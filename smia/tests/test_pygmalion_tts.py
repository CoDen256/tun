"""The `pygmalion` /tts adapter (pygmalion-tts-provider tasks 4.x, 5.3-5.8):
exact casefolded lookup, one `{sha256, source, voice}` candidate per recording,
Oslo first; plus the fuzzy tiers 2/3 of tts-candidate-matching, whose
candidates add `context` = the stored word. Seeds `pygmalion_audio` itself,
so no real corpus is required; the end-to-end tests go through the real app."""

from __future__ import annotations

import hashlib

import pytest

from adapters.pygmalion_tts import PygmalionTtsAdapter
from app import app as real_app
from audio_cache import store
from db.models import PygmalionAudio, TtsAudio
from db.session import get_sessionmaker
from norwegian import normalize_match_key

AUTH = {"Authorization": "Bearer test-token"}


@pytest.fixture(autouse=True)
def _clean_pygmalion():
    Session = get_sessionmaker()
    with Session() as db:
        db.query(PygmalionAudio).delete()
        db.query(TtsAudio).delete()
        db.commit()
    yield


def _seed(*entries):
    """entries: (word as the corpus spells it, dialect, take, audio_bytes),
    stored the way `import_pygmalion` stores them. Returns the sha256s in order."""
    shas = []
    with get_sessionmaker()() as db:
        for word, dialect, take, data in entries:
            sha = store(db, data, "audio/mpeg")
            db.add(PygmalionAudio(
                word=word.casefold(), dialect=dialect, take=take, sha256=sha,
                match_key=normalize_match_key(word), text=word,
            ))
            shas.append(sha)
        db.commit()
    return shas


def _sha(data):
    return hashlib.sha256(data).hexdigest()


def _lookup(text, lang="nb"):
    return PygmalionTtsAdapter().lookup({"text": text, "lang": lang})["candidates"]


def test_one_candidate_per_recording_ordered_oslo_first_with_exact_keys():
    o0, o1, b0 = _seed(
        ("led", "Oslo", 0, b"o0"), ("led", "Oslo", 1, b"o1"), ("led", "Bergen", 0, b"b0")
    )
    cands = _lookup("led")
    assert [(c["voice"], c["sha256"]) for c in cands] == [("Oslo", o0), ("Oslo", o1), ("Bergen", b0)]
    for c in cands:
        assert set(c) == {"sha256", "source", "voice"} and c["source"] == "human"  # no invented field


def test_oslo_leads_even_when_it_sorts_after_other_dialects():
    _seed(("hus", "Elverum", 0, b"e"), ("hus", "Oslo", 0, b"o"), ("hus", "Bergen", 0, b"b"))
    assert [c["voice"] for c in _lookup("hus")] == ["Oslo", "Bergen", "Elverum"]


def test_recordings_within_a_dialect_keep_take_order():
    _seed(("hus", "Oslo", 2, b"c"), ("hus", "Oslo", 0, b"a"), ("hus", "Oslo", 1, b"b"))
    assert [x["sha256"] for x in _lookup("hus")] == [_sha(b"a"), _sha(b"b"), _sha(b"c")]


def test_casefold_and_surrounding_whitespace_are_ignored():
    _seed(("led", "Oslo", 0, b"x"))
    assert _lookup("  Led ") == _lookup("led") != []


def test_phrases_match_exactly_or_not_at_all():
    _seed(("la du", "Oslo", 0, b"x"))
    assert len(_lookup("la du")) == 1
    assert _lookup("la deg") == []


def test_unknown_word_is_empty_not_an_error():
    assert PygmalionTtsAdapter().lookup({"text": "qzxnotaword", "lang": "nb"}) == {"candidates": []}


def test_count_function_reports_recordings_live():
    from adapters.pygmalion_tts import pygmalion_audio_count
    with get_sessionmaker()() as db:
        assert pygmalion_audio_count(db) == 0
    _seed(("led", "Oslo", 0, b"a"), ("led", "Bergen", 0, b"b"), ("ledd", "Oslo", 0, b"c"))
    with get_sessionmaker()() as db:
        assert pygmalion_audio_count(db) == 3


def test_registered_as_a_tts_provider_with_a_count_source():
    from registry import registry
    assert "pygmalion" in registry.providers_for("tts")
    _seed(("led", "Oslo", 0, b"a"), ("led", "Oslo", 1, b"b"))
    with get_sessionmaker()() as db:
        assert registry.counts_for(db, "tts")["pygmalion"] == 2


def test_other_languages_get_no_candidates():
    _seed(("led", "Oslo", 0, b"x"))
    assert _lookup("led", lang="en") == []


# ───────────── fuzzy tiers (tts-candidate-matching spec scenarios) ─────────────

def test_article_stored_word_found_by_its_bare_form():
    o, b = _seed(("ei avis", "Oslo", 0, b"o"), ("ei avis", "Bergen", 0, b"b"))
    assert _lookup("avis") == [
        {"sha256": o, "source": "human", "voice": "Oslo", "context": "ei avis"},
        {"sha256": b, "source": "human", "voice": "Bergen", "context": "ei avis"},
    ]


