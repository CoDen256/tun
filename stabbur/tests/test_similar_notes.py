"""Tests for the `similar-notes-merge` change: the three similarity
signals (tasks.md section 3/6.1-6.4), the merge endpoint's status rules
and transactionality (6.5-6.8), and `audio_blob` take behaviour (6.7)."""

from __future__ import annotations

from tests.conftest import AUTH


def _create(client, **overrides):
    body = {"type": "word", "source_lang": "no", "text": "x"}
    body.update(overrides)
    resp = client.post("/api/notes", json=body, headers=AUTH)
    assert resp.status_code == 201, resp.get_json()
    return resp.get_json()


def _similar(client, note_id):
    resp = client.get(f"/api/notes/{note_id}/similar", headers=AUTH)
    assert resp.status_code == 200, resp.get_json()
    return resp.get_json()


def _reason_signals(match):
    return {r["signal"] for r in match["reasons"]}


# --------------------------------------------------------------- 6.1 ---

def test_spelling_signal_above_threshold(client):
    a = _create(client, text="å oppleve")
    b = _create(client, text="en opplevelse")

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    assert b["id"] in by_id
    assert "spelling" in _reason_signals(by_id[b["id"]])
    score = next(r["score"] for r in by_id[b["id"]]["reasons"] if r["signal"] == "spelling")
    assert score == 0.5833333134651184 or abs(score - 0.5833) < 0.01


def test_morphology_signal_shared_inflected_form(client):
    a = _create(client, text="en blogg", inflections={"article": "en", "sg_indef": "blogg", "sg_def": "bloggen"})
    b = _create(client, text="en blogger", inflections={"article": "en", "sg_indef": "blogger", "sg_def": "bloggeren"})
    c = _create(
        client,
        text="å blogge",
        inflections={"infinitiv": "blogge", "presens": "blogger", "preteritum": "bloggd", "perfektum": "bloggd"},
    )

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    # a and c share the surface form "blogger" (a's sg_def-adjacent form
    # isn't shared with c directly in this fixture, so assert on b<->c,
    # the pair the design doc actually calls out as cross-PoS.
    matches_b = _similar(client, b["id"])
    by_id_b = {m["id"]: m for m in matches_b}
    assert c["id"] in by_id_b
    assert "morphology" in _reason_signals(by_id_b[c["id"]])


def test_similar_match_includes_actual_field_values(client):
    a = _create(client, text="å oppleve")
    b = _create(
        client,
        text="en opplevelse",
        translations=[{"lang": "en", "text": "an experience"}],
        examples=["en spennende opplevelse"],
        inflections={"article": "en", "sg_indef": "opplevelse", "sg_def": "opplevelsen"},
        transcription="/ɔ.plɛ.vɛl.sə/",
    )

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    match = by_id[b["id"]]
    assert match["translations"] == [{"lang": "en", "text": "an experience"}]
    assert match["examples"] == ["en spennende opplevelse"]
    assert match["has_examples"] is True
    assert match["inflections"] == {"article": "en", "sg_indef": "opplevelse", "sg_def": "opplevelsen"}
    assert match["transcription"] == "/ɔ.plɛ.vɛl.sə/"
    assert match["audio_blob"] is None
    assert match["has_audio"] is False


def test_similar_match_inflections_strip_grammatical_marker_prefix(client):
    a = _create(client, text="å oppleve")
    b = _create(
        client,
        text="en opplevelse",
        inflections={"article": "en", "sg_indef": "en opplevelse", "sg_def": "opplevelsen"},
    )

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    # sg_indef's stored "en opplevelse" is the marker-plus-form shape a
    # dictionary reads naturally; article already carries "en" on its own
    # field, so the prefix is redundant once sg_indef is labeled by key.
    assert by_id[b["id"]]["inflections"]["sg_indef"] == "opplevelse"
    assert by_id[b["id"]]["inflections"]["article"] == "en"


def test_similar_match_superlativ_keeps_only_first_slash_variant(client):
    a = _create(client, text="å oppleve")
    b = _create(
        client,
        text="en opplevelse",
        inflections={"superlativ": "strengest/strengeste"},
    )

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    assert by_id[b["id"]]["inflections"]["superlativ"] == "strengest"


