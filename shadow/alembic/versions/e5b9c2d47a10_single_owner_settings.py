"""single owner, shadow-owned settings, chapter titles, manual-edit count

shadow-playback-chapter-reading, D168. Four additions and ONE CHECK that
runs before any of them.

THE CHECK. shadow becomes single-user: the plain-integer `user_id` columns
(D42) are KEPT and every row belongs to one owner id, pinned here, once.
The owner is whatever single distinct `user_id` the data already carries
across books, uploads, progress ranges and cursors — or the constant
DEFAULT_OWNER_ID when there is no data at all. MORE THAN ONE distinct id
means two profiles' data would be merged silently, so the revision ABORTS
with a message naming every id and changes NOTHING: the check runs before
the first DDL statement, and Postgres DDL is transactional, so even a
failure later in this revision leaves no table and no column behind. The
service keeps serving degraded (D157) until the operator resolves the
ownership by hand and the migration is retried.

THE ADDITIONS
  * `shadow_owner` — one row, the pinned id. A table rather than a
    settings key because it is not a preference: nothing may write it after
    this revision, and the settings API must never list it.
  * `shadow_settings` — key -> JSON value. The operator's preferences,
    stored by shadow (D2/D165's "one authoritative place the service
    owns"), in this database so `shadow.sql` dumps them. No `user_id`
    column: there is one owner.
  * `shadowing_segments.title` — nullable, used for chapters only (D15).
  * `shadowing_split_configs.manual_edit_count` — how many hand edits the
    config carries since its last analysis (sentence split/merge, chapter
    break/merge/title). Re-analysis resets it to 0 together with the rows
    it rebuilds.

No stored span, progress range or cursor is read for anything but the
distinct-id check, and none is written.
"""
from __future__ import annotations

import os
from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op
from sqlalchemy.dialects import postgresql

revision: str = 'e5b9c2d47a10'
down_revision: Union[str, None] = 'd3f81c5a2e17'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None

# The owner of an empty database. Any constant works — it is never shown —
# and 1 is what phonexa's first auto-created 'default' profile always was.
DEFAULT_OWNER_ID = 1

# Every table that carries a user_id. The order is only the message's.
OWNED_TABLES = ('shadowing_media', 'shadowing_uploads',
                'shadowing_progress_ranges', 'shadowing_cursors')


class AmbiguousOwnerError(RuntimeError):
    pass


def distinct_owner_ids(conn) -> list[int]:
    union = ' UNION '.join(f'SELECT user_id FROM {t}' for t in OWNED_TABLES)
    rows = conn.execute(sa.text(f'SELECT DISTINCT user_id FROM ({union}) AS u ORDER BY user_id'))
    return [int(r[0]) for r in rows if r[0] is not None]


def pin_owner(conn) -> int:
    """The owner id, or AmbiguousOwnerError naming every id. Reads only."""
    ids = distinct_owner_ids(conn)
    if len(ids) > 1:
        per_table = []
        for t in OWNED_TABLES:
            n = conn.execute(sa.text(
                f'SELECT user_id, COUNT(*) FROM {t} GROUP BY user_id ORDER BY user_id')).all()
            if n:
                per_table.append(f'  {t}: ' + ', '.join(f'user_id {u} × {c}' for u, c in n))
        raise AmbiguousOwnerError(
            'shadow: e5b9c2d47a10 (single owner) REFUSES — the data belongs to '
            f'{len(ids)} distinct user ids: {", ".join(str(i) for i in ids)}.\n'
            'shadow is single-user now (D168) and will not merge two profiles\' '
            'books and progress silently.\n'
            + '\n'.join(per_table) + '\n'
            'NOTHING HAS BEEN CHANGED. Decide which id is the owner, then either '
            'delete the other id\'s rows or UPDATE them to the owner id, and '
            'restart shadow-backend (the migration is retried in the background).'
        )
    return ids[0] if ids else DEFAULT_OWNER_ID


def upgrade() -> None:
    conn = op.get_bind()
    owner_id = pin_owner(conn)   # BEFORE any DDL — an abort changes nothing

    op.create_table(
        'shadow_owner',
        sa.Column('id', sa.SmallInteger(), primary_key=True),
        sa.Column('user_id', sa.Integer(), nullable=False),
        sa.Column('pinned_at', sa.DateTime(), server_default=sa.func.now(), nullable=False),
        sa.CheckConstraint('id = 1', name='shadow_owner_single_row'),
    )
    json_type = postgresql.JSONB() if conn.dialect.name == 'postgresql' else sa.JSON()
    op.create_table(
        'shadow_settings',
        sa.Column('key', sa.Text(), primary_key=True),
        sa.Column('value', json_type, nullable=False),
        sa.Column('updated_at', sa.DateTime(), server_default=sa.func.now(), nullable=False),
    )
    op.add_column('shadowing_segments', sa.Column('title', sa.Text(), nullable=True))
    op.add_column('shadowing_split_configs',
                  sa.Column('manual_edit_count', sa.Integer(), nullable=False,
                            server_default='0'))
    conn.execute(sa.text('INSERT INTO shadow_owner (id, user_id) VALUES (1, :u)'),
                 {'u': owner_id})


DOWNGRADE_OPT_IN = 'SHADOW_ALLOW_SINGLE_OWNER_DOWNGRADE'


def downgrade() -> None:
    """Drops the settings, the owner pin, chapter titles and edit counts —
    only when asked for on purpose: titles and settings are things a human
    produced, and the previous image works against the kept columns anyway
    (design.md Migration Plan: rollback = previous image)."""
    if os.environ.get(DOWNGRADE_OPT_IN) != '1':
        raise RuntimeError(
            'shadow: e5b9c2d47a10 (single owner) will not drop chapter titles '
            'and stored settings as part of an unattended downgrade. Nothing has '
            'been dropped. The previous image runs fine against this schema; to '
            f'drop them deliberately: {DOWNGRADE_OPT_IN}=1 alembic downgrade d3f81c5a2e17'
        )
    op.drop_column('shadowing_split_configs', 'manual_edit_count')
    op.drop_column('shadowing_segments', 'title')
    op.drop_table('shadow_settings')
    op.drop_table('shadow_owner')
