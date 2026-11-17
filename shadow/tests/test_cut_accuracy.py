"""
The shape of the precise cut, and the invalidation of chunks cut the old way.

The cut's ACCURACY is a property of ffmpeg and is verified by measuring real
audio (the change's verification tasks, acceptance criteria 1-3). What is
asserted here is what a careless edit would silently undo: the flag order
that makes the cut precise at all, and the cache key that stops a chunk cut
before 2026-11-16 from being served.

    cd shadow && python -m pytest
"""

import os
import pathlib
import sys
import time

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

import audio  # noqa: E402


# ── the flag order IS the fix ──────────────────────────────────────────

def test_the_stream_copy_cut_is_gone():
    """`-c copy` cannot cut between the frames it muxes, which is why the
    old chunk started at the enclosing Ogg page instead of at startMs."""
    source = (ROOT / 'audio.py').read_text()
    cut_body = source.split('def cut(')[1].split('\ndef ')[0]
    assert "'-c', 'copy'" not in cut_body
    assert 'stream_copy' not in cut_body.split('"""')[2]  # not in the code, only the correction


def test_the_cut_seeks_twice_and_bounds_by_duration():
    """Coarse seek before `-i`, fine seek after it, and `-t` rather than
    `-to`: `-to` is read against the input's own timeline, which the coarse
    seek has already moved."""
    source = (ROOT / 'audio.py').read_text()
    cut_body = source.split('def cut(')[1].split('\ndef ')[0]
    args = cut_body.split("args = [")[1]
    assert args.count("'-ss'") == 2
    assert "'-i'" in args
    assert "'-t'" in args
    assert "'-to'" not in cut_body


# ── chunks cut the old way are unreachable, then reclaimed ─────────────

def test_the_cache_key_carries_the_cut_version():
    path = audio.chunk_path(7, 42, 1000, 2000)
    assert path.name == f'ch-{audio.CHUNK_CUT_VERSION}-42-1000-2000.opus'
    # The boundary key still works too — both must change the filename.
    assert audio.chunk_path(7, 42, 1001, 2000) != path


def test_purge_removes_only_chunks_from_another_cut(tmp_path, monkeypatch):
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    chunks = tmp_path / 'books' / '7' / 'chunks'
    chunks.mkdir(parents=True)
    stale = chunks / 'ch-42-1000-2000.opus'          # the pre-2026-11-16 name
    current = audio.chunk_path(7, 42, 1000, 2000)
    for p in (stale, current):
        p.write_bytes(b'x')
    master = tmp_path / 'books' / '7' / 'master.opus'
    master.write_bytes(b'x')

    assert audio.purge_stale_chunks() == 1
    assert not stale.exists()
    assert current.exists()
    assert master.exists()          # the one stored artefact is not cache
    assert audio.purge_stale_chunks() == 0   # and it is idempotent


def test_purge_survives_a_book_directory_that_does_not_exist(tmp_path, monkeypatch):
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path / 'nothing-here')
    assert audio.purge_stale_chunks() == 0


# ── invalidation is per CHAPTER, not per book (2026-11-17) ─────────────

def test_dropping_one_chapters_chunks_leaves_every_other_chunk_alone(tmp_path, monkeypatch):
    """A re-analysis, a split or a merge invalidates ITS chapters. Under
    the old stream copy a book-wide wipe cost milliseconds; a precise
    re-encode costs ~20-30 s per chapter, and another split config's
    chapters did not move at all."""
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    mine_old = audio.chunk_path(7, 42, 0, 1000)
    mine_new = audio.chunk_path(7, 42, 0, 2000)      # same id, moved boundary
    other_config = audio.chunk_path(7, 99, 0, 1000)
    other_book = audio.chunk_path(8, 42, 0, 1000)
    for p in (mine_old, mine_new, other_config, other_book):
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(b'x')

    assert audio.drop_chunks_for(7, [42]) == 2
    assert not mine_old.exists() and not mine_new.exists()
    assert other_config.exists(), "another config's chapter lost its chunk"
    assert other_book.exists()


def test_dropping_chunks_of_a_book_with_no_cache_is_not_an_error(tmp_path, monkeypatch):
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    assert audio.drop_chunks_for(7, [1, 2, 3]) == 0


# ── the garbage a superseded pre-cut leaves behind ─────────────────────

def test_purge_reclaims_chunks_of_segment_ids_that_no_longer_exist(tmp_path, monkeypatch):
    """A pre-cut cancelled by a re-analysis may have written one chunk for
    a segment id the analysis had already deleted. It carries the CURRENT
    cut version, so the version rule skips it forever."""
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    live = audio.chunk_path(7, 42, 0, 1000)
    orphan = audio.chunk_path(7, 41, 0, 1000)        # id deleted by re-analysis
    live.parent.mkdir(parents=True, exist_ok=True)
    for p in (live, orphan):
        p.write_bytes(b'x')
    old = time.time() - 10 * 60
    for p in (live, orphan):
        os.utime(p, (old, old))                      # past ORPHAN_GRACE_SEC

    # No database → no opinion: nothing is judged dead.
    assert audio.purge_stale_chunks() == 0
    assert orphan.exists()

    assert audio.purge_stale_chunks({7: {live.name}}) == 1
    assert live.exists() and not orphan.exists()


def test_a_chunk_younger_than_the_grace_is_never_judged_dead(tmp_path, monkeypatch):
    """The live set is read before the glob, so a chapter created in
    between would otherwise lose its brand-new chunk."""
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    fresh = audio.chunk_path(7, 42, 0, 1000)
    fresh.parent.mkdir(parents=True, exist_ok=True)
    fresh.write_bytes(b'x')
    assert audio.purge_stale_chunks({7: set()}) == 0
    assert fresh.exists()


def test_purge_reclaims_an_abandoned_partial_encode(tmp_path, monkeypatch):
    """`cut` writes `<name>.<pid>-<hex>.partial`, which the old
    `ch-*.opus` glob could not even see. A pre-cut killed by a container
    restart leaves one behind."""
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    chunks = audio.chunks_dir(7)
    chunks.mkdir(parents=True)
    dead = chunks / 'ch-v2-42-0-1000.opus.17-deadbeef.partial'
    live = chunks / 'ch-v2-43-0-1000.opus.18-feedface.partial'
    for p in (dead, live):
        p.write_bytes(b'x')
    old = time.time() - audio.CHUNK_PARTIAL_GRACE_SEC - 60
    os.utime(dead, (old, old))

    assert audio.purge_stale_chunks() == 1
    assert not dead.exists()
    assert live.exists(), 'an encode that is still writing lost its own output'


# ── the request path is bounded; the background one is not ─────────────

def test_the_request_path_has_a_much_smaller_ceiling_than_the_background():
    assert audio.CHUNK_REQUEST_CUT_TIMEOUT_SEC < audio.CHUNK_CUT_TIMEOUT_SEC / 10


def test_a_chapter_already_being_cut_is_waited_for_not_cut_again(tmp_path, monkeypatch):
    """Both paths take the same per-chunk lock, so a cold request behind a
    running pre-cut gives up with ChunkPending instead of starting a second
    25-second encode of the same chapter."""
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    audio.master_path(7).parent.mkdir(parents=True, exist_ok=True)
    audio.master_path(7).write_bytes(b'not really opus')
    path = audio.chunk_path(7, 42, 0, 1000)
    held = audio._chunk_lock(str(path))
    assert held.acquire(timeout=1)
    try:
        with pytest.raises(audio.ChunkPending):
            audio.chapter_chunk(7, 42, 0, 1000, budget_sec=1)
    finally:
        held.release()