def test_similar_match_without_fields_returns_empty_values(client):
    a = _create(client, text="å oppleve")
    b = _create(client, text="en opplevelse")

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    match = by_id[b["id"]]
    assert match["translations"] == []
    assert match["examples"] == []
    assert match["has_examples"] is False
    assert match["inflections"] == {}
    assert match["transcription"] is None
    assert match["audio_blob"] is None


def test_semantic_signal_shared_translation(client):
    a = _create(client, text="forbindelse", translations=[{"lang": "en", "text": "a connection"}])
    b = _create(client, text="sammenheng", translations=[{"lang": "en", "text": "connection"}])

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    assert b["id"] in by_id
    assert "semantic" in _reason_signals(by_id[b["id"]])


# --------------------------------------------------------------- 6.2 ---

def test_shared_article_alone_does_not_relate_two_nouns(client):
    a = _create(client, text="en katt", inflections={"article": "en", "sg_indef": "katt", "sg_def": "katten"})
    b = _create(client, text="en bil", inflections={"article": "en", "sg_indef": "bil", "sg_def": "bilen"})

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    assert b["id"] not in by_id


# --------------------------------------------------------------- 6.3 ---

def test_listening_note_has_no_spelling_similarity(client):
    a = _create(client, type="listening", text="Jeg liker å oppleve nye ting")
    b = _create(client, text="å oppleve")

    matches = _similar(client, a["id"])
    assert matches == []
    # And the reverse direction: a listening note isn't offered as a
    # spelling match for a word note either.
    matches_b = _similar(client, b["id"])
    by_id_b = {m["id"]: m for m in matches_b}
    assert a["id"] not in by_id_b


# --------------------------------------------------------------- 6.4 ---

def test_note_matched_by_two_signals_appears_once(client):
    a = _create(client, text="å oppleve", translations=[{"lang": "en", "text": "to experience"}])
    b = _create(client, text="en opplevelse", translations=[{"lang": "en", "text": "an experience"}])

    matches = _similar(client, a["id"])
    matching_rows = [m for m in matches if m["id"] == b["id"]]
    assert len(matching_rows) == 1
    assert _reason_signals(matching_rows[0]) == {"spelling", "semantic"}


# --------------------------------------------------------------- 6.5 ---

def test_ready_absorbs_draft_is_permitted(client):
    survivor = _create(client, text="hus", status="ready")
    absorbed = _create(client, text="hus2", status="draft")

    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": survivor["id"], "absorbed_ids": [absorbed["id"]], "take": {}},
        headers=AUTH,
    )
    assert resp.status_code == 200


def test_draft_absorbs_draft_is_permitted(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft")

    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": survivor["id"], "absorbed_ids": [absorbed["id"]], "take": {}},
        headers=AUTH,
    )
    assert resp.status_code == 200


def test_draft_absorbing_ready_is_rejected(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="ready")

    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": survivor["id"], "absorbed_ids": [absorbed["id"]], "take": {}},
        headers=AUTH,
    )
    assert resp.status_code == 400

    still_there = client.get(f"/api/notes/{absorbed['id']}", headers=AUTH)
    assert still_there.status_code == 200


def test_ready_absorbing_ready_is_rejected(client):
    survivor = _create(client, text="hus", status="ready")
    absorbed = _create(client, text="hus2", status="ready")

    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": survivor["id"], "absorbed_ids": [absorbed["id"]], "take": {}},
        headers=AUTH,
    )
    assert resp.status_code == 400

    still_there = client.get(f"/api/notes/{absorbed['id']}", headers=AUTH)
    assert still_there.status_code == 200


# --------------------------------------------------------------- 6.6 ---

def test_permitted_merge_deletes_absorbed_and_bumps_survivor(client):
    survivor = _create(client, text="hus", status="ready")
    absorbed = _create(client, text="hus2", status="draft", origin="manual")
    survivor_before = client.get(f"/api/notes/{survivor['id']}", headers=AUTH).get_json()

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"examples": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    survivor_after = resp.get_json()
    assert survivor_after["absorbed_ids"] == [absorbed["id"]]

    gone = client.get(f"/api/notes/{absorbed['id']}", headers=AUTH)
    assert gone.status_code == 404

    assert survivor_after["updated_at"] != survivor_before["updated_at"]
    assert survivor_after["origin"] == survivor_before["origin"]


# --------------------------------------------------------------- 6.7 ---

