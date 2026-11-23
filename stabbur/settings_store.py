"""
settings_store.py — operator-settings defaults and catalogue reconciliation
(operator-settings design D1-D4). routes/settings.py is the only caller;
this module holds the logic so it's unit-testable without a Flask request.

Defaults live here, in code, not in the database (D2) — reading settings
before anything has ever been written returns these, so no caller ever has
to branch on "unconfigured" vs. "configured".
"""

from __future__ import annotations

import re

from db.models import (
    SETTINGS_EXAMPLES_SHEET_COUNT_RANGE,
    SETTINGS_THEMES,
    SETTINGS_VALUE_COLOR_CUSTOM_PATTERN,
    SETTINGS_VALUE_COLORS,
    Settings,
)

# stabbur-editor-redesign D12: appearance. Mirrors db/models.py, whose check
# constraints are the enforced source of truth; validated here first so the
# operator gets a readable 400 instead of an IntegrityError.
THEMES = SETTINGS_THEMES
VALUE_COLORS = SETTINGS_VALUE_COLORS
VALUE_COLOR_CUSTOM_RE = re.compile(SETTINGS_VALUE_COLOR_CUSTOM_PATTERN)
DEFAULT_THEME = "auto"
DEFAULT_VALUE_COLOR = "blue"
# note-triage design D6: "on_open" prefills a triage note's empty fields the
# moment it's presented; "on_demand" waits for the operator's fill control.
PREFILL_TIMINGS = ("on_open", "on_demand")
# triage-editor-ux-fixes design D3: "autosave" extends today's Send-to-back
# behavior to Skip and Go to previous too; "manual" means none of the three
# save — only the explicit triage Save action does.
TRIAGE_NAVIGATE_SAVE_MODES = ("autosave", "manual")
# triage-editor-ux-fixes examples-prefill follow-up: both bound 1-10 (D43's
# own CheckConstraint is the enforced source of truth; mirrored here only
# for the validation error message in routes/settings.py).
EXAMPLES_COUNT_RANGE = (1, 10)
EXAMPLES_MAX_PROVIDERS_RANGE = (1, 10)
# stabbur-prefill-and-settings-fixes D5: K, the Examples SHEET's per-provider
# sentence count. Mirrors the model's check constraint for the 400 message.
EXAMPLES_SHEET_COUNT_RANGE = SETTINGS_EXAMPLES_SHEET_COUNT_RANGE

DEFAULT_OVERRIDE_PREFILL = True
DEFAULT_TARGET_LANGS = ("en", "de")
DEFAULT_PREFILL_TIMING = "on_open"
DEFAULT_TRIAGE_NAVIGATE_SAVE = "autosave"
# Matches the hardcoded "3 sentences, first provider that answers" walk this
# replaces — ships with no behavior change until the operator opts into a
# larger count or provider budget.
DEFAULT_EXAMPLES_COUNT = 3
DEFAULT_EXAMPLES_MAX_PROVIDERS = 1
# D5: the sheet asks for at least 5, but never fewer than prefill's own M —
# an operator who had already set M above 5 must not be served a default
# that breaks the M <= K rule the API enforces.
DEFAULT_EXAMPLES_SHEET_COUNT_FLOOR = 5


def default_examples_sheet_count(examples_count: int) -> int:
    return max(DEFAULT_EXAMPLES_SHEET_COUNT_FLOOR, examples_count)

# --------------------------------------------------------- triage queues --
# stabbur-triage-queues D1. A queue is a named filter set plus its own sort.
#
# The three origin queues are SYNTHESISED, not stored: they reproduce exactly
# what the origin dropdown did before this change, and keeping them out of
# storage is what makes them impossible to edit, delete, or drift from that
# definition. `builtin: True` is what the API refuses writes against.
BUILTIN_QUEUE_ORIGINS = ("import", "manual", "capture")

# The filter keys a queue may carry. Anything else is rejected rather than
# stored and silently ignored — a queue that quietly dropped a filter would
# look like a queue with different contents, which is worse than an error.
QUEUE_FILTER_KEYS = (
    "status",
    "type",
    "origin",
    "pos",
    "source_lang",
    "updated_since",
    "q",
    "audio_blob_presence",
    "transcription_presence",
    "inflections_presence",
    "examples_presence",
    "translations_presence",
    "lemma_presence",
    # stabbur-editor-redesign notes-browser delta: "Triage these" saves the
    # browser's own filters, so a queue may carry them too.
    "audio",
    "missing",
    "updated_within",
)

