"""
routes/settings.py — the operator-settings read/write endpoint
(operator-settings spec; design D1-D4). Serves the single settings row,
reconciled against smia's live provider catalogue on every read (D3), so
the settings page and any other caller always see an effective order and
primary that account for providers smia has gained or lost since the
preference was last written.
"""

from __future__ import annotations

import uuid

from flask import jsonify, request

import settings_store
import smia_client
from db.session import session_scope
from routes.enrich import ENRICHABLE_KINDS

ALLOWED_SETTINGS_KEYS = {
    "translation_merge_mode", "override_prefill", "default_target_langs", "providers", "prefill_timing",
    "triage_navigate_save", "examples_count", "examples_max_providers",
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
    scalars["providers"] = settings_store.resolve_providers(db, catalogue, ENRICHABLE_KINDS)
    # stabbur-triage-queues D1: the triage selector reads its queues from
    # here, so they ride along with every settings read.
    scalars["triage_queues"] = settings_store.read_queues(db)
    return scalars


def _validate_patch_body(body: dict) -> str | None:
    unknown = set(body) - ALLOWED_SETTINGS_KEYS
    if unknown:
        return f"unknown settings key(s): {sorted(unknown)}"

    if "translation_merge_mode" in body and body["translation_merge_mode"] not in settings_store.TRANSLATION_MERGE_MODES:
        return f"translation_merge_mode must be one of {settings_store.TRANSLATION_MERGE_MODES}"

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
            if kind not in ENRICHABLE_KINDS:
                return f"unknown kind {kind!r}; must be one of {list(ENRICHABLE_KINDS)}"
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

        with session_scope() as db:
            settings_store.write(db, body, ENRICHABLE_KINDS)
            return jsonify(_serialize(db)), 200
