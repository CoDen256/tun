"""
routes/settings.py — the operator-settings read/write endpoint
(operator-settings spec; design D1-D4). Serves the single settings row,
reconciled against smia's live provider catalogue on every read (D3), so
the settings page and any other caller always see an effective order and
primary that account for providers smia has gained or lost since the
preference was last written.
"""

from __future__ import annotations

import re
import uuid

from flask import jsonify, request

import settings_store
import smia_client
from db.session import session_scope
from routes.enrich import ENRICHABLE_KINDS

# stabbur-editor-redesign (C17): the Settings page orders providers for two
# more editor fields than stabbur proxies as enrichment kinds. "pos" has no
# smia endpoint of its own — the part-of-speech sheet reads the inflections
# lookup's reported pos — so it is reconciled against the INFLECTIONS
# catalogue, but ordered (and switched off) independently of the paradigm
# list. "stt" is smia's own speech-to-text kind (text from audio).
PROVIDER_KINDS = (*ENRICHABLE_KINDS, "pos", "stt")
CATALOGUE_SOURCE = {"pos": "inflections"}

# stabbur-editor-fixes D4: translations are ordered PER TARGET LANGUAGE, under
# keys of the shape "translations:<lang>". They are reconciled against the
# translations catalogue exactly as "pos" is reconciled against the
# inflections one, and the set served is computed per read from the
# operator's target languages plus whatever is already stored — so adding a
# language in Settings adds its list, and removing one does not destroy it.
TRANSLATIONS_KIND = "translations"
TRANSLATIONS_LANG_PREFIX = f"{TRANSLATIONS_KIND}:"
# Deliberately loose: a language tag is the operator's own string (the
# Translation languages field is free text), so this only refuses shapes that
# could collide with another kind's key or with nothing at all.
TRANSLATIONS_LANG_KEY_RE = re.compile(r"^translations:[a-z]{2,8}(-[a-z0-9]{2,8})*$")


def normalize_target_langs(langs: list[str]) -> list[str]:
    """Lower-cased, stripped, de-duplicated, order kept.

    stabbur-editor-fixes D4 makes a target language a STORAGE KEY
    ("translations:<lang>"), which two things depend on: a duplicate would
    render the same list twice in Settings and push the same language twice
    in the prefill walk, and an upper-cased language would be served by GET
    and then refused by PATCH's key check — a list the operator can see and
    never reorder. Normalising once, on write, closes both."""
    out: list[str] = []
    for lang in langs:
        value = lang.strip().lower()
        if value and value not in out:
            out.append(value)
    return out


def _lang_provider_kinds(db) -> tuple[str, ...]:
    """The per-language translations keys this read should resolve: one per
    configured target language, then any already stored for a language the
    operator has since removed (kept so re-adding it restores its order)."""
    langs = settings_store.read_scalars(db)["default_target_langs"]
    wanted = [f"{TRANSLATIONS_LANG_PREFIX}{lang}" for lang in langs]
    wanted += settings_store.stored_kinds_with_prefix(db, TRANSLATIONS_LANG_PREFIX)
    out: list[str] = []
    for kind in wanted:
        if kind not in out:
            out.append(kind)
    return tuple(out)

ALLOWED_SETTINGS_KEYS = {
    "override_prefill", "default_target_langs", "providers", "prefill_timing",
    "triage_navigate_save", "examples_count", "examples_max_providers",
    "theme", "value_color", "value_color_custom",
}


def _fetch_catalogue() -> dict:
    """A catalogue fetch failure degrades reconciliation (nothing new gets
    appended this read) rather than failing the whole settings read —
    stabbur's own settings must stay readable even when smia is down."""
    try:
        status, body = smia_client.get("/providers")
    except smia_client.SmiaUnavailableError:
        return {}
    if status != 200 or not isinstance(body, dict):
        return {}
    return body


def _serialize(db) -> dict:
    scalars = settings_store.read_scalars(db)
    catalogue = _fetch_catalogue()
    lang_kinds = _lang_provider_kinds(db)
    sources = {**CATALOGUE_SOURCE, **{kind: TRANSLATIONS_KIND for kind in lang_kinds}}
    catalogue = {**catalogue, **{kind: catalogue.get(src, []) for kind, src in sources.items()}}
    scalars["providers"] = settings_store.resolve_providers(db, catalogue, (*PROVIDER_KINDS, *lang_kinds))
    # stabbur-triage-queues D1: the triage selector reads its queues from
    # here, so they ride along with every settings read.
    scalars["triage_queues"] = settings_store.read_queues(db)
    return scalars


