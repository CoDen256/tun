"""
routes/notes.py — the authoring CRUD (`notes-authoring` spec, design.md
D-N3) and the one-directional read API (`notes-read-api` spec, D-N4) that
`mjolnir/hub` pulls from.
"""

from __future__ import annotations

import copy
import datetime

from flask import jsonify, request
from sqlalchemy import Float, Text, and_, case, cast, func, literal, or_, select
from sqlalchemy.exc import IntegrityError

import similarity
from db.models import NOTE_ORIGINS, NOTE_STATUSES, NOTE_TYPES, GrammarRule, Note
from db.session import session_scope

# similar-notes-merge tasks.md 4.2: fields a merge may copy from a related
# note into the survivor. Deliberately excludes `status`, `origin`, and
# `import_ref` — status governs which note survives (design D3) and
# origin/import_ref are immutable provenance (note-origin-provenance D5),
# neither of which a field-level take should be able to touch.
MERGE_TAKE_FIELDS = (
    "text",
    "translations",
    "transcription",
    "pos",
    "lemma",
    "inflections",
    "examples",
    "audio_blob",
    "audio_sel_ms",
)

# stabbur-merge-fixes D2: a take is either additive or replacive, fixed per
# field. `translations` and `examples` add (stabbur-editor-redesign D10:
# `examples` took over the old context text's additive role) — the survivor's own value is
# never discarded, because combining two drafts' knowledge is the point of a
# merge. Everything else replaces: an inflection paradigm is one coherent
# object (unioning it slot-by-slot across two notes describes no actual
# word), and the remaining fields are single-valued. Declared here so the
# distinction is readable without tracing the merge loop; the loop below is
# what enforces it.
MERGE_ADDITIVE_FIELDS = ("translations", "examples")

# stabbur-merge-fixes D1: the fields the merge request may carry as the
# survivor's current (unsaved) form state. The same set `patch_note` accepts
# — a merge saves the open form exactly the way Save would, then applies the
# takes on top. `origin`/`import_ref` are absent on purpose: immutable
# provenance (design.md D5), enforced below as well.
MERGE_SURVIVOR_VALUE_FIELDS = (
    "type",
    "source_lang",
    "text",
    "status",
    "capture_id",
    "translations",
    "transcription",
    "pos",
    "lemma",
    "inflections",
    "examples",
    "audio_blob",
    "audio_sel_ms",
    "grammar_rule_id",
)

# The fields `patch_note` writes — the same set a merge may carry as form
# state for either side (survivor or absorbed).
PATCHABLE_FIELDS = MERGE_SURVIVOR_VALUE_FIELDS

# stabbur-editor-redesign D11: every authored field a duplicate copies.
# Status (always draft) and provenance (always manual, unlinked) are set by
# the route instead.
DUPLICATED_FIELDS = (
    "type",
    "source_lang",
    "text",
    "translations",
    "transcription",
    "pos",
    "lemma",
    "inflections",
    "examples",
    "audio_blob",
    "audio_sel_ms",
    "grammar_rule_id",
)


def copy_value(value):
    """A deep-enough copy of a JSONB value so the copy never shares a list
    or dict object with the original's in-session state."""
    return copy.deepcopy(value)


SIMILAR_NOTES_SIGNAL_LABELS = {
    "spelling": "spelled alike",
    "morphology": "same word family",
    "semantic": "related",
}

# stabbur-triage-queues task 1.2: the fields a saved queue can filter on by
# presence, mapped to their column. Three-state (`any` / `missing` / `has`).
#
# "missing" is deliberately NOT just `IS NULL`. `inflections` and
# `translations` are NOT NULL columns, so their empty value (`{}` / `[]`) is
# the only reachable missing state; the rest are nullable, so for those both
# NULL and the empty string are real and both count. Keying off nullability
# would make the sweep queues silently skip exactly the notes they exist to
# find — a note whose `inflections` is `{}` is missing inflections by any
# reading the operator would recognise (design D2).
FIELD_PRESENCE_FILTERS = (
    "audio_blob",
    "transcription",
    "inflections",
    "examples",
    "translations",
    "lemma",
)
FIELD_PRESENCE_STATES = ("any", "missing", "has")

# Paging (design D4). A bounded default so the response stays small whatever
# the note count, and a hard ceiling so a hand-typed limit cannot ask for
# everything and undo the point of paging.
DEFAULT_PAGE_LIMIT = 50
MAX_PAGE_LIMIT = 200

UPDATED_SINCE_WINDOWS = {
    "24h": datetime.timedelta(hours=24),
    "7d": datetime.timedelta(days=7),
    "30d": datetime.timedelta(days=30),
}


def _is_missing(column):
    """The `missing` predicate for one column: SQL NULL, or empty for its
    type. JSONB columns compare against their own empty literal; text
    columns against the empty string."""
    name = column.key
    if name in ("inflections",):
        return or_(column.is_(None), cast(column, Text) == "{}")
    if name in ("translations", "examples"):
        return or_(column.is_(None), cast(column, Text) == "[]")
    return or_(column.is_(None), column == "")


# stabbur-editor-redesign notes-browser delta: the editor's done-markers,
# computed in SQL so the list can sort on them server-side and page. The
# applicable fields are exactly the markers' (Word | Sound | Meaning, plus
# Grammar only on a grammar note):
#   Word    text, type, pos, lemma, + inflections when the pos has a paradigm
#           (every slot of that pos's field set filled)
#   Sound   audio, transcription (IPA)
#   Meaning translations non-empty, examples non-empty
#   Grammar the linked rule — counted only when type = grammar
# The paradigm field sets are the editor's own INFLECTION_SHAPES (ui.js);
# adverb's single `form` slot is not a paradigm and does not count.
PARADIGM_FIELDS = {
    "substantiv": ("article", "sg_indef", "sg_def", "pl_indef", "pl_def"),
    "adjektiv": ("positiv", "nøytrum", "flertall", "komparativ", "superlativ"),
    "verb": ("infinitiv", "presens", "preteritum", "perfektum"),
}


