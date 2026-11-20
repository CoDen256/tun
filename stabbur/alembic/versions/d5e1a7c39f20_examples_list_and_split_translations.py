"""examples list, split translations, appearance settings

stabbur-editor-redesign design D4/D5/D12 — the one migration that does all
of that change's data surgery, exactly once, inside alembic's single
transaction:

1. `notes.examples` (JSONB array, NOT NULL, default `[]`) is added and
   filled from `notes.context_text`: split on newlines, each line trimmed,
   empty lines dropped, order kept.
2. Every translation row whose `text` contains `" / "` (the separator the
   retired append merge-mode glued a second candidate on with) is replaced,
   at its own position, by one row per trimmed, non-empty segment in the
   same `lang`. Within that language only exact duplicates the split itself
   produces are dropped; rows that were already separate are left alone.
3. `notes.context_text` is dropped. `captures.context_text` is untouched —
   the capture is provenance (D85).
4. `settings.translation_merge_mode` is dropped, and the appearance
   preferences `theme`, `value_color`, `value_color_custom` are added
   (nullable, no seeded value, like every other preference on the row).
5. Saved triage queues that filtered on the old column's presence
   (`context_text_presence`) are re-keyed to `examples_presence`, so a
   queue keeps meaning what it meant.

Both splits are mechanical inverses of what wrote them (newline-join and
append-mode), not guesses. IRREVERSIBLE BY DESIGN: the pre-deploy backup
dump is the rollback, so `downgrade` refuses rather than pretending.

Revision ID: d5e1a7c39f20
Revises: e91c7b35a2df
Create Date: 2026-11-20 00:00:00.000000

"""
import json
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision: str = 'd5e1a7c39f20'
down_revision: Union[str, None] = 'e91c7b35a2df'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None

TRANSLATION_SEPARATOR = " / "


def examples_from_context(context_text):
    """D5 step 1: newline-split, trimmed, empty lines dropped, order kept."""
    if not context_text:
        return []
    return [line.strip() for line in context_text.split("\n") if line.strip()]


def split_translations(translations):
    """D5 step 2. A segment is dropped only when it duplicates (same lang,
    same trimmed text) a row that was already separate, or a segment an
    earlier split in this note already emitted — i.e. only duplicates the
    split itself produces. Pre-existing duplicate rows are not touched."""
    if not isinstance(translations, list):
        return translations, False
    unsplit = {
        (row.get("lang"), row.get("text"))
        for row in translations
        if isinstance(row, dict)
        and isinstance(row.get("text"), str)
        and TRANSLATION_SEPARATOR not in row["text"]
    }
    emitted = set()
    out = []
    changed = False
    for row in translations:
        text = row.get("text") if isinstance(row, dict) else None
        if not isinstance(text, str) or TRANSLATION_SEPARATOR not in text:
            out.append(row)
            continue
        changed = True
        lang = row.get("lang")
        for segment in text.split(TRANSLATION_SEPARATOR):
            segment = segment.strip()
            if not segment:
                continue
            key = (lang, segment)
            if key in unsplit or key in emitted:
                continue
            emitted.add(key)
            new_row = dict(row)
            new_row["text"] = segment
            out.append(new_row)
    return out, changed


def upgrade() -> None:
    bind = op.get_bind()

    op.add_column(
        'notes',
        sa.Column('examples', postgresql.JSONB(), nullable=False, server_default=sa.text("'[]'::jsonb")),
    )

    rows = bind.execute(sa.text("SELECT id, context_text, translations FROM notes")).fetchall()
    for note_id, context_text, translations in rows:
        examples = examples_from_context(context_text)
        new_translations, translations_changed = split_translations(translations)
        if not examples and not translations_changed:
            continue
        # updated_at is deliberately NOT bumped: the builder regenerates
        # every minted card's content on each publish anyway (design D6),
        # and a bump would make every migrated note look operator-edited.
        bind.execute(
            sa.text(
                "UPDATE notes SET examples = CAST(:examples AS jsonb), "
                "translations = CAST(:translations AS jsonb) WHERE id = :id"
            ),
            {
                "id": note_id,
                "examples": json.dumps(examples, ensure_ascii=False),
                "translations": json.dumps(new_translations, ensure_ascii=False),
            },
        )

    op.drop_column('notes', 'context_text')

    # Saved queues: re-key the presence filter on the dropped column.
    settings_rows = bind.execute(
        sa.text("SELECT id, triage_queues FROM settings WHERE triage_queues IS NOT NULL")
    ).fetchall()
    for settings_id, queues in settings_rows:
        if not isinstance(queues, list):
            continue
        changed = False
        for queue in queues:
            filters = queue.get("filters") if isinstance(queue, dict) else None
            if isinstance(filters, dict) and "context_text_presence" in filters:
                filters["examples_presence"] = filters.pop("context_text_presence")
                changed = True
        if changed:
            bind.execute(
                sa.text("UPDATE settings SET triage_queues = CAST(:q AS jsonb) WHERE id = :id"),
                {"id": settings_id, "q": json.dumps(queues, ensure_ascii=False)},
            )

    # Dropping the column drops its ck_settings_merge_mode check with it.
    op.drop_column('settings', 'translation_merge_mode')

    op.add_column('settings', sa.Column('theme', sa.Text(), nullable=True))
    op.add_column('settings', sa.Column('value_color', sa.Text(), nullable=True))
    op.add_column('settings', sa.Column('value_color_custom', sa.Text(), nullable=True))
    op.create_check_constraint(
        'ck_settings_theme', 'settings', "theme IS NULL OR theme IN ('auto', 'light', 'dark')"
    )
    op.create_check_constraint(
        'ck_settings_value_color',
        'settings',
        "value_color IS NULL OR value_color IN ('blue', 'teal', 'violet', 'orange', 'custom')",
    )
    op.create_check_constraint(
        'ck_settings_value_color_custom',
        'settings',
        "value_color_custom IS NULL OR value_color_custom ~ '^#[0-9a-fA-F]{6}$'",
    )


def downgrade() -> None:
    raise NotImplementedError(
        "d5e1a7c39f20 is irreversible by design (stabbur-editor-redesign D5): "
        "restore the pre-deploy backup dump instead."
    )
