"""stabbur-editor-redesign tasks 1.3, 2.1 and 2.3: examples on the authoring
API, the duplicate endpoint (D11), and the notes browser's filters and
sorts (notes-browser delta)."""

from __future__ import annotations

import datetime

from sqlalchemy import update

from db.models import Note
from db.session import get_sessionmaker
from tests.conftest import AUTH, make_capture

VERB_PARADIGM = {"infinitiv": "gå", "presens": "går", "preteritum": "gikk", "perfektum": "gått"}


def _create(client, **overrides):
    payload = {"type": "word", "source_lang": "no", "text": "hus"}
    payload.update(overrides)
    resp = client.post("/api/notes", json=payload, headers=AUTH)
    assert resp.status_code == 201, resp.get_json()
    return resp.get_json()


def _list(client, query=""):
    resp = client.get(f"/api/notes/authoring{query}", headers=AUTH)
    assert resp.status_code == 200, resp.get_json()
    return resp.get_json()


def _texts(body):
    return {n["text"] for n in body["notes"]}


# ------------------------------------------------------- examples (1.3) --

def test_examples_are_stored_exactly_as_given(client):
    # C05.
    note = _create(client, examples=["Hvor er doen?", "Doet er opptatt."])
    assert note["examples"] == ["Hvor er doen?", "Doet er opptatt."]
    Session = get_sessionmaker()
    with Session() as db:
        assert db.get(Note, note["id"]).examples == ["Hvor er doen?", "Doet er opptatt."]

    resp = client.patch(f"/api/notes/{note['id']}", json={"examples": ["Doet er opptatt."]}, headers=AUTH)
    assert resp.status_code == 200
    assert client.get(f"/api/notes/{note['id']}", headers=AUTH).get_json()["examples"] == ["Doet er opptatt."]


def test_examples_default_to_an_empty_list(client):
    assert _create(client)["examples"] == []


def test_invalid_examples_are_rejected_on_create_and_patch(client):
    note = _create(client)
    for bad in ("one string", [""], ["  "], [1], [None], {"a": 1}):
        resp = client.post(
            "/api/notes", json={"type": "word", "source_lang": "no", "text": "x", "examples": bad}, headers=AUTH
        )
        assert resp.status_code == 400, bad
        resp = client.patch(f"/api/notes/{note['id']}", json={"examples": bad}, headers=AUTH)
        assert resp.status_code == 400, bad
    assert client.get(f"/api/notes/{note['id']}", headers=AUTH).get_json()["examples"] == []


# ------------------------------------------------------ duplicate (2.1) --

def test_duplicating_a_ready_captured_note_with_audio(client):
    # C07.
    make_capture("cap-dup")
    original = _create(
        client,
        text="bil",
        status="ready",
        origin="capture",
        capture_id="cap-dup",
        pos="verb",
        lemma="bil",
        transcription="biːl",
        translations=[{"lang": "en", "text": "car"}, {"lang": "en", "text": "automobile"}],
        examples=["Bilen er rød."],
        inflections=VERB_PARADIGM,
        audio_blob="a" * 64,
        audio_sel_ms=[120, 840],
    )
    before = client.get(f"/api/notes/{original['id']}", headers=AUTH).get_json()

    resp = client.post(f"/api/notes/{original['id']}/duplicate", headers=AUTH)
    assert resp.status_code == 201, resp.get_json()
    copy = resp.get_json()

    assert copy["id"] != original["id"]
    assert copy["duplicated_from"] == original["id"]
    assert copy["status"] == "draft"
    assert copy["origin"] == "manual"
    assert copy["capture_id"] is None
    assert copy["import_ref"] is None
    for field in (
        "type", "source_lang", "text", "translations", "transcription", "pos", "lemma",
        "inflections", "examples", "audio_blob", "audio_sel_ms", "grammar_rule_id",
    ):
        assert copy[field] == before[field], field

    after = client.get(f"/api/notes/{original['id']}", headers=AUTH).get_json()
    assert after == before

    Session = get_sessionmaker()
    with Session() as db:
        row = db.get(Note, copy["id"])
        assert row.status == "draft" and row.origin == "manual" and row.capture_id is None
        assert row.audio_blob == "a" * 64


def test_duplicating_an_imported_note_drops_the_import_ref(client):
    original = _create(
        client, origin="import", import_ref={"source": "ntnu", "source_note_id": "1", "run_id": 1}
    )
    copy = client.post(f"/api/notes/{original['id']}/duplicate", headers=AUTH).get_json()
    assert copy["origin"] == "manual" and copy["import_ref"] is None


