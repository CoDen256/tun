"""initial shadow schema

The shadowing domain's two tables, as they leave phonexa.

This is NOT a fresh design: it is phonexa's shape at revision c08d16350df6
(its head when shadow was split out) minus the one cross-domain foreign key.
Column names, types and nullability are reproduced EXACTLY so that the data
move — a `pg_dump --data-only` out of phonexa and a `psql` restore into
shadow as the shadow role (P42) — lands without a single cast or rename and
with every id preserved.

The one difference, and it is the whole point of the split:

    shadowing_media.user_id  was  INTEGER NOT NULL
                                  REFERENCES users(id) ON DELETE CASCADE
                             now  INTEGER NOT NULL, indexed, no FK

`users` stayed in phonexa's database and D42 forbids cross-service foreign
keys. An index replaces it, because every query in shadowing.py filters on
user_id and the FK was previously providing that index implicitly.

Both of shadowing_segments' foreign keys stay: they point inside this
database, which is exactly what made this domain separable.

Revision ID: a1d7f3c90b45
Revises:
Create Date: 2026-11-13
"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'a1d7f3c90b45'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
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
        sa.PrimaryKeyConstraint('id'),
        sa.UniqueConstraint('user_id', 'fingerprint'),
    )
    # What the dropped foreign key used to provide for free.
    op.create_index(op.f('ix_shadowing_media_user_id'), 'shadowing_media', ['user_id'])

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


def downgrade() -> None:
    op.drop_table('shadowing_segments')
    op.drop_index(op.f('ix_shadowing_media_user_id'), table_name='shadowing_media')
    op.drop_table('shadowing_media')
