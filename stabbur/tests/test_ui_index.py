"""stabbur-editor-redesign D12: the page itself carries the stored theme and
value colour, so the first frame is drawn in them (no flash, on any device),
and it still serves when the settings cannot be read (D157)."""

from __future__ import annotations

import json
import re

import app as stabbur_app
import settings_store
import smia_client
from tests.conftest import AUTH


def _look(html: str):
    match = re.search(r"JSON\.parse\('(.*?)'\)", html)
    assert match, "index.html must carry the appearance placeholder"
    return json.loads(match.group(1))


def test_index_carries_the_default_appearance(client):
    resp = client.get("/", headers=AUTH)
    assert resp.status_code == 200
    assert _look(resp.get_data(as_text=True)) == {"theme": "auto", "value_color": "blue", "value_color_custom": None}


def test_index_carries_the_stored_appearance(client, monkeypatch):
    monkeypatch.setattr(smia_client, "get", lambda path, timeout=20.0: (200, {}))
    assert client.patch(
        "/api/settings", json={"theme": "dark", "value_color": "custom", "value_color_custom": "#c2185b"}, headers=AUTH
    ).status_code == 200
    html = client.get("/", headers=AUTH).get_data(as_text=True)
    assert _look(html) == {"theme": "dark", "value_color": "custom", "value_color_custom": "#c2185b"}
    assert "__STABBUR_LOOK__" not in html


def test_index_still_serves_when_settings_cannot_be_read(client, monkeypatch):
    def boom(db):
        raise RuntimeError("database down")

    monkeypatch.setattr(settings_store, "read_scalars", boom)
    resp = client.get("/", headers=AUTH)
    assert resp.status_code == 200
    assert "JSON.parse('null')" in resp.get_data(as_text=True)


def test_the_ui_has_no_native_select_and_no_context_text():
    root = stabbur_app.app.root_path
    for name in ("ui/index.html", "ui/ui.js"):
        with open(f"{root}/{name}", encoding="utf-8") as fh:
            source = fh.read()
        assert "<select" not in source
        assert "context_text" not in source
