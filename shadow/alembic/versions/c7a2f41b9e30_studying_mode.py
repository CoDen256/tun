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
is never read or written again, so keeping it means this migration stays
auditable after the fact.

CORRECTION, 2026-11-16. The paragraph above used to end "...and reversible
without data loss — `downgrade()` removes only things this revision added",
and `downgrade()` acted on that claim. It was wrong twice, and the
correction is recorded here rather than deleted because the wrong reasoning
is instructive: "removes only what it added" is not the same as "loses
nothing".

  * `shadowing_progress_ranges` IS the progress now, and `done` is frozen —
    the application has not written it since this revision landed. Dropping
    the ranges therefore discards every minute of study done since, and a
    re-upgrade would cheerfully reconstruct the pre-2026-11-15 flags and
    print "verified identical" while doing it. It passed its own proof by
    re-deriving from the very column that had stopped being true.
  * Dropping `config_id` collapses every config's boundary rows into one
    undifferentiated set keyed by `media_id`. Three configs over a
    2000-sentence book leave 6000 overlapping rows with duplicate
    `order_index`, which no upgrade can take apart again.

`downgrade()` therefore REFUSES. A downgrade that cannot be correct must
not run; restoring the day's dump is the honest way back, and it is the
rollback the cutover already relies on (D157/D155).

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


def _tables(conn) -> set[str]:
    return set(sa.inspect(conn).get_table_names())


def _columns(conn, table: str) -> set[str]:
    if table not in _tables(conn):
        return set()
    return {c['name'] for c in sa.inspect(conn).get_columns(table)}


def upgrade() -> None:
    """Idempotent by construction (CORRECTION, 2026-11-16).

    Every step asks whether its object already exists. That is not
    defensive clutter: this revision is the one an operator is most likely
    to re-run by hand after a partial failure or a restored dump, and the
    expensive half — the progress conversion — must never overwrite newer
    truth with the stale `done` flags it derives from. Each guard is the
    cheap half of the one invariant this file exists to protect.
    """
    conn = op.get_bind()
    media_cols = _columns(conn, 'shadowing_media')
    tables = _tables(conn)

    # ── 1. the stored master ────────────────────────────────────────────
    if 'audio_path' not in media_cols:
        op.add_column('shadowing_media', sa.Column('audio_path', sa.Text(), nullable=True))
    if 'audio_bytes' not in media_cols:
        op.add_column('shadowing_media', sa.Column('audio_bytes', sa.BigInteger(), nullable=True))
    if 'audio_state' not in media_cols:
        op.add_column('shadowing_media', sa.Column(
            'audio_state', sa.Text(), nullable=False, server_default='absent'))
    if 'audio_error' not in media_cols:
        op.add_column('shadowing_media', sa.Column('audio_error', sa.Text(), nullable=True))
    if 'title' not in media_cols:
        op.add_column('shadowing_media', sa.Column('title', sa.Text(), nullable=True))

    # ── 2. split configs ────────────────────────────────────────────────
    if 'shadowing_split_configs' not in tables:
        _create_split_configs(conn)

    if 'config_id' not in _columns(conn, 'shadowing_segments'):
        _attach_segments_to_configs()

    # ── 3. progress as time ranges, and the cursor ──────────────────────
    if 'shadowing_progress_ranges' not in tables:
        _create_progress_tables()
    if 'shadowing_uploads' not in tables:
        _create_uploads_table()

    # ── 4. the lossless conversion, with its own proof ──────────────────
    _convert_done_flags(conn)


def _create_split_configs(conn) -> None:
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


def _attach_segments_to_configs() -> None:
    conn = op.get_bind()
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


def _create_progress_tables() -> None:
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


def _create_uploads_table() -> None:
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


