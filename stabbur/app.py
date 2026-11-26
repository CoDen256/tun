"""
app.py — stabbur's Flask entrypoint. Mirrors smia's app.py shape (D-N1):
registers auth, then mounts blob storage and notes routes.

Run: `flask --app app run` (dev) with DATABASE_URL set. Auth is the shared
check (libs/pyservice/auth.py) — the gateway marker or INTERNAL_TOKEN.
"""

from __future__ import annotations

import json
import os

from flask import Flask
from flask_cors import CORS
from pyservice.auth import register_auth
from pyservice.icon import register_icon
from pyservice.prefix import forwarded_prefix, render_page

from routes.blobs import register_blob_routes
from routes.captures import register_capture_routes
from routes.enrich import register_enrich_routes
from routes.notes import register_notes_routes
from routes.settings import register_settings_routes
import settings_store
from db.session import session_scope

# static_folder="ui" / static_url_path="/static" is what moves the UI to the
# prefix root (unified-auth 5.1, superseding D46's /ui convention): the page
# itself is served at `/` and Flask's own static handler serves ui/ under
# `/static/`. Behind the gateway that is `/stabbur/` and `/stabbur/static/`.
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
app.json.ensure_ascii = False  # Norwegian characters as literal UTF-8, not \uXXXX escapes
register_auth(app)

# The tab icon: libs/icons/stabbur.svg, served at this service's own
# /icon.svg (libs/pyservice/icon.py). The <head> link is in the page.
register_icon(app, "stabbur")
register_blob_routes(app)
register_notes_routes(app)
register_capture_routes(app)
register_enrich_routes(app)
register_settings_routes(app)


@app.route("/", methods=["GET"])
def ui_index():
    # Mounted at the domain root in local dev and under /stabbur/ behind the
    # gateway, which strips that prefix before forwarding (so every other
    # route stays prefix-agnostic) and passes it on as X-Forwarded-Prefix.
    # ui/ui.js reads it back via `window.STABBUR_PREFIX` for its own absolute
    # asset/API requests. One implementation now, in libs/pyservice/prefix.py.
    return render_page(
        app.root_path, "ui/index.html", STABBUR_PREFIX=forwarded_prefix(), STABBUR_LOOK=_appearance_json()
    )


# ── The PWA manifest (the same shape shadow uses, shadow/app.py) ──────
#
# A route rather than a static file for two reasons: start_url and scope must
# be stabbur's prefix AS SERVED (X-Forwarded-Prefix — '/stabbur' behind the
# gateway, '' on a published port), which is the same substitution ui_index
# makes; and the MIME type must be application/manifest+json, which this sets
# itself instead of trusting the platform's mimetypes table. No service worker
# and no offline mode — stabbur is useless without its database, so an offline
# shell would be a lie.
#
# It sits behind the same operator gate as every page, and the <link> asks for
# it with credentials: Chrome fetches a manifest WITHOUT them otherwise, and
# the gateway's basic_auth covers /stabbur/.
#
# The icons are under ui/, which Flask serves at /static — the same directory
# the Dockerfile already COPYs, so nothing new has to ship.

STABBUR_THEME = "#fbfbfc"       # --bg (light) in ui/ui.css
STABBUR_BACKGROUND = "#fbfbfc"  # --bg (light) in ui/ui.css


@app.route("/manifest.webmanifest", methods=["GET"])
def web_manifest():
    base = forwarded_prefix() + "/"
    body = {
        "name": "stabbur",
        "short_name": "stabbur",
        "description": "Captures, notes and triage for Norwegian learning content.",
        "id": base,
        "start_url": base,
        "scope": base,
        "display": "standalone",
        "theme_color": STABBUR_THEME,
        "background_color": STABBUR_BACKGROUND,
        "icons": [
            {"src": base + "static/icons/icon-192.png", "sizes": "192x192",
             "type": "image/png", "purpose": "any"},
            {"src": base + "static/icons/icon-512.png", "sizes": "512x512",
             "type": "image/png", "purpose": "any"},
            {"src": base + "static/icons/icon-maskable-512.png", "sizes": "512x512",
             "type": "image/png", "purpose": "maskable"},
        ],
    }
    resp = app.response_class(json.dumps(body), mimetype="application/manifest+json")
    resp.headers["Cache-Control"] = "no-cache"
    return resp


def _appearance_json() -> str:
    """stabbur-editor-redesign D12: the theme and value colour, substituted
    into index.html so the very first frame is drawn in them — on any device,
    including one that has never visited before (a browser-side cache alone
    would flash the defaults there).

    Serve-before-migrate (D157): the page must still load when the database
    is down or not yet migrated, so any failure here yields `null`, and the
    page falls back to the copy the browser cached on its last visit. The
    values are DB-constrained enums and `#rrggbb`, and the result is placed
    inside a single-quoted JS string, so `<` and `'` are escaped anyway."""
    try:
        with session_scope() as db:
            scalars = settings_store.read_scalars(db)
    except Exception:  # noqa: BLE001 — any failure degrades to the cached look
        return "null"
    look = {key: scalars[key] for key in ("theme", "value_color", "value_color_custom")}
    return json.dumps(look).replace("<", "\\u003c").replace("'", "\\u0027")


if __name__ == "__main__":
    debug = os.environ.get("FLASK_DEBUG", "0") == "1"
    app.run(host="0.0.0.0", port=5056, debug=debug)
