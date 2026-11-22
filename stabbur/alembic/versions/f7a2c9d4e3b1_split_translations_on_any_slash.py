"""split every stored translation on any "/"

stabbur-editor-fixes design D9, the operator's finding 13: translations are
separate rows, and a slash between alternatives is a join — whether or not
it has spaces around it. `d5e1a7c39f20` split only on `" / "`, the separator
the retired append merge-mode wrote, because that was the only join this
codebase had ever produced. Real data carries the other shape too, typed by
hand and pasted from providers: "hurry/rush".

So, once, over every note:

- every `translations[].text` is split on EVERY "/" it contains
- each segment is trimmed; a segment empty after trimming is dropped
- a row whose text yields no segment at all is left exactly as it was
- segments replace the row at its own position, in order, in the same `lang`
- a segment is dropped only when it duplicates a row that was ALREADY
  separate, or a segment an earlier split in this note already emitted —
  which is what keeps "hurry/rush" + "rush" from becoming three rows.
  Pre-existing duplicate rows are left alone, exactly as `d5e1a7c39f20`
  left them: this migration undoes joins, it is not a de-duplicator

No note is deleted and no note loses a value. IRREVERSIBLE BY DESIGN, like
the migration before it: a join cannot be reconstructed from the rows, so
`downgrade` refuses rather than pretending. The pre-deploy backup dump is
the rollback.

Revision ID: f7a2c9d4e3b1
Revises: d5e1a7c39f20
Create Date: 2026-11-22 00:00:00.000000

"""
import json
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision: str = 'f7a2c9d4e3b1'
down_revision: Union[str, None] = 'd5e1a7c39f20'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def split_alternatives(text):
    """The one shared rule (design D9). Returns the parts a value splits
    into, or an empty list when it yields nothing — the caller keeps the
    original row in that case rather than dropping it."""
    if not isinstance(text, str) or "/" not in text:
        return [text] if isinstance(text, str) else []
    parts = [part.strip() for part in text.split("/") if part.strip()]
    # Nothing but slashes and whitespace yields nothing: the value is kept
    # verbatim rather than silently deleted.
    return parts or [text]


def split_translations(translations):
    """Returns (rows, changed). `changed` is False when nothing about the
    list differs, so an untouched note is not rewritten at all."""
    if not isinstance(translations, list):
        return translations, False
    # Rows that carry no slash are already separate values. A segment equal
    # to one of them is the SAME value arriving twice, so it is dropped —
    # but the pre-existing row itself, and any pre-existing duplicate of it,
    # stays. Only duplicates this split produces are removed.
    unsplit = {
        (row.get("lang"), row.get("text"))
        for row in translations
        if isinstance(row, dict) and isinstance(row.get("text"), str) and "/" not in row["text"]
    }
    emitted = set()
    out = []
    changed = False
    for row in translations:
        text = row.get("text") if isinstance(row, dict) else None
        if not isinstance(text, str) or "/" not in text:
            out.append(row)
            continue
        lang = row.get("lang")
        parts = split_alternatives(text)
        if parts == [text]:
            # Nothing but slashes and whitespace: keep it verbatim rather
            # than silently deleting a value the operator can still see.
            out.append(row)
            continue
        changed = True
        for part in parts:
            key = (lang, part)
            if key in unsplit or key in emitted:
                continue
            emitted.add(key)
            new_row = dict(row)
            new_row["text"] = part
            out.append(new_row)
    return out, changed


def upgrade() -> None:
    bind = op.get_bind()
    rows = bind.execute(sa.text("SELECT id, translations FROM notes")).fetchall()
    for note_id, translations in rows:
        new_translations, changed = split_translations(translations)
        if not changed:
            continue
        # updated_at is deliberately NOT bumped, for the same reason as
        # d5e1a7c39f20: the builder regenerates every minted card's content
        # on each publish, and a bump would make every migrated note look
        # operator-edited.
        bind.execute(
            sa.text("UPDATE notes SET translations = CAST(:translations AS jsonb) WHERE id = :id"),
            {"id": note_id, "translations": json.dumps(new_translations, ensure_ascii=False)},
        )


def downgrade() -> None:
    raise RuntimeError(
        "f7a2c9d4e3b1 cannot be reversed: which separate translation rows were "
        "once one slash-joined value is not recorded anywhere. Restore the "
        "pre-deploy database dump instead."
    )