def _convert_done_flags(conn) -> None:
    """done=true sentences → covered time ranges, book by book, verified.

    Book by book rather than in one pass because the verification is
    per-book: a range set only means anything against the segments of the
    book that owns it, and a failure must name the book.

    A BOOK THAT ALREADY HAS RANGES IS SKIPPED (correction, 2026-11-16).
    Once this revision has run, `done` is frozen and the ranges are the
    live truth; converting again would re-derive a month-old snapshot over
    the top of real progress. The skip is announced per book, and the
    summary at the end counts only what was actually converted and
    actually verified — the earlier version printed "verified identical"
    unconditionally, which is how a destructive re-run reported success.
    """
    books = conn.execute(sa.text(
        'SELECT id, user_id FROM shadowing_media ORDER BY id')).fetchall()
    total_before = 0
    converted = 0
    converted_ids: list[int] = []
    skipped = 0
    for media_id, user_id in books:
        existing = conn.execute(sa.text("""
            SELECT COUNT(*) FROM shadowing_progress_ranges WHERE media_id = :m
        """), {'m': media_id}).scalar()
        if existing:
            skipped += 1
            print(f'  shadow progress migration: media {media_id} — SKIPPED, it '
                  f'already holds {existing} progress range(s); the frozen `done` '
                  'flags are older than they are and must not overwrite them',
                  flush=True)
            continue
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
        converted += 1
        converted_ids.append(media_id)
        for start_ms, end_ms in ranges:
            conn.execute(sa.text("""
                INSERT INTO shadowing_progress_ranges (media_id, user_id, start_ms, end_ms)
                VALUES (:m, :u, :s, :e)
            """), {'m': media_id, 'u': user_id, 's': start_ms, 'e': end_ms})
        if before:
            print(f'  shadow progress migration: media {media_id} — '
                  f'{before} done sentences -> {len(ranges)} ranges (verified identical)',
                  flush=True)

    # Re-derive from what was actually committed to the new table, not from
    # the in-memory lists above: this catches an insert that silently did
    # not land as well as a bad conversion. Scoped to the books this run
    # CONVERTED — a skipped book's frozen `done` flags are expected to
    # disagree with its live ranges, and checking them here would turn a
    # correct re-run into a false alarm.
    if converted_ids:
        check = conn.execute(sa.text("""
            SELECT COUNT(*) FROM shadowing_segments s
            WHERE s.kind = 'sentence' AND s.media_id = ANY(:ids) AND NOT EXISTS (
                SELECT 1 FROM shadowing_progress_ranges r
                WHERE r.media_id = s.media_id
                  AND r.start_ms <= s.start_ms AND r.end_ms >= s.end_ms
            ) AND s.done AND s.end_ms > s.start_ms
        """), {'ids': converted_ids}).scalar()
        if check:
            raise RuntimeError(
                f'progress migration lost {check} done sentences on re-read — aborting')
    # Say exactly what was done and no more: `verified` counts the books
    # that went through verify_lossless in THIS run.
    print(f'  shadow progress migration: {total_before} done sentences preserved '
          f'across {converted} book(s), verified; {skipped} book(s) skipped because '
          'they already hold live progress ranges', flush=True)


def downgrade() -> None:
    """REFUSES. This revision cannot be reversed without losing data.

    Not a precaution and not laziness — two specific, unrecoverable
    losses, both named in the message so an operator reading a failed
    `alembic downgrade` knows exactly what he was about to do and what to
    do instead.
    """
    raise RuntimeError(
        'shadow: c7a2f41b9e30 (studying mode) cannot be downgraded — it '
        'would destroy data, not just structure.\n'
        '\n'
        '  1. PROGRESS. shadowing_progress_ranges IS the progress now, and '
        'shadowing_segments.done has been frozen since this revision '
        'landed. Dropping the ranges discards every session studied since, '
        'and re-upgrading would silently rebuild the pre-2026-11-15 flags '
        'and report success — passing its own losslessness proof while '
        'losing the real work.\n'
        '  2. BOUNDARIES. Dropping config_id collapses every split '
        "config's rows into one set keyed only by media_id: a book with "
        'three configs ends up holding every config\'s sentences at once, '
        'with duplicate order_index values that nothing can untangle.\n'
        '\n'
        '\n'
        'AND IF YOU TYPED `alembic downgrade base`: a NEWER REVISION MAY '
        'ALREADY HAVE RUN. Alembic walks the chain one revision at a time '
        'and commits each step before starting the next, so everything '
        'between the head and here has already been applied and committed '
        'by the time you read this. That is why d3f81c5a2e17 (speech '
        'window) refuses to drop its columns unless asked for explicitly — '
        'without that guard they would be gone now, and the running '
        'service, which serves before it migrates (D157), would still be '
        'selecting them. Check `alembic current` before assuming nothing '
        'happened.\n'
        '\n'
        'TO GO BACK: restore the shadow database from a dump taken before '
        'the upgrade (backup/ writes one daily; see DEPLOY.md). That is '
        'the rollback this change was accepted with. If you need a column '
        'or a table gone and NOT the data, write a new revision that does '
        'exactly that, with its own proof.'
    )


def _downgrade_structure_only_DO_NOT_USE() -> None:
    """The old body, kept unreachable and unregistered as documentation.

    This is what `downgrade()` used to do. It is left here, never called,
    so that the next person who needs to reverse part of this revision can
    see precisely which objects it created — and, right next to it, why
    running the whole thing is not a reversal but a deletion.
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