QUEUE_SORTS = (
    "updated_asc",
    "updated_desc",
    "created_asc",
    "created_desc",
    "text_asc",
    "text_desc",
    "complete_asc",
    "complete_desc",
)
DEFAULT_QUEUE_SORT = "updated_asc"
MAX_QUEUE_NAME_LENGTH = 60


def builtin_queues() -> list[dict]:
    """The three origin queues, exactly as the dropdown behaved: draft notes
    of one origin, oldest updated first."""
    return [
        {
            "id": f"builtin:{origin}",
            "name": origin,
            "builtin": True,
            "filters": {"status": "draft", "origin": origin},
            "sort": DEFAULT_QUEUE_SORT,
        }
        for origin in BUILTIN_QUEUE_ORIGINS
    ]


def read_queues(db) -> list[dict]:
    """Built-ins first, then the operator's own in stored order."""
    row = _row(db)
    stored = (row.triage_queues if row else None) or []
    own = []
    for q in stored:
        if not isinstance(q, dict):
            continue
        own.append(
            {
                "id": q.get("id"),
                "name": q.get("name") or "(unnamed)",
                "builtin": False,
                "filters": q.get("filters") or {},
                "sort": q.get("sort") or DEFAULT_QUEUE_SORT,
            }
        )
    return builtin_queues() + own


def validate_queue(payload: dict) -> str | None:
    """Returns an error message, or None when the queue is acceptable."""
    if not isinstance(payload, dict):
        return "a queue must be an object"
    name = (payload.get("name") or "").strip()
    if not name:
        return "a queue needs a name"
    if len(name) > MAX_QUEUE_NAME_LENGTH:
        return f"a queue name must be at most {MAX_QUEUE_NAME_LENGTH} characters"

    sort = payload.get("sort") or DEFAULT_QUEUE_SORT
    if sort not in QUEUE_SORTS:
        return f"sort must be one of {list(QUEUE_SORTS)}"

    filters = payload.get("filters") or {}
    if not isinstance(filters, dict):
        return "filters must be an object"
    unknown = sorted(set(filters) - set(QUEUE_FILTER_KEYS))
    if unknown:
        return f"unknown filter(s): {unknown}"
    return None


def write_queues(db, queues: list[dict]) -> None:
    row = _row(db)
    if row is None:
        row = Settings(id=1)
        db.add(row)
    # Reassigned as a new list, not mutated in place — this is a plain
    # (non-Mutable) JSONB column, so an in-place mutation is not tracked as
    # dirty and would be silently dropped. Same reason `provider_prefs` is
    # reassigned in `write` below.
    row.triage_queues = [
        {
            "id": q["id"],
            "name": q["name"],
            "filters": q.get("filters") or {},
            "sort": q.get("sort") or DEFAULT_QUEUE_SORT,
        }
        for q in queues
    ]


def _row(db) -> Settings | None:
    return db.get(Settings, 1)


def read_scalars(db) -> dict:
    """Stored scalar preferences with defaults applied (D2) — no catalogue
    involved, since these aren't provider-ordering preferences."""
    row = _row(db)
    examples_count = (row.examples_count if row else None) or DEFAULT_EXAMPLES_COUNT
    return {
        "override_prefill": DEFAULT_OVERRIDE_PREFILL if row is None or row.override_prefill is None else row.override_prefill,
        "default_target_langs": (row.default_target_langs if row else None) or list(DEFAULT_TARGET_LANGS),
        "prefill_timing": (row.prefill_timing if row else None) or DEFAULT_PREFILL_TIMING,
        "triage_navigate_save": (row.triage_navigate_save if row else None) or DEFAULT_TRIAGE_NAVIGATE_SAVE,
        "examples_count": examples_count,
        "examples_max_providers": (row.examples_max_providers if row else None) or DEFAULT_EXAMPLES_MAX_PROVIDERS,
        # D5: NULL is "never chosen", not 5 — see default_examples_sheet_count.
        "examples_sheet_count": (row.examples_sheet_count if row else None)
        or default_examples_sheet_count(examples_count),
        "theme": (row.theme if row else None) or DEFAULT_THEME,
        "value_color": (row.value_color if row else None) or DEFAULT_VALUE_COLOR,
        # No default: unset means "no custom colour picked yet".
        "value_color_custom": row.value_color_custom if row else None,
    }


