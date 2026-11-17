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

import ast
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


GUARDED_SOURCES = ('shadowing.py', 'audio.py')


def test_no_single_line_assigns_a_speech_window_into_a_stored_boundary():
    """The tier-3 tripwire, as a shape test — ON ONE LINE ONLY.

    A future edit that "simplifies" trimming by writing the window back
    into start_ms/end_ms would pass every numeric test above and break the
    whole progress model.

    THE LIMIT OF THIS TEST, STATED PLAINLY (it was presented as the guard
    on a tier-3 tripwire and is not one on its own): it is a regex over
    source text, so it sees only the single-line form. Split the same
    write across two lines —

        w = audio.speech_window(seg.start_ms, seg.end_ms, silences)
        seg.start_ms = w[0]                      # this test says nothing

    — and it passes happily. The test below, which follows the value
    instead of the characters, is the real guard; this one is kept because
    when it does fire it names the offending line verbatim.
    """
    source = ''.join((ROOT / f).read_text() for f in GUARDED_SOURCES)
    # A STORED boundary taking its value from anything about speech. The
    # lookbehind demands a WHOLE identifier, which is what keeps the
    # legitimate `speech_start_ms=...` and `cut_end_ms=...` out of the net:
    # only `start_ms`/`end_ms` themselves are boundaries.
    offender = re.search(r'(?<!\w)(start_ms|end_ms)\s*=\s*[^,\n]*speech', source)
    assert offender is None, \
        f'a stored boundary is being set from a window: {offender.group(0)!r}'


# ── the same tripwire, following the VALUE rather than the line ─────────

BOUNDARY_NAMES = ('start_ms', 'end_ms')


def _is_boundary(target) -> bool:
    """`start_ms`/`end_ms` themselves — never `speech_start_ms`, never
    `cut_end_ms`, never `at_ms`."""
    if isinstance(target, ast.Attribute):
        return target.attr in BOUNDARY_NAMES
    if isinstance(target, ast.Name):
        return target.id in BOUNDARY_NAMES
    return False


def _targets(node):
    for target in getattr(node, 'targets', []) or [getattr(node, 'target', None)]:
        if target is None:
            continue
        if isinstance(target, (ast.Tuple, ast.List)):
            yield from target.elts
        else:
            yield target


def _speech_tainted(value, tainted: set[str]) -> bool:
    """Does this expression carry anything derived from a speech window?"""
    for sub in ast.walk(value):
        if isinstance(sub, ast.Attribute) and 'speech' in sub.attr:
            return True
        if isinstance(sub, ast.Name) and ('speech' in sub.id or sub.id in tainted):
            return True
    return False


def test_no_value_from_a_speech_window_ever_reaches_a_stored_boundary():
    """The tier-3 tripwire, following the value across statements.

    A speech window may be stored (`speech_start_ms`), returned, compared,
    or cut with — but the moment anything derived from one is assigned
    into `start_ms`/`end_ms`, the silence between two sentences stops
    belonging to any sentence and can never be marked done (design.md §2).
    Names that take a value from a window are tainted, and so is anything
    computed from them, which is what catches the two-line form the regex
    above cannot see.
    """
    for filename in GUARDED_SOURCES:
        tree = ast.parse((ROOT / filename).read_text(), filename)
        statements = sorted(
            (n for n in ast.walk(tree) if isinstance(n, (ast.Assign, ast.AnnAssign,
                                                         ast.AugAssign))),
            key=lambda n: (n.lineno, n.col_offset))
        tainted: set[str] = set()
        for node in statements:
            value = node.value
            if value is None:
                continue
            carries = _speech_tainted(value, tainted)
            for target in _targets(node):
                assert not (carries and _is_boundary(target)), (
                    f'{filename}:{node.lineno} writes a speech-derived value into a '
                    'stored boundary — that is the tier-3 tripwire')
                if carries and isinstance(target, ast.Name):
                    tainted.add(target.id)


def test_the_value_following_tripwire_actually_fires(tmp_path):
    """The guard above is only worth having if it catches the two-line
    form, so here is that form, in a file of its own."""
    offender = tmp_path / 'offender.py'
    offender.write_text('def f(seg, silences):\n'
                        '    w = audio.speech_window(seg.start_ms, seg.end_ms, silences)\n'
                        '    seg.start_ms = w[0]\n')
    tree = ast.parse(offender.read_text())
    tainted: set[str] = set()
    caught = False
    for node in sorted((n for n in ast.walk(tree) if isinstance(n, ast.Assign)),
                       key=lambda n: n.lineno):
        carries = _speech_tainted(node.value, tainted)
        for target in _targets(node):
            if carries and _is_boundary(target):
                caught = True
            if carries and isinstance(target, ast.Name):
                tainted.add(target.id)
    assert caught, 'the AST tripwire does not catch the two-line form it exists for'


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