def test_duplicating_a_grammar_note_keeps_its_rule(client):
    rule = client.post("/api/grammar_rules", json={"title": "V2", "html": "<p>x</p>"}, headers=AUTH).get_json()
    original = _create(client, type="grammar", grammar_rule_id=rule["id"])
    copy = client.post(f"/api/notes/{original['id']}/duplicate", headers=AUTH).get_json()
    assert copy["grammar_rule_id"] == rule["id"]


def test_duplicating_an_unknown_note_is_404(client):
    assert client.post("/api/notes/nope/duplicate", headers=AUTH).status_code == 404


def test_duplicating_a_tombstoned_note_is_404(client):
    note = _create(client, status="ready")
    assert client.delete(f"/api/notes/{note['id']}", headers=AUTH).status_code == 200  # ready -> tombstone
    assert client.post(f"/api/notes/{note['id']}/duplicate", headers=AUTH).status_code == 404


# ----------------------------------------------- notes browser (2.3) --

def test_pos_and_audio_filters_combine(client):
    # C10.
    _create(client, text="fin", pos="adjektiv")
    _create(client, text="stor", pos="adjektiv")
    _create(client, text="rød", pos="adjektiv", audio_blob="b" * 64)
    _create(client, text="gå", pos="verb")
    body = _list(client, "?pos=adjektiv&audio=none")
    assert _texts(body) == {"fin", "stor"}
    assert body["total"] == 2

    assert _texts(_list(client, "?pos=adjektiv&audio=has")) == {"rød"}
    assert _texts(_list(client, "?audio=any")) == {"fin", "stor", "rød", "gå"}


def test_multi_value_filters_accept_comma_lists_and_repeats(client):
    _create(client, text="fin", pos="adjektiv")
    _create(client, text="gå", pos="verb")
    _create(client, text="hus", pos="substantiv")
    _create(client, text="heia", type="expression")
    assert _texts(_list(client, "?pos=adjektiv,verb")) == {"fin", "gå"}
    assert _texts(_list(client, "?pos=adjektiv&pos=substantiv")) == {"fin", "hus"}
    assert _texts(_list(client, "?type=expression")) == {"heia"}
    assert _texts(_list(client, "?type=word,expression")) == {"fin", "gå", "hus", "heia"}


def test_origin_filter_is_multi(client):
    make_capture("cap-o")
    _create(client, text="m")
    _create(client, text="c", origin="capture", capture_id="cap-o")
    _create(client, text="i", origin="import", import_ref={"source": "s", "source_note_id": "1", "run_id": 1})
    assert _texts(_list(client, "?origin=manual,import")) == {"m", "i"}
    assert _texts(_list(client, "?origin=capture")) == {"c"}


def test_status_filter(client):
    _create(client, text="d")
    _create(client, text="r", status="ready")
    assert _texts(_list(client, "?status=ready")) == {"r"}
    assert _texts(_list(client, "?status=draft")) == {"d"}


def test_missing_filters_are_anded(client):
    _create(client, text="bare")
    _create(client, text="ipa", transcription="x")
    _create(client, text="tr", translations=[{"lang": "en", "text": "t"}])
    _create(client, text="ex", examples=["E."])
    _create(client, text="lem", lemma="l")
    _create(client, text="lem-empty", lemma="")
    assert _texts(_list(client, "?missing=ipa")) == {"bare", "tr", "ex", "lem", "lem-empty"}
    assert _texts(_list(client, "?missing=translations")) == {"bare", "ipa", "ex", "lem", "lem-empty"}
    assert _texts(_list(client, "?missing=examples")) == {"bare", "ipa", "tr", "lem", "lem-empty"}
    assert _texts(_list(client, "?missing=lemma")) == {"bare", "ipa", "tr", "ex", "lem-empty"}
    body = _list(client, "?missing=ipa,translations,examples,lemma")
    assert _texts(body) == {"bare", "lem-empty"}
    assert body["total"] == 2


def test_updated_within(client):
    recent = _create(client, text="recent")
    old = _create(client, text="old")
    older = _create(client, text="older")
    now = datetime.datetime.now(datetime.timezone.utc)
    Session = get_sessionmaker()
    with Session() as db:
        db.execute(update(Note).where(Note.id == old["id"]).values(updated_at=now - datetime.timedelta(days=3)))
        db.execute(update(Note).where(Note.id == older["id"]).values(updated_at=now - datetime.timedelta(days=20)))
        db.commit()
    assert _texts(_list(client, "?updated_within=today")) == {"recent"}
    assert _texts(_list(client, "?updated_within=week")) == {"recent", "old"}
    assert _texts(_list(client, "?updated_within=month")) == {"recent", "old", "older"}
    assert _texts(_list(client, "?updated_within=any")) == {"recent", "old", "older"}
    assert recent


