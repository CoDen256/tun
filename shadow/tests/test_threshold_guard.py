"""
The one threshold combination that is not a segmentation.

Chapter cuts are a SUBSET of sentence cuts — long silences are a subset of
medium ones. A chapter threshold SHORTER than the sentence one inverts
that: chapter boundaries land inside sentences, a sentence straddles two
chapters, and a chapter manifest's offsetMs + durationMs runs past the end
of the chunk the phone downloaded. Nothing forbade it until 2026-11-16.

    cd shadow && python -m pytest
"""

import pathlib
import sys

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

import audio  # noqa: E402
import shadowing  # noqa: E402


def test_segment_ranges_refuses_an_inverted_pair_before_touching_the_disk():
    with pytest.raises(audio.AudioError) as excinfo:
        # media 999999 has no master; the guard must fire first, which is
        # what proves it runs before any decode.
        audio.segment_ranges(999999, 60000, sentence_silence_ms=800,
                             chapter_silence_ms=400)
    message = str(excinfo.value)
    assert 'chapter silence threshold' in message
    assert '400' in message and '800' in message


def test_equal_thresholds_are_allowed():
    """Degenerate but coherent: every sentence is its own chapter. The
    slider in Prepare can produce exactly this pair, so it must not 400."""
    assert shadowing._threshold_error(1200, 1200) is None


@pytest.mark.parametrize("sentence_ms,chapter_ms,needle", [
    (800, 400, 'chapter silence threshold'),
    (0, 2000, 'at least'),
    (400, 0, 'at least'),
    ('x', 2000, 'whole numbers'),
    (None, 2000, 'whole numbers'),
])
def test_threshold_error_names_the_problem(sentence_ms, chapter_ms, needle):
    message = shadowing._threshold_error(sentence_ms, chapter_ms)
    assert message and needle in message


def test_the_defaults_are_a_valid_pair():
    assert shadowing._threshold_error(shadowing.DEFAULT_SENTENCE_SILENCE_MS,
                                      shadowing.DEFAULT_CHAPTER_SILENCE_MS) is None