def _validate_patch_body(body: dict) -> str | None:
    unknown = set(body) - ALLOWED_SETTINGS_KEYS
    if unknown:
        return f"unknown settings key(s): {sorted(unknown)}"

    if "theme" in body and body["theme"] not in settings_store.THEMES:
        return f"theme must be one of {settings_store.THEMES}"

    if "value_color" in body and body["value_color"] not in settings_store.VALUE_COLORS:
        return f"value_color must be one of {settings_store.VALUE_COLORS}"

    # null clears the custom colour; otherwise exactly #rrggbb.
    if "value_color_custom" in body and body["value_color_custom"] is not None:
        value = body["value_color_custom"]
        if not isinstance(value, str) or not settings_store.VALUE_COLOR_CUSTOM_RE.match(value):
            return "value_color_custom must be a #rrggbb colour or null"

    if "override_prefill" in body and not isinstance(body["override_prefill"], bool):
        return "override_prefill must be a boolean"

    if "prefill_timing" in body and body["prefill_timing"] not in settings_store.PREFILL_TIMINGS:
        return f"prefill_timing must be one of {settings_store.PREFILL_TIMINGS}"

    if "triage_navigate_save" in body and body["triage_navigate_save"] not in settings_store.TRIAGE_NAVIGATE_SAVE_MODES:
        return f"triage_navigate_save must be one of {settings_store.TRIAGE_NAVIGATE_SAVE_MODES}"

    if "examples_count" in body:
        lo, hi = settings_store.EXAMPLES_COUNT_RANGE
        value = body["examples_count"]
        if not isinstance(value, int) or isinstance(value, bool) or not (lo <= value <= hi):
            return f"examples_count must be an integer between {lo} and {hi}"

    if "examples_max_providers" in body:
        lo, hi = settings_store.EXAMPLES_MAX_PROVIDERS_RANGE
        value = body["examples_max_providers"]
        if not isinstance(value, int) or isinstance(value, bool) or not (lo <= value <= hi):
            return f"examples_max_providers must be an integer between {lo} and {hi}"

    if "default_target_langs" in body:
        langs = body["default_target_langs"]
        if not isinstance(langs, list) or not all(isinstance(lang, str) for lang in langs):
            return "default_target_langs must be a list of strings"

    if "providers" in body:
        providers = body["providers"]
        if not isinstance(providers, dict):
            return "providers must be an object keyed by kind"
        for kind, kind_update in providers.items():
            if kind not in PROVIDER_KINDS and not TRANSLATIONS_LANG_KEY_RE.match(kind):
                return (
                    f"unknown kind {kind!r}; must be one of {list(PROVIDER_KINDS)} "
                    f"or {TRANSLATIONS_LANG_PREFIX}<lang>"
                )
            if not isinstance(kind_update, dict):
                return f"providers.{kind} must be an object"
            if "order" in kind_update:
                order = kind_update["order"]
                # D3/3.3: a provider name absent from the current catalogue
                # is retained, not refused — the catalogue is smia's, and a
                # provider can vanish simply because a token is unset.
                if not isinstance(order, list) or not all(isinstance(p, str) for p in order):
                    return f"providers.{kind}.order must be a list of strings"
                if len(order) != len(set(order)):
                    return f"providers.{kind}.order must not contain duplicate provider names"
            if "disabled" in kind_update:
                disabled = kind_update["disabled"]
                if not isinstance(disabled, list) or not all(isinstance(p, str) for p in disabled):
                    return f"providers.{kind}.disabled must be a list of strings"
    return None


def _own_queues(db) -> list[dict]:
    """The operator's own queues only — the built-ins are synthesised and
    must never be written back into storage."""
    return [q for q in settings_store.read_queues(db) if not q.get("builtin")]


