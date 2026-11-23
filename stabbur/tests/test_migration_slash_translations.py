"""stabbur-editor-fixes task 9.2 / F26-F27: the second translation split
(f7a2c9d4e3b1), run for real through alembic against a throwaway database.

The migration before it split only on `" / "`, the separator the retired
append merge-mode wrote. This one splits on EVERY "/" — the shape typed by
hand and pasted from providers — so the test seeds rows at the revision just
before it, migrates to head, and checks every `notes-schema` scenario,
including that nothing was deleted and that pre-existing duplicates were
left alone."""

from __future__ import annotations

import json
import os
import subprocess
import sys
from pathlib import Path

import pytest
from sqlalchemy import create_engine, text
from sqlalchemy.engine import make_url

STABBUR_DIR = Path(__file__).resolve().parent.parent
PRE_REVISION = "d5e1a7c39f20"
REVISION = "f7a2c9d4e3b1"


def _alembic(url: str, *args: str):
    env = dict(os.environ, DATABASE_URL=url)
    return subprocess.run(
        [sys.executable, "-m", "alembic", *args],
        cwd=STABBUR_DIR,
        env=env,
        capture_output=True,
        text=True,
    )


def _alembic_ok(url: str, *args: str) -> None:
    result = _alembic(url, *args)
    assert result.returncode == 0, result.stderr + result.stdout


@pytest.fixture
def migration_db_url():
    base = make_url(os.environ["DATABASE_URL"])
    # conftest guarantees the suite's database name ends in `_test`.
    name = base.database[: -len("_test")] + "_slash_migration_test"
    url = base.set(database=name)
    maintenance = create_engine(base.set(database="postgres"), isolation_level="AUTOCOMMIT")
    with maintenance.connect() as conn:
        conn.execute(text(f'DROP DATABASE IF EXISTS "{name}" WITH (FORCE)'))
        conn.execute(text(f'CREATE DATABASE "{name}"'))
    yield url.render_as_string(hide_password=False)
    with maintenance.connect() as conn:
        conn.execute(text(f'DROP DATABASE IF EXISTS "{name}" WITH (FORCE)'))
    maintenance.dispose()


def _insert_note(conn, note_id, translations):
    conn.execute(
        text(
            "INSERT INTO notes (id, origin, type, source_lang, text, translations, inflections, "
            "examples, status) VALUES (:id, 'manual', 'word', 'no', :id, CAST(:tr AS jsonb), "
            "'{}'::jsonb, '[]'::jsonb, 'draft')"
        ),
        {"id": note_id, "tr": json.dumps(translations)},
    )


def test_every_slash_is_split_and_nothing_is_lost(migration_db_url):
    _alembic_ok(migration_db_url, "upgrade", PRE_REVISION)

    engine = create_engine(migration_db_url)
    with engine.begin() as conn:
        _insert_note(conn, "spaced", [{"lang": "en", "text": "hurry / rush"}])
        _insert_note(conn, "tight", [{"lang": "en", "text": "hurry/rush"}])
        _insert_note(conn, "several", [{"lang": "de", "text": "eilen/hasten / rennen"}])
        # Position and language are kept, and a split is consecutive.
        _insert_note(
            conn,
            "ordered",
            [
                {"lang": "en", "text": "go"},
                {"lang": "de", "text": "gehen/laufen"},
                {"lang": "en", "text": "walk"},
            ],
        )
        # A segment that duplicates an already-separate row goes...
        _insert_note(
            conn,
            "dupsplit",
            [{"lang": "en", "text": "hurry/rush"}, {"lang": "en", "text": "rush"}],
        )
        # ...but a pre-existing duplicate the split did not produce stays.
        _insert_note(conn, "dupkept", [{"lang": "en", "text": "x"}, {"lang": "en", "text": "x"}])
        # Untouched shapes.
        _insert_note(conn, "plain", [{"lang": "en", "text": "plain"}])
        _insert_note(conn, "none", [])
        # Nothing but slashes: kept verbatim rather than deleted.
        _insert_note(conn, "slashonly", [{"lang": "en", "text": " / "}])
        # The same language twice, already separate: a legitimate shape now.
        _insert_note(
            conn, "two_en", [{"lang": "en", "text": "hurry"}, {"lang": "en", "text": "rush"}]
        )
    engine.dispose()

    _alembic_ok(migration_db_url, "upgrade", "head")

    engine = create_engine(migration_db_url)
    with engine.connect() as conn:
        rows = {
            r.id: r.translations
            for r in conn.execute(text("SELECT id, translations FROM notes")).fetchall()
        }

        assert rows["spaced"] == [{"lang": "en", "text": "hurry"}, {"lang": "en", "text": "rush"}]
        assert rows["tight"] == [{"lang": "en", "text": "hurry"}, {"lang": "en", "text": "rush"}]
        assert rows["several"] == [
            {"lang": "de", "text": "eilen"},
            {"lang": "de", "text": "hasten"},
            {"lang": "de", "text": "rennen"},
        ]
        assert rows["ordered"] == [
            {"lang": "en", "text": "go"},
            {"lang": "de", "text": "gehen"},
            {"lang": "de", "text": "laufen"},
            {"lang": "en", "text": "walk"},
        ]
        assert rows["dupsplit"] == [{"lang": "en", "text": "hurry"}, {"lang": "en", "text": "rush"}]
        assert rows["dupkept"] == [{"lang": "en", "text": "x"}, {"lang": "en", "text": "x"}]
        assert rows["plain"] == [{"lang": "en", "text": "plain"}]
        assert rows["none"] == []
        assert rows["slashonly"] == [{"lang": "en", "text": " / "}]
        assert rows["two_en"] == [{"lang": "en", "text": "hurry"}, {"lang": "en", "text": "rush"}]

        # No slash survives anywhere, in either shape.
        assert conn.execute(
            text("SELECT count(*) FROM notes, jsonb_array_elements(translations) t "
                 "WHERE t->>'text' LIKE '%/%' AND btrim(replace(t->>'text', '/', '')) <> ''")
        ).scalar() == 0
        # Nothing deleted, and nothing that had a translation lost all of them.
        assert conn.execute(text("SELECT count(*) FROM notes")).scalar() == 10
        assert conn.execute(
            text("SELECT count(*) FROM notes WHERE jsonb_array_length(translations) = 0")
        ).scalar() == 1
    engine.dispose()


def test_downgrade_refuses(migration_db_url):
    """The revision is named, not reached as `-1`: this test is about THIS
    data migration being irreversible, and `-1` meant whatever happened to
    be head — which stopped being this revision the moment another
    migration landed on top of it."""
    _alembic_ok(migration_db_url, "upgrade", "head")
    result = _alembic(migration_db_url, "downgrade", "f7a2c9d4e3b1-1")
    assert result.returncode != 0
    assert "cannot be reversed" in (result.stderr + result.stdout)