def test_taking_audio_copies_hash_without_duplicating_blob(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft", audio_blob="deadbeef" * 8)

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"audio_blob": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["audio_blob"] == "deadbeef" * 8


def test_taking_inflections_strips_grammatical_marker_prefix(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(
        client,
        text="hus2",
        status="draft",
        inflections={"infinitiv": "å ringe", "perfektum": "har ringt", "presens": "ringer"},
    )

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"inflections": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["inflections"] == {"infinitiv": "ringe", "perfektum": "ringt", "presens": "ringer"}


def test_taking_translations_adds_separate_rows_never_a_joined_one(client):
    # stabbur-editor-redesign D7/D10: translations are always separate rows;
    # the retired append mode's "house / home" can no longer be produced.
    survivor = _create(client, text="hus", status="draft", translations=[{"lang": "en", "text": "house"}])
    absorbed = _create(
        client,
        text="hus2",
        status="draft",
        translations=[{"lang": "en", "text": "home"}, {"lang": "de", "text": "Haus"}],
    )

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"translations": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["translations"] == [
        {"lang": "en", "text": "house"},
        {"lang": "en", "text": "home"},
        {"lang": "de", "text": "Haus"},
    ]


def test_taking_translations_skips_a_translation_the_survivor_already_has(client):
    survivor = _create(client, text="hus", status="draft", translations=[{"lang": "en", "text": "house"}])
    absorbed = _create(
        client,
        text="hus2",
        status="draft",
        translations=[{"lang": "EN", "text": " house "}, {"lang": "en", "text": "home"}],
    )

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"translations": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["translations"] == [
        {"lang": "en", "text": "house"},
        {"lang": "en", "text": "home"},
    ]


def test_taking_translations_with_no_existing_translations_just_adds_them(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft", translations=[{"lang": "en", "text": "house"}])

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"translations": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["translations"] == [{"lang": "en", "text": "house"}]


def test_taking_pos_copies_it_onto_the_survivor(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft", pos="substantiv")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"pos": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["pos"] == "substantiv"


def test_similar_match_exposes_pos_and_has_translations(client):
    a = _create(client, text="å oppleve")
    b = _create(client, text="en opplevelse", pos="substantiv", translations=[{"lang": "en", "text": "an experience"}])

    matches = _similar(client, a["id"])
    by_id = {m["id"]: m for m in matches}
    assert by_id[b["id"]]["pos"] == "substantiv"
    assert by_id[b["id"]]["has_pos"] is True
    assert by_id[b["id"]]["has_translations"] is True


# --------------------------------------------------------------- 6.8 ---

def test_failed_merge_rolls_back_entirely(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed_ok = _create(client, text="hus2", status="draft")
    absorbed_forbidden = _create(client, text="hus3", status="ready")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed_ok["id"], absorbed_forbidden["id"]],
            "take": {"examples": absorbed_ok["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 400

    # Nothing was deleted and nothing was copied — all-or-nothing.
    still_ok = client.get(f"/api/notes/{absorbed_ok['id']}", headers=AUTH)
    assert still_ok.status_code == 200
    survivor_after = client.get(f"/api/notes/{survivor['id']}", headers=AUTH).get_json()
    assert survivor_after["examples"] == []


def test_merge_rejects_absorbing_self(client):
    survivor = _create(client, text="hus", status="draft")
    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": survivor["id"], "absorbed_ids": [survivor["id"]], "take": {}},
        headers=AUTH,
    )
    assert resp.status_code == 400


# ------------------------------------- stabbur-merge-fixes task 1.8 ---
# Save-then-merge: the request carries the survivor's open form values,
# which are applied before the takes, in the same transaction.


def test_unsaved_form_value_survives_a_merge_that_takes_nothing(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {},
            "survivor_values": {"transcription": "ˈhuːs", "examples": ["Et stort hus."]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200, resp.get_json()

    stored = client.get(f"/api/notes/{survivor['id']}", headers=AUTH).get_json()
    assert stored["transcription"] == "ˈhuːs"
    assert stored["examples"] == ["Et stort hus."]


def test_merge_without_survivor_values_leaves_the_stored_row_alone(client):
    """Absent values mean "unchanged" — an older client keeps working."""
    survivor = _create(client, text="hus", status="draft", transcription="ˈhuːs")
    absorbed = _create(client, text="hus2", status="draft")

    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": survivor["id"], "absorbed_ids": [absorbed["id"]], "take": {}},
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["transcription"] == "ˈhuːs"


def test_a_replacive_take_wins_over_the_submitted_form_value(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft", transcription="ˈhʉːs")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"transcription": absorbed["id"]},
            "survivor_values": {"transcription": "typed-but-not-saved"},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["transcription"] == "ˈhʉːs"


def test_survivor_values_are_saved_even_for_fields_a_take_does_not_touch(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft", transcription="ˈhʉːs")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"transcription": absorbed["id"]},
            "survivor_values": {"transcription": "typed", "lemma": "hus"},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    body = resp.get_json()
    assert body["transcription"] == "ˈhʉːs"
    assert body["lemma"] == "hus"


def test_invalid_survivor_values_roll_the_whole_merge_back(client):
    survivor = _create(client, text="hus", status="draft", transcription="ˈhuːs")
    absorbed = _create(client, text="hus2", status="draft")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {},
            # The editor's required `text` field, cleared.
            "survivor_values": {"text": "", "transcription": "typed"},
        },
        headers=AUTH,
    )
    assert resp.status_code == 400
    assert "text" in resp.get_json()["error"]

    # Nothing partially applied: the survivor is untouched and — crucially,
    # since a merge hard-deletes — the absorbed note still exists.
    stored = client.get(f"/api/notes/{survivor['id']}", headers=AUTH).get_json()
    assert stored["text"] == "hus"
    assert stored["transcription"] == "ˈhuːs"
    assert client.get(f"/api/notes/{absorbed['id']}", headers=AUTH).status_code == 200


def test_invalid_status_in_survivor_values_is_rejected_like_a_patch(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {},
            "survivor_values": {"status": "published"},
        },
        headers=AUTH,
    )
    assert resp.status_code == 400
    patch_resp = client.patch(f"/api/notes/{survivor['id']}", json={"status": "published"}, headers=AUTH)
    assert resp.get_json()["error"] == patch_resp.get_json()["error"]
    assert client.get(f"/api/notes/{absorbed['id']}", headers=AUTH).status_code == 200


def test_survivor_values_cannot_rewrite_origin_or_import_ref(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {},
            "survivor_values": {"origin": "import", "import_ref": "whatever"},
        },
        headers=AUTH,
    )
    assert resp.status_code == 400
    assert resp.get_json()["error"] == "origin is immutable once set"
    assert client.get(f"/api/notes/{absorbed['id']}", headers=AUTH).status_code == 200


def test_survivor_values_round_trip_of_the_whole_note_is_accepted(client):
    """The client sends its form, not a diff — the unchanged `origin` and
    `import_ref` it already holds must not be read as a rewrite."""
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {},
            "survivor_values": {"origin": "manual", "import_ref": None, "text": "huset"},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["text"] == "huset"


def test_merge_with_survivor_values_still_bumps_updated_at(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft")
    before = client.get(f"/api/notes/{survivor['id']}", headers=AUTH).get_json()["updated_at"]

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {},
            "survivor_values": {"text": "hus"},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["updated_at"] != before


# ------------------------------------- stabbur-merge-fixes task 2.4 ---
# Additive examples, replacive inflections (dragging the source's pos).


def test_taking_examples_appends_them_in_order(client):
    survivor = _create(client, text="hus", status="draft", examples=["Han gikk på doen."])
    absorbed = _create(client, text="hus2", status="draft", examples=["Døra var låst.", "Lyset var av."])

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"examples": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200, resp.get_json()
    assert resp.get_json()["examples"] == ["Han gikk på doen.", "Døra var låst.", "Lyset var av."]


def test_taking_examples_appends_to_the_submitted_form_value_not_the_stored_one(client):
    survivor = _create(client, text="hus", status="draft", examples=["stored"])
    absorbed = _create(client, text="hus2", status="draft", examples=["Døra var låst."])

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"examples": absorbed["id"]},
            "survivor_values": {"examples": ["Han gikk på doen."]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200, resp.get_json()
    assert resp.get_json()["examples"] == ["Han gikk på doen.", "Døra var låst."]


def test_taking_examples_when_both_share_a_sentence_keeps_the_union_without_duplicate(client):
    # C09.
    survivor = _create(client, text="hus", status="draft", examples=["Døra var låst.", "Huset er stort."])
    absorbed = _create(client, text="hus2", status="draft", examples=["  Døra var låst. ", "Ny setning."])

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"examples": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200, resp.get_json()
    assert resp.get_json()["examples"] == ["Døra var låst.", "Huset er stort.", "Ny setning."]


def test_taking_examples_onto_an_empty_survivor_just_takes_them(client):
    survivor = _create(client, text="hus", status="draft")
    absorbed = _create(client, text="hus2", status="draft", examples=["Døra var låst."])

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"examples": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200, resp.get_json()
    assert resp.get_json()["examples"] == ["Døra var låst."]


def test_taking_only_pos_changes_pos_and_leaves_inflections_alone(client):
    # C08: part of speech is its own replacive take.
    paradigm = {"infinitiv": "gå", "presens": "går", "preteritum": "gikk", "perfektum": "gått"}
    survivor = _create(client, text="gå", status="draft", pos="verb", inflections=paradigm)
    absorbed = _create(client, text="gå2", status="draft", pos="substantiv",
                       inflections={"article": "en", "sg_indef": "gang"})

    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": survivor["id"], "absorbed_ids": [absorbed["id"]], "take": {"pos": absorbed["id"]}},
        headers=AUTH,
    )
    assert resp.status_code == 200, resp.get_json()
    stored = client.get(f"/api/notes/{survivor['id']}", headers=AUTH).get_json()
    assert stored["pos"] == "substantiv"
    assert stored["inflections"] == paradigm


# ----------------------------- stabbur-editor-redesign D10: two-way ---
# "This note into '<other>'": the open note is the ABSORBED one; its unsaved
# form state travels as absorbed_values so the takes read what is on screen.


def test_open_note_absorbed_into_other_carries_its_unsaved_form_values(client):
    other = _create(client, text="hus", status="ready", examples=["Huset er stort."])
    open_note = _create(client, text="huset", status="draft", transcription="stored")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": other["id"],
            "absorbed_ids": [open_note["id"]],
            "take": {"transcription": open_note["id"], "examples": open_note["id"], "pos": open_note["id"]},
            "absorbed_values": {
                open_note["id"]: {"transcription": "ˈhʉːsə", "examples": ["Huset er rødt."], "pos": "substantiv"}
            },
        },
        headers=AUTH,
    )
    assert resp.status_code == 200, resp.get_json()
    body = resp.get_json()
    assert body["id"] == other["id"]
    assert body["absorbed_ids"] == [open_note["id"]]
    assert body["transcription"] == "ˈhʉːsə"
    assert body["examples"] == ["Huset er stort.", "Huset er rødt."]
    assert body["pos"] == "substantiv"
    assert body["status"] == "ready"
    assert client.get(f"/api/notes/{open_note['id']}", headers=AUTH).status_code == 404


def test_both_directions_produce_the_mirror_survivor(client):
    a = _create(client, text="bil", status="draft", examples=["A."])
    b = _create(client, text="bilen", status="draft", examples=["B."])
    # Into this note (a survives).
    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": a["id"], "absorbed_ids": [b["id"]], "take": {"examples": b["id"]}},
        headers=AUTH,
    )
    assert resp.status_code == 200 and resp.get_json()["examples"] == ["A.", "B."]

    c = _create(client, text="bil", status="draft", examples=["C."])
    d = _create(client, text="bilen", status="draft", examples=["D."])
    # This note (c) into the other (d survives).
    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": d["id"], "absorbed_ids": [c["id"]], "take": {"examples": c["id"], "text": c["id"]}},
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["id"] == d["id"]
    assert resp.get_json()["examples"] == ["D.", "C."]
    assert resp.get_json()["text"] == "bil"
    assert client.get(f"/api/notes/{c['id']}", headers=AUTH).status_code == 404


def test_a_ready_open_note_cannot_be_absorbed_into_another(client):
    other = _create(client, text="hus", status="draft")
    open_note = _create(client, text="huset", status="ready")
    resp = client.post(
        "/api/notes/merge",
        json={"survivor_id": other["id"], "absorbed_ids": [open_note["id"]], "take": {"text": open_note["id"]}},
        headers=AUTH,
    )
    assert resp.status_code == 400
    assert "only draft" in resp.get_json()["error"]
    assert client.get(f"/api/notes/{open_note['id']}", headers=AUTH).status_code == 200
    assert client.get(f"/api/notes/{other['id']}", headers=AUTH).get_json()["text"] == "hus"


def test_an_open_note_switched_to_ready_in_the_form_cannot_be_absorbed(client):
    other = _create(client, text="hus", status="draft")
    open_note = _create(client, text="huset", status="draft")
    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": other["id"],
            "absorbed_ids": [open_note["id"]],
            "take": {},
            "absorbed_values": {open_note["id"]: {"status": "ready"}},
        },
        headers=AUTH,
    )
    assert resp.status_code == 400
    assert client.get(f"/api/notes/{open_note['id']}", headers=AUTH).status_code == 200