def resolve_kind_order(stored: dict, catalogue_providers: list[str]) -> dict:
    """design D3: known providers in stored order first (a vanished one is
    skipped, not an error, with its position and enabled state retained in
    storage so it resumes its place if it returns); a catalogue provider
    absent from the stored order is appended at the end, enabled. The
    primary is derived as the first enabled provider in the effective
    order — never stored separately (D3/2.4)."""
    stored_order = stored.get("order") or []
    stored_disabled = set(stored.get("disabled") or [])
    catalogue_set = set(catalogue_providers or [])

    effective = [p for p in stored_order if p in catalogue_set]
    effective += [p for p in (catalogue_providers or []) if p not in stored_order]

    disabled = sorted(stored_disabled & set(effective))
    primary = next((p for p in effective if p not in stored_disabled), None)

    return {"order": effective, "disabled": disabled, "primary": primary}


def stored_kinds_with_prefix(db, prefix: str) -> list[str]:
    """Stored provider-preference keys under a namespace, in stored order.
    stabbur-editor-fixes D4 uses it to keep serving a per-language
    translations order for a language the operator has removed from their
    target languages, so re-adding the language restores its order."""
    row = _row(db)
    prefs = (row.provider_prefs if row else None) or {}
    return [kind for kind in prefs if kind.startswith(prefix)]


def _stored_for_kind(prefs: dict, kind: str) -> dict:
    """What a kind's stored preference is, with one inheritance rule
    (stabbur-editor-fixes D4): a NAMESPACED kind ("translations:de") that has
    never been written falls back to its namespace's own preference
    ("translations"), so a newly configured language starts at the order the
    operator already has rather than at the raw catalogue order. A stored
    empty dict is not "never written" — only a missing key is."""
    if kind in prefs:
        return prefs[kind] or {}
    if ":" in kind:
        return prefs.get(kind.split(":", 1)[0], {}) or {}
    return {}


def resolve_providers(db, catalogue: dict, kinds: tuple[str, ...]) -> dict:
    """Reconciles every kind stabbur proxies against smia's live catalogue
    (D3 — "every time the ordering is used"; reading settings counts). A
    kind absent from `catalogue` (e.g. smia unreachable) reconciles against
    an empty catalogue, which still resolves cleanly via resolve_kind_order
    — it just means nothing new gets appended this time."""
    row = _row(db)
    provider_prefs = (row.provider_prefs if row else None) or {}
    return {
        kind: resolve_kind_order(_stored_for_kind(provider_prefs, kind), catalogue.get(kind, []))
        for kind in kinds
    }


def write(db, updates: dict, kinds: tuple[str, ...]) -> None:
    """Partial update (3.2): only the keys present in `updates` are
    touched; everything else — including other kinds' provider ordering —
    is left at its stored or default value (6.2)."""
    row = _row(db)
    if row is None:
        row = Settings(id=1)
        db.add(row)

    if "override_prefill" in updates:
        row.override_prefill = updates["override_prefill"]
    if "default_target_langs" in updates:
        row.default_target_langs = updates["default_target_langs"]
    if "prefill_timing" in updates:
        row.prefill_timing = updates["prefill_timing"]
    if "triage_navigate_save" in updates:
        row.triage_navigate_save = updates["triage_navigate_save"]
    if "examples_count" in updates:
        # D5: an UNSET sheet count resolves to max(5, examples_count), which
        # makes K a function of M. Writing M while K is still NULL would
        # therefore move a number the operator never touched — lowering M
        # from 8 to 3 would drop a displayed sheet count of 8 to 5. So the
        # value currently being SHOWN is frozen into storage first.
        if row.examples_sheet_count is None and "examples_sheet_count" not in updates:
            row.examples_sheet_count = default_examples_sheet_count(
                row.examples_count or DEFAULT_EXAMPLES_COUNT
            )
        row.examples_count = updates["examples_count"]
    if "examples_max_providers" in updates:
        row.examples_max_providers = updates["examples_max_providers"]
    if "examples_sheet_count" in updates:
        row.examples_sheet_count = updates["examples_sheet_count"]
    for key in ("theme", "value_color", "value_color_custom"):
        if key in updates:
            setattr(row, key, updates[key])

    if "providers" in updates:
        # Reassigned as a new dict (not mutated in place) so SQLAlchemy's
        # plain (non-Mutable) JSONB column tracks the change as dirty.
        prefs = dict(row.provider_prefs or {})
        for kind, kind_update in updates["providers"].items():
            if kind not in kinds:
                continue
            existing = dict(prefs.get(kind, {}))
            if "order" in kind_update:
                existing["order"] = kind_update["order"]
            if "disabled" in kind_update:
                existing["disabled"] = kind_update["disabled"]
            prefs[kind] = existing
        row.provider_prefs = prefs

    db.flush()
