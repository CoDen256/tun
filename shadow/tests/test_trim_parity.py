"""
Trim parity (shadow-playback-chapter-reading D7, task 4.1, acceptance A6.1).

A sentence produced by a manual split or merge must trim like an analysed
one: its speech window — from `audio.local_speech_window`, which probes the
one span — must equal, within 20 ms at each edge, what analysis computes for
the same span (`audio.speech_window` over the whole-book silence pass) under
the same config threshold.

This runs the REAL ffmpeg over a synthesized book: distinguishable tones
separated by silences of known lengths, transcoded to a mono Opus master by
the same `transcode_to_master` uploads use. Skipped where ffmpeg is absent
(it is always present in the shadow image):

    docker run --rm -v $PWD:/src -v $PWD/../libs:/libs:ro -w /src \\
        -e PYTHONPATH=/libs -e INTERNAL_TOKEN=x <shadow image> \\
        sh -c 'pip install -q pytest && python -m pytest -q'
"""

import math
import pathlib
import shutil
import struct
import sys
import wave

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

import audio  # noqa: E402

pytestmark = pytest.mark.skipif(shutil.which('ffmpeg') is None, reason='needs ffmpeg')

TOLERANCE_MS = 20
SENTENCE_MS, CHAPTER_MS = 400, 2500
RATE = 16_000
MEDIA_ID = 4242

# (kind, ms[, Hz]). An internal 200 ms gap inside one sentence (shorter than
# the 400 ms threshold) checks that a pause INSIDE a sentence is not trimmed.
BOOK = [
    ('sil', 1000),
    ('tone', 1200, 220), ('sil', 800),
    ('tone', 700, 330), ('sil', 200), ('tone', 800, 330), ('sil', 600),
    ('tone', 1000, 440), ('sil', 3000),                      # a chapter break
    ('tone', 1300, 550), ('sil', 900),
    ('tone', 1100, 660), ('sil', 1000),
]


def _write_wav(path: pathlib.Path) -> int:
    frames = bytearray()
    for part in BOOK:
        n = int(RATE * part[1] / 1000)
        if part[0] == 'sil':
            frames += b'\x00\x00' * n
            continue
        hz, fade = part[2], int(RATE * 0.01)
        for i in range(n):
            env = min(1.0, i / fade, (n - 1 - i) / fade)
            frames += struct.pack('<h', int(0.5 * 32767 * env * math.sin(2 * math.pi * hz * i / RATE)))
    with wave.open(str(path), 'wb') as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(RATE)
        w.writeframes(bytes(frames))
    return sum(p[1] for p in BOOK)


@pytest.fixture(scope='module')
def book(tmp_path_factory):
    root = tmp_path_factory.mktemp('audio')
    saved = audio.AUDIO_ROOT
    audio.AUDIO_ROOT = root
    try:
        src = root / 'book.wav'
        duration_ms = _write_wav(src)
        info = audio.transcode_to_master(src, MEDIA_ID)
        duration_ms = int(info.get('durationMs') or duration_ms)
        result = audio.segment_ranges(MEDIA_ID, duration_ms, SENTENCE_MS, CHAPTER_MS)
        yield result
    finally:
        audio.AUDIO_ROOT = saved


def analysed(result, start_ms, end_ms):
    return audio.speech_window(start_ms, end_ms, result['silences'])


def local(start_ms, end_ms):
    return audio.local_speech_window(MEDIA_ID, start_ms, end_ms, SENTENCE_MS)


def close(a, b):
    return abs(a[0] - b[0]) <= TOLERANCE_MS and abs(a[1] - b[1]) <= TOLERANCE_MS


def test_the_synthesized_book_segments_as_designed(book):
    # 5 spoken sentences, plus the half-silences before the first cut and
    # after the last one, which analysis also emits as (silent) sentences.
    assert len(book['sentences']) == 7
    assert len(book['chapters']) == 2


def test_every_analysed_sentence_trims_the_same_when_probed_alone(book):
    """Merge parity in its purest form: a 'merge' whose result is exactly an
    analysed span must get exactly the analysed window."""
    for span in book['sentences']:
        want, got = analysed(book, *span), local(*span)
        assert close(want, got), f'{span}: analysed {want} vs local {got}'


def test_the_windows_actually_trim(book):
    """Guards the test itself: parity of two no-ops would prove nothing."""
    trimmed = [analysed(book, *s) != tuple(s) for s in book['sentences']]
    assert sum(trimmed) >= 5


def test_split_halves_keep_the_outer_edges(book):
    """A6.1: split a sentence inside its speech — the first half's window
    start and the second half's window end equal the original's."""
    for span in book['sentences']:
        whole = analysed(book, *span)
        at = (whole[0] + whole[1]) // 2
        first, second = local(span[0], at), local(at, span[1])
        assert abs(first[0] - whole[0]) <= TOLERANCE_MS, (span, first, whole)
        assert abs(second[1] - whole[1]) <= TOLERANCE_MS, (span, second, whole)
        # the operator's cut is not a silence: nothing trimmed at it
        assert first[1] == at and second[0] == at


def test_merging_the_halves_back_restores_the_window(book):
    for span in book['sentences']:
        assert close(local(*span), analysed(book, *span))


def test_merging_two_analysed_sentences_trims_like_analysis_of_the_union(book):
    """Merge of two neighbours: the merged span's outer edges trim as the
    analysis pass would trim that span (the inner silence stays)."""
    sentences = book['sentences']
    for a, b in zip(sentences, sentences[1:]):
        span = (a[0], b[1])
        assert close(local(*span), analysed(book, *span)), span