# ── the two paths really do agree now (2026-11-17) ─────────────────────

def test_the_local_window_measures_silence_at_the_configs_own_threshold():
    """`local_speech_window` claimed "exactly the same arithmetic" as the
    analysed path while running silencedetect at 120 ms, where analysis
    runs it at the config's sentence threshold (400 ms by default). A
    split sentence therefore trimmed edge pauses an analysed one never
    detected — the opposite of conservative at onsets."""
    import inspect  # noqa: PLC0415

    signature = inspect.signature(audio.local_speech_window)
    assert 'min_silence_ms' in signature.parameters, \
        'the threshold must come from the config, not from a trim constant'
    body = (ROOT / 'audio.py').read_text().split('def local_speech_window(')[1]
    body = body.split('\ndef ')[0]
    assert 'd={max(int(min_silence_ms), 1) / 1000:.3f}' in body
    assert 'TRIM_MIN_SILENCE_MS' not in body.split('"""')[2], \
        'the local pass is back on the trim constant instead of the threshold'


def test_the_local_probe_looks_past_the_span_so_an_edge_silence_is_whole():
    """A boundary silence is half inside the span. Probing the span alone
    measured half its length and could fail its own length test; the
    whole-book pass measures it whole."""
    body = (ROOT / 'audio.py').read_text().split('def local_speech_window(')[1].split('\ndef ')[0]
    assert 'probe_start_ms = max(0, start_ms - pad_ms)' in body
    assert 'probe_end_ms = end_ms + pad_ms' in body


def test_split_and_merge_pass_the_configs_threshold():
    source = (ROOT / 'shadowing.py').read_text()
    assert source.count('min_silence_ms = ') >= 2
    assert 'config.sentence_silence_ms' in source
    for call in re.findall(r'audio\.local_speech_window\([^)]*\)', source):
        assert 'min_silence_ms' in call, f'{call} does not carry a threshold'


def test_a_duplicated_config_carries_its_speech_windows():
    """A duplicate exists to preserve hand-fixed boundaries. Leaving its
    windows NULL meant the only way to get them back was a re-analysis,
    which destroys exactly those boundaries."""
    duplicate = (ROOT / 'shadowing.py').read_text().split('def duplicate_config(')[1]
    duplicate = duplicate.split('\n@shadowing_bp')[0]
    assert 'speech_start_ms=s.speech_start_ms' in duplicate
    assert 'speech_end_ms=s.speech_end_ms' in duplicate


def test_split_and_merge_measure_their_windows_outside_the_transaction():
    """ffmpeg inside an open write transaction held row locks on
    shadowing_segments for up to two CUT_TIMEOUT_SEC (four minutes)."""
    source = (ROOT / 'shadowing.py').read_text()
    for name in ('def split_shadowing_segment(', 'def merge_shadowing_segments('):
        body = source.split(name)[1].split('\n@shadowing_bp')[0]
        before, after = body.split('audio.local_speech_window', 1)
        # The measurement happens between two sessions, not inside one: the
        # session that was open when it started must have been closed.
        opens = before.count('with get_sessionmaker()() as db:')
        assert opens >= 1, 'nothing was read before measuring'
        assert 'db.commit()' not in before, 'the window is measured mid-transaction'
        assert 'with get_sessionmaker()() as db:' in after, \
            'the window is not applied in its own fresh transaction'


def test_the_local_probes_clock_is_shifted_by_the_COARSE_seek():
    """`-ss` after `-i` drops frames silencedetect has already seen, so the
    filter's clock counts from the coarse seek point — half a second
    earlier than the span. Shifting by the span's start reported every
    silence 500 ms late and skewed every window a split or merge wrote.
    Measured in the container: a silence the whole-book pass puts at
    (4199, 4500) came back as (4699, 5000)."""
    body = (ROOT / 'audio.py').read_text().split('def local_speech_window(')[1].split('\ndef ')[0]
    shift = body.split('return speech_window(')[1]
    assert '(a + coarse_ms, b + coarse_ms)' in shift
    assert 'probe_start_ms' not in shift
