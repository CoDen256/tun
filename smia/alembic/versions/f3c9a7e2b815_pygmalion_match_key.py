"""pygmalion_audio: match_key (+ index) and verbatim text, for fuzzy matching

tts-candidate-matching: the `pygmalion` adapter's tiers 2/3 look up
`match_key` = `norwegian.normalize_match_key(<stored word>)`; `text` keeps the
word as the corpus spells it (`Hallo!`) for a fuzzy candidate's `context`.

The importer fills both. Existing rows are backfilled here from `word` so the
fuzzy tiers work before the deploy's re-import; `word` is already casefolded,
so `text` stays NULL on them (the adapter falls back to `word`) until the
re-import restores the verbatim spelling.

Revision ID: f3c9a7e2b815
Revises: e6b3a9d2f401
Create Date: 2026-11-23

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

from norwegian import normalize_match_key

revision: str = "f3c9a7e2b815"
down_revision: Union[str, None] = "e6b3a9d2f401"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.add_column("pygmalion_audio", sa.Column("match_key", sa.Text(), nullable=True))
    op.add_column("pygmalion_audio", sa.Column("text", sa.Text(), nullable=True))
    op.create_index("ix_pygmalion_audio_match_key", "pygmalion_audio", ["match_key"])

    conn = op.get_bind()
    words = [r[0] for r in conn.execute(sa.text("SELECT DISTINCT word FROM pygmalion_audio"))]
    if words:
        conn.execute(
            sa.text("UPDATE pygmalion_audio SET match_key = :k WHERE word = :w"),
            [{"k": normalize_match_key(w), "w": w} for w in words],
        )


def downgrade() -> None:
    op.drop_index("ix_pygmalion_audio_match_key", table_name="pygmalion_audio")
    op.drop_column("pygmalion_audio", "text")
    op.drop_column("pygmalion_audio", "match_key")
