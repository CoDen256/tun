"""drop shadowing tables

The phonexa half of the shadow split (zone-isolation task 3.5).

ORDER MATTERS AND IS NOT ENFORCEABLE FROM HERE. This migration DESTROYS the
shadowing rows in the `phonexa` database. The data move —
`pg_dump --data-only` out of phonexa as the phonexa role, restore into the
`shadow` database AS THE SHADOW ROLE (P42: a superuser restore leaves every
object owned by tunadmin and the service then fails with "permission denied
for table alembic_version" the first time it migrates) — must have completed
and had its row counts checked on BOTH sides before this runs. Alembic
cannot know whether it did; the deploy procedure does.

Rows at the time of the move, as the acceptance criterion:
    shadowing_media     3
    shadowing_segments  2739

No downgrade path back to data. `downgrade()` recreates the two tables with
their original shape including the cross-domain foreign key, so the schema
can be restored; the rows have to come from the `shadow` database or from a
backup. That is the honest state of a one-way data move, written down rather
than implied by an empty function.

Revision ID: d4b8e2a71c30
Revises: c08d16350df6
Create Date: 2026-11-13
"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'd4b8e2a71c30'
down_revision: Union[str, None] = 'c08d16350df6'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # segments first: its media_id FK points at shadowing_media.
    op.drop_table('shadowing_segments')
    op.drop_table('shadowing_media')


def downgrade() -> None:
    # The pre-split shape, foreign key included — this database still has
    # `users`, so the constraint is recreatable here even though shadow's own
    # copy of these tables deliberately does not have it (D42).
    op.create_table(
        'shadowing_media',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('user_id', sa.Integer(), nullable=False),
        sa.Column('fingerprint', sa.Text(), nullable=False),
        sa.Column('original_filename', sa.Text(), nullable=True),
        sa.Column('file_size_bytes', sa.Integer(), nullable=True),
        sa.Column('duration_ms', sa.Integer(), nullable=True),
        sa.Column('sample_rate_hz', sa.Integer(), nullable=True),
        sa.Column('channels', sa.SmallInteger(), nullable=True),
        sa.Column('sentence_silence_ms', sa.Integer(), nullable=True),
        sa.Column('chapter_silence_ms', sa.Integer(), nullable=True),
        sa.Column('created_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.Column('updated_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['user_id'], ['users.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id'),
        sa.UniqueConstraint('user_id', 'fingerprint'),
    )
    op.create_table(
        'shadowing_segments',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('media_id', sa.Integer(), nullable=False),
        sa.Column('kind', sa.Text(), nullable=False),
        sa.Column('parent_segment_id', sa.Integer(), nullable=True),
        sa.Column('order_index', sa.Integer(), nullable=False),
        sa.Column('start_ms', sa.Integer(), nullable=False),
        sa.Column('end_ms', sa.Integer(), nullable=False),
        sa.Column('text', sa.Text(), nullable=True),
        sa.Column('done', sa.Boolean(), nullable=False),
        sa.Column('created_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.Column('updated_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['media_id'], ['shadowing_media.id'], ondelete='CASCADE'),
        sa.ForeignKeyConstraint(['parent_segment_id'], ['shadowing_segments.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id'),
    )