def test_absorbed_values_are_validated_and_must_name_an_absorbed_note(client):
    other = _create(client, text="hus", status="draft")
    open_note = _create(client, text="huset", status="draft")
    for absorbed_values in (
        {other["id"]: {"text": "x"}},
        {open_note["id"]: {"examples": [""]}},
        {open_note["id"]: {"origin": "import"}},
        {open_note["id"]: "not an object"},
    ):
        resp = client.post(
            "/api/notes/merge",
            json={
                "survivor_id": other["id"],
                "absorbed_ids": [open_note["id"]],
                "take": {"text": open_note["id"]},
                "absorbed_values": absorbed_values,
            },
            headers=AUTH,
        )
        assert resp.status_code == 400, absorbed_values
    assert client.get(f"/api/notes/{open_note['id']}", headers=AUTH).status_code == 200


def test_taking_inflections_replaces_the_paradigm_wholesale(client):
    survivor = _create(
        client,
        text="hus",
        status="draft",
        pos="substantiv",
        inflections={"sg_indef": "hus", "sg_def": "huset", "pl_indef": "hus"},
    )
    absorbed = _create(
        client,
        text="å huse",
        status="draft",
        pos="verb",
        inflections={"infinitiv": "huse", "presens": "huser", "preteritum": "huset"},
    )

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"inflections": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    body = resp.get_json()
    assert body["inflections"] == {"infinitiv": "huse", "presens": "huser", "preteritum": "huset"}
    # Not one slot of the survivor's own paradigm survives.
    assert "sg_indef" not in body["inflections"]


