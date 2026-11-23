"""
app.py — smia's Flask entrypoint. Registers auth (D-S6), imports every
adapter module so provider registration runs before the first request, and
mounts the provider-catalog routes (`/providers`, `/health`) plus each
kind's lookup routes once that kind has an adapter.

Run: `flask --app app run` (dev) with DATABASE_URL set. Auth is the shared
check (libs/pyservice/auth.py) — the gateway marker or INTERNAL_TOKEN.
"""

from __future__ import annotations

import base64
import hashlib
import os

from flask import Flask, Response, jsonify, request
from flask_cors import CORS
from pyservice.auth import register_auth
from pyservice.prefix import forwarded_prefix, render_page

import audio_cache
import cache
from example_text import normalise_examples_payload
from db.session import session_scope

# static_folder="ui" / static_url_path="/static" is what moves the UI to the
# prefix root (unified-auth 5.1, superseding D46's /ui convention): the page
# itself is served at `/` and Flask's own static handler serves ui/ under
# `/static/`. Behind the gateway that is `/smia/` and `/smia/static/`.
app = Flask(__name__, static_folder="ui", static_url_path="/static")
# flask-cors IS STILL LIVE HERE, AND THAT IS NOT WHAT THE SURROUNDING
# DOCUMENTATION USED TO SAY (corrected 2026-11-14, P57). `libs/pyservice/auth.py`
# claimed the service-side CORS answer had been removed in favour of the
# gateway's, and grind/caddy/Caddyfile reasons at length about "the gateway's
# `*` policy" as though it were the only one. Measured, with the stack up:
#
#   curl -H 'Origin: https://evil.example' .../smia/health
#       -> Access-Control-Allow-Origin: https://evil.example
#
# So there are TWO policies, in two places, and they disagree: the gateway
# answers the PREFLIGHT with `*`, and this line answers the ACTUAL request by
# REFLECTING whatever Origin asked.
#
# Kept, deliberately, until the extension lands (unified-auth 6.1/6.2). The
# gateway sets Access-Control-Allow-Origin on the preflight only — nothing in
# the Caddyfile adds it to a real response — so deleting this line would let
# a cross-origin preflight succeed and then have the browser discard the
# answer to the request it authorised. hover-translate (D154) is exactly that
# client and it is not in this repository, so the regression could not be
# caught here.
#
# Not exploitable as it stands: `Access-Control-Allow-Credentials` is never
# set, so a browser will not attach the operator cookie or basic credential to
# a cross-origin request, and a response read this way carries no authority
# the caller did not already have. It is a documentation defect, recorded
# rather than silently left: two CORS policies with a comment claiming one.
CORS(app)
app.json.ensure_ascii = False  # IPA/Norwegian characters as literal UTF-8, not \uXXXX escapes
register_auth(app)

import adapters  # noqa: F401,E402  (imported for registration side-effects only)
from routes.generic import register_lookup_routes  # noqa: E402


def _extract_inflections_input(body: dict) -> dict:
    if "word" not in body or "lang" not in body:
        raise ValueError("word and lang are required")
    return {"word": body["word"], "lang": body["lang"]}


register_lookup_routes(app, "inflections", _extract_inflections_input)


from routes.ipa import register_ipa_routes  # noqa: E402

register_ipa_routes(app)


def _extract_tts_input(body: dict) -> dict:
    if "text" not in body or "lang" not in body:
        raise ValueError("text and lang are required")
    return {"text": body["text"], "lang": body["lang"]}


# /tts has its own GET: the tts-api spec's `GET /tts/{sha256}` (raw audio
# bytes, keyed on the *audio's* content hash) shares a path shape with the
# generic lookup-cache `GET /<kind>/{id}` (metadata, keyed on the
# *request's* resource id) — register_get=False skips the generic GET so
# this single handler can serve both: resource-id metadata if it matches a
# cached /tts lookup, else raw bytes if it matches a cached audio clip.
register_lookup_routes(app, "tts", _extract_tts_input, register_get=False)


@app.route("/tts/<key>", methods=["GET"])
def get_tts(key):
    with session_scope() as db:
        payload = cache.fetch_by_id(db, "tts", key)
        if payload is not None:
            return jsonify(payload), 200
        audio = audio_cache.fetch(db, key)
        if audio is not None:
            data, content_type = audio
            return Response(data, mimetype=content_type)
    return jsonify({"error": "not found"}), 404


def _extract_translations_input(body: dict) -> dict:
    if "text" not in body or "from" not in body or "to" not in body:
        raise ValueError("text, from, and to are required")
    return {"text": body["text"], "from": body["from"], "to": body["to"]}