def _filled(column):
    return case((_is_missing(column), 0), else_=1)


def _completeness_columns():
    """(filled, applicable) as SQL expressions over `notes`."""
    paradigm_filled = case(
        *[
            (
                and_(
                    Note.pos == pos,
                    *[func.coalesce(func.btrim(Note.inflections[key].astext), "") != "" for key in keys],
                ),
                1,
            )
            for pos, keys in PARADIGM_FIELDS.items()
        ],
        else_=0,
    )
    paradigm_applicable = case((Note.pos.in_(tuple(PARADIGM_FIELDS)), 1), else_=0)
    grammar_filled = case((and_(Note.type == "grammar", Note.grammar_rule_id.is_not(None)), 1), else_=0)
    grammar_applicable = case((Note.type == "grammar", 1), else_=0)
    filled = (
        _filled(Note.text)
        + _filled(Note.type)
        + _filled(Note.pos)
        + _filled(Note.lemma)
        + paradigm_filled
        + _filled(Note.audio_blob)
        + _filled(Note.transcription)
        + _filled(Note.translations)
        + _filled(Note.examples)
        + grammar_filled
    )
    applicable = literal(8) + paradigm_applicable + grammar_applicable
    return filled, applicable


COMPLETENESS_FILLED, COMPLETENESS_APPLICABLE = _completeness_columns()
COMPLETENESS_RATIO = cast(COMPLETENESS_FILLED, Float) / cast(COMPLETENESS_APPLICABLE, Float)

# The notes browser's multi-value filters: a comma-separated list (repeating
# the parameter works too). "missing" names a field the operator wants
# EMPTY; several are ANDed.
MISSING_FILTER_FIELDS = {
    "ipa": "transcription",
    "translations": "translations",
    "examples": "examples",
    "lemma": "lemma",
}
AUDIO_FILTER_STATES = ("has", "none")
# Rolling windows, like `updated_since` (and the same lengths): "today" is
# the last 24 hours, not since a midnight in some timezone.
UPDATED_WITHIN_WINDOWS = {
    "today": datetime.timedelta(hours=24),
    "week": datetime.timedelta(days=7),
    "month": datetime.timedelta(days=30),
}

AUTHORING_SORTS = {
    # Least complete first; ties by most recently updated.
    "complete_asc": (COMPLETENESS_RATIO.asc(), Note.updated_at.desc()),
    "complete_desc": (COMPLETENESS_RATIO.desc(), Note.updated_at.desc()),
    "updated_desc": Note.updated_at.desc(),
    "updated_asc": Note.updated_at.asc(),
    "created_desc": Note.created_at.desc(),
    "created_asc": Note.created_at.asc(),
    "text_asc": Note.text.asc(),
    "text_desc": Note.text.desc(),
}

REQUIRED_CREATE_FIELDS = ("type", "source_lang", "text")

# Every field in design.md D-N4's exact response shape, in that order.
READ_API_FIELDS = (
    "id",
    "created_at",
    "capture_id",
    "type",
    "source_lang",
    "text",
    "translations",
    "transcription",
    "pos",
    "lemma",
    "inflections",
    "examples",
    "audio_blob",
    "audio_sel_ms",
    "grammar_rule_id",
    "status",
)


def _iso(dt: datetime.datetime | None) -> str | None:
    return dt.isoformat() if dt is not None else None


def _serialize_public(note: Note) -> dict:
    """The exact `notes-read-api` contract (D-N4) — no more, no less."""
    return {
        "id": note.id,
        "created_at": _iso(note.created_at),
        "capture_id": note.capture_id,
        "type": note.type,
        "source_lang": note.source_lang,
        "text": note.text,
        "translations": note.translations,
        "transcription": note.transcription,
        "pos": note.pos,
        "lemma": note.lemma,
        "inflections": note.inflections,
        "examples": note.examples or [],
        "audio_blob": note.audio_blob,
        "audio_sel_ms": note.audio_sel_ms,
        "grammar_rule_id": note.grammar_rule_id,
        "status": note.status,
    }


def _serialize_authoring(note: Note) -> dict:
    """The authoring surface's own representation — a superset of the
    public contract with the fields an editor needs (`seq`, `updated_at`,
    tombstone state) that `notes-read-api` deliberately does not expose."""
    data = _serialize_public(note)
    data["seq"] = note.seq
    data["updated_at"] = _iso(note.updated_at)
    data["deleted_at"] = _iso(note.deleted_at)
    data["origin"] = note.origin
    data["import_ref"] = note.import_ref
    return data


# triage-editor-ux-fixes follow-up: smia's paradigm forms read naturally
# with their grammatical marker in front (å ringe, har ringt, en ring) —
# redundant once the value is filed under its own already-labeled field.
# Mirrors ui.js's INFLECTION_FIELD_PREFIX_STOPWORDS/normalizeInflectionValue
# — kept in sync by hand, since the two run in different languages.
_INFLECTION_FIELD_PREFIX_STOPWORDS = {
    "infinitiv": ("å",),
    "perfektum": ("har", "er"),
    "sg_indef": ("en", "et", "ei"),
    "sg_def": ("en", "et", "ei"),
}
# A superlativ answer is often two "/"-joined forms (bare + its +e definite
# variant, e.g. "strengest/strengeste") — one field holds one form, so only
# the first is kept.
_INFLECTION_FIELD_SLASH_VARIANT_FIELDS = {"superlativ"}


def _normalize_inflections(inflections: dict | None) -> dict:
    if not inflections:
        return {}
    out = {}
    for key, value in inflections.items():
        if key in _INFLECTION_FIELD_SLASH_VARIANT_FIELDS and isinstance(value, str) and "/" in value:
            value = value.split("/")[0].strip()
        stopwords = _INFLECTION_FIELD_PREFIX_STOPWORDS.get(key)
        if stopwords and isinstance(value, str):
            tokens = value.strip().split()
            if len(tokens) > 1 and tokens[0].lower() in stopwords:
                value = " ".join(tokens[1:])
        out[key] = value
    return out


