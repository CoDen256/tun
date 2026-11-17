"""Shared fixtures: a clean notes/grammar_rule table per test, plus a Flask
test client with auth configured.

`DATABASE_URL` is resolved and pinned to a dedicated `_test`-suffixed
database *before* anything else in the test session imports `db.session` —
that module binds `DATABASE_URL` to a module-level constant at import time,
so this has to happen first. Without this, `clean_db` below (which must
stay autouse — every test needs a blank slate) would truncate `notes`/
`grammar_rule` in whatever database `DATABASE_URL` already happens to
resolve to, which defaults to the same local dev Postgres `/ui` points at.
That's exactly what happened before this guard existed: running the suite
with a dev `DATABASE_URL` still exported in the shell silently wiped real
hand-authored notes.

CORRECTION, 2026-11-16: it happened a SECOND time, because the guard
compared `DATABASE_URL` against one hardcoded pre-monorepo string and D155
changed the real URL out from under it. The guard is now structural — the
database NAME must end in `_test` — which no change of host, port, user or
password can defeat. See the comment on the guard itself."""

from __future__ import annotations

import os

_TEST_DATABASE_URL = "postgresql+psycopg2://stabbur:stabbur@localhost:5434/stabbur_test"

# The guard is STRUCTURAL, not a list of known-bad URLs.
#
# It used to compare `DATABASE_URL` against one hardcoded string, the
# pre-monorepo dev URL `...@localhost:5434/stabbur`. D155 moved every
# service onto the shared cluster, so the real URL became
# `...@postgres:5432/stabbur` — a different string. The guard stopped
# matching anything, and the incident its own docstring describes happened
# again: running this suite with that URL set (inside the container, where
# it is set for you) truncated the real `notes` table.
#
# So the rule is now "the database NAME must look like a test database",
# which cannot go stale when a host, port, user or password changes. An
# explicit opt-out exists for the one legitimate case — a throwaway
# database that happens not to be named `*_test`.
_resolved = os.environ.get("DATABASE_URL", _TEST_DATABASE_URL)
_db_name = _resolved.rsplit("/", 1)[-1].split("?")[0]
if not _db_name.endswith("_test") and os.environ.get("STABBUR_ALLOW_UNSAFE_TEST_DB") != "1":
    raise RuntimeError(
        f"DATABASE_URL points at the database {_db_name!r}, whose name does "
        "not end in '_test' — tests/conftest.py's clean_db fixture DELETES "
        "every row in notes/captures/grammar_rule/settings before every "
        "test, so this would wipe real data.\n"
        "  Unset DATABASE_URL (the suite then defaults to stabbur_test), or "
        "point it at a '*_test' database.\n"
        "  Note: inside the stabbur container DATABASE_URL is already set to "
        "the REAL database, so `docker compose exec stabbur-backend pytest` "
        "needs an override:\n"
        "    DATABASE_URL=postgresql+psycopg2://stabbur:$PW@postgres:5432/stabbur_test\n"
        "  Set STABBUR_ALLOW_UNSAFE_TEST_DB=1 only for a database you are "
        "willing to lose."
    )
os.environ["DATABASE_URL"] = _resolved

import shutil  # noqa: E402

import pytest  # noqa: E402
from sqlalchemy import create_engine, text  # noqa: E402
from sqlalchemy.engine import make_url  # noqa: E402

from db.models import Base, Capture, GrammarRule, Note, Settings  # noqa: E402
from db.session import get_engine, get_sessionmaker  # noqa: E402


@pytest.fixture(scope="session", autouse=True)
def _ensure_test_database():
    """Create the `_test` database and its tables if they don't exist yet —
    the test suite should work against a bare `docker compose up postgres`
    with no manual setup step."""
    url = make_url(os.environ["DATABASE_URL"])
    db_name = url.database
    maintenance_engine = create_engine(url.set(database="postgres"), isolation_level="AUTOCOMMIT")
    try:
        with maintenance_engine.connect() as conn:
            exists = conn.execute(
                text("SELECT 1 FROM pg_database WHERE datname = :name"), {"name": db_name}
            ).scalar()
            if not exists:
                conn.execute(text(f'CREATE DATABASE "{db_name}"'))
    finally:
        maintenance_engine.dispose()

    Base.metadata.create_all(get_engine())

    # similar-notes-merge: `Base.metadata.create_all` only creates tables,
    # not the extension/expression index the spelling signal depends on —
    # those live in the alembic migration, which this fixture bypasses.
    # Without this, pg_trgm's `similarity()` function doesn't exist on a
    # freshly created test database (the GIN index itself is an
    # optimization, not needed for correctness, so it's not recreated here).
    with get_engine().connect() as conn:
        conn.execute(text("CREATE EXTENSION IF NOT EXISTS pg_trgm"))
        conn.commit()


@pytest.fixture(autouse=True)
def clean_db():
    Session = get_sessionmaker()
    with Session() as db:
        # Note first — captures.id has ON DELETE RESTRICT, so a note still
        # referencing a capture must go before the capture it references.
        db.query(Note).delete()
        db.query(Capture).delete()
        db.query(GrammarRule).delete()
        db.query(Settings).delete()
        db.commit()
    yield


def make_capture(capture_id="cap-1", **overrides):
    """Test helper: insert a minimal capture row directly, for tests that
    only need a valid `capture_id` to reference — not exercising the
    ingestion endpoint itself."""
    defaults = {"id": capture_id, "selected_text": "x", "source": {"web": "https://example.com"}}
    defaults.update(overrides)
    Session = get_sessionmaker()
    with Session() as db:
        db.add(Capture(**defaults))
        db.commit()
    return capture_id


@pytest.fixture
def client(monkeypatch, tmp_path):
    monkeypatch.setenv("INTERNAL_TOKEN", "test-token")
    monkeypatch.setenv("STABBUR_BLOB_DIR", str(tmp_path / "blobs"))
    import blob_storage

    monkeypatch.setattr(blob_storage, "BLOB_DIR", str(tmp_path / "blobs"))

    import app as app_module

    yield app_module.app.test_client()

    shutil.rmtree(tmp_path / "blobs", ignore_errors=True)


AUTH = {"Authorization": "Bearer test-token"}
