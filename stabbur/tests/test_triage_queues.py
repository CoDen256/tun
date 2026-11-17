"""stabbur-triage-queues task 3.8 — saved triage queues.

A queue is a named filter set plus its own sort, stored with the operator's
settings so it reaches any device (D1). The three origin queues are
SYNTHESISED rather than stored, which is what makes them undeletable rather
than merely hidden from the delete control — these tests assert the refusal
at the API, not the absence of a button.
"""

from __future__ import annotations

from tests.conftest import AUTH

BUILTIN_NAMES = {"import", "manual", "capture"}


def _queues(client):
    resp = client.get("/api/settings/triage_queues", headers=AUTH)
    assert resp.status_code == 200
    return resp.get_json()


def _create(client, **payload):
    payload.setdefault("name", "Missing audio")
    payload.setdefault("filters", {"audio_blob_presence": "missing"})
    return client.post("/api/settings/triage_queues", json=payload, headers=AUTH)


# ------------------------------------------------------------- built-ins --

def test_the_three_origin_queues_always_exist(client):
    queues = _queues(client)
    builtins = [q for q in queues if q["builtin"]]
    assert {q["name"] for q in builtins} == BUILTIN_NAMES


def test_a_builtin_reproduces_the_old_origin_dropdown_exactly(client):
    imports = next(q for q in _queues(client) if q["name"] == "import")
    assert imports["filters"] == {"status": "draft", "origin": "import"}
    assert imports["sort"] == "updated_asc"


def test_a_builtin_cannot_be_edited_or_deleted(client):
    imports = next(q for q in _queues(client) if q["name"] == "import")
    patched = client.patch(
        f"/api/settings/triage_queues/{imports['id']}", json={"name": "mine now"}, headers=AUTH
    )
    assert patched.status_code == 400
    deleted = client.delete(f"/api/settings/triage_queues/{imports['id']}", headers=AUTH)
    assert deleted.status_code == 400
    # Still there, still itself.
    assert next(q for q in _queues(client) if q["name"] == "import")["builtin"] is True


def test_builtins_are_never_written_into_storage(client):
    """They are synthesised, so saving an operator queue must not persist a
    copy of them — a stored copy could be edited or drift."""
    assert _create(client).status_code == 201
    resp = client.get("/api/settings", headers=AUTH)
    stored = resp.get_json()["triage_queues"]
    own = [q for q in stored if not q["builtin"]]
    assert len(own) == 1
    assert all(not q["id"].startswith("builtin:") for q in own)


# ------------------------------------------------------- operator queues --

def test_create_rename_and_delete(client):
    created = _create(client, name="Missing audio")
    assert created.status_code == 201
    queue = next(q for q in created.get_json() if not q["builtin"])
    assert queue["name"] == "Missing audio"
    assert queue["filters"] == {"audio_blob_presence": "missing"}

    renamed = client.patch(
        f"/api/settings/triage_queues/{queue['id']}", json={"name": "No recordings"}, headers=AUTH
    )
    assert renamed.status_code == 200
    assert next(q for q in renamed.get_json() if not q["builtin"])["name"] == "No recordings"

    deleted = client.delete(f"/api/settings/triage_queues/{queue['id']}", headers=AUTH)
    assert deleted.status_code == 200
    assert [q for q in deleted.get_json() if not q["builtin"]] == []
    # The built-ins survive the deletion of an operator queue.
    assert {q["name"] for q in deleted.get_json()} == BUILTIN_NAMES


def test_a_queue_carries_its_own_sort_and_one_does_not_leak_to_another(client):
    _create(client, name="sweep", sort="updated_asc")
    _create(client, name="review", sort="text_desc")
    own = {q["name"]: q for q in _queues(client) if not q["builtin"]}
    assert own["sweep"]["sort"] == "updated_asc"
    assert own["review"]["sort"] == "text_desc"


def test_queues_survive_a_second_read(client):
    _create(client, name="persisted")
    assert "persisted" in {q["name"] for q in _queues(client)}
    assert "persisted" in {q["name"] for q in _queues(client)}


def test_queues_ride_along_with_the_settings_read(client):
    _create(client, name="on settings")
    body = client.get("/api/settings", headers=AUTH).get_json()
    assert "on settings" in {q["name"] for q in body["triage_queues"]}


def test_every_designed_filter_dimension_is_accepted(client):
    resp = _create(
        client,
        name="everything",
        filters={
            "status": "draft",
            "type": "word",
            "origin": "import",
            "pos": "substantiv",
            "source_lang": "no",
            "updated_since": "7d",
            "q": "fastsatt",
            "audio_blob_presence": "missing",
            "transcription_presence": "has",
            "inflections_presence": "missing",
            "context_text_presence": "any",
            "translations_presence": "has",
            "lemma_presence": "missing",
        },
    )
    assert resp.status_code == 201, resp.get_json()


# --------------------------------------------------------------- refusals --

def test_an_unknown_filter_is_refused_not_silently_dropped(client):
    # A queue that quietly dropped a filter would look like a queue with
    # different contents.
    resp = _create(client, name="bad", filters={"deck": "C30"})
    assert resp.status_code == 400
    assert "deck" in resp.get_json()["error"]


def test_a_queue_needs_a_name(client):
    assert _create(client, name="").status_code == 400
    assert _create(client, name="   ").status_code == 400


def test_an_overlong_name_is_refused(client):
    assert _create(client, name="x" * 200).status_code == 400


def test_an_unknown_sort_is_refused(client):
    assert _create(client, name="bad sort", sort="relevance_desc").status_code == 400


def test_patching_a_missing_queue_is_404(client):
    assert client.patch(
        "/api/settings/triage_queues/nope", json={"name": "x"}, headers=AUTH
    ).status_code == 404


def test_deleting_a_missing_queue_is_404(client):
    assert client.delete("/api/settings/triage_queues/nope", headers=AUTH).status_code == 404


def test_patch_validates_the_merged_result_not_just_the_delta(client):
    queue = next(q for q in _create(client, name="ok").get_json() if not q["builtin"])
    # A delta that alone looks fine but makes the queue invalid is refused.
    resp = client.patch(
        f"/api/settings/triage_queues/{queue['id']}", json={"name": ""}, headers=AUTH
    )
    assert resp.status_code == 400
