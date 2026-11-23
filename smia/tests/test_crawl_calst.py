"""
tests/test_crawl_calst.py — scripts/crawl_calst.py (calst-full-coverage):
word-list parsing, sampling to saturation, the per-sample cache key, dialect
discovery and the coverage report / exit code.

No network: the HTTP client is a fake that serves scripted bodies. These
tests need no database: the conftest autouse DB fixtures are shadowed.
"""

from __future__ import annotations

import io
import json
from pathlib import Path

import pytest

from scripts import crawl_calst as cc
from scripts import fetch_pygmalion_audio as fpa

FIX = Path(__file__).parent / "fixtures" / "calst"


@pytest.fixture(autouse=True)
def clean_db():  # shadows conftest: this module is DB-free
    yield


@pytest.fixture(autouse=True)
def fresh_registry():  # shadows conftest: this module is DB-free
    yield


def _body(words: list[str], dialect: str = "Oslo") -> str:
    """A LAS-shaped Details body holding `words`, one sound each."""
    entries = ",".join(
        f'{{wordID:{abs(hash(w)) % 100000},text:"{w}",translation:"",'
        f'sounds:[{{url:"/sfiles/Norwegian/Words_MP3/{dialect}_Normal_{w.upper()}X.mp3",'
        f'speed:"Normal"}}],soundGroup:0}}'
        for w in words
    )
    return f"<script>Calst.VocabExerciseData = [{{wordList:[{entries}]}}];</script>"


class FakeClient:
    """Serves `draws[sample]` for each Details request; records the calls."""

    def __init__(self, draws, status=200, raise_at=None):
        self.draws = draws
        self.status = status
        self.raise_at = raise_at
        self.calls = []
        self.network_calls = 0

    def request(self, method, path, data=None, *, dialect=cc.OSLO, sample=None):
        self.calls.append((method, path, dict(data or {}), dialect, sample))
        if self.raise_at is not None and sample == self.raise_at:
            raise RuntimeError("ReadTimeout on POST (after retry)")
        draw = self.draws[min(sample, len(self.draws) - 1)]
        body = draw if isinstance(draw, str) else _body(draw)
        return {"status": self.status, "location": None, "body": body}


EX = {"exercise_id": 947, "wrid": 121, "vwrid": 0, "language": "no",
      "href": "/Exercise/no/947?wrid=121",
      "appearances": [{"title": "Tonelag 1C"}]}


# ─────────────────────────── parsing ───────────────────────────

def test_wordlist_with_doubled_assignment_is_parsed():
    words, variables, errors = cc.parse_words((FIX / "tonelag_wordlist.html").read_text())
    assert variables == ["WordList"]
    assert [w["text"] for w in words] == ["målende", "målene", "undrende", "undre"]
    assert words[0]["sounds"][0]["url"].endswith("Oslo_Normal_AAAA1111BBBB2222.mp3")
    assert errors == []


def test_vocab_exercise_data_is_parsed_and_shuffle_line_ignored():
    words, variables, _ = cc.parse_words((FIX / "las_vocab.html").read_text())
    assert variables == ["VocabExerciseData"]
    assert [w["text"] for w in words] == ["bindende", "bindene"]


def test_words_without_sounds_are_not_a_failure():
    c = FakeClient([(FIX / "tonelag_wordlist.html").read_text()])
    r = cc.sample_exercise(c, EX, cc.OSLO)
    assert r["status"] == "saturated"
    undre = [w for w in r["wordList"] if w["text"] == "undre"][0]
    assert undre["sounds"] == []


def test_empty_parse_is_a_failure_with_id_type_and_body_head():
    c = FakeClient([(FIX / "no_wordlist.html").read_text()])
    r = cc.sample_exercise(c, EX, cc.OSLO)
    assert r["status"] == "failed"
    assert r["samples"] == 1
    assert "no word list parsed" in r["error"]
    assert "type LAS" in r["error"]
    assert "Calst.SomethingNew" in r["error"]  # body head kept as a hint


# ─────────────────────────── sampling ───────────────────────────

def test_only_las_is_requested():
    c = FakeClient([["a", "b"]])
    cc.sample_exercise(c, EX, cc.OSLO)
    assert {call[2]["Type"] for call in c.calls} == {"LAS"}


