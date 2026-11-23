"""Contract tests for `POST /examples` / `GET /examples/{id}` (examples-api
tasks 7.1, 7.2, 7.12) against the real `app`, registering a throwaway fake
provider for deterministic candidate counts."""

from __future__ import annotations

import pytest

from app import app as real_app, _extract_examples_input
from registry import registry


def _client():
    return real_app.test_client()


AUTH = {"Authorization": "Bearer test-token"}


class _FakeAdapter:
    def lookup(self, input_dict: dict) -> dict:
        limit = input_dict["limit"]
        return {"candidates": [{"text": f"example {i}"} for i in range(limit)]}


@pytest.fixture
def fake_provider():
    registry.register("examples", "faketest", _FakeAdapter())
    return "faketest"


def test_extract_input_defaults_limit_to_3():
    assert _extract_examples_input({"text": "kalv"}) == {"text": "kalv", "lang": "nb", "limit": 3}


def test_extract_input_clamps_limit_below_1():
    assert _extract_examples_input({"text": "kalv", "limit": 0})["limit"] == 1


def test_extract_input_clamps_limit_above_10():
    assert _extract_examples_input({"text": "kalv", "limit": 999})["limit"] == 10


def test_extract_input_rejects_non_nb_lang():
    with pytest.raises(ValueError):
        _extract_examples_input({"text": "kalv", "lang": "en"})


def test_extract_input_requires_text():
    with pytest.raises(ValueError):
        _extract_examples_input({})


def test_post_examples_default_limit_is_3(monkeypatch, fake_provider):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    resp = _client().post("/examples", json={"text": "kalv", "provider": fake_provider}, headers=AUTH)
    assert resp.status_code == 200
    body = resp.get_json()
    assert len(body["candidates"]) == 3


def test_post_examples_explicit_limit_is_honored(monkeypatch, fake_provider):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    resp = _client().post(
        "/examples", json={"text": "kalv", "provider": fake_provider, "limit": 10}, headers=AUTH
    )
    assert len(resp.get_json()["candidates"]) == 10


def test_post_examples_unsupported_lang_is_400(monkeypatch, fake_provider):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    resp = _client().post(
        "/examples", json={"text": "kalv", "lang": "en", "provider": fake_provider}, headers=AUTH
    )
    assert resp.status_code == 400


def test_limit_3_and_limit_10_are_distinct_cache_resources(monkeypatch, fake_provider):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    client = _client()
    resp3 = client.post("/examples", json={"text": "kalv", "provider": fake_provider, "limit": 3}, headers=AUTH)
    resp10 = client.post("/examples", json={"text": "kalv", "provider": fake_provider, "limit": 10}, headers=AUTH)

    rid3 = resp3.headers["Location"].rsplit("/", 1)[-1]
    rid10 = resp10.headers["Location"].rsplit("/", 1)[-1]
    assert rid3 != rid10

    get3 = client.get(f"/examples/{rid3}", headers=AUTH)
    get10 = client.get(f"/examples/{rid10}", headers=AUTH)
    assert len(get3.get_json()["candidates"]) == 3
    assert len(get10.get_json()["candidates"]) == 10


def test_providers_catalog_lists_examples_kind_with_counts(monkeypatch):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    resp = _client().get("/providers", headers=AUTH)
    body = resp.get_json()
    assert "examples" in body
    for name in ("tatoeba", "leipzig", "kaikki"):
        assert name in body["examples"]
    counts = body["counts"].get("examples", {})
    for name in ("tatoeba", "leipzig", "kaikki"):
        assert name in counts
    assert "ordbokene" not in counts


# --- examples-sentence-normalisation task 2.2 ----------------------------
#
# The normaliser runs at the response boundary, after the cache read (D2):
# a raw row seeded into the cache comes back normalised and stays raw on disk.


class _RawAdapter:
    """Returns text exactly as a dictionary provider holds it: lower-case,
    no final punctuation, and one pair that collides once normalised."""

    def lookup(self, input_dict: dict) -> dict:
        return {
            "candidates": [
                {"text": "ei lita jente", "source": "bm"},
                {"text": "Ei lita jente."},
                {"text": "komme seg opp"},
            ]
        }


@pytest.fixture
def raw_provider():
    registry.register("examples", "rawtest", _RawAdapter())
    return "rawtest"


def _seed_examples_cache(input_dict, provider, payload):
    """Writes a payload straight into the lookup cache, as a pre-change
    entry would sit there, and returns its resource id."""
    import cache as cache_module
    from db.models import LookupCache
    from db.session import session_scope

    ihash = cache_module.input_hash(input_dict)
    rid = cache_module.resource_id("examples", provider, ihash)
    with session_scope() as db:
        db.add(
            LookupCache(
                id=rid, kind="examples", provider=provider, input_hash=ihash, payload=payload
            )
        )
        db.commit()
    return rid


def _stored_payload(rid):
    from db.models import LookupCache
    from db.session import session_scope

    with session_scope() as db:
        return dict(db.get(LookupCache, rid).payload)


def test_post_examples_normalises_a_cache_miss(monkeypatch, raw_provider):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    resp = _client().post("/examples", json={"text": "jente", "provider": raw_provider}, headers=AUTH)
    assert resp.status_code == 200
    candidates = resp.get_json()["candidates"]
    # Normalised, and the two that collide once normalised are collapsed.
    assert candidates == [
        {"text": "Ei lita jente.", "source": "bm"},
        {"text": "Komme seg opp."},
    ]


def test_cache_stores_the_raw_provider_payload(monkeypatch, raw_provider):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    resp = _client().post("/examples", json={"text": "jente", "provider": raw_provider}, headers=AUTH)
    rid = resp.headers["Location"].rsplit("/", 1)[-1]
    stored = _stored_payload(rid)
    assert [c["text"] for c in stored["candidates"]] == [
        "ei lita jente",
        "Ei lita jente.",
        "komme seg opp",
    ]


def test_seeded_raw_cache_row_is_normalised_on_read_and_left_raw(monkeypatch, raw_provider):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    input_dict = {"text": "jente", "lang": "nb", "limit": 3}
    rid = _seed_examples_cache(
        input_dict,
        raw_provider,
        {"provider": raw_provider, "candidates": [{"text": "ei lita jente"}]},
    )

    client = _client()
    post = client.post("/examples", json={"text": "jente", "provider": raw_provider}, headers=AUTH)
    assert post.headers["Location"].rsplit("/", 1)[-1] == rid
    assert post.get_json()["candidates"] == [{"text": "Ei lita jente."}]

    # GET /examples/{id} normalises the same way (task 2.1).
    get = client.get(f"/examples/{rid}", headers=AUTH)
    assert get.get_json()["candidates"] == [{"text": "Ei lita jente."}]

    # ...and the stored row is untouched by either read.
    assert _stored_payload(rid)["candidates"] == [{"text": "ei lita jente"}]
