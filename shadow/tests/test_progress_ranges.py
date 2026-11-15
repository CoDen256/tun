"""
The progress model's rules, as tests rather than as prose.

Everything here exercises progress.py — the ONE implementation of the
coverage rule, shared by the service and by the Alembic migration, so a
test that passes here is a test of what actually runs in both.

Deliberately database-free: these are rules about ranges, and a cluster
would add nothing but a dependency.

    cd shadow && python -m pytest
"""

import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent.parent))

import progress  # noqa: E402


def sentence(i, start, end, done=False, kind='sentence'):
    return {'id': i, 'kind': kind, 'start_ms': start, 'end_ms': end, 'done': done}


# ── normalisation: the set cannot grow without bound (task 4.1) ─────────

def test_overlapping_and_adjacent_ranges_merge():
    assert progress.normalize([(0, 100), (100, 200)]) == [(0, 200)]
    assert progress.normalize([(0, 150), (100, 200)]) == [(0, 200)]
    assert progress.normalize([(300, 400), (0, 100)]) == [(0, 100), (300, 400)]
    assert progress.normalize([(50, 50)]) == []


def test_marking_many_consecutive_sentences_stores_one_range():
    spans = [(i * 1000, (i + 1) * 1000) for i in range(500)]
    assert progress.add([], *spans) == [(0, 500_000)]


# ── the done rule: FULLY covered (design.md §4) ─────────────────────────

def test_fully_covered_is_done_and_partially_is_not():
    ranges = [(1000, 2000)]
    assert progress.covers(ranges, 1000, 2000)      # exactly
    assert progress.covers(ranges, 1200, 1800)      # inside
    assert not progress.covers(ranges, 900, 2000)   # a sliver before
    assert not progress.covers(ranges, 1000, 2100)  # a sliver after
    assert not progress.covers(ranges, 3000, 4000)  # elsewhere


def test_coverage_spanning_two_ranges_needs_no_gap():
    assert progress.covers(progress.normalize([(0, 500), (500, 1000)]), 200, 800)
    assert not progress.covers(progress.normalize([(0, 500), (600, 1000)]), 200, 800)


# ── merge is conjunctive, split preserves (acceptance 16, 17) ───────────

def test_merge_is_conjunctive():
    first, second = (0, 1000), (1000, 2000)
    only_one = progress.add([], first)
    both = progress.add([], first, second)
    # The merged sentence spans 0..2000 in both cases; only "both done" covers it.
    assert not progress.covers(only_one, 0, 2000)
    assert progress.covers(both, 0, 2000)


def test_split_preserves_doneness():
    ranges = progress.add([], (0, 2000))
    assert progress.covers(ranges, 0, 900) and progress.covers(ranges, 900, 2000)


def test_unmarking_removes_exactly_that_span():
    ranges = progress.add([], (0, 3000))           # one merged stored range
    ranges = progress.subtract(ranges, (1000, 2000))
    assert ranges == [(0, 1000), (2000, 3000)]
    assert not progress.covers(ranges, 1000, 2000)
    assert progress.covers(ranges, 0, 1000)


# ── progress carries across configs (acceptance 15) ─────────────────────

def test_progress_carries_into_a_differently_split_config():
    # Config A marked one long sentence done.
    ranges = progress.add([], (0, 4000))
    # Config B split the same time differently.
    config_b = [sentence(1, 0, 1500), sentence(2, 1500, 3900), sentence(3, 3900, 5000)]
    done = progress.done_segment_ids(config_b, ranges)
    assert done == {1, 2}, 'sentences wholly inside the marked span are done; the overhanging one is not'


# ── the migration (acceptance 19) ───────────────────────────────────────

def test_migration_converts_done_flags_losslessly():
    """A fixture of done segments, through the exact conversion the
    migration runs, re-derived and compared."""
    segments = [
        sentence(1, 0, 1000, done=True),
        sentence(2, 1000, 2000, done=True),    # adjacent to 1 — must still both read done
        sentence(3, 2000, 2500, done=False),
        sentence(4, 2500, 3000, done=True),
        sentence(5, 3000, 4000, done=False),
        sentence(6, 4000, 5000, done=True),
    ]
    ranges = progress.ranges_from_done_segments(segments)
    progress.verify_lossless(segments, ranges)     # raises if anything moved
    assert progress.done_segment_ids(segments, ranges) == {1, 2, 4, 6}
    # And the adjacent pair collapsed into one stored row, as designed.
    assert ranges == [(0, 2000), (2500, 3000), (4000, 5000)]


def test_migration_ignores_chapter_rows_so_nothing_is_gained():
    """A chapter flagged done would cover every sentence inside it.

    Criterion 19 is "zero gained, zero lost", so the conversion looks at
    sentences only — which this asserts by constructing exactly the trap.
    """
    segments = [
        sentence(10, 0, 5000, done=True, kind='chapter'),
        sentence(1, 0, 1000, done=True),
        sentence(2, 1000, 2000, done=False),
    ]
    ranges = progress.ranges_from_done_segments(segments)
    progress.verify_lossless(segments, ranges)
    assert progress.done_segment_ids(segments, ranges) == {1}


def test_verify_lossless_actually_fails_when_the_set_changes():
    """The guard must be able to fail, or it proves nothing."""
    segments = [sentence(1, 0, 1000, done=True), sentence(2, 1000, 2000, done=False)]
    try:
        progress.verify_lossless(segments, [(0, 2000)])   # a conversion that GAINED one
    except RuntimeError as exc:
        assert 'gained=[2]' in str(exc)
    else:
        raise AssertionError('verify_lossless accepted a lossy conversion')


# ── the cursor (acceptance 20, 22) ──────────────────────────────────────

def test_cursor_resolves_to_the_containing_sentence():
    sentences = [sentence(1, 0, 1000), sentence(2, 1000, 2000), sentence(3, 2000, 3000)]
    assert progress.resolve_cursor(sentences, 1500)['id'] == 2
    assert progress.resolve_cursor(sentences, 0)['id'] == 1
    assert progress.resolve_cursor(sentences, None)['id'] == 1
    assert progress.resolve_cursor(sentences, 99_000)['id'] == 3, 'past the end lands on the last'
    assert progress.resolve_cursor([], 500) is None


def test_cursor_survives_a_boundary_change():
    """The whole reason the cursor is a time and not a segment id."""
    before = [sentence(1, 0, 1000), sentence(2, 1000, 3000), sentence(3, 3000, 4000)]
    assert progress.resolve_cursor(before, 2000)['id'] == 2
    position = 2000  # the stored POSITION; the segment id 2 is about to vanish
    # Re-split: different boundaries, different ids, the old row is gone.
    after = [sentence(11, 0, 1800), sentence(12, 1800, 2400), sentence(13, 2400, 4000)]
    assert progress.resolve_cursor(after, position)['id'] == 12


def test_cursor_in_a_silence_lands_on_the_next_sentence():
    sentences = [sentence(1, 0, 1000), sentence(2, 1400, 2000)]
    assert progress.resolve_cursor(sentences, 1200)['id'] == 2