def test_small_pool_stops_at_one_sample():
    c = FakeClient([[f"w{i}" for i in range(12)]])
    r = cc.sample_exercise(c, EX, cc.OSLO)
    assert (r["status"], r["pool_size"], r["samples"]) == ("saturated", 12, 1)
    assert len(c.calls) == 1


def test_saturation_needs_k_consecutive_zero_gain_samples():
    pool = [f"w{i:02d}" for i in range(40)]
    a, b = pool[:20], pool[20:]
    # sample 0: a; 1: a again (zero gain); 2: b (+20, resets the run); then
    # a/b alternate with zero gain until K(40, 20) is reached.
    k = cc.k_needed(40, 20)
    assert k > 1
    draws = [a, a, b] + [a if i % 2 else b for i in range(k + 5)]
    c = FakeClient(draws)
    r = cc.sample_exercise(c, EX, cc.OSLO)
    assert r["status"] == "saturated"
    assert r["pool_size"] == 40
    assert r["samples"] == 3 + k  # the zero gain at sample 1 was reset by sample 2
    assert [call[4] for call in c.calls] == list(range(3 + k))


def test_zero_gain_then_gain_keeps_sampling():
    # the live probe: zero gain was followed by +4 — one zero must not stop it
    base = [f"w{i:02d}" for i in range(20)]
    later = base[:16] + ["x1", "x2", "x3", "x4"]
    draws = [base, base, later] + [base] * 30
    r = cc.sample_exercise(FakeClient(draws), EX, cc.OSLO)
    assert r["status"] == "saturated"
    assert r["pool_size"] == 24
    assert {"x1", "x4"} <= {w["text"] for w in r["wordList"]}


def test_unsaturated_at_request_cap():
    # every sample brings two new words: never saturates
    draws = [[f"s{i}_{j}" for j in range(18)] + [f"n{i}a", f"n{i}b"] for i in range(10)]
    c = FakeClient(draws)
    r = cc.sample_exercise(c, EX, cc.OSLO, max_samples=10)
    assert r["status"] == "unsaturated"
    assert r["samples"] == 10
    assert len(c.calls) == 10


def test_k_grows_with_the_pool():
    assert cc.k_needed(20, 20) == cc.K_MIN
    assert cc.k_needed(94, 20) >= 10
    assert cc.k_needed(94, 20) > cc.k_needed(40, 20)


def test_request_failure_is_isolated_and_keeps_partial_pool():
    c = FakeClient([[f"w{i}" for i in range(20)]] * 5, raise_at=1)
    r = cc.sample_exercise(c, EX, cc.OSLO)
    assert r["status"] == "failed"
    assert r["pool_size"] == 20
    assert "sample 1" in r["error"]


def test_non_200_is_a_failure():
    r = cc.sample_exercise(FakeClient([["a"]], status=300), EX, cc.OSLO)
    assert r["status"] == "failed"
    assert "HTTP 300" in r["error"]


# ─────────────────────────── cache key ───────────────────────────

def test_cache_key_distinct_per_dialect_and_sample():
    data = {"ExerciseId": 947, "wrid": 121, "vwrid": 0, "Type": "LAS"}
    keys = {cc.cache_key("POST", "/Exercises/Details", data, d, s)
            for d in (1, 2, 5) for s in range(4)}
    assert len(keys) == 12


def test_oslo_sample_zero_reuses_the_legacy_key():
    import hashlib
    data = {"ExerciseId": 947, "wrid": 121, "vwrid": 0, "Type": "LAS"}
    legacy = hashlib.sha256(json.dumps(["POST", "/Exercises/Details", data],
                                       sort_keys=True).encode()).hexdigest()[:32]
    assert cc.cache_key("POST", "/Exercises/Details", data, cc.OSLO, 0) == legacy
    assert cc.cache_key("GET", "/Home/Lessons", None) == hashlib.sha256(
        json.dumps(["GET", "/Home/Lessons", None], sort_keys=True).encode()).hexdigest()[:32]
    assert cc.cache_key("POST", "/Exercises/Details", data, 2, 0) != legacy


def test_cached_samples_replay_without_network(tmp_path):
    import gzip
    data = {"ExerciseId": 947, "wrid": 121, "vwrid": 0, "Type": "LAS"}
    rec = {"status": 200, "location": None, "body": _body(["a"])}
    for d, s in ((1, 0), (2, 3)):
        f = tmp_path / f"{cc.cache_key('POST', '/Exercises/Details', data, d, s)}.json.gz"
        f.write_bytes(gzip.compress(json.dumps(rec).encode()))
    c = cc.Client(cache_dir=tmp_path)
    c._fetch = lambda *a, **k: pytest.fail("network used")  # type: ignore[assignment]
    assert c.request("POST", "/Exercises/Details", data, dialect=1, sample=0) == rec
    assert c.request("POST", "/Exercises/Details", data, dialect=2, sample=3) == rec
    assert c.network_calls == 0


