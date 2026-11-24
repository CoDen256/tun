"""
Single owner and shadow-owned settings (shadow-playback-chapter-reading
D1/D2, ADR D168; acceptance A1.3-A1.5).

  * the migration pins exactly one owner id, takes the constant on an empty
    database, and ABORTS changing nothing when the data carries two ids;
  * every request uses the pinned owner and ignores a client `userId`;
  * settings are read and written in shadow's own table, with defaults, and
    the one-time phonexa import fills only what shadow has not stored, stops
    for good once phonexa has answered, and retries while it has not.

Runs on SQLite in-process (no cluster needed):

    cd shadow && python -m pytest
"""

import hashlib
import importlib.util
import pathlib
import sys

import pytest
import sqlalchemy as sa

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

MIGRATION = ROOT / 'alembic' / 'versions' / 'e5b9c2d47a10_single_owner_settings.py'

# The pre-revision shape of exactly what the migration reads and alters.
OLD_SCHEMA = [
    'CREATE TABLE shadowing_media (id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, fingerprint TEXT)',
    'CREATE TABLE shadowing_uploads (id TEXT PRIMARY KEY, user_id INTEGER NOT NULL)',
    'CREATE TABLE shadowing_progress_ranges (id INTEGER PRIMARY KEY, media_id INTEGER, '
    'user_id INTEGER NOT NULL, start_ms INTEGER, end_ms INTEGER)',
    'CREATE TABLE shadowing_cursors (id INTEGER PRIMARY KEY, media_id INTEGER, '
    'user_id INTEGER NOT NULL, position_ms INTEGER)',
    'CREATE TABLE shadowing_segments (id INTEGER PRIMARY KEY, start_ms INTEGER, end_ms INTEGER)',
    'CREATE TABLE shadowing_split_configs (id INTEGER PRIMARY KEY, name TEXT)',
]


def _load_migration():
    spec = importlib.util.spec_from_file_location(MIGRATION.stem, MIGRATION)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def _old_db(rows):
    engine = sa.create_engine('sqlite://')
    with engine.begin() as conn:
        for ddl in OLD_SCHEMA:
            conn.execute(sa.text(ddl))
        for sql in rows:
            conn.execute(sa.text(sql))
    return engine


def _run_upgrade(engine):
    from alembic.migration import MigrationContext
    from alembic.operations import Operations

    module = _load_migration()
    with engine.begin() as conn:
        ctx = MigrationContext.configure(conn)
        with Operations.context(ctx):
            module.upgrade()


def _fingerprint(engine):
    """Row counts + a checksum of every table — what A1.5 compares."""
    out = {}
    with engine.connect() as conn:
        for name in sorted(sa.inspect(engine).get_table_names()):
            rows = conn.execute(sa.text(f'SELECT * FROM {name} ORDER BY 1')).all()
            out[name] = (len(rows), hashlib.sha256(repr(rows).encode()).hexdigest())
    return out


ONE_OWNER = [
    "INSERT INTO shadowing_media VALUES (1, 7, 'a:1')",
    "INSERT INTO shadowing_media VALUES (2, 7, 'b:2')",
    "INSERT INTO shadowing_uploads VALUES ('u1', 7)",
    'INSERT INTO shadowing_progress_ranges VALUES (1, 1, 7, 0, 5000)',
    'INSERT INTO shadowing_cursors VALUES (1, 1, 7, 4000)',
]


def test_one_owner_id_is_pinned_and_nothing_else_changes():
    engine = _old_db(ONE_OWNER)
    before = _fingerprint(engine)
    _run_upgrade(engine)
    with engine.connect() as conn:
        assert conn.execute(sa.text('SELECT id, user_id FROM shadow_owner')).all() == [(1, 7)]
        cols = {c['name'] for c in sa.inspect(conn).get_columns('shadowing_segments')}
        assert 'title' in cols
        cols = {c['name'] for c in sa.inspect(conn).get_columns('shadowing_split_configs')}
        assert 'manual_edit_count' in cols
    after = _fingerprint(engine)
    for table in ('shadowing_media', 'shadowing_uploads',
                  'shadowing_progress_ranges', 'shadowing_cursors'):
        assert after[table] == before[table], f'{table} changed'


def test_an_empty_database_gets_the_constant_owner():
    engine = _old_db([])
    _run_upgrade(engine)
    module = _load_migration()
    with engine.connect() as conn:
        assert conn.execute(sa.text('SELECT user_id FROM shadow_owner')).scalar() \
            == module.DEFAULT_OWNER_ID


