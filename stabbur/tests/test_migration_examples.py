"""stabbur-editor-redesign task 1.1 / C01-C02: the one data-surgery migration
(d5e1a7c39f20), run for real through alembic against a throwaway database.

The rest of the suite builds its schema with `Base.metadata.create_all`, so
it never exercises a migration. This test instead creates its own
`*_migration_test` database, migrates it to the revision just before this
change, seeds rows the way the pre-change schema stored them (that is the
only reason `context_text` appears here), migrates to head, and checks the
`notes-schema` scenarios on the result."""

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
PRE_REVISION = "e91c7b35a2df"


def _alembic(url: str, *args: str) -> None:
    env = dict(os.environ, DATABASE_URL=url)
    result = subprocess.run(
        [sys.executable, "-m", "alembic", *args],
        cwd=STABBUR_DIR,
        env=env,
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, result.stderr + result.stdout


@pytest.fixture
def migration_db_url():
    base = make_url(os.environ["DATABASE_URL"])
    # conftest guarantees the suite's database name ends in `_test`.
    name = base.database[: -len("_test")] + "_migration_test"
    url = base.set(database=name)
    maintenance = create_engine(base.set(database="postgres"), isolation_level="AUTOCOMMIT")
    with maintenance.connect() as conn:
        conn.execute(text(f'DROP DATABASE IF EXISTS "{name}" WITH (FORCE)'))
        conn.execute(text(f'CREATE DATABASE "{name}"'))
    yield url.render_as_string(hide_password=False)
    with maintenance.connect() as conn:
        conn.execute(text(f'DROP DATABASE IF EXISTS "{name}" WITH (FORCE)'))
    maintenance.dispose()


def _insert_pre_migration_note(conn, note_id, context_text, translations):
    conn.execute(
        text(
            "INSERT INTO notes (id, origin, type, source_lang, text, translations, inflections, "
            "context_text, status) VALUES (:id, 'manual', 'word', 'no', :id, CAST(:tr AS jsonb), "
            "'{}'::jsonb, :ctx, 'draft')"
        ),
        {"id": note_id, "ctx": context_text, "tr": json.dumps(translations)},
    )


def test_migration_splits_context_and_translations_exactly_once(migration_db_url):
    _alembic(migration_db_url, "upgrade", PRE_REVISION)

    engine = create_engine(migration_db_url)
    with engine.begin() as conn:
        # C01's note X.
        _insert_pre_migration_note(
            conn, "x", "A.\n\nB.", [{"lang": "en", "text": "toilet / loo"}, {"lang": "de", "text": "Klo"}]
        )
        # notes-schema scenario "Context text becomes examples".
        _insert_pre_migration_note(conn, "vei", "Vi må komme i vei.\n\nEndelig kom det i vei.", [])
        # Padded lines and a CRLF line ending trim away; NULL and empty stay [].
        _insert_pre_migration_note(conn, "padded", "  first  \r\n\n   \nsecond", [])
        _insert_pre_migration_note(conn, "nothing", None, [{"lang": "en", "text": "plain"}])
        _insert_pre_migration_note(conn, "empty", "", [])
        # The split's own duplicates go; pre-existing separate rows stay,
        # including a pre-existing duplicate the split did not produce.
        _insert_pre_migration_note(
            conn,
            "dups",
            None,
            [
                {"lang": "en", "text": "car"},
                {"lang": "en", "text": "car / automobile / car"},
                {"lang": "de", "text": "Auto / car"},
                {"lang": "en", "text": "x"},
                {"lang": "en", "text": "x"},
                {"lang": "en", "text": "a /  / b"},
            ],
        )
        conn.execute(
            text("INSERT INTO settings (id, provider_prefs, translation_merge_mode, triage_queues) "
                 "VALUES (1, '{}'::jsonb, 'append', CAST(:q AS jsonb))"),
            {"q": json.dumps([{"id": "q1", "name": "no ex", "filters": {"context_text_presence": "missing"},
                               "sort": "updated_asc"}])},
        )
        # A capture's context is provenance and must survive untouched.
        conn.execute(
            text("INSERT INTO captures (id, selected_text, context_text, translations, source) "
                 "VALUES ('cap', 'x', 'Line one.\nLine two.', '[]'::jsonb, '{\"web\": \"u\"}'::jsonb)")
        )
    engine.dispose()

    _alembic(migration_db_url, "upgrade", "head")

    engine = create_engine(migration_db_url)
    with engine.connect() as conn:
        rows = {
            r.id: r
            for r in conn.execute(text("SELECT id, examples, translations FROM notes")).fetchall()
        }
        assert rows["x"].examples == ["A.", "B."]
        assert rows["x"].translations == [
            {"lang": "en", "text": "toilet"},
            {"lang": "en", "text": "loo"},
            {"lang": "de", "text": "Klo"},
        ]
        assert rows["vei"].examples == ["Vi må komme i vei.", "Endelig kom det i vei."]
        assert rows["padded"].examples == ["first", "second"]
        assert rows["nothing"].examples == []
        assert rows["nothing"].translations == [{"lang": "en", "text": "plain"}]
        assert rows["empty"].examples == []
        assert rows["dups"].translations == [
            {"lang": "en", "text": "car"},
            {"lang": "en", "text": "automobile"},
            {"lang": "de", "text": "Auto"},
            {"lang": "de", "text": "car"},
            {"lang": "en", "text": "x"},
            {"lang": "en", "text": "x"},
            {"lang": "en", "text": "a"},
            {"lang": "en", "text": "b"},
        ]

        # C02.
        assert conn.execute(
            text("SELECT count(*) FROM notes WHERE translations::text LIKE '% / %'")
        ).scalar() == 0
        note_cols = {
            r[0]
            for r in conn.execute(
                text("SELECT column_name FROM information_schema.columns WHERE table_name = 'notes'")
            )
        }
        assert "context_text" not in note_cols and "examples" in note_cols
        settings_cols = {
            r[0]
            for r in conn.execute(
                text("SELECT column_name FROM information_schema.columns WHERE table_name = 'settings'")
            )
        }
        assert "translation_merge_mode" not in settings_cols
        assert {"theme", "value_color", "value_color_custom"} <= settings_cols

        queues = conn.execute(text("SELECT triage_queues FROM settings WHERE id = 1")).scalar()
        assert queues[0]["filters"] == {"examples_presence": "missing"}

        assert conn.execute(text("SELECT context_text FROM captures WHERE id = 'cap'")).scalar() == (
            "Line one.\nLine two."
        )

        # NOT NULL with a [] default for rows written after the migration.
        conn.execute(
            text("INSERT INTO notes (id, origin, type, source_lang, text, translations, inflections, status) "
                 "VALUES ('new', 'manual', 'word', 'no', 'ny', '[]'::jsonb, '{}'::jsonb, 'draft')")
        )
        assert conn.execute(text("SELECT examples FROM notes WHERE id = 'new'")).scalar() == []
        conn.rollback()
    engine.dispose()