register_lookup_routes(app, "translations", _extract_translations_input)


def _extract_examples_input(body: dict) -> dict:
    if "text" not in body:
        raise ValueError("text is required")
    lang = body.get("lang", "nb")
    if lang != "nb":
        raise ValueError("lang must be 'nb' — /examples only supports Norwegian Bokmål")
    limit = body.get("limit", 3)
    try:
        limit = int(limit)
    except (TypeError, ValueError):
        limit = 3
    limit = max(1, min(10, limit))
    # `limit` stays inside the extracted input dict (design D6) so it
    # participates in the cache key — a limit=3 and limit=10 request for
    # the same word are distinct cache resources holding different payloads.
    return {"text": body["text"], "lang": lang, "limit": limit}


# Response-boundary normalisation (examples-sentence-normalisation D2): the
# cache keeps the provider's raw answer; candidates are shaped into sentences
# on the way out, on a cache hit, a cache miss and `GET /examples/{id}` alike.
register_lookup_routes(
    app, "examples", _extract_examples_input, transform_payload=normalise_examples_payload
)


@app.route("/stt", methods=["POST"])
def post_stt():
    from cache import ProviderLookupError, run_lookup
    from registry import ProviderRequiredError, UnknownProviderError, registry

    # /stt's request body is multipart audio, not JSON (tasks.md 7.2) — a
    # genuinely different shape from every other kind, so this bypasses
    # routes/generic.py's JSON-body _post entirely. `provider` is required
    # per request regardless of how many providers are configured (D17 /
    # proposal's explicit "{provider} (always required, even with one
    # provider configured)" — `/stt` deliberately opts out of the
    # lookup-cache's usual "optional when exactly one" default), checked
    # here before registry.resolve_provider ever gets a chance to default it.
    audio_file = request.files.get("audio")
    if audio_file is None:
        return jsonify({"error": "audio file is required (multipart field 'audio')"}), 400
    provider = request.form.get("provider")
    if not provider:
        return jsonify({"error": "provider is required", "available": registry.providers_for("stt")}), 400
    lang = request.form.get("lang")

    audio_bytes = audio_file.read()
    input_dict = {
        "audio_sha256": hashlib.sha256(audio_bytes).hexdigest(),
        "audio_b64": base64.b64encode(audio_bytes).decode("ascii"),
        "lang": lang,
    }

    with session_scope() as db:
        try:
            payload, rid, _ = run_lookup(db, "stt", provider, input_dict)
        except ProviderRequiredError as exc:
            return jsonify({"error": "provider is required", "available": exc.available}), 400
        except UnknownProviderError as exc:
            return jsonify({"error": "unknown provider", "available": exc.available}), 400
        except ProviderLookupError as exc:
            return jsonify({"error": str(exc)}), 502
        response = jsonify(payload)
        response.headers["Location"] = f"/stt/{rid}"
        return response, 200


@app.route("/stt/<rid>", methods=["GET"])
def get_stt(rid):
    with session_scope() as db:
        payload = cache.fetch_by_id(db, "stt", rid)
    if payload is None:
        return jsonify({"error": "not found"}), 404
    return jsonify(payload), 200


@app.route("/health", methods=["GET"])
def get_health():
    import health as health_module

    with session_scope() as db:
        return jsonify(health_module.get_all(db))


@app.route("/", methods=["GET"])
def ui_index():
    # Mounted at the domain root in local dev and under /smia/ behind the
    # gateway, which strips that prefix before forwarding and passes it on as
    # X-Forwarded-Prefix; ui/ui.js reads it back via `window.SMIA_PREFIX` for
    # its own absolute asset/API requests. Mirrors stabbur's app.py exactly,
    # and both now call the one implementation in libs/pyservice/prefix.py.
    return render_page(app.root_path, "ui/index.html", SMIA_PREFIX=forwarded_prefix())


@app.route("/providers", methods=["GET"])
def providers():
    from db.session import session_scope
    from registry import KINDS, registry

    with session_scope() as db:
        counts = {kind: registry.counts_for(db, kind) for kind in KINDS}
    body = {kind: registry.providers_for(kind) for kind in KINDS}
    body["counts"] = {kind: c for kind, c in counts.items() if c}
    return jsonify(body)


if __name__ == "__main__":
    debug = os.environ.get("FLASK_DEBUG", "1") == "1"
    app.run(host="0.0.0.0", port=5055, debug=debug)