def test_two_owner_ids_abort_naming_both_and_change_nothing():
    engine = _old_db(ONE_OWNER + ['INSERT INTO shadowing_cursors VALUES (2, 2, 9, 0)'])
    before = _fingerprint(engine)
    with pytest.raises(RuntimeError, match='REFUSES') as excinfo:
        _run_upgrade(engine)
    message = str(excinfo.value)
    assert '7' in message and '9' in message
    assert 'NOTHING HAS BEEN CHANGED' in message
    # Same tables, same rows, same checksums — no settings/owner table, no column.
    assert _fingerprint(engine) == before
    with engine.connect() as conn:
        cols = {c['name'] for c in sa.inspect(conn).get_columns('shadowing_segments')}
    assert 'title' not in cols


def test_the_check_runs_before_any_ddl():
    """Ordering, as structure: pin_owner is the first statement of upgrade()."""
    import ast

    tree = ast.parse(MIGRATION.read_text())
    upgrade = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == 'upgrade')
    writes = ('op.create_table', 'op.add_column', 'conn.execute')
    first_op = next(i for i, stmt in enumerate(upgrade.body)
                    if any(w in ast.unparse(stmt) for w in writes))
    pin = next(i for i, stmt in enumerate(upgrade.body) if 'pin_owner' in ast.unparse(stmt))
    assert pin < first_op


def test_downgrade_refuses_unless_asked(monkeypatch):
    module = _load_migration()
    monkeypatch.delenv(module.DOWNGRADE_OPT_IN, raising=False)
    with pytest.raises(RuntimeError, match='Nothing has been dropped'):
        module.downgrade()


# ── the running service ────────────────────────────────────────────────

@pytest.fixture()
def client(monkeypatch, tmp_path):
    pytest.importorskip('flask')
    from sqlalchemy.orm import Session, sessionmaker
    from sqlalchemy.pool import StaticPool

    import appsettings
    import audio
    import shadowing
    from db.models import Base, ShadowOwner

    engine = sa.create_engine('sqlite://', connect_args={'check_same_thread': False},
                              poolclass=StaticPool)
    Base.metadata.create_all(engine)
    maker = sessionmaker(bind=engine, expire_on_commit=False, class_=Session)
    with maker() as db:
        db.add(ShadowOwner(id=1, user_id=7))
        db.commit()
    for module in (appsettings, shadowing):
        monkeypatch.setattr(module, 'get_sessionmaker', lambda: maker)
    monkeypatch.setattr(audio, 'AUDIO_ROOT', tmp_path)
    monkeypatch.setattr(shadowing, '_start_prechunk', lambda *a, **k: None)
    monkeypatch.setattr(shadowing, 'sweep_uploads', lambda: 0)
    appsettings._reset_owner_cache()

    from flask import Flask
    app = Flask(__name__)
    app.register_blueprint(shadowing.shadowing_bp)
    app.register_blueprint(appsettings.settings_bp)
    app.maker = maker
    yield app.test_client()
    appsettings._reset_owner_cache()


def test_settings_defaults(client):
    assert client.get('/api/v1/settings').get_json() == {
        'transcribeBackend': {'provider': 'hf_whisper'},
        'shadowTrimSilence': {'on': True},
        'shadowAutoplay': {'on': True},
        'shadowAudiobookTrim': {'on': False},
    }


def test_settings_round_trip_and_ignore_a_userid(client):
    r = client.put('/api/v1/settings/shadowTrimSilence?userId=99', json={'value': {'on': False}})
    assert r.status_code == 200 and r.get_json() == {'key': 'shadowTrimSilence', 'value': {'on': False}}
    client.put('/api/v1/settings/transcribeBackend', json={'value': {'provider': 'openai'}})
    got = client.get('/api/v1/settings?userId=12345').get_json()
    assert got['shadowTrimSilence'] == {'on': False}
    assert got['transcribeBackend'] == {'provider': 'openai'}


@pytest.mark.parametrize('key, value', [
    ('nope', {'on': True}),
    ('shadowAutoplay', {'on': 'yes'}),
    ('transcribeBackend', {'provider': ''}),
    ('shadowTrimSilence', True),
    ('_phonexaImportDone', {'on': True}),
])
def test_bad_settings_are_refused(client, key, value):
    assert client.put(f'/api/v1/settings/{key}', json={'value': value}).status_code == 400


