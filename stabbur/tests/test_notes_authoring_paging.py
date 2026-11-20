"""stabbur-triage-queues tasks 1.4 and 2.6 — the authoring list's new
filter dimensions (source_lang, updated-since, three-state field presence)
and its server-side paging.

The `missing` predicate is the subtle one and is tested per column type:
`inflections` and `translations` are NOT NULL, so their empty value is the
only reachable missing state, while `transcription` and `lemma` are
nullable and must count BOTH null and the empty string. Keying off
nullability alone would make a sweep queue silently skip the notes it
exists to find (design D2).
"""

from __future__ import annotations

from tests.conftest import AUTH


def _create(client, **overrides):
    payload = {"type": "word", "source_lang": "no", "text": "hus"}
    payload.update(overrides)
    resp = client.post("/api/notes", json=payload, headers=AUTH)
    assert resp.status_code == 201
    return resp.get_json()


def _get(client, query=""):
    resp = client.get(f"/api/notes/authoring{query}", headers=AUTH)
    assert resp.status_code == 200, resp.get_json()
    return resp.get_json()


def _texts(body):
    return {n["text"] for n in body["notes"]}


# --------------------------------------------------------------- paging --

def test_response_is_a_paged_object_carrying_the_total(client):
    for i in range(5):
        _create(client, text=f"n{i}")
    body = _get(client, "?limit=2")
    assert isinstance(body, dict)
    assert len(body["notes"]) == 2
    assert body["total"] == 5
    assert body["limit"] == 2
    assert body["offset"] == 0


def test_total_counts_the_filters_not_the_page(client):
    for i in range(7):
        _create(client, text=f"n{i}")
    _create(client, text="other", type="expression")
    body = _get(client, "?type=word&limit=3")
    assert len(body["notes"]) == 3
    # 7 word notes match; the `expression` one does not. The total is about
    # the filters, never the page.
    assert body["total"] == 7


def test_offset_walks_the_result_set_without_overlap(client):
    for i in range(5):
        _create(client, text=f"n{i}")
    first = _get(client, "?limit=2&offset=0&sort=text_asc")
    second = _get(client, "?limit=2&offset=2&sort=text_asc")
    third = _get(client, "?limit=2&offset=4&sort=text_asc")
    assert [n["text"] for n in first["notes"]] == ["n0", "n1"]
    assert [n["text"] for n in second["notes"]] == ["n2", "n3"]
    # The last page is partial, and the total still reports every match.
    assert [n["text"] for n in third["notes"]] == ["n4"]
    assert third["total"] == 5


def test_offset_past_the_end_is_an_empty_page_not_an_error(client):
    _create(client, text="only")
    body = _get(client, "?limit=10&offset=50")
    assert body["notes"] == []
    assert body["total"] == 1


def test_bad_paging_values_are_rejected_not_clamped(client):
    # A clamped page size would make the pager's own arithmetic lie about
    # which slice is on screen.
    for query in ("?limit=0", "?limit=99999", "?limit=abc", "?offset=-1", "?offset=x"):
        assert client.get(f"/api/notes/authoring{query}", headers=AUTH).status_code == 400


def test_counts_describe_the_filtered_set_not_the_page(client):
    for i in range(4):
        n = _create(client, text=f"d{i}")
        if i < 2:
            client.patch(f"/api/notes/{n['id']}", json={"audio_blob": "a" * 64}, headers=AUTH)
    body = _get(client, "?limit=1")
    assert len(body["notes"]) == 1
    assert body["total"] == 4
    # Two of the four lack audio — not "however many of this one page do".
    assert body["counts"]["missing_audio"] == 2
    assert body["counts"]["draft"] == 4
    assert body["counts"]["ready"] == 0


# -------------------------------------------------------- field presence --

def test_missing_matches_null_and_empty_string_for_a_nullable_column(client):
    _create(client, text="ipa-null")
    _create(client, text="ipa-empty", transcription="")
    _create(client, text="ipa-set", transcription="ˈhʉːs")
    missing = _texts(_get(client, "?transcription_presence=missing"))
    assert missing == {"ipa-null", "ipa-empty"}
    assert _texts(_get(client, "?transcription_presence=has")) == {"ipa-set"}