def test_bad_filter_values_are_400(client):
    for query in (
        "?type=word,nope", "?pos=", "?origin=elsewhere", "?audio=maybe", "?missing=ipa,audio",
        "?updated_within=year", "?sort=complete",
    ):
        resp = client.get(f"/api/notes/authoring{query}", headers=AUTH)
        if query == "?pos=":
            assert resp.status_code == 200  # an empty list is no filter
        else:
            assert resp.status_code == 400, query


def _set_times(note_id, created, updated):
    Session = get_sessionmaker()
    with Session() as db:
        db.execute(update(Note).where(Note.id == note_id).values(created_at=created, updated_at=updated))
        db.commit()


def test_sorts_updated_created_and_text(client):
    now = datetime.datetime.now(datetime.timezone.utc)
    a = _create(client, text="b-word")
    b = _create(client, text="a-word")
    c = _create(client, text="c-word")
    # created: a < b < c ; updated: c < a < b
    _set_times(a["id"], now - datetime.timedelta(days=3), now - datetime.timedelta(days=2))
    _set_times(b["id"], now - datetime.timedelta(days=2), now - datetime.timedelta(days=1))
    _set_times(c["id"], now - datetime.timedelta(days=1), now - datetime.timedelta(days=4))

    def order(sort):
        return [n["text"] for n in _list(client, f"?sort={sort}")["notes"]]

    assert order("updated_desc") == ["a-word", "b-word", "c-word"]
    assert order("created_desc") == ["c-word", "a-word", "b-word"]
    assert order("text_asc") == ["a-word", "b-word", "c-word"]


def _complete_word(client, text, **overrides):
    fields = dict(
        text=text,
        pos="verb",
        lemma=text,
        inflections=VERB_PARADIGM,
        audio_blob="c" * 64,
        transcription="ɡoː",
        translations=[{"lang": "en", "text": "go"}],
        examples=["Vi går."],
    )
    fields.update(overrides)
    return _create(client, **fields)


def test_least_complete_first(client):
    # C11.
    _complete_word(client, "complete")
    _complete_word(client, "lacking", transcription=None, translations=[], examples=[])
    _complete_word(client, "nearly", examples=[])
    body = _list(client, "?sort=complete_asc")
    assert [n["text"] for n in body["notes"]] == ["lacking", "nearly", "complete"]
    by_text = {n["text"]: n["completeness"] for n in body["notes"]}
    # verb has a paradigm: 4 word + inflections + 2 sound + 2 meaning = 9.
    assert by_text["complete"] == {"filled": 9, "applicable": 9}
    assert by_text["nearly"] == {"filled": 8, "applicable": 9}
    assert by_text["lacking"] == {"filled": 6, "applicable": 9}
    assert [n["text"] for n in _list(client, "?sort=complete_desc")["notes"]] == ["complete", "nearly", "lacking"]


def test_completeness_counts_inflections_only_for_a_paradigm_pos(client):
    _complete_word(client, "verb-partial", inflections={"infinitiv": "gå", "presens": "går"})
    _complete_word(client, "adverb", pos="adverb", inflections={})
    _complete_word(client, "no-pos", pos=None, inflections={})
    _complete_word(client, "noun-blank-slot", pos="substantiv",
                   inflections={"article": "en", "sg_indef": "bil", "sg_def": "bilen", "pl_indef": "biler",
                                "pl_def": " "})
    by_text = {n["text"]: n["completeness"] for n in _list(client)["notes"]}
    assert by_text["verb-partial"] == {"filled": 8, "applicable": 9}
    assert by_text["adverb"] == {"filled": 8, "applicable": 8}
    assert by_text["no-pos"] == {"filled": 7, "applicable": 8}
    assert by_text["noun-blank-slot"] == {"filled": 8, "applicable": 9}


def test_completeness_counts_the_rule_only_on_a_grammar_note(client):
    rule = client.post("/api/grammar_rules", json={"title": "V2", "html": "<p>x</p>"}, headers=AUTH).get_json()
    _complete_word(client, "grammar", type="grammar", pos=None, inflections={}, grammar_rule_id=rule["id"])
    _complete_word(client, "word-with-rule", pos=None, inflections={}, grammar_rule_id=rule["id"])
    by_text = {n["text"]: n["completeness"] for n in _list(client)["notes"]}
    # no pos: text, type, lemma filled of 4 word + 4 sound/meaning (+1 rule on grammar).
    assert by_text["grammar"] == {"filled": 8, "applicable": 9}
    assert by_text["word-with-rule"] == {"filled": 7, "applicable": 8}


def test_filters_page_and_total_together(client):
    for i in range(5):
        _create(client, text=f"adj{i}", pos="adjektiv")
    _create(client, text="verb", pos="verb")
    body = _list(client, "?pos=adjektiv&limit=2&offset=2&sort=text_asc")
    assert [n["text"] for n in body["notes"]] == ["adj2", "adj3"]
    assert body["total"] == 5
