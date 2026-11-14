"""The db-guard's exemptions must match routes this app actually serves.

THE DEFECT THESE TESTS EXIST FOR, measured with postgres stopped before the
fix:

    /stabbur/              503 b=263  {"detail":"alembic upgrade head failed
                                       ... psycopg2.OperationalError ..."}
    /stabbur/static/ui.js  503 b=263
    /stabbur/ui            404        (the old route is gone)

scripts/bootstrap.py exempted `("/ui", "/blob/", "/api/enrich/tts/preview/")`
with a comment promising "the shell, read off disk — it must render so the
operator can SEE that the database is unavailable". unified-auth 5.1 then
moved the shell from `/ui` to `/`, and the gateway strips `/stabbur` before
forwarding — so the front page reached Flask as `/`, matched no exemption,
and the whole zone answered a JSON 503. The exemption had become dead code
and nothing said so.

Reading the list could not catch that. Asserting it against `app.url_map`
can, and does not need a container, a gateway or a stopped database.
"""

from __future__ import annotations

import os

# app.py calls register_auth() at import time, which refuses to import
# without the one internal token. Set before the import below, not in a
# fixture: `scripts.bootstrap` imports `app` at module scope.
os.environ.setdefault("INTERNAL_TOKEN", "test-token")

import pytest  # noqa: E402
from pyservice.bootstrap import (  # noqa: E402
    _dead_prefixes,
    _matches,
    create_bootstrap,
    register_db_guard,
)
from sqlalchemy.exc import OperationalError  # noqa: E402

from scripts.bootstrap import GUARD_EXEMPT  # noqa: E402


def test_every_exempt_prefix_matches_a_registered_route():
    import app as app_module

    assert _dead_prefixes(app_module.app, GUARD_EXEMPT) == []


def test_the_shell_is_exempt_and_the_api_is_not():
    # `/` is the shell's own route since unified-auth 5.1, and must not be
    # read as "every path", which is what a naive prefix match would do.
    assert _matches("/", GUARD_EXEMPT)
    assert _matches("/static/ui.js", GUARD_EXEMPT)
    assert _matches("/blob/" + "a" * 64, GUARD_EXEMPT)
    assert not _matches("/api/notes", GUARD_EXEMPT)
    assert not _matches("/api/captures", GUARD_EXEMPT)


@pytest.fixture
def degraded_client(monkeypatch, tmp_path):
    """The real app with the real guard, wired to a bootstrap that is stuck
    not-ready — i.e. exactly the state a database outage produces, without
    stopping anything."""
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    import app as app_module

    app = app_module.app

    def _never_ready():
        raise OperationalError("SELECT 1", {}, Exception("postgres is down"))

    boot = create_bootstrap(name="stabbur-backend-test", prepare=_never_ready, check=_never_ready)
    # Deliberately NOT boot.start() — no thread, no retry loop, no database.

    # The guard installs a before_request hook and error handlers on the
    # module-level app, which every other test in this session shares.
    # Snapshot and restore rather than leaving a permanently degraded app
    # behind us.
    before = list(app.before_request_funcs.get(None, []))
    handlers = dict(app.error_handler_spec)
    first_request = app._got_first_request
    # Flask refuses `before_request` once the app has served a request, and
    # by the time this suite reaches here another test has. The app is a
    # module-level singleton shared by the whole session, so the choice is
    # this flag or a second copy of the app that would no longer be the thing
    # under test. Restored below with everything else.
    app._got_first_request = False
    register_db_guard(app, boot, exempt=GUARD_EXEMPT, db_errors=(OperationalError,))
    try:
        yield app.test_client()
    finally:
        app.before_request_funcs[None] = before
        app.error_handler_spec.clear()
        app.error_handler_spec.update(handlers)
        app._got_first_request = first_request


def test_the_shell_still_renders_while_degraded(degraded_client):
    response = degraded_client.get("/", headers={"Authorization": "Bearer test-token"})
    assert response.status_code == 200
    assert response.mimetype == "text/html"
    assert b"<html" in response.data.lower()


def test_a_database_route_degrades_while_the_shell_renders(degraded_client):
    response = degraded_client.get("/api/notes", headers={"Authorization": "Bearer test-token"})
    assert response.status_code == 503
    body = response.get_json()
    assert body["error"] == "database unavailable"
    # No driver text, no internal hostname, no migration-tool wording.
    assert "psycopg2" not in response.get_data(as_text=True)
    assert "postgres" not in response.get_data(as_text=True)