def test_article_in_the_query():
    (sha,) = _seed(("bil", "Oslo", 0, b"x"))
    assert _lookup("en bil") == [{"sha256": sha, "source": "human", "voice": "Oslo", "context": "bil"}]


def test_infinitive_marker_in_the_query():
    _seed(("stille", "Oslo", 0, b"x"))
    assert [c["context"] for c in _lookup("å stille")] == ["stille"]


def test_compound_written_with_plus():
    _seed(("bok + handel", "Oslo", 0, b"x"), ("flagg  + stang", "Oslo", 0, b"y"))
    assert [c["context"] for c in _lookup("bokhandel")] == ["bok + handel"]
    assert [c["context"] for c in _lookup("flaggstang")] == ["flagg  + stang"]


def test_punctuation_and_case_context_is_verbatim():
    _seed(("Hallo!", "Oslo", 0, b"x"), ("Hva heter du?", "Oslo", 0, b"y"))
    assert [c["context"] for c in _lookup("hallo")] == ["Hallo!"]
    assert [c["context"] for c in _lookup("Hva heter du")] == ["Hva heter du?"]


def test_exact_casefold_hit_of_a_punctuated_word_has_no_context():
    _seed(("Hallo!", "Oslo", 0, b"x"))
    assert "context" not in _lookup("hallo!")[0]  # tier 1: casefolded text == word


def test_trailing_particle_dropped_only_as_a_last_resort():
    _seed(("stille", "Oslo", 0, b"x"))
    assert [c["context"] for c in _lookup("stille opp")] == ["stille"]
    assert _lookup("stille på") != [] and _lookup("roe seg") == []  # `roe` not stored


def test_tier_2_beats_tier_3():
    # `stille opp` stored as a phrase: tier 2 answers, tier 3's `stille` is not mixed in.
    _seed(("å stille opp", "Oslo", 0, b"phrase"), ("stille", "Oslo", 0, b"bare"))
    assert [(c["sha256"], c["context"]) for c in _lookup("stille opp")] == [(_sha(b"phrase"), "å stille opp")]


def test_exact_hit_is_not_diluted():
    (exact,) = _seed(("avis", "Oslo", 0, b"exact"))
    _seed(("ei avis", "Oslo", 0, b"fuzzy"))
    assert _lookup("avis") == [{"sha256": exact, "source": "human", "voice": "Oslo"}]


def test_lone_article_is_not_stripped_to_nothing():
    _seed(("en", "Oslo", 0, b"x"))
    assert _lookup("en") and "context" not in _lookup("en")[0]
    assert _lookup("å") == []


def test_rows_without_verbatim_text_fall_back_to_word_as_context():
    # Rows migrated before the re-import have match_key but no text.
    with get_sessionmaker()() as db:
        sha = store(db, b"x", "audio/mpeg")
        db.add(PygmalionAudio(word="ei avis", dialect="Oslo", take=0, sha256=sha,
                              match_key="avis", text=None))
        db.commit()
    assert [c["context"] for c in _lookup("avis")] == ["ei avis"]


def test_identical_audio_is_deduplicated_by_sha256():
    _seed(("led", "Oslo", 0, b"same"), ("led", "Bergen", 0, b"same"))
    cands = _lookup("led")
    assert len(cands) == 1 and cands[0]["voice"] == "Oslo"


# ───────────────────────── through the real app ─────────────────────────

@pytest.fixture
def client(monkeypatch):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    return real_app.test_client()


def test_post_tts_returns_candidates_and_get_serves_the_bytes(client):
    (sha,) = _seed(("led", "Oslo", 0, b"ID3-fake-mp3"))
    resp = client.post("/tts", json={"text": "led", "lang": "nb", "provider": "pygmalion"}, headers=AUTH)
    assert resp.status_code == 200
    body = resp.get_json()
    assert body["provider"] == "pygmalion"
    assert body["candidates"] == [{"sha256": sha, "source": "human", "voice": "Oslo"}]

    audio = client.get(f"/tts/{sha}", headers=AUTH)
    assert audio.status_code == 200
    assert audio.data == b"ID3-fake-mp3" and audio.headers["Content-Type"].startswith("audio/mpeg")


def test_post_tts_miss_is_a_successful_empty_response(client):
    resp = client.post("/tts", json={"text": "qzxnotaword", "lang": "nb", "provider": "pygmalion"}, headers=AUTH)
    assert resp.status_code == 200 and resp.get_json()["candidates"] == []


def test_providers_lists_pygmalion_with_a_live_count(client):
    first = client.get("/providers", headers=AUTH).get_json()
    assert "pygmalion" in first["tts"]
    assert first["counts"]["tts"]["pygmalion"] == 0

    _seed(("led", "Oslo", 0, b"a"), ("led", "Oslo", 1, b"b"))
    second = client.get("/providers", headers=AUTH).get_json()
    assert second["counts"]["tts"]["pygmalion"] == 2  # live, no restart
