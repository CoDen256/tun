"""examples sheet count (K)

stabbur-prefill-and-settings-fixes D5. One nullable column, bounded 1-10 by
a check constraint, exactly as examples_count is. NULL is the only value an
existing row can have after this migration, and read_scalars resolves NULL
to max(5, examples_count) — so no backfill is needed and no stored row can
start out violating the M <= K rule.

Revision ID: c81f3a9d4b20
Revises: f7a2c9d4e3b1
Create Date: 2026-11-23 00:00:00.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision: str = 'c81f3a9d4b20'
down_revision: Union[str, None] = 'f7a2c9d4e3b1'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.add_column('settings', sa.Column('examples_sheet_count', sa.Integer(), nullable=True))
    op.create_check_constraint(
        'ck_settings_examples_sheet_count',
        'settings',
        'examples_sheet_count IS NULL OR examples_sheet_count BETWEEN 1 AND 10',
    )
    # M <= K on the PAIR. Every existing row has a NULL sheet count, so
    # nothing can fail this on the way in. It exists because the API check
    # is a read-then-write and optimistic saves make overlapping PATCHes
    # ordinary.
    op.create_check_constraint(
        'ck_settings_examples_count_within_sheet_count',
        'settings',
        'examples_count IS NULL OR examples_sheet_count IS NULL '
        'OR examples_count <= examples_sheet_count',
    )


def downgrade() -> None:
    op.drop_constraint('ck_settings_examples_count_within_sheet_count', 'settings', type_='check')
    op.drop_constraint('ck_settings_examples_sheet_count', 'settings', type_='check')
    op.drop_column('settings', 'examples_sheet_count')
