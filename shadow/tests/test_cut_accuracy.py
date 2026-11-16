"""
The shape of the precise cut, and the invalidation of chunks cut the old way.

The cut's ACCURACY is a property of ffmpeg and is verified by measuring real
audio (the change's verification tasks, acceptance criteria 1-3). What is
asserted here is what a careless edit would silently undo: the flag order
that makes the cut precise at all, and the cache key that stops a chunk cut
before 2026-11-16 from being served.

    cd shadow && python -m pytest
"""

import pathlib
import sys

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
