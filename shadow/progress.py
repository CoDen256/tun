"""
progress.py — the range algebra behind shadow's progress model.

shadow-studying-mode replaced per-segment `done` booleans with a set of
COMPLETED TIME RANGES owned by the book (design.md §4). Everything that
makes that model behave correctly lives here, as pure functions over
``(start_ms, end_ms)`` tuples, for two reasons:

1. the Alembic migration that converts the old booleans must run the SAME
   coverage rule the application runs, or the migration could "succeed"
   while changing which sentences read as done (acceptance criterion 19);
2. the rules — conjunctive merge, split preserves, cursor resolution — are
   exactly the things worth testing without a database.

INVARIANT of a stored range set: sorted ascending, non-overlapping, and
non-ADJACENT (``[0,100)`` and ``[100,200)`` collapse to ``[0,200)``).
Adjacent ranges are merged because sentence spans meet exactly at
boundaries: without that, a sentence spanning two merged neighbours would
not read as covered even though every millisecond of it is done.

Ranges are half-open ``[start, end)`` in milliseconds.
"""

from __future__ import annotations

from typing import Iterable, Sequence

Range = tuple[int, int]


def normalize(ranges: Iterable[Range]) -> list[Range]:
    """Sort, drop empties, and merge overlapping or adjacent ranges.

    This is what keeps the stored set from growing without bound (task
    4.1): marking 500 consecutive sentences done stores one row, not 500.
    """
    cleaned = sorted((int(a), int(b)) for a, b in ranges if int(b) > int(a))
    out: list[Range] = []
    for start, end in cleaned:
        if out and start <= out[-1][1]:
            if end > out[-1][1]:
                out[-1] = (out[-1][0], end)
        else:
            out.append((start, end))
    return out


def add(ranges: Iterable[Range], *spans: Range) -> list[Range]:
    """The set with `spans` marked done."""
    return normalize(list(ranges) + [s for s in spans])


def subtract(ranges: Iterable[Range], *spans: Range) -> list[Range]:
    """The set with `spans` marked NOT done — punching holes, not deleting rows.

    Un-marking a sentence must remove exactly its span even when that span
    sits in the middle of one merged stored range, which is why this is a
    difference and not a row delete.
    """
    out = normalize(ranges)
    for cut_start, cut_end in normalize(spans):
        next_out: list[Range] = []
        for start, end in out:
            if cut_end <= start or cut_start >= end:
                next_out.append((start, end))
                continue
            if start < cut_start:
                next_out.append((start, cut_start))
            if cut_end < end:
                next_out.append((cut_end, end))
        out = next_out
    return out


def covers(ranges: Sequence[Range], start: int, end: int) -> bool:
    """True when [start, end) is ENTIRELY covered — the done rule.

    "Entirely" is the whole design: it is what makes a merge conjunctive
    (the merged span is covered only if both halves were), a split
    preserving (each half of a covered span is itself covered), and
    progress portable across split configs (a config's sentence is done
    iff it happens to fall inside covered time).
    """
    if end <= start:
        return False
    cursor = start
    for r_start, r_end in ranges:  # assumed normalized: sorted, disjoint
        if r_start > cursor:
            return False
        if r_end > cursor:
            cursor = r_end
            if cursor >= end:
                return True
    return cursor >= end


def covered_ms(ranges: Sequence[Range], start: int, end: int) -> int:
    """Milliseconds of [start, end) that are covered. For progress bars."""
    total = 0
    for r_start, r_end in ranges:
        lo, hi = max(start, r_start), min(end, r_end)
        if hi > lo:
            total += hi - lo
    return total


# ── The migration's half: old booleans → ranges, and the proof ──────────

def ranges_from_done_segments(segments: Iterable[dict]) -> list[Range]:
    """Every sentence previously flagged done, as one normalized range set.

    `segments` are dicts with at least ``kind``, ``start_ms``, ``end_ms``
    and ``done``. ONLY ``kind == 'sentence'`` rows are converted: a chapter
    row carrying a stray ``done`` would cover every sentence inside it and
    GAIN done sentences, which criterion 19 forbids ("zero gained, zero
    lost"). The old UI only ever marked sentences.
    """
    return normalize(
        (int(s['start_ms']), int(s['end_ms']))
        for s in segments
        if s.get('kind') == 'sentence' and s.get('done')
    )


def done_segment_ids(segments: Iterable[dict], ranges: Sequence[Range]) -> set:
    """The ids of the sentences the coverage rule calls done."""
    return {
        s['id'] for s in segments
        if s.get('kind') == 'sentence' and covers(ranges, int(s['start_ms']), int(s['end_ms']))
    }


def _studiable(s: dict) -> bool:
    """A sentence with real duration.

    A row with ``end_ms <= start_ms`` spans no audio: there is nothing to
    play, nothing to shadow, and no range that could represent it (an empty
    range is not a range). Such rows are excluded from the lossless
    comparison rather than failing it, because a flag on a zero-length span
    carries no progress to lose. The operator's database contains none
    (checked, 2026-11-15); this exists so a malformed row cannot wedge the
    upgrade of a service that is supposed to degrade, not refuse to boot.
    """
    return s.get('kind') == 'sentence' and int(s['end_ms']) > int(s['start_ms'])


def verify_lossless(segments: Sequence[dict], ranges: Sequence[Range]) -> None:
    """Raise unless the coverage rule reproduces the old boolean set exactly.

    Called BY the migration, on the real rows, before it commits — so a
    database whose data would not survive the conversion fails the upgrade
    loudly instead of quietly losing the operator's place in a book he is
    part-way through (acceptance criterion 19).
    """
    before = {s['id'] for s in segments if _studiable(s) and s.get('done')}
    after = {i for i in done_segment_ids(segments, ranges)}
    if before != after:
        raise RuntimeError(
            'progress migration is NOT lossless: '
            f'lost={sorted(before - after)} gained={sorted(after - before)}'
        )


# ── The cursor ──────────────────────────────────────────────────────────

def resolve_cursor(sentences: Sequence[dict], position_ms: int | None):
    """The sentence a stored time POSITION lands on, or None.

    `sentences` must be ordered by start_ms. The cursor is a time position
    rather than a segment id precisely so that it survives a re-split: the
    containing sentence is recomputed against whatever boundaries the
    active config currently has. A position that falls in a silence between
    two sentences resolves to the next one; past the end, to the last.
    """
    if not sentences:
        return None
    if position_ms is None:
        return sentences[0]
    pos = int(position_ms)
    following = None
    for s in sentences:
        if int(s['start_ms']) <= pos < int(s['end_ms']):
            return s
        if following is None and int(s['start_ms']) > pos:
            following = s
    return following or sentences[-1]