# ─────────────────────────── dialects ───────────────────────────

def test_dialects_parsed_from_settings_selector():
    ds = cc.parse_dialects((FIX / "settings.html").read_text())
    assert ds == [{"dialect_id": 1, "name": "Oslo"},
                  {"dialect_id": 2, "name": "Trondheim"},
                  {"dialect_id": 6, "name": "Sandnessjøen"}]


def test_missing_dialect_selector_is_loud():
    with pytest.raises(RuntimeError):
        cc.parse_dialects("<html>no selector</html>")


# ─────────────────────────── report + exit code ───────────────────────────

DIALECTS = [{"dialect_id": 1, "name": "Oslo"}]


def _run(tmp_path, client, todo, **kw):
    out = io.StringIO()
    code = cc.run(client, [], todo, DIALECTS, tmp_path / "m.json", report_out=out, **kw)
    return code, out.getvalue(), json.loads((tmp_path / "m.json").read_text())


def test_clean_run_exits_zero_and_manifest_is_extractable(tmp_path):
    c = FakeClient([(FIX / "tonelag_wordlist.html").read_text()])
    code, report, doc = _run(tmp_path, c, [EX])
    assert code == 0
    assert "failures: 0" in report
    assert "ex   947" in report and "pool    4 samples   1 saturated" in report
    assert "Tonelag 1C" in report
    assert "dialects found: 1=Oslo" in report
    assert "only Oslo is offered" in report
    assert "network calls: 0" in report
    assert doc["failures"] == []
    assert "skipped" not in doc
    # the unchanged extractor still finds every word and sound
    rows, skipped = fpa.build_calst_inventory(doc, set(), {})
    assert {r["word"] for r in rows} == {"målende", "målene"}
    assert skipped == []


def test_empty_parse_makes_the_run_exit_non_zero(tmp_path):
    other = {**EX, "exercise_id": 935, "appearances": [{"title": "Stress, 2 syllables"}]}

    class Mixed(FakeClient):
        def request(self, method, path, data=None, *, dialect=1, sample=None):
            body = (FIX / ("no_wordlist.html" if data["ExerciseId"] == 935
                           else "las_vocab.html")).read_text()
            return {"status": 200, "location": None, "body": body}

    code, report, doc = _run(tmp_path, Mixed([]), [EX, other])
    assert code == 1
    assert "failures: 1" in report
    assert "! ex 935" in report
    assert [f["exercise_id"] for f in doc["failures"]] == [935]
    # the failing exercise is still in the manifest, not dropped
    assert [e["exercise_id"] for e in doc["exercises"]] == [947, 935]


def test_unsaturated_makes_the_run_exit_non_zero(tmp_path):
    draws = [[f"s{i}_{j}" for j in range(20)] for i in range(5)]
    code, report, doc = _run(tmp_path, FakeClient(draws), [EX], max_samples=3)
    assert code == 1
    assert "unsaturated" in report


def test_manifest_is_deterministic(tmp_path):
    draws = [[f"w{i:02d}" for i in range(20)][::-1]] * 5
    _, _, _ = _run(tmp_path, FakeClient(draws), [EX])
    first = (tmp_path / "m.json").read_bytes()
    _run(tmp_path, FakeClient(draws), [EX])
    assert (tmp_path / "m.json").read_bytes() == first
    words = json.loads(first)["exercises"][0]["dialects"][0]["wordList"]
    assert [w["text"] for w in words] == sorted(w["text"] for w in words)


def test_report_lists_offered_dialects_when_crawl_is_restricted(tmp_path):
    offered = DIALECTS + [{"dialect_id": 2, "name": "Trondheim"}]
    _, report, doc = _run(tmp_path, FakeClient([["a"]]), [EX], offered=offered)
    assert "dialects found: 1=Oslo, 2=Trondheim" in report
    assert "dialects crawled (restricted): 1=Oslo" in report
    assert "only Oslo is offered" not in report
    assert doc["meta"]["dialects_offered"] == offered
