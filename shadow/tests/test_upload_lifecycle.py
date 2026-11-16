"""
The upload lifecycle's sharp edges, as tests.

Each of these reproduces a defect an independent review confirmed on
2026-11-16 by CONSTRUCTING it, not by asserting the fixed shape: the
janitor deleting an in-flight transcode's source, and two concurrent PUTs
both passing one offset check. A test that cannot fail on the old code
would not have caught either.

    cd shadow && python -m pytest
"""

import os
import pathlib
import sys
import threading
import time

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))


@pytest.fixture()
def audio_root(tmp_path, monkeypatch):
    import audio  # noqa: PLC0415

    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    return audio


def _aged_part(audio, upload_id: str, age_sec: int) -> pathlib.Path:
    part = audio.upload_part_path(upload_id)
    part.write_bytes(b'x' * 16)
    stamp = time.time() - age_sec
    os.utime(part, (stamp, stamp))
    return part


def test_busy_upload_survives_both_sweep_rules(audio_root):
    """THE DEFECT: a transcoding upload's source was swept as an orphan.

    Its mtime is the last slice — minutes or hours old by the time ffmpeg
    finishes — and its row is no longer `receiving`, so BOTH the orphan
    rule and the TTL rule used to fire on the one file ffmpeg had open.
    """
    audio = audio_root
    part = _aged_part(audio, 'busy', age_sec=3 * 24 * 3600)

    # The old call shape — a live set that knows only about `receiving`.
    assert audio.sweep_abandoned_uploads(live_ids=set(), busy_ids={'busy'}) == 0
    assert part.exists(), 'an in-flight transcode lost its own source file'

    # And it is still immune when the database cannot be read at all.
    assert audio.sweep_abandoned_uploads(live_ids=None, busy_ids={'busy'}) == 0
    assert part.exists()


def test_orphan_and_stale_part_files_are_still_reclaimed(audio_root):
    """The fix must not turn the janitor into a no-op."""
    audio = audio_root
    orphan = _aged_part(audio, 'orphan', age_sec=600)
    resumable = _aged_part(audio, 'resumable', age_sec=600)
    stale = _aged_part(audio, 'stale', age_sec=2 * 24 * 3600)
    fresh = _aged_part(audio, 'fresh', age_sec=1)

    removed = audio.sweep_abandoned_uploads(
        live_ids={'resumable', 'stale'}, busy_ids=set())

    assert removed == 2
    assert not orphan.exists(), 'an unclaimed part file must go at once'
    assert not stale.exists(), 'a resumable upload nobody touched for a day must go'
    assert resumable.exists(), 'a live resumable upload must survive'
    assert fresh.exists(), 'a part file inside the grace window is never an orphan'


def test_concurrent_slices_for_one_upload_cannot_interleave():
    """THE DEFECT: two PUTs read the same `on_disk`, both passed the offset
    check, both opened the file for append, and the book came out longer
    than it was and spliced in the middle.

    Reproduced against the real serialisation primitive rather than over
    HTTP: the guarantee being tested is "two threads cannot be inside the
    append section for one upload id at once".
    """
    import shadowing  # noqa: PLC0415

    inside = 0
    overlaps = 0
    witness = threading.Lock()
    done = threading.Barrier(9, timeout=10)

    def slice_writer():
        nonlocal inside, overlaps
        got = shadowing._upload_lock('one-upload').acquire(blocking=True, timeout=5)
        try:
            if got:
                with witness:
                    inside += 1
                    if inside > 1:
                        overlaps += 1
                time.sleep(0.02)        # the multi-MB streamed write
                with witness:
                    inside -= 1
        finally:
            if got:
                shadowing._upload_lock('one-upload').release()
        done.wait()

    threads = [threading.Thread(target=slice_writer) for _ in range(8)]
    for t in threads:
        t.start()
    done.wait()
    for t in threads:
        t.join(timeout=5)

    assert overlaps == 0, 'two slices of one upload were appending at once'
    # A different upload is NOT blocked by it: the lock is per upload.
    assert shadowing._upload_lock('other') is not shadowing._upload_lock('one-upload')
