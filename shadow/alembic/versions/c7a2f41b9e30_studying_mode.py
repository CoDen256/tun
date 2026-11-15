"""studying mode: stored master, split configs, progress as time ranges

shadow-studying-mode. Four things at once, because they are one change:

1. shadowing_media learns about a STORED master (audio_path/bytes/state).
   Pre-change rows get audio_state='absent': their audio only ever existed
   in the browser, so they keep their boundaries and their progress and ask
   for a re-upload. Nothing is deleted.
2. shadowing_split_configs: a book may hold several named segmentations.
   Every existing book gets exactly one, named "Original split", carrying
   the thresholds already recorded on the book and marked active, and every
   existing segment row is attached to it. The operator recognises his
   existing boundaries by that name (task 3.5).
3. shadowing_progress_ranges + shadowing_cursors: progress becomes
   completed time ranges on the book, and the cursor becomes a time
   position.
4. THE ONE THAT MUST NOT BE GOT WRONG — every `shadowing_segments.done =
   true` sentence becomes a covered time range, LOSSLESSLY. The conversion
   runs the same coverage rule the application runs (progress.py, one
   implementation, not a re-derivation), and then RE-DERIVES the done set
   from the ranges it just wrote and compares it, per book, with the set of
   ids that were flagged before. A mismatch raises and the upgrade aborts
   inside the transaction: the operator is part-way through a book, and a
   lossy migration loses his place irrecoverably (acceptance criterion 19).

`shadowing_segments.done` is NOT dropped. It stops being authoritative and
is never read or written again, but keeping it means this migration is
auditable after the fact and reversible without data loss — `downgrade()`
removes only things this revision added.

Revision ID: c7a2f41b9e30
Revises: a1d7f3c90b45
Create Date: 2026-11-15
"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

import progress  # shadow's own range algebra; alembic.ini puts '.' on sys.path


# revision identifiers, used by Alembic.
revision: str = 'c7a2f41b9e30'
down_revision: Union[str, None] = 'a1d7f3c90b45'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    conn = op.get_bind()

    # ── 1. the stored master ────────────────────────────────────────────
    op.add_column('shadowing_media', sa.Column('audio_path', sa.Text(), nullable=True))
    op.add_column('shadowing_media', sa.Column('audio_bytes', sa.BigInteger(), nullable=True))
    op.add_column('shadowing_media', sa.Column(
        'audio_state', sa.Text(), nullable=False, server_default='absent'))
    op.add_column('shadowing_media', sa.Column('audio_error', sa.Text(), nullable=True))
    op.add_column('shadowing_media', sa.Column('title', sa.Text(), nullable=True))

    # ── 2. split configs ────────────────────────────────────────────────
    op.create_table(
        'shadowing_split_configs',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('media_id', sa.Integer(), nullable=False),
        sa.Column('name', sa.Text(), nullable=False),
        sa.Column('sentence_silence_ms', sa.Integer(), nullable=False, server_default='400'),
        sa.Column('chapter_silence_ms', sa.Integer(), nullable=False, server_default='2000'),
        sa.Column('is_active', sa.Boolean(), nullable=False, server_default=sa.false()),
        sa.Column('analysis_state', sa.Text(), nullable=False, server_default='idle'),
        sa.Column('analysis_error', sa.Text(), nullable=True),
        sa.Column('created_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.Column('updated_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['media_id'], ['shadowing_media.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id'),
    )
    op.create_index('ix_shadowing_split_configs_media_id', 'shadowing_split_configs', ['media_id'])

    # One config per existing book, named so the operator recognises it.
    conn.execute(sa.text("""
        INSERT INTO shadowing_split_configs
            (media_id, name, sentence_silence_ms, chapter_silence_ms, is_active)
        SELECT id, 'Original split',
               COALESCE(sentence_silence_ms, 400), COALESCE(chapter_silence_ms, 2000), TRUE
        FROM shadowing_media
    """))

    op.add_column('shadowing_segments', sa.Column('config_id', sa.Integer(), nullable=True))
    conn.execute(sa.text("""
        UPDATE shadowing_segments s
        SET config_id = c.id
        FROM shadowing_split_configs c
        WHERE c.media_id = s.media_id
    """))
    # A segment with no media (impossible: the FK is NOT NULL) would be the
    # only way this is still NULL, so NOT NULL is safe to assert.
    op.alter_column('shadowing_segments', 'config_id', nullable=False)
    op.create_foreign_key('fk_shadowing_segments_config', 'shadowing_segments',
                          'shadowing_split_configs', ['config_id'], ['id'], ondelete='CASCADE')
    op.create_index('ix_shadowing_segments_config_id', 'shadowing_segments', ['config_id'])

    # ── 3. progress as time ranges, and the cursor ──────────────────────
    op.create_table(
        'shadowing_progress_ranges',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('media_id', sa.Integer(), nullable=False),
        sa.Column('user_id', sa.Integer(), nullable=False),
        sa.Column('start_ms', sa.Integer(), nullable=False),
        sa.Column('end_ms', sa.Integer(), nullable=False),
        sa.Column('created_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['media_id'], ['shadowing_media.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id'),
    )
    op.create_index('ix_shadowing_progress_media_user', 'shadowing_progress_ranges',
                    ['media_id', 'user_id'])

    op.create_table(
        'shadowing_cursors',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('media_id', sa.Integer(), nullable=False),
        sa.Column('user_id', sa.Integer(), nullable=False),
        sa.Column('position_ms', sa.Integer(), nullable=False, server_default='0'),
        sa.Column('updated_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['media_id'], ['shadowing_media.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id'),
        sa.UniqueConstraint('media_id', 'user_id'),
    )

    op.create_table(
        'shadowing_uploads',
        sa.Column('id', sa.Text(), nullable=False),
        sa.Column('user_id', sa.Integer(), nullable=False),
        sa.Column('fingerprint', sa.Text(), nullable=False),
        sa.Column('original_filename', sa.Text(), nullable=True),
        sa.Column('size_bytes', sa.BigInteger(), nullable=False),
        sa.Column('received_bytes', sa.BigInteger(), nullable=False, server_default='0'),
        sa.Column('state', sa.Text(), nullable=False, server_default='receiving'),
        sa.Column('error', sa.Text(), nullable=True),
        sa.Column('media_id', sa.Integer(), nullable=True),
        sa.Column('created_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.Column('updated_at', sa.DateTime(), server_default=sa.text('now()'), nullable=False),
        sa.PrimaryKeyConstraint('id'),
    )
    op.create_index('ix_shadowing_uploads_user_id', 'shadowing_uploads', ['user_id'])
    op.create_index('ix_shadowing_uploads_fingerprint', 'shadowing_uploads', ['fingerprint'])

    # ── 4. the lossless conversion, with its own proof ──────────────────
    _convert_done_flags(conn)


def _convert_done_flags(conn) -> None:
    """done=true sentences → covered time ranges, book by book, verified.

    Book by book rather than in one pass because the verification is
    per-book: a range set only means anything against the segments of the
    book that owns it, and a failure must name the book.
    """
    books = conn.execute(sa.text(
        'SELECT id, user_id FROM shadowing_media ORDER BY id')).fetchall()
    total_before = 0
    for media_id, user_id in books:
        rows = conn.execute(sa.text("""
            SELECT id, kind, start_ms, end_ms, done
            FROM shadowing_segments WHERE media_id = :m ORDER BY start_ms
        """), {'m': media_id}).mappings().all()
        segments = [dict(r) for r in rows]

        ranges = progress.ranges_from_done_segments(segments)
        # The proof, run against the rows themselves and not against a
        # hand-written expectation: re-derive the done set from the ranges
        # using the application's own coverage rule and demand equality.
        progress.verify_lossless(segments, ranges)

        before = sum(1 for s in segments
                     if s['kind'] == 'sentence' and s['done'] and s['end_ms'] > s['start_ms'])
        total_before += before
        for start_ms, end_ms in ranges:
            conn.execute(sa.text("""
                INSERT INTO shadowing_progress_ranges (media_id, user_id, start_ms, end_ms)
                VALUES (:m, :u, :s, :e)
            """), {'m': media_id, 'u': user_id, 's': start_ms, 'e': end_ms})
        if before:
            print(f'  shadow progress migration: media {media_id} — '
                  f'{before} done sentences -> {len(ranges)} ranges (verified identical)',
                  flush=True)

    # Re-derive across the WHOLE database from what was actually committed
    # to the new table, not from the in-memory lists above: this catches an
    # insert that silently did not land as well as a bad conversion.
    check = conn.execute(sa.text("""
        SELECT COUNT(*) FROM shadowing_segments s
        WHERE s.kind = 'sentence' AND NOT EXISTS (
            SELECT 1 FROM shadowing_progress_ranges r
            WHERE r.media_id = s.media_id
              AND r.start_ms <= s.start_ms AND r.end_ms >= s.end_ms
        ) AND s.done AND s.end_ms > s.start_ms
    """)).scalar()
    if check:
        raise RuntimeError(
            f'progress migration lost {check} done sentences on re-read — aborting')
    print(f'  shadow progress migration: {total_before} done sentences preserved '
          f'across {len(books)} book(s)', flush=True)


def downgrade() -> None:
    """Removes only what this revision added.

    `shadowing_segments.done` was never touched by the upgrade, so going
    back loses the ranges (which were derived from it) and nothing else.
    """
    op.drop_index('ix_shadowing_uploads_fingerprint', table_name='shadowing_uploads')
    op.drop_index('ix_shadowing_uploads_user_id', table_name='shadowing_uploads')
    op.drop_table('shadowing_uploads')
    op.drop_table('shadowing_cursors')
    op.drop_index('ix_shadowing_progress_media_user', table_name='shadowing_progress_ranges')
    op.drop_table('shadowing_progress_ranges')
    op.drop_index('ix_shadowing_segments_config_id', table_name='shadowing_segments')
    op.drop_constraint('fk_shadowing_segments_config', 'shadowing_segments', type_='foreignkey')
    op.drop_column('shadowing_segments', 'config_id')
    op.drop_index('ix_shadowing_split_configs_media_id', table_name='shadowing_split_configs')
    op.drop_table('shadowing_split_configs')
    for col in ('title', 'audio_error', 'audio_state', 'audio_bytes', 'audio_path'):
        op.drop_column('shadowing_media', col)