# A "take translations" wholesale-replacing the survivor's own list (the
# way every other take field works, since those are single-value fields)
# would silently drop any translation the survivor already had — a merge
# is supposed to combine two drafts' knowledge, not pick a winner for a
# list-shaped field. stabbur-editor-redesign D7/D10: translations are always
# separate rows, so an incoming row is appended unless the survivor already
# has that exact translation (same language, case-insensitively; same
# trimmed text). No row is ever joined onto another with a separator.
def _merge_translation_lists(existing: list | None, incoming: list | None) -> list:
    merged = [dict(e) for e in (existing or []) if isinstance(e, dict)]
    seen = {((e.get("lang") or "").lower(), (e.get("text") or "").strip()) for e in merged}
    for item in incoming or []:
        if not isinstance(item, dict):
            continue
        lang, text = item.get("lang"), item.get("text")
        if lang is None or text is None:
            continue
        key = (lang.lower(), text.strip())
        if key in seen:
            continue
        seen.add(key)
        merged.append({"lang": lang, "text": text})
    return merged


# stabbur-editor-redesign D10 (replacing stabbur-merge-fixes D3's context
# join): examples are a list, so the incoming sentences are appended in
# order, skipping any exact (trimmed) duplicate of one the survivor already
# has or one this merge already brought across. Near-duplicates are
# deliberately left alone — deciding two sentences are "the same enough" is
# a judgement this route has no business making silently.
def _merge_example_lists(existing: list | None, incoming: list | None) -> list:
    merged = list(existing or [])
    seen = {e.strip() for e in merged if isinstance(e, str)}
    for sentence in incoming or []:
        if not isinstance(sentence, str) or not sentence.strip():
            continue
        if sentence.strip() in seen:
            continue
        seen.add(sentence.strip())
        merged.append(sentence)
    return merged


def _validate_examples(value) -> str | None:
    """notes-schema: `examples` is an ordered list of non-empty sentences."""
    if not isinstance(value, list):
        return "examples must be a list of strings"
    for item in value:
        if not isinstance(item, str) or not item.strip():
            return "every example must be a non-empty string"
    return None


def _validate_form_values(values: dict, note: Note, role: str = "survivor") -> str | None:
    """stabbur-merge-fixes tasks 1.2/1.3: submitted form state is held to
    exactly the rules `patch_note` applies, and is validated in full before
    anything is written, so an invalid value can never be partially applied.
    Used for the survivor's values and (stabbur-editor-redesign D10) for an
    absorbed note's values. Returns an error message, or None."""
    unknown = [f for f in values if f not in PATCHABLE_FIELDS and f not in ("origin", "import_ref")]
    if unknown:
        return f"cannot set field {unknown[0]!r} on the {role}"

    error = _validate_type_and_status(values, note.type, note.status)
    if error:
        return error

    # The identical value is accepted so a round-trip of the whole note
    # object through the merge request isn't broken by immutability.
    if "origin" in values and values["origin"] != note.origin:
        return "origin is immutable once set"
    if "import_ref" in values and values["import_ref"] != note.import_ref:
        return "import_ref is immutable once set"

    missing = [f for f in REQUIRED_CREATE_FIELDS if f in values and not values[f]]
    if missing:
        return f"missing required fields: {missing}"

    if "examples" in values:
        error = _validate_examples(values["examples"])
        if error:
            return error

    return None


def _apply_form_values(note: Note, values: dict) -> None:
    """Writes submitted form state onto a note. Absent fields mean
    "unchanged" (tasks 1.1), so a client that doesn't send them — an older
    one, or a merge driven from somewhere without an open form — still gets
    the previous behaviour of merging the stored row."""
    for field in PATCHABLE_FIELDS:
        if field in values:
            setattr(note, field, values[field])


def _serialize_similar_match(note: Note, signals: dict) -> dict:
    """similar-notes-merge tasks.md 4.1: a match with its reasons, status,
    origin, and which fields it has to offer — never a bare blended score
    (design D1)."""
    reasons = []
    if "spelling" in signals:
        reasons.append(
            {"signal": "spelling", "label": SIMILAR_NOTES_SIGNAL_LABELS["spelling"], "score": signals["spelling"]}
        )
    if "morphology" in signals:
        reasons.append({"signal": "morphology", "label": SIMILAR_NOTES_SIGNAL_LABELS["morphology"]})
    if "semantic" in signals:
        reasons.append({"signal": "semantic", "label": SIMILAR_NOTES_SIGNAL_LABELS["semantic"]})

    return {
        "id": note.id,
        "text": note.text,
        "type": note.type,
        "status": note.status,
        "origin": note.origin,
        "import_ref": note.import_ref,
        "reasons": reasons,
        "has_audio": note.audio_blob is not None,
        "has_transcription": note.transcription is not None,
        "has_inflections": bool(note.inflections),
        "has_examples": bool(note.examples),
        "has_translations": bool(note.translations),
        "has_pos": note.pos is not None,
        # stabbur-merge-fixes task 3.1: `lemma` gained a take control, which
        # is shown only when the match actually has one. `text` needs no
        # such flag — every note has a text by construction.
        "has_lemma": note.lemma is not None and note.lemma != "",
        # triage-editor-ux-fixes D4: the actual values, not just presence —
        # reading fields already loaded on `note` to compute the booleans
        # above, not an extra query. The booleans stay too; existing UI
        # logic still branches on them for which take-buttons to render.
        "translations": note.translations or [],
        "examples": note.examples or [],
        "inflections": _normalize_inflections(note.inflections),
        "transcription": note.transcription,
        "audio_blob": note.audio_blob,
        "pos": note.pos,
        "lemma": note.lemma,
    }


def _multi_arg(name: str) -> list[str]:
    """A multi-value query parameter: comma-separated and/or repeated.
    Empty items are dropped; order is kept, duplicates removed."""
    values = []
    for raw in request.args.getlist(name):
        for item in raw.split(","):
            item = item.strip()
            if item and item not in values:
                values.append(item)
    return values


