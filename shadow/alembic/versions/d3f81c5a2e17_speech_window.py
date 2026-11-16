"""speech window: where speech is inside a sentence's stored span

shadow-studying-refinements §2. Two nullable columns on
`shadowing_segments`, and NOTHING ELSE.

WHAT THIS IS NOT, which is the only interesting thing about it: it is not a
boundary change. `start_ms`/`end_ms` are not read, not written and not
recomputed by this revision, and no row's span differs by a millisecond
after it runs. Trimming is a playback and display attribute — a sentence is
still done when its WHOLE stored span is covered by the book's completed
time ranges, so doneness, the coverage rule, merge, split and cross-config
carry-over are untouched by construction (design.md §2, acceptance
criteria 12-14).

Tightening the stored span to the trimmed window was offered to the
operator and rejected: the silence between two sentences would then belong
to no sentence and could never be marked done, leaving a wider sentence in
another split config permanently not-done. A later revision that "cleans
this up" by narrowing spans is a tier-3 tripwire, not a tidy-up.

Both columns are NULL after this upgrade. NULL means "not computed" and
every reader renders it as the full span, so the state immediately after
the migration is exactly today's behaviour: no trimming anywhere. The
windows appear when a config is re-analysed, which recomputes them from the
same silence pass that places the boundaries.

Reversible without loss, genuinely — unlike c7a2f41b9e30, whose downgrade
refuses. Dropping these two columns discards a derivation that the next
analysis recreates, and discards nothing a human produced.

Revision ID: d3f81c5a2e17
Revises: c7a2f41b9e30
Create Date: 2026-11-16
"""

from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op

revision: str = 'd3f81c5a2e17'
down_revision: Union[str, None] = 'c7a2f41b9e30'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.add_column('shadowing_segments', sa.Column('speech_start_ms', sa.Integer(), nullable=True))
    op.add_column('shadowing_segments', sa.Column('speech_end_ms', sa.Integer(), nullable=True))


def downgrade() -> None:
    op.drop_column('shadowing_segments', 'speech_end_ms')
    op.drop_column('shadowing_segments', 'speech_start_ms')