def register_settings_routes(app):
    # ----------------------------------------------------- triage queues --
    # A queue is a named filter set plus its own sort (D1). The three origin
    # queues are synthesised by settings_store and are refused by every
    # write below — that is what makes them undeletable rather than merely
    # hidden from the delete control.

    @app.route("/api/settings/triage_queues", methods=["GET"])
    def list_triage_queues():
        with session_scope() as db:
            return jsonify(settings_store.read_queues(db)), 200

    @app.route("/api/settings/triage_queues", methods=["POST"])
    def create_triage_queue():
        body = request.get_json(silent=True)
        if body is None:
            return jsonify({"error": "JSON body required"}), 400
        error = settings_store.validate_queue(body)
        if error:
            return jsonify({"error": error}), 400

        with session_scope() as db:
            queues = _own_queues(db)
            queue = {
                "id": str(uuid.uuid4()),
                "name": body["name"].strip(),
                "filters": body.get("filters") or {},
                "sort": body.get("sort") or settings_store.DEFAULT_QUEUE_SORT,
            }
            queues.append(queue)
            settings_store.write_queues(db, queues)
            return jsonify(settings_store.read_queues(db)), 201

    @app.route("/api/settings/triage_queues/<queue_id>", methods=["PATCH"])
    def patch_triage_queue(queue_id):
        body = request.get_json(silent=True)
        if body is None:
            return jsonify({"error": "JSON body required"}), 400

        with session_scope() as db:
            if queue_id.startswith("builtin:"):
                return jsonify({"error": "a built-in queue cannot be edited"}), 400
            queues = _own_queues(db)
            target = next((q for q in queues if q["id"] == queue_id), None)
            if target is None:
                return jsonify({"error": "not found"}), 404

            merged = {
                "name": body.get("name", target["name"]),
                "filters": body.get("filters", target.get("filters") or {}),
                "sort": body.get("sort", target.get("sort")),
            }
            error = settings_store.validate_queue(merged)
            if error:
                return jsonify({"error": error}), 400

            target["name"] = merged["name"].strip()
            target["filters"] = merged["filters"]
            target["sort"] = merged["sort"]
            settings_store.write_queues(db, queues)
            return jsonify(settings_store.read_queues(db)), 200

    @app.route("/api/settings/triage_queues/<queue_id>", methods=["DELETE"])
    def delete_triage_queue(queue_id):
        with session_scope() as db:
            if queue_id.startswith("builtin:"):
                return jsonify({"error": "a built-in queue cannot be deleted"}), 400
            queues = _own_queues(db)
            remaining = [q for q in queues if q["id"] != queue_id]
            if len(remaining) == len(queues):
                return jsonify({"error": "not found"}), 404
            settings_store.write_queues(db, remaining)
            return jsonify(settings_store.read_queues(db)), 200

    @app.route("/api/settings", methods=["GET"])
    def get_settings():
        with session_scope() as db:
            return jsonify(_serialize(db)), 200

    @app.route("/api/settings", methods=["PATCH"])
    def patch_settings():
        body = request.get_json(silent=True)
        if body is None:
            return jsonify({"error": "JSON body required"}), 400

        error = _validate_patch_body(body)
        if error:
            return jsonify({"error": error}), 400

        # A target language is a storage key since D4, so it is normalised
        # before anything stores or resolves against it.
        if "default_target_langs" in body:
            body = {**body, "default_target_langs": normalize_target_langs(body["default_target_langs"])}

        with session_scope() as db:
            # D12: "custom" means "use value_color_custom", so it needs one —
            # from this request or already stored.
            if body.get("value_color") == "custom" or "value_color_custom" in body:
                current = settings_store.read_scalars(db)
                color = body.get("value_color", current["value_color"])
                custom = body.get("value_color_custom", current["value_color_custom"])
                if color == "custom" and not custom:
                    return jsonify({"error": "value_color 'custom' requires value_color_custom"}), 400
            writable = (*PROVIDER_KINDS, *_lang_provider_kinds(db))
            # A language the operator has typed into Translation languages in
            # the SAME request is not in the stored scalars yet, so the keys
            # this body carries are accepted on their own validated shape too.
            writable += tuple(
                kind for kind in (body.get("providers") or {})
                if TRANSLATIONS_LANG_KEY_RE.match(kind) and kind not in writable
            )
            settings_store.write(db, body, writable)
            return jsonify(_serialize(db)), 200
