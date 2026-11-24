"""
Installable app (shadow-playback-chapter-reading D8, task 5.1, A7.1).

The manifest names the app "shadow", is standalone, starts at and is scoped
to shadow's prefix AS SERVED (X-Forwarded-Prefix), lists icons that exist,
is served as application/manifest+json, and the page links it with
credentials. There is no service worker.

    cd shadow && python -m pytest
"""

import os
import pathlib
import struct
import sys

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

pytest.importorskip('flask')


@pytest.fixture()
def client():
    os.environ.setdefault('INTERNAL_TOKEN', 'test')
    from app import app
    c = app.test_client()
    c.auth = {'Authorization': 'Bearer ' + os.environ['INTERNAL_TOKEN']}
    return c


@pytest.mark.parametrize('prefix, base', [('/shadow', '/shadow/'), (None, '/')])
def test_the_manifest_is_scoped_to_the_prefix_as_served(client, prefix, base):
    headers = dict(client.auth)
    if prefix:
        headers['X-Forwarded-Prefix'] = prefix
    r = client.get('/manifest.webmanifest', headers=headers)
    assert r.status_code == 200
    assert r.mimetype == 'application/manifest+json'
    m = r.get_json(force=True)
    assert m['name'] == 'shadow'
    assert m['display'] == 'standalone'
    assert m['start_url'] == base and m['scope'] == base
    assert {i['sizes'] for i in m['icons']} >= {'192x192', '512x512'}
    for icon in m['icons']:
        assert icon['src'].startswith(base)
        local = ROOT / icon['src'][len(base):]
        data = local.read_bytes()
        assert data[:8] == b'\x89PNG\r\n\x1a\n'
        w, h = struct.unpack('>II', data[16:24])
        assert icon['sizes'] == f'{w}x{h}'


def test_the_manifest_sits_behind_the_operator_gate(client):
    assert client.get('/manifest.webmanifest').status_code == 401


def test_the_page_links_the_manifest_with_credentials():
    html = (ROOT / 'shadow.html').read_text()
    assert '<link rel="manifest" href="manifest.webmanifest" crossorigin="use-credentials">' in html


def test_there_is_no_service_worker():
    for path in list((ROOT / 'js').glob('*.js')) + [ROOT / 'shadow.html']:
        assert 'serviceWorker' not in path.read_text(), path


def test_the_image_ships_the_icons():
    assert 'COPY shadow/icons/ ./icons/' in (ROOT / 'Dockerfile').read_text()
