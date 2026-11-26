"""
Installable app — the same contract shadow's test_pwa_manifest.py asserts,
for the same reasons, against stabbur's own layout.

The manifest names the app "stabbur", is standalone, starts at and is scoped
to stabbur's prefix AS SERVED (X-Forwarded-Prefix), lists icons that exist at
the size they claim, is served as application/manifest+json, sits behind the
operator gate, and the page links it with credentials. There is no service
worker.

The one shape that differs from shadow: shadow serves its pages and its
icons/ straight off its root directory, while stabbur's UI lives in ui/ and
Flask serves it at /static — so an icon's `src` is `<prefix>/static/icons/…`
and the file behind it is `ui/icons/…`.

    cd stabbur && python -m pytest tests/test_pwa_manifest.py
"""

from __future__ import annotations

import pathlib
import struct

import pytest

from tests.conftest import AUTH

ROOT = pathlib.Path(__file__).resolve().parent.parent


@pytest.mark.parametrize("prefix, base", [("/stabbur", "/stabbur/"), (None, "/")])
def test_the_manifest_is_scoped_to_the_prefix_as_served(client, prefix, base):
    headers = dict(AUTH)
    if prefix:
        headers["X-Forwarded-Prefix"] = prefix
    r = client.get("/manifest.webmanifest", headers=headers)
    assert r.status_code == 200
    assert r.mimetype == "application/manifest+json"
    m = r.get_json(force=True)
    assert m["name"] == "stabbur"
    assert m["display"] == "standalone"
    assert m["start_url"] == base and m["scope"] == base
    assert {i["sizes"] for i in m["icons"]} >= {"192x192", "512x512"}
    for icon in m["icons"]:
        assert icon["src"].startswith(base + "static/")
        # /static is ui/, so strip the prefix and the /static/ segment.
        local = ROOT / "ui" / icon["src"][len(base + "static/"):]
        data = local.read_bytes()
        assert data[:8] == b"\x89PNG\r\n\x1a\n"
        width, height = struct.unpack(">II", data[16:24])
        assert icon["sizes"] == f"{width}x{height}"


def test_one_icon_is_maskable_and_the_others_are_not(client):
    m = client.get("/manifest.webmanifest", headers=AUTH).get_json(force=True)
    purposes = sorted(i["purpose"] for i in m["icons"])
    assert purposes == ["any", "any", "maskable"]


def test_the_manifest_sits_behind_the_operator_gate(client):
    assert client.get("/manifest.webmanifest").status_code == 401


def test_the_page_links_the_manifest_with_credentials():
    html = (ROOT / "ui" / "index.html").read_text()
    assert (
        '<link rel="manifest" href="__STABBUR_PREFIX__/manifest.webmanifest" '
        'crossorigin="use-credentials">'
    ) in html


def test_the_page_declares_a_theme_colour_for_both_schemes():
    html = (ROOT / "ui" / "index.html").read_text()
    assert 'name="theme-color" content="#fbfbfc" media="(prefers-color-scheme: light)"' in html
    assert 'name="theme-color" content="#0e1013" media="(prefers-color-scheme: dark)"' in html


def test_there_is_no_service_worker():
    for path in [ROOT / "ui" / "ui.js", ROOT / "ui" / "index.html"]:
        assert "serviceWorker" not in path.read_text(), path


def test_the_image_ships_the_icons():
    # ui/ is COPYed whole, so ui/icons/ rides along — asserted rather than
    # assumed, because a future Dockerfile that narrows that COPY would ship
    # a manifest pointing at four-oh-fours.
    assert "COPY stabbur/ui/ ./ui/" in (ROOT / "Dockerfile").read_text()
