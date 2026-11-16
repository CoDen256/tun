"""
The speech window: what it may trim, and the one thing it may never touch.

Silence trimming is a PLAYBACK AND DISPLAY attribute. The sentence's stored
span — `start_ms`/`end_ms` — is the unit of doneness, and narrowing it to
the trimmed window would leave the silence between two sentences belonging
to no sentence, unmarkable forever, so a wider sentence in another split
config would read not-done for good. The operator raised that risk himself
and the answer is here, as tests rather than as prose (design.md §2).

Database-free, like the rest of this suite: these are rules about numbers
and about the shape of the code, which is what a careless edit would break.

    cd shadow && python -m pytest
"""

import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

import audio  # noqa: E402
import progress  # noqa: E402
from db.models import ShadowingSegment  # noqa: E402


# A sentence as the segmenter makes one: the boundary sits at the MIDDLE of
# a silence, so the span opens and closes with half a pause.
SPAN = (10_000, 14_000)
EDGE_SILENCES = [(9_600, 10_400), (13_700, 14_300)]


# ── what it trims ──────────────────────────────────────────────────────

def test_it_trims_the_half_pause_at_each_end():
    start, end = audio.speech_window(*SPAN, EDGE_SILENCES)
    assert start == 10_400 - audio.TRIM_ONSET_GUARD_MS
    assert end == 13_700 + audio.TRIM_TAIL_GUARD_MS


def test_the_window_is_always_inside_the_stored_span():
    for silences in ([], EDGE_SILENCES, [(0, 999_999)], [(9_000, 13_999)]):
        start, end = audio.speech_window(*SPAN, silences)
        assert SPAN[0] <= start < end <= SPAN[1]


def test_it_is_idempotent():
    once = audio.speech_window(*SPAN, EDGE_SILENCES)
    assert audio.speech_window(*SPAN, EDGE_SILENCES) == once
    # And re-running it on its own output cannot creep inwards, because the
    # input is the stored span and never the previous answer.
    assert audio.speech_window(*SPAN, EDGE_SILENCES) == once


def test_a_silence_in_the_MIDDLE_is_not_trimmed():
    """Only the edges. A pause inside a sentence is part of the sentence."""
    assert audio.speech_window(*SPAN, [(11_000, 12_000)]) == SPAN


def test_no_silence_detected_means_no_trim():
    assert audio.speech_window(*SPAN, []) == SPAN


# ── conservative at onsets — the failure mode that is invisible ─────────

def test_the_onset_is_never_cut_closer_than_the_guard():
    """Clipping a soft consonant does not LOOK broken; it just means
    shadowing a truncated model. Hence a guard, and hence this test."""
    detected_speech_onset = 10_400
    start, _ = audio.speech_window(*SPAN, EDGE_SILENCES)
    assert detected_speech_onset - start >= audio.TRIM_ONSET_GUARD_MS


def test_a_short_edge_silence_is_left_alone():
    assert audio.speech_window(*SPAN, [(9_990, 10_050), (13_950, 14_050)]) == SPAN


def test_an_implausibly_short_window_falls_back_to_the_full_span():
    """If almost everything is silence, the detector is not believed."""
    nearly_all_silence = [(9_000, 13_800), (13_850, 15_000)]
    assert audio.speech_window(*SPAN, nearly_all_silence) == SPAN


def test_a_very_short_sentence_is_never_trimmed():
    assert audio.speech_window(5_000, 5_200, [(4_000, 5_100)]) == (5_000, 5_200)


def test_a_300ms_lead_in_leaves_less_than_150ms_of_silence():
    """Acceptance criterion 10, as arithmetic: sound within 150 ms."""
    start, _ = audio.speech_window(10_000, 14_000, [(9_000, 10_300)])
    assert start - 10_000 >= 0
    assert 10_300 - start < 150


# ── the stored span is never altered ────────────────────────────────────

def _recompute(segment, silences):
    """Exactly what analysis and split/merge do: write the WINDOW only."""
    segment.speech_start_ms, segment.speech_end_ms = audio.speech_window(
        segment.start_ms, segment.end_ms, silences)


def test_enabling_disabling_and_recomputing_never_moves_a_boundary():
    seg = ShadowingSegment(media_id=1, config_id=1, kind='sentence',
                           order_index=0, start_ms=SPAN[0], end_ms=SPAN[1])
    before = (seg.start_ms, seg.end_ms)

    _recompute(seg, EDGE_SILENCES)                    # trimming computed
    assert (seg.start_ms, seg.end_ms) == before
    seg.speech_start_ms = seg.speech_end_ms = None    # trimming turned off
    assert (seg.start_ms, seg.end_ms) == before
    _recompute(seg, EDGE_SILENCES)                    # and recomputed
    assert (seg.start_ms, seg.end_ms) == before
    _recompute(seg, [(9_000, 10_900), (13_100, 15_000)])  # different silences
    assert (seg.start_ms, seg.end_ms) == before


def test_doneness_reads_the_full_span_and_not_the_window():
    """Criterion 13, as a unit: covering only what is HEARD is not done."""
    seg = ShadowingSegment(media_id=1, config_id=1, kind='sentence',
                           order_index=0, start_ms=SPAN[0], end_ms=SPAN[1])
    _recompute(seg, EDGE_SILENCES)
    covering_the_window_only = [(seg.speech_start_ms, seg.speech_end_ms)]
    assert not progress.covers(covering_the_window_only, seg.start_ms, seg.end_ms)
    assert progress.covers([SPAN], seg.start_ms, seg.end_ms)


def test_nothing_assigns_a_speech_window_into_a_stored_boundary():
    """The tier-3 tripwire, as a shape test.

    A future edit that "simplifies" trimming by writing the window back
    into start_ms/end_ms would pass every numeric test above and break the
    whole progress model. It would have to write one of these lines.
    """
    source = (ROOT / 'shadowing.py').read_text() + (ROOT / 'audio.py').read_text()
    # A STORED boundary taking its value from anything about speech. The
    # lookbehind demands a WHOLE identifier, which is what keeps the
    # legitimate `speech_start_ms=...` and `cut_end_ms=...` out of the net:
    # only `start_ms`/`end_ms` themselves are boundaries.
    offender = re.search(r'(?<!\w)(start_ms|end_ms)\s*=\s*[^,\n]*speech', source)
    assert offender is None, \
        f'a stored boundary is being set from a window: {offender.group(0)!r}'


def test_the_migration_adds_columns_and_touches_no_boundary():
    migration = (ROOT / 'alembic' / 'versions' / 'd3f81c5a2e17_speech_window.py').read_text()
    assert "add_column('shadowing_segments'" in migration
    upgrade = migration.split('def upgrade')[1].split('def downgrade')[0]
    assert 'UPDATE' not in upgrade and 'update(' not in upgrade
    # Only the two NEW columns may be named; a bare start_ms/end_ms in an
    # upgrade body is a boundary being rewritten.
    assert re.search(r'(?<!\w)(start_ms|end_ms)', upgrade) is None


# ── the trailing silence that runs to EOF ───────────────────────────────

def test_a_silence_that_never_ends_is_closed_at_the_duration():
    """Over a single sentence cut the trailing pause always runs to EOF, so
    ffmpeg emits `silence_start` with no `silence_end`. Dropping that pair —
    which the parser did until 2026-11-16 — meant a tail was never trimmed."""
    log = 'silence_start: 3.100\n'
    assert audio._parse_silences(log) == []
    assert audio._parse_silences(log, duration_ms=4000) == [(3100, 4000)]
