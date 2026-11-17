"""saved triage queues

stabbur-triage-queues D1: the operator's own named filter sets, each with
its own sort, stored with the operator's settings rather than in the
browser — a queue is most useful on the phone and localStorage does not
travel.

Nullable with no server default and no seeded value, matching every other
preference on this row (operator-settings D2): unset means "use the
code-level default", which here is "the operator has saved no queues yet".
The three built-in origin queues are deliberately NOT stored — they are
synthesised at read time, so they cannot be edited, deleted, or drift from
their definition.

Revision ID: e91c7b35a2df
Revises: c3f8a0d2e5b1
Create Date: 2026-11-16 00:00:00.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision: str = 'e91c7b35a2df'
down_revision: Union[str, None] = 'c3f8a0d2e5b1'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.add_column('settings', sa.Column('triage_queues', postgresql.JSONB(), nullable=True))


def downgrade() -> None:
    op.drop_column('settings', 'triage_queues')
