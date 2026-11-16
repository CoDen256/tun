"""
The studying-mode migration's two safety properties, as tests.

Both were confirmed defects on 2026-11-16: a `downgrade()` that destroyed
progress and collapsed every split config's boundaries into one set, and an
`upgrade()` that would rebuild the frozen `done` flags over the top of real
progress and print "verified identical" while doing it.

Database-free: these assert what the module DOES when asked, which is what
a careless edit would undo. The full round trip is verified against a real
cluster in the change's verification tasks.

    cd shadow && python -m pytest
"""

import importlib.util
import pathlib
import sys

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

MIGRATION = ROOT / 'alembic' / 'versions' / 'c7a2f41b9e30_studying_mode.py'


def _load():
    spec = importlib.util.spec_from_file_location('c7a2f41b9e30_studying_mode', MIGRATION)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def test_downgrade_refuses_and_names_both_losses():
    """A downgrade that cannot be correct must not run — and must say why."""
    module = _load()
    with pytest.raises(RuntimeError) as excinfo:
        module.downgrade()
    message = str(excinfo.value)
    assert 'cannot be downgraded' in message
    # Both consequences, and the way out, in the text the operator sees.
    assert 'PROGRESS' in message and 'BOUNDARIES' in message
    assert 'restore' in message.lower() and 'dump' in message.lower()


def test_downgrade_drops_nothing():
    """It must refuse BEFORE touching anything, not half way through."""
    module = _load()
    import ast  # noqa: PLC0415

    tree = ast.parse(MIGRATION.read_text())
    body = next(n for n in tree.body
                if isinstance(n, ast.FunctionDef) and n.name == 'downgrade')
    calls = [n for n in ast.walk(body) if isinstance(n, ast.Call)]
    for call in calls:
        name = getattr(call.func, 'attr', getattr(call.func, 'id', ''))
        assert not name.startswith('drop_'), f'downgrade() still calls {name}'


def test_upgrade_skips_a_book_that_already_holds_progress_ranges():
    """THE DEFECT: re-running the conversion re-derived month-old truth.

    `shadowing_segments.done` is frozen; the ranges are live. A book that
    already has ranges must be left exactly as it is, and the summary must
    not claim a verification that did not happen.
    """
    module = _load()

    class FakeResult:
        def __init__(self, value):
            self.value = value

        def scalar(self):
            return self.value

        def fetchall(self):
            return self.value

        def mappings(self):
            return self

        def all(self):
            return self.value

    writes = []

    class FakeConn:
        def execute(self, statement, params=None):
            sql = ' '.join(str(statement).split())
            if sql.startswith('SELECT id, user_id FROM shadowing_media'):
                return FakeResult([(7, 1)])
            if 'COUNT(*) FROM shadowing_progress_ranges' in sql:
                return FakeResult(3)        # the book has live progress
            writes.append((sql, params))
            return FakeResult(0)

    module._convert_done_flags(FakeConn())

    assert not any('INSERT INTO shadowing_progress_ranges' in sql for sql, _ in writes), \
        'the upgrade overwrote live progress with the frozen done flags'
    assert not any('shadowing_segments s' in sql for sql, _ in writes), \
        'the upgrade re-ran its losslessness check against a book it skipped'