def _validate_type_and_status(body: dict, existing_type: str | None, existing_status: str | None) -> str | None:
    type_ = body.get("type", existing_type)
    status = body.get("status", existing_status)
    if type_ is not None and type_ not in NOTE_TYPES:
        return f"type must be one of {NOTE_TYPES}"
    if status is not None and status not in NOTE_STATUSES:
        return f"status must be one of {NOTE_STATUSES}"
    return None


def _derive_origin(body: dict) -> tuple[str | None, str | None]:
    """design.md D6: explicit `origin` wins; omitted derives `capture` if
    `capture_id` is present, else `manual`. `import` is never derived — an
    `import_ref` with no explicit `origin`, or `origin=import` with no
    `import_ref`, is a 400. Returns (origin, error)."""
    origin = body.get("origin")
    if origin is not None and origin not in NOTE_ORIGINS:
        return None, f"origin must be one of {NOTE_ORIGINS}"

    if origin is None:
        if body.get("import_ref") is not None:
            return None, "import_ref requires an explicit origin=import"
        origin = "capture" if body.get("capture_id") else "manual"

    if origin == "import" and body.get("import_ref") is None:
        return None, "origin=import requires import_ref"

    return origin, None


def register_notes_routes(app):
    @app.route("/api/notes", methods=["POST"])
    def create_note():
        body = request.get_json(silent=True)
        if body is None:
            return jsonify({"error": "JSON body required"}), 400

        missing = [f for f in REQUIRED_CREATE_FIELDS if not body.get(f)]
        if missing:
            return jsonify({"error": f"missing required fields: {missing}"}), 400

        error = _validate_type_and_status(body, None, None)
        if error:
            return jsonify({"error": error}), 400

        origin, error = _derive_origin(body)
        if error:
            return jsonify({"error": error}), 400

        if "examples" in body:
            error = _validate_examples(body["examples"])
            if error:
                return jsonify({"error": error}), 400

        note = Note(
            type=body["type"],
            source_lang=body["source_lang"],
            text=body["text"],
            status=body.get("status", "draft"),
            capture_id=body.get("capture_id"),
            origin=origin,
            import_ref=body.get("import_ref"),
            translations=body.get("translations", []),
            transcription=body.get("transcription"),
            pos=body.get("pos"),
            lemma=body.get("lemma"),
            inflections=body.get("inflections", {}),
            examples=body.get("examples", []),
            audio_blob=body.get("audio_blob"),
            audio_sel_ms=body.get("audio_sel_ms"),
            grammar_rule_id=body.get("grammar_rule_id"),
        )

        with session_scope() as db:
            db.add(note)
            try:
                db.flush()
            except IntegrityError as exc:
                db.rollback()
                return jsonify({"error": _integrity_error_message(exc)}), 400
            return jsonify(_serialize_authoring(note)), 201

    @app.route("/api/notes/<note_id>", methods=["GET"])
    def get_note(note_id):
        with session_scope() as db:
            note = db.get(Note, note_id)
            if note is None:
                return jsonify({"error": "not found"}), 404
            return jsonify(_serialize_authoring(note)), 200

    @app.route("/api/notes/<note_id>", methods=["PATCH"])
    def patch_note(note_id):
        body = request.get_json(silent=True)
        if body is None:
            return jsonify({"error": "JSON body required"}), 400

        with session_scope() as db:
            note = db.get(Note, note_id)
            if note is None:
                return jsonify({"error": "not found"}), 404

            error = _validate_type_and_status(body, note.type, note.status)
            if error:
                return jsonify({"error": error}), 400

            # design.md D5: origin/import_ref are immutable — rewriting
            # provenance falsifies a record, it doesn't correct one. The
            # identical value is accepted so a GET -> PATCH round-trip of
            # the full note object isn't broken by this rule.
            if "origin" in body and body["origin"] != note.origin:
                return jsonify({"error": "origin is immutable once set"}), 400
            if "import_ref" in body and body["import_ref"] != note.import_ref:
                return jsonify({"error": "import_ref is immutable once set"}), 400

            if "examples" in body:
                error = _validate_examples(body["examples"])
                if error:
                    return jsonify({"error": error}), 400

            for field in PATCHABLE_FIELDS:
                if field in body:
                    setattr(note, field, body[field])

            try:
                db.flush()
            except IntegrityError as exc:
                db.rollback()
                return jsonify({"error": _integrity_error_message(exc)}), 400
            return jsonify(_serialize_authoring(note)), 200

    @app.route("/api/notes/<note_id>", methods=["DELETE"])
    def delete_note(note_id):
        with session_scope() as db:
            note = db.get(Note, note_id)
            if note is None:
                return jsonify({"error": "not found"}), 404

            # A draft has never been eligible for the read API to have
            # pulled it — safe to free the id entirely. Anything that has
            # ever reached `ready` could plausibly already be minted
            # (notes-schema spec), so it becomes a tombstone instead.
            if note.status == "draft":
                db.delete(note)
                return "", 204

            if note.deleted_at is None:
                note.deleted_at = datetime.datetime.now(datetime.timezone.utc)
            return jsonify(_serialize_authoring(note)), 200

    @app.route("/api/notes", methods=["GET"])
    def list_notes():
        """`notes-read-api`'s one-directional pull endpoint (D-N4). `status`
        is accepted but has no effect beyond the hard `status=ready` filter
        below — there is no way to ask this endpoint for drafts, regardless
        of what `status=` is set to."""
        source_lang = request.args.get("source_lang")
        since = request.args.get("since")

        stmt = select(Note).where(Note.status == "ready", Note.deleted_at.is_(None))
        if source_lang:
            stmt = stmt.where(Note.source_lang == source_lang)
        if since:
            try:
                since_dt = datetime.datetime.fromisoformat(since.replace("Z", "+00:00"))
            except ValueError:
                return jsonify({"error": "since must be ISO8601"}), 400
            # Filters on updated_at, not created_at, so an edit to an
            # already-ready note is picked up by a later `since` pull too
            # (design.md's Risks/Trade-offs: builder's content-regeneration
            # needs this, not just newly-created notes).
            stmt = stmt.where(Note.updated_at >= since_dt)
        stmt = stmt.order_by(Note.created_at)

        with session_scope() as db:
            notes = db.scalars(stmt).all()
            return jsonify([_serialize_public(n) for n in notes]), 200

    @app.route("/api/notes/authoring", methods=["GET"])
    def list_notes_authoring():
        """D-S1 — the operator-only authoring list: every status, filterable/
        sortable/searchable. A deliberately separate route and query path
        from `list_notes` above (D44's public contract) — never touches that
        function or its `status == "ready"` filter."""
        status = request.args.get("status")
        if status is not None and status not in NOTE_STATUSES:
            return jsonify({"error": f"status must be one of {NOTE_STATUSES}"}), 400

        types = _multi_arg("type")
        if any(t not in NOTE_TYPES for t in types):
            return jsonify({"error": f"type must be one or more of {NOTE_TYPES}"}), 400

        origins = _multi_arg("origin")
        if any(o not in NOTE_ORIGINS for o in origins):
            return jsonify({"error": f"origin must be one or more of {NOTE_ORIGINS}"}), 400

        audio = request.args.get("audio")
        if audio is not None and audio != "any" and audio not in AUDIO_FILTER_STATES:
            return jsonify({"error": f"audio must be one of {['any', *AUDIO_FILTER_STATES]}"}), 400

        missing_fields = _multi_arg("missing")
        if any(m not in MISSING_FILTER_FIELDS for m in missing_fields):
            return jsonify({"error": f"missing must be one or more of {list(MISSING_FILTER_FIELDS)}"}), 400

        updated_within = request.args.get("updated_within")
        if updated_within is not None and updated_within != "any" and updated_within not in UPDATED_WITHIN_WINDOWS:
            return (
                jsonify({"error": f"updated_within must be one of {['any', *UPDATED_WITHIN_WINDOWS]}"}),
                400,
            )

        sort = request.args.get("sort", "updated_desc")
        if sort not in AUTHORING_SORTS:
            return jsonify({"error": f"sort must be one of {sorted(AUTHORING_SORTS)}"}), 400

        stmt = select(Note).where(Note.deleted_at.is_(None))
        if status:
            stmt = stmt.where(Note.status == status)
        if types:
            stmt = stmt.where(Note.type.in_(types))
        if origins:
            stmt = stmt.where(Note.origin.in_(origins))
        # Any part of speech, including a custom one — the classes are the
        # editor's menu, not a constraint on stored data.
        pos_values = _multi_arg("pos")
        if pos_values:
            stmt = stmt.where(Note.pos.in_(pos_values))
        if audio == "has":
            stmt = stmt.where(~_is_missing(Note.audio_blob))
        elif audio == "none":
            stmt = stmt.where(_is_missing(Note.audio_blob))
        for name in missing_fields:
            stmt = stmt.where(_is_missing(getattr(Note, MISSING_FILTER_FIELDS[name])))
        if updated_within and updated_within != "any":
            cutoff = datetime.datetime.now(datetime.timezone.utc) - UPDATED_WITHIN_WINDOWS[updated_within]
            stmt = stmt.where(Note.updated_at >= cutoff)
        grammar_rule_id = request.args.get("grammar_rule_id")
        if grammar_rule_id:
            stmt = stmt.where(Note.grammar_rule_id == grammar_rule_id)
        q = request.args.get("q")
        if q:
            needle = f"%{q}%"
            stmt = stmt.where(
                or_(
                    Note.text.ilike(needle),
                    Note.lemma.ilike(needle),
                    cast(Note.translations, Text).ilike(needle),
                )
            )

        # stabbur-triage-queues task 1.1: two dimensions added beyond the
        # operator's list, both free from columns that already exist.
        source_lang = request.args.get("source_lang")
        if source_lang:
            stmt = stmt.where(Note.source_lang == source_lang)

        updated_since = request.args.get("updated_since")
        if updated_since:
            window = UPDATED_SINCE_WINDOWS.get(updated_since)
            if window is None:
                return (
                    jsonify({"error": f"updated_since must be one of {sorted(UPDATED_SINCE_WINDOWS)}"}),
                    400,
                )
            cutoff = datetime.datetime.now(datetime.timezone.utc) - window
            stmt = stmt.where(Note.updated_at >= cutoff)

        # task 1.2/1.3: three-state field presence. An unknown state is a
        # 400, never silently ignored — a queue that quietly stopped
        # filtering would look like a queue with different contents.
        for field in FIELD_PRESENCE_FILTERS:
            state = request.args.get(f"{field}_presence")
            if state is None or state == "any":
                continue
            if state not in FIELD_PRESENCE_STATES:
                return (
                    jsonify({"error": f"{field}_presence must be one of {list(FIELD_PRESENCE_STATES)}"}),
                    400,
                )
            column = getattr(Note, field)
            predicate = _is_missing(column)
            stmt = stmt.where(predicate if state == "missing" else ~predicate)

        # Paging (task 2.1). Bounded, and a bad value is a 400 rather than a
        # silent clamp — a clamped page size makes the pager's own arithmetic
        # lie about which slice is on screen.
        try:
            limit = int(request.args.get("limit", DEFAULT_PAGE_LIMIT))
            offset = int(request.args.get("offset", 0))
        except ValueError:
            return jsonify({"error": "limit and offset must be integers"}), 400
        if limit < 1 or limit > MAX_PAGE_LIMIT:
            return jsonify({"error": f"limit must be between 1 and {MAX_PAGE_LIMIT}"}), 400
        if offset < 0:
            return jsonify({"error": "offset must not be negative"}), 400

        order = AUTHORING_SORTS[sort]
        stmt = stmt.order_by(*(order if isinstance(order, tuple) else (order,)))

        with session_scope() as db:
            # The total counts the FILTERS, not the page (task 2.2) — it is
            # what the pager divides into pages, so it is computed from the
            # same statement with its ordering and window removed.
            counted = stmt.order_by(None).subquery()
            total = db.scalar(select(func.count()).select_from(counted))
            # The summary line's breakdown must describe the FILTERED set,
            # not the page — deriving it from the page (as the unpaged list
            # did from the whole array) would quietly turn "69 missing audio"
            # into "however many of these 20 are missing audio".
            ready = db.scalar(
                select(func.count()).select_from(counted).where(counted.c.status == "ready")
            )
            # The SAME predicate the `audio_blob_presence=missing` filter
            # uses — NULL *or* empty. Counting only NULL here would let a
            # note sit in the queue without being in the number that sent
            # the operator to it.
            missing_audio = db.scalar(
                select(func.count()).select_from(counted).where(_is_missing(counted.c.audio_blob))
            )
            page = db.execute(
                stmt.add_columns(COMPLETENESS_FILLED, COMPLETENESS_APPLICABLE).limit(limit).offset(offset)
            ).all()
            rows = []
            for note, filled, applicable in page:
                row = _serialize_authoring(note)
                # The same numbers `sort=complete_asc` orders by, for the
                # list's Complete column.
                row["completeness"] = {"filled": filled, "applicable": applicable}
                rows.append(row)
            return (
                jsonify(
                    {
                        "notes": rows,
                        "total": total,
                        "limit": limit,
                        "offset": offset,
                        "counts": {
                            "ready": ready,
                            "draft": total - ready,
                            "missing_audio": missing_audio,
                        },
                    }
                ),
                200,
            )

    @app.route("/api/notes/authoring/counts", methods=["GET"])
    def notes_authoring_counts():
        """note-triage: a remaining count per origin for the queue selector
        (design.md tasks 1.3), so switching queues doesn't require fetching
        every origin's full note list just to show a count."""
        status = request.args.get("status", "draft")
        if status not in NOTE_STATUSES:
            return jsonify({"error": f"status must be one of {NOTE_STATUSES}"}), 400

        with session_scope() as db:
            rows = db.execute(
                select(Note.origin, func.count())
                .where(Note.status == status, Note.deleted_at.is_(None))
                .group_by(Note.origin)
            ).all()
            counts = dict.fromkeys(NOTE_ORIGINS, 0)
            counts.update(dict(rows))
            return jsonify(counts), 200

    @app.route("/api/grammar_rules", methods=["POST"])
    def create_grammar_rule():
        # Minimal support so the authoring UI can create a grammar_rule row
        # for `type=grammar` notes to reference (03-data-model.md), without
        # building any of P8's triage machinery around it.
        body = request.get_json(silent=True)
        if body is None or not body.get("title") or not body.get("html"):
            return jsonify({"error": "title and html are required"}), 400
        rule = GrammarRule(title=body["title"], html=body["html"])
        with session_scope() as db:
            db.add(rule)
            db.flush()
            return jsonify(_serialize_grammar_rule(rule, 0)), 201

    @app.route("/api/grammar_rules", methods=["GET"])
    def list_grammar_rules():
        sort = request.args.get("sort", "usage_desc")
        grammar_sorts = ("usage_desc", "usage_asc", "title_asc", "title_desc")
        if sort not in grammar_sorts:
            return jsonify({"error": f"sort must be one of {list(grammar_sorts)}"}), 400
        q = request.args.get("q")

        with session_scope() as db:
            stmt = select(GrammarRule)
            if q:
                stmt = stmt.where(GrammarRule.title.ilike(f"%{q}%"))
            rules = db.scalars(stmt).all()
            counts = _grammar_rule_usage_counts(db, [r.id for r in rules])
            rows = [_serialize_grammar_rule(r, counts.get(r.id, 0)) for r in rules]
            if sort == "usage_desc":
                rows.sort(key=lambda r: r["usage_count"], reverse=True)
            elif sort == "usage_asc":
                rows.sort(key=lambda r: r["usage_count"])
            elif sort == "title_desc":
                rows.sort(key=lambda r: r["title"].lower(), reverse=True)
            else:
                rows.sort(key=lambda r: r["title"].lower())
            return jsonify(rows), 200

    @app.route("/api/grammar_rules/<int:rule_id>", methods=["GET"])
    def get_grammar_rule(rule_id):
        with session_scope() as db:
            rule = db.get(GrammarRule, rule_id)
            if rule is None:
                return jsonify({"error": "not found"}), 404
            counts = _grammar_rule_usage_counts(db, [rule_id])
            return jsonify(_serialize_grammar_rule(rule, counts.get(rule_id, 0))), 200

    @app.route("/api/grammar_rules/<int:rule_id>", methods=["PATCH"])
    def patch_grammar_rule(rule_id):
        body = request.get_json(silent=True)
        if body is None:
            return jsonify({"error": "JSON body required"}), 400

        with session_scope() as db:
            rule = db.get(GrammarRule, rule_id)
            if rule is None:
                return jsonify({"error": "not found"}), 404

            for field in ("title", "html"):
                if field in body:
                    setattr(rule, field, body[field])

            db.flush()
            counts = _grammar_rule_usage_counts(db, [rule_id])
            return jsonify(_serialize_grammar_rule(rule, counts.get(rule_id, 0))), 200

    @app.route("/api/grammar_rules/<int:rule_id>", methods=["DELETE"])
    def delete_grammar_rule(rule_id):
        # D-S3/D-S4's race note: check-then-delete inside the same
        # transaction/session, not two separate round-trips, so a note
        # created with this rule's id between the check and the delete
        # can't slip through.
        with session_scope() as db:
            rule = db.get(GrammarRule, rule_id)
            if rule is None:
                return jsonify({"error": "not found"}), 404

            count = db.scalar(
                select(func.count()).select_from(Note).where(Note.grammar_rule_id == rule_id)
            )
            if count:
                return (
                    jsonify({"error": f"grammar rule is referenced by {count} note(s)", "reference_count": count}),
                    409,
                )

            db.delete(rule)
            return "", 204

    @app.route("/api/notes/<note_id>/similar", methods=["GET"])
    def similar_notes(note_id):
        """similar-notes-merge tasks.md 4.1."""
        with session_scope() as db:
            note = db.get(Note, note_id)
            if note is None:
                return jsonify({"error": "not found"}), 404

            matches = similarity.find_similar(db, note)
            matches.sort(key=lambda m: m["note"].text.lower())
            return jsonify([_serialize_similar_match(m["note"], m["signals"]) for m in matches]), 200

    # ------------------------------------------------------------- merge --
    # HOW THE EDITOR CALLS THIS (stabbur-editor-redesign D10). The merge is
    # two-way in the UI but ONE shape here: a survivor absorbs drafts.
    #
    # "Into this note" — the open note survives:
    #     {survivor_id: <open>, absorbed_ids: [<other>],
    #      take: {<field>: <other>, ...},
    #      survivor_values: <the open form's fields>}
    #
    # "This note into '<other>'" — the open note is absorbed:
    #     {survivor_id: <other>, absorbed_ids: [<open>],
    #      take: {<field>: <open>, ...},
    #      absorbed_values: {<open>: <the open form's fields>}}
    #   `survivor_values` is omitted (the survivor is not being edited); the
    #   open form's unsaved edits travel as `absorbed_values`, which are
    #   applied to the absorbed note before the takes read from it, so what
    #   is taken is what the operator sees, exactly as save-then-merge
    #   (stabbur-merge-fixes D1) guarantees for the survivor side. The open
    #   note must be a draft — stored AND as submitted — or the request is
    #   refused (the UI disables this direction for a ready note).
    #
    # `take` keys: text, lemma, pos, inflections, audio_blob, audio_sel_ms,
    # transcription (all REPLACE), translations, examples (both ADD with
    # de-duplication). Taking `inflections` also brings the source's pos.
    # The response is the survivor (authoring shape) plus `absorbed_ids`.
    @app.route("/api/notes/merge", methods=["POST"])
    def merge_notes():
        """similar-notes-merge tasks.md 4.2-4.7: one survivor absorbs one or
        more notes, taking the given per-field selections. Enforced here,
        not only in the UI (design D3): every absorbed note must be a
        `draft` — that is the single rule the four status combinations
        (tasks.md 6.5) reduce to, since the survivor's own status is
        unconstrained.

        stabbur-merge-fixes: the request also carries `survivor_values`, the
        open form's current state, which is saved onto the survivor *before*
        the takes are applied, inside this same transaction — so a merge can
        never silently discard an edit the operator had not saved.
        stabbur-editor-redesign D10 adds `absorbed_values` for the reverse
        direction (see the block comment above)."""
        body = request.get_json(silent=True)
        if body is None:
            return jsonify({"error": "JSON body required"}), 400

        survivor_id = body.get("survivor_id")
        absorbed_ids = body.get("absorbed_ids") or []
        take = body.get("take") or {}
        # stabbur-merge-fixes D1: the survivor's *currently edited* values,
        # not the stored row. Omitted entirely by an older client, which
        # then keeps working exactly as before.
        survivor_values = body.get("survivor_values")
        if survivor_values is not None and not isinstance(survivor_values, dict):
            return jsonify({"error": "survivor_values must be an object"}), 400
        absorbed_values = body.get("absorbed_values") or {}
        if not isinstance(absorbed_values, dict) or not all(isinstance(v, dict) for v in absorbed_values.values()):
            return jsonify({"error": "absorbed_values must be an object of objects keyed by absorbed id"}), 400

        if not survivor_id or not absorbed_ids:
            return jsonify({"error": "survivor_id and absorbed_ids are required"}), 400
        if survivor_id in absorbed_ids:
            return jsonify({"error": "a note cannot absorb itself"}), 400
        stray = [i for i in absorbed_values if i not in absorbed_ids]
        if stray:
            return jsonify({"error": f"absorbed_values given for {stray[0]}, which is not absorbed"}), 400
        for field in take:
            if field not in MERGE_TAKE_FIELDS:
                return jsonify({"error": f"cannot take field {field!r}"}), 400

        with session_scope() as db:
            survivor = db.get(Note, survivor_id)
            if survivor is None:
                return jsonify({"error": "survivor not found"}), 404

            absorbed_notes = []
            for absorbed_id in absorbed_ids:
                absorbed = db.get(Note, absorbed_id)
                if absorbed is None:
                    return jsonify({"error": f"absorbed note {absorbed_id} not found"}), 404
                submitted_status = absorbed_values.get(absorbed_id, {}).get("status", absorbed.status)
                if absorbed.status != "draft" or submitted_status != "draft":
                    status = absorbed.status if absorbed.status != "draft" else submitted_status
                    return (
                        jsonify(
                            {
                                "error": f"absorbed note {absorbed_id} has status={status!r}; "
                                "only draft notes can be absorbed by a merge"
                            }
                        ),
                        400,
                    )
                absorbed_notes.append(absorbed)
            absorbed_by_id = {n.id: n for n in absorbed_notes}

            # Every take's source is resolved before a single value is
            # written: an unknown source has to be refused without having
            # already applied the takes that happened to be iterated first
            # (session_scope commits on return, so an early return out of a
            # half-applied loop would persist it).
            resolved_takes = []
            for field, source_id in take.items():
                source = survivor if source_id == survivor.id else absorbed_by_id.get(source_id)
                if source is None:
                    return jsonify({"error": f"take source {source_id} is not part of this merge"}), 400
                resolved_takes.append((field, source))
            # An explicitly staged `pos` take is applied last, so it wins
            # over the one an `inflections` take drags along below rather
            # than depending on dict order.
            resolved_takes.sort(key=lambda pair: pair[0] == "pos")

            if survivor_values is not None:
                error = _validate_form_values(survivor_values, survivor)
                if error:
                    return jsonify({"error": error}), 400
            for absorbed_id, values in absorbed_values.items():
                error = _validate_form_values(values, absorbed_by_id[absorbed_id], role="absorbed note")
                if error:
                    return jsonify({"error": error}), 400

            # Ordering is load-bearing (design D1): the forms' values first,
            # the takes on top. A take is the operator saying "and also bring
            # this across", which must win over whatever the form held — and
            # for the two additive fields it is also what makes the result
            # correct, since the taken value then appends to the *edited*
            # value rather than to the stored one. An absorbed note's values
            # are applied for the same reason: the take reads what is shown.
            if survivor_values is not None:
                _apply_form_values(survivor, survivor_values)
            for absorbed_id, values in absorbed_values.items():
                _apply_form_values(absorbed_by_id[absorbed_id], values)

            for field, source in resolved_takes:
                value = getattr(source, field)
                if field == "inflections":
                    # A source note saved before the prefix-stripping fix (or
                    # one whose inflections were never re-edited since) can
                    # still carry the grammatical-marker prefix on its stored
                    # values — stripped here too, so a merge never reintroduces
                    # it onto the survivor.
                    value = _normalize_inflections(value)
                elif field in MERGE_ADDITIVE_FIELDS and source is not survivor:
                    if field == "translations":
                        value = _merge_translation_lists(survivor.translations, value)
                    else:
                        value = _merge_example_lists(survivor.examples, value)
                setattr(survivor, field, value)
                if field == "inflections" and source is not survivor and source.pos is not None:
                    # D2: the paradigm's part of speech comes with it, always
                    # — INFLECTION_SHAPES is keyed by pos, so a paradigm
                    # landing on a note with a different pos renders into
                    # fields that do not exist and the take looks like it did
                    # nothing. Unconditional, and server-side, so the client
                    # has no pairing bookkeeping of its own to get wrong.
                    # A source with no pos of its own is the one exception:
                    # there is nothing to carry, and clearing the survivor's
                    # pos would leave the paradigm just taken with no shape
                    # to render into at all — the opposite of the point.
                    # (A `pos` take on its own is the reverse: it replaces the
                    # part of speech and never touches inflections.)
                    survivor.pos = source.pos

            # Hard-deleted, never tombstoned — every absorbed note was just
            # asserted to be a draft above, and a draft has never been
            # eligible for the read API to have pulled it (design D3).
            # Values applied to it above are discarded with it; they existed
            # only so its takes read the operator's unsaved edits.
            for absorbed in absorbed_notes:
                db.delete(absorbed)

            # D82: bumped explicitly so a merge that takes zero fields (pure
            # duplicate absorption) still counts as a change the builder's
            # `since` pull sees — onupdate=func.now() only fires when a
            # column is actually assigned.
            survivor.updated_at = datetime.datetime.now(datetime.timezone.utc)

            try:
                db.flush()
            except IntegrityError as exc:
                db.rollback()
                return jsonify({"error": _integrity_error_message(exc)}), 400

            result = _serialize_authoring(survivor)
            result["absorbed_ids"] = list(absorbed_ids)
            return jsonify(result), 200

    # --------------------------------------------------------- duplicate --
    # stabbur-editor-redesign D11. A new draft with every authored field
    # copied (audio included: blobs are content-addressed, so the bytes are
    # shared, not copied). Provenance is NOT copied — a capture backs exactly
    # one note and an import ref names one imported note — so the copy is
    # origin=manual with no capture_id and no import_ref. The response is the
    # new note (authoring shape) plus `duplicated_from: <original id>`, which
    # is not stored; the UI uses it to label the copy.
    @app.route("/api/notes/<note_id>/duplicate", methods=["POST"])
    def duplicate_note(note_id):
        with session_scope() as db:
            original = db.get(Note, note_id)
            if original is None:
                return jsonify({"error": "not found"}), 404
            duplicate = Note(
                status="draft",
                origin="manual",
                capture_id=None,
                import_ref=None,
                **{field: copy_value(getattr(original, field)) for field in DUPLICATED_FIELDS},
            )
            db.add(duplicate)
            try:
                db.flush()
            except IntegrityError as exc:
                db.rollback()
                return jsonify({"error": _integrity_error_message(exc)}), 400
            result = _serialize_authoring(duplicate)
            result["duplicated_from"] = original.id
            return jsonify(result), 201


