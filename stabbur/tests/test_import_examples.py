"""stabbur-editor-redesign task 1.5: the import pipeline carries a note's
example sentences as an `examples` list end to end (normalize -> store ->
merge -> push). Pure-function tests, no source archives needed."""

from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "scripts" / "import"))

import normalize as import_normalize  # noqa: E402
import store as import_store  # noqa: E402


def test_csv_example_becomes_an_examples_list():
    row = import_normalize._normalize_csv({"Original word": "komme i vei", "Example (no)": " Vi må komme i vei. "})
    assert row["examples"] == ["Vi må komme i vei."]


def test_core6k_sentence_becomes_an_examples_list_and_empty_is_empty():
    row = import_normalize._normalize_core6k({"Norwegian-Word": "hus", "Norwegian-Sentence": "A.\n\nB."})
    assert row["examples"] == ["A.", "B."]
    assert import_normalize._normalize_core6k({"Norwegian-Word": "hus"})["examples"] == []


def test_every_source_without_examples_yields_an_empty_list():
    assert import_normalize._normalize_ntnu({"Word": "hus"})["examples"] == []
    assert import_normalize._normalize_a1({"Front": "hus"})["examples"] == []
    assert import_normalize._normalize_freq6k({"Norwegian word": "hus"})["examples"] == []


def test_a_store_from_before_examples_gains_the_column(tmp_path):
    import sqlite3

    path = tmp_path / "old.db"
    old = sqlite3.connect(path)
    old.executescript(
        "CREATE TABLE normalized (id INTEGER PRIMARY KEY, run_id INTEGER, raw_note_id INTEGER, source TEXT, "
        "note_type TEXT, text TEXT, pos TEXT, translations_json TEXT, context_text TEXT);"
        "CREATE TABLE raw_note (id INTEGER PRIMARY KEY, run_id INTEGER, source TEXT, source_note_id TEXT, "
        "note_type TEXT, fields_json TEXT, tags_json TEXT, media_json TEXT, due INTEGER);"
    )
    old.close()
    conn = import_store.connect(path)
    columns = {r["name"] for r in conn.execute("PRAGMA table_info(normalized)")}
    assert "examples_json" in columns
