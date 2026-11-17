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

CORRECTION, 2026-11-17. "Reversible" was true of this revision alone and
false of the only command anyone actually types. `alembic downgrade base`
walks the chain, and alembic commits each step before starting the next:
this one dropped the columns and committed, THEN c7a2f41b9e30 raised its
refusal and the walk stopped. What was left was a database serving a
`shadowing_segments` table with no `speech_start_ms` — which `db/models.py`
still selects on every query — behind a service that stays up by design
(D157). Every segment read failed while the service reported itself
healthy.

So the drop is now OPT-IN. Running it as part of a walk past c7a2f41b9e30
is refused BEFORE anything is dropped, which leaves the database whole and
the failure legible; running it deliberately, to land exactly on
c7a2f41b9e30 with an application that no longer reads the columns, is a
different act and is spelled differently:

    SHADOW_ALLOW_SPEECH_WINDOW_DOWNGRADE=1 alembic downgrade c7a2f41b9e30

The env var is not a formality. It is the only way to say "I know the
revision below this one refuses, and I am not trying to walk past it".

Revision ID: d3f81c5a2e17
Revises: c7a2f41b9e30
Create Date: 2026-11-16
"""

import os
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


DOWNGRADE_OPT_IN = 'SHADOW_ALLOW_SPEECH_WINDOW_DOWNGRADE'


def downgrade() -> None:
    """Drops the two columns — but only when asked for on purpose.

    See the module docstring: unguarded, this step made `alembic downgrade
    base` leave a live service querying columns that no longer exist,
    because it commits before the revision below it refuses.
    """
    if os.environ.get(DOWNGRADE_OPT_IN) != '1':
        raise RuntimeError(
            'shadow: d3f81c5a2e17 (speech window) will not drop its columns '
            'as part of an unattended downgrade.\n'
            '\n'
            'THE REVISION BELOW THIS ONE REFUSES. c7a2f41b9e30 (studying '
            'mode) cannot be reversed without destroying progress and '
            'collapsing every split config, so `alembic downgrade base` '
            'cannot finish — but each step commits before the next one '
            'runs, so without this guard the columns would already be gone '
            'when it stopped. db/models.py still selects speech_start_ms '
            'and speech_end_ms, and shadow serves before it migrates '
            '(D157), so the result is a service that stays up while every '
            'shadowing_segments query fails.\n'
            '\n'
            'Nothing has been dropped. The database is exactly as it was.\n'
            '\n'
            'TO GO BACK PROPERLY: restore the day\'s dump (see '
            'c7a2f41b9e30 and DEPLOY.md). TO DROP ONLY THESE TWO COLUMNS, '
            'deliberately, with an application that no longer reads them:\n'
            f'    {DOWNGRADE_OPT_IN}=1 alembic downgrade c7a2f41b9e30'
        )
    op.drop_column('shadowing_segments', 'speech_end_ms')
    op.drop_column('shadowing_segments', 'speech_start_ms')