def _serialize_grammar_rule(rule: GrammarRule, usage_count: int) -> dict:
    return {"id": rule.id, "title": rule.title, "html": rule.html, "usage_count": usage_count}


def _grammar_rule_usage_counts(db, rule_ids: list[int]) -> dict[int, int]:
    if not rule_ids:
        return {}
    rows = db.execute(
        select(Note.grammar_rule_id, func.count())
        .where(Note.grammar_rule_id.in_(rule_ids), Note.deleted_at.is_(None))
        .group_by(Note.grammar_rule_id)
    ).all()
    return {rule_id: count for rule_id, count in rows}


def _integrity_error_message(exc: IntegrityError) -> str:
    if "ck_notes_grammar_requires_rule" in str(exc.orig):
        return "type=grammar notes require grammar_rule_id"
    if "ck_notes_type" in str(exc.orig):
        return f"type must be one of {NOTE_TYPES}"
    if "ck_notes_status" in str(exc.orig):
        return f"status must be one of {NOTE_STATUSES}"
    if "ck_notes_origin" in str(exc.orig):
        return f"origin must be one of {NOTE_ORIGINS}"
    if "ck_notes_capture_origin_requires_capture_id" in str(exc.orig):
        return "origin=capture requires capture_id"
    if "ck_notes_import_origin_requires_import_ref" in str(exc.orig):
        return "origin=import requires import_ref"
    if "ck_notes_manual_origin_has_no_provenance" in str(exc.orig):
        return "origin=manual requires both capture_id and import_ref to be null"
    if "ck_captures_source_shape" in str(exc.orig):
        return "source must contain a recognised shape (web or youtube)"
    return "invalid note data"