def test_the_users_proxy_is_gone():
    pytest.importorskip('flask')
    import os
    os.environ.setdefault('INTERNAL_TOKEN', 'test')
    from app import app
    rules = {r.rule for r in app.url_map.iter_rules()}
    assert '/api/v1/users' not in rules
    assert '/api/v1/settings' in rules and '/api/v1/settings/<key>' in rules


def test_upload_ignores_the_client_userid_and_never_asks_phonexa(client, monkeypatch):
    import phonexa_client
    assert not hasattr(phonexa_client, 'verify_user')
    r = client.post('/api/v1/shadowing/uploads',
                    json={'userId': 42, 'filename': 'bok.m4b', 'sizeBytes': 10})
    assert r.status_code == 201
    assert r.get_json()['userId'] == 7


def test_listing_uses_the_owner_whatever_the_client_sends(client):
    from db.models import ShadowingMedia
    with client.application.maker() as db:
        db.add(ShadowingMedia(user_id=7, fingerprint='x:1', original_filename='x'))
        db.commit()
    assert len(client.get('/api/v1/shadowing/media?userId=3').get_json()) == 1
    assert len(client.get('/api/v1/shadowing/media').get_json()) == 1


# ── the one-time import ────────────────────────────────────────────────

def test_import_copies_phonexas_values(client, monkeypatch):
    import appsettings
    import phonexa_client
    asked = []

    def remote(uid):
        asked.append(uid)
        return {'transcribeBackend': {'provider': 'openai'}, 'shadowTrimSilence': {'on': False},
                'unrelated': {'x': 1}}
    monkeypatch.setattr(phonexa_client, 'get_settings', remote)
    assert appsettings.import_once() == 'done'
    assert asked == [7]   # the owner's rows
    got = client.get('/api/v1/settings').get_json()
    assert got['transcribeBackend'] == {'provider': 'openai'}
    assert got['shadowTrimSilence'] == {'on': False}
    # ...and never again, even if phonexa now says something else.
    monkeypatch.setattr(phonexa_client, 'get_settings',
                        lambda uid: pytest.fail('phonexa consulted after the import'))
    assert appsettings.import_once() == 'done'


def test_import_with_phonexa_down_keeps_defaults_and_retries(client, monkeypatch):
    import appsettings
    import phonexa_client

    def down(uid):
        raise phonexa_client.PhonexaUnavailable('connection refused')
    monkeypatch.setattr(phonexa_client, 'get_settings', down)
    assert appsettings.import_once() == 'retry'
    got = client.get('/api/v1/settings').get_json()
    assert got['shadowTrimSilence'] == {'on': True}
    assert got['transcribeBackend'] == {'provider': 'hf_whisper'}


def test_import_never_overwrites_what_the_operator_stored_meanwhile(client, monkeypatch):
    import appsettings
    import phonexa_client
    client.put('/api/v1/settings/shadowTrimSilence', json={'value': {'on': True}})
    monkeypatch.setattr(phonexa_client, 'get_settings',
                        lambda uid: {'shadowTrimSilence': {'on': False},
                                     'transcribeBackend': {'provider': 'openai'}})
    assert appsettings.import_once() == 'done'
    got = client.get('/api/v1/settings').get_json()
    assert got['shadowTrimSilence'] == {'on': True}           # the operator's
    assert got['transcribeBackend'] == {'provider': 'openai'}  # imported


def test_import_with_no_value_in_phonexa_finishes_on_defaults(client, monkeypatch):
    import appsettings
    import phonexa_client
    monkeypatch.setattr(phonexa_client, 'get_settings', lambda uid: {})
    assert appsettings.import_once() == 'done'
    assert client.get('/api/v1/settings').get_json()['shadowTrimSilence'] == {'on': True}


def test_the_import_thread_retries_then_stops(monkeypatch):
    import appsettings
    answers = iter(['not-ready', 'retry', 'done'])
    calls = []
    monkeypatch.setattr(appsettings, 'import_once', lambda: calls.append(1) or next(answers))
    sleeps = []
    t = appsettings.start_import_thread(sleep=sleeps.append)
    t.join(timeout=5)
    assert not t.is_alive() and len(calls) == 3
    assert sleeps[1] < sleeps[2]   # backoff grows