def test_missing_matches_the_empty_object_for_a_not_null_jsonb_column(client):
    # `inflections` is NOT NULL, so `{}` is the only reachable missing
    # state — a note carrying it is missing inflections by any reading the
    # operator would recognise.
    _create(client, text="infl-empty")
    _create(client, text="infl-set", pos="substantiv", inflections={"sg_indef": "hus"})
    assert _texts(_get(client, "?inflections_presence=missing")) == {"infl-empty"}
    assert _texts(_get(client, "?inflections_presence=has")) == {"infl-set"}


def test_missing_matches_the_empty_array_for_translations(client):
    _create(client, text="t-empty")
    _create(client, text="t-set", translations=[{"lang": "en", "text": "house"}])
    assert _texts(_get(client, "?translations_presence=missing")) == {"t-empty"}
    assert _texts(_get(client, "?translations_presence=has")) == {"t-set"}


def test_missing_audio_is_the_operators_original_sweep(client):
    a = _create(client, text="with-audio")
    client.patch(f"/api/notes/{a['id']}", json={"audio_blob": "b" * 64}, headers=AUTH)
    _create(client, text="without-audio")
    assert _texts(_get(client, "?audio_blob_presence=missing")) == {"without-audio"}


def test_lemma_and_examples_presence(client):
    _create(client, text="l-null")
    _create(client, text="l-empty", lemma="")
    _create(client, text="l-set", lemma="hus")
    assert _texts(_get(client, "?lemma_presence=has")) == {"l-set"}
    assert _texts(_get(client, "?lemma_presence=missing")) == {"l-null", "l-empty"}

    _create(client, text="c-set", examples=["Huset er stort."])
    assert "c-set" in _texts(_get(client, "?examples_presence=has"))
    assert "c-set" not in _texts(_get(client, "?examples_presence=missing"))


def test_any_is_the_same_as_no_filter(client):
    _create(client, text="one")
    _create(client, text="two", transcription="x")
    assert _texts(_get(client, "?transcription_presence=any")) == {"one", "two"}


def test_presence_filters_combine(client):
    _create(client, text="both-missing")
    _create(client, text="has-ipa", transcription="x")
    body = _get(client, "?transcription_presence=missing&audio_blob_presence=missing")
    assert _texts(body) == {"both-missing"}


def test_unknown_presence_state_is_rejected_not_ignored(client):
    # A queue that quietly stopped filtering would look like a queue with
    # different contents, which is worse than an error.
    resp = client.get("/api/notes/authoring?transcription_presence=bogus", headers=AUTH)
    assert resp.status_code == 400


# ---------------------------------------------- source_lang / updated_since --

def test_filters_by_source_lang(client):
    _create(client, text="norsk", source_lang="no")
    _create(client, text="deutsch", source_lang="de")
    assert _texts(_get(client, "?source_lang=de")) == {"deutsch"}


def test_updated_since_window_includes_a_fresh_note(client):
    _create(client, text="fresh")
    assert _texts(_get(client, "?updated_since=24h")) == {"fresh"}


def test_unknown_updated_since_window_is_rejected(client):
    assert client.get("/api/notes/authoring?updated_since=1y", headers=AUTH).status_code == 400


# ------------------------------------------------------- the read API's shape --

def test_the_public_read_api_is_not_paged_and_stays_a_bare_array(client):
    """D44's contract. The route mjolnir pulls from is a different function
    with a different query path, and this change must not reshape it."""
    n = _create(client, text="ready-one")
    client.patch(f"/api/notes/{n['id']}", json={"status": "ready"}, headers=AUTH)
    resp = client.get("/api/notes?source_lang=no&status=ready", headers=AUTH)
    assert resp.status_code == 200
    body = resp.get_json()
    assert isinstance(body, list), "the read API must stay a bare array"
    assert [x["text"] for x in body] == ["ready-one"]


def test_paging_and_presence_params_do_nothing_to_the_read_api(client):
    for i in range(3):
        n = _create(client, text=f"r{i}")
        client.patch(f"/api/notes/{n['id']}", json={"status": "ready"}, headers=AUTH)
    plain = client.get("/api/notes?source_lang=no&status=ready", headers=AUTH).get_json()
    noisy = client.get(
        "/api/notes?source_lang=no&status=ready&limit=1&offset=2&audio_blob_presence=missing",
        headers=AUTH,
    ).get_json()
    assert plain == noisy
    assert len(plain) == 3