def test_taking_inflections_carries_pos_even_when_the_survivor_already_has_one(client):
    survivor = _create(client, text="hus", status="draft", pos="substantiv", inflections={"sg_indef": "hus"})
    absorbed = _create(client, text="å huse", status="draft", pos="verb", inflections={"presens": "huser"})

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"inflections": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["pos"] == "verb"


def test_taking_inflections_from_a_source_without_pos_keeps_the_survivors(client):
    """There is nothing to carry, and clearing the survivor's pos would
    leave the paradigm just taken with no shape to render into."""
    survivor = _create(client, text="hus", status="draft", pos="substantiv")
    absorbed = _create(client, text="hus2", status="draft", inflections={"sg_def": "huset"})

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"inflections": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["pos"] == "substantiv"


def test_an_explicit_pos_take_wins_over_the_one_inflections_carries(client):
    survivor = _create(client, text="hus", status="draft")
    paradigm_source = _create(client, text="å huse", status="draft", pos="verb", inflections={"presens": "huser"})
    pos_source = _create(client, text="huset", status="draft", pos="substantiv")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [paradigm_source["id"], pos_source["id"]],
            "take": {"inflections": paradigm_source["id"], "pos": pos_source["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    body = resp.get_json()
    assert body["pos"] == "substantiv"
    assert body["inflections"] == {"presens": "huser"}


def test_transcription_still_replaces(client):
    survivor = _create(client, text="hus", status="draft", transcription="ˈhuːs")
    absorbed = _create(client, text="hus2", status="draft", transcription="ˈhʉːs")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"transcription": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["transcription"] == "ˈhʉːs"


def test_text_and_lemma_takes_replace(client):
    survivor = _create(client, text="hus", status="draft", lemma="hus")
    absorbed = _create(client, text="huset", status="draft", lemma="huset")

    resp = client.post(
        "/api/notes/merge",
        json={
            "survivor_id": survivor["id"],
            "absorbed_ids": [absorbed["id"]],
            "take": {"text": absorbed["id"], "lemma": absorbed["id"]},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    body = resp.get_json()
    assert body["text"] == "huset"
    assert body["lemma"] == "huset"
