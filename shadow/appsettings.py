"""
appsettings.py — shadow's single owner and its own settings store (D168).

shadow-playback-chapter-reading D1/D2. shadow used to proxy profiles and
settings to phonexa (`/api/v1/users`, `/api/v1/settings`), so changing the
STT provider or the trim switch failed whenever phonexa was down, for a
profile picker nobody used. Both proxies are gone:

  OWNER     one id, pinned by migration e5b9c2d47a10 into `shadow_owner`.
            Every request uses it; a `userId` sent by an old tab is ignored,
            which is what keeps such a tab working.
  SETTINGS  `shadow_settings` in shadow's own database (dumped with
            `shadow.sql`). `GET /api/v1/settings` answers every known key
            with its EFFECTIVE value (stored, else the default);
            `PUT /api/v1/settings/<key>` with `{"value": ...}` stores one.
  IMPORT    once, best-effort, in the background: the owner's
            `transcribeBackend` and `shadowTrimSilence` rows from phonexa, for
            the keys shadow has not stored yet. It never blocks boot (D157):
            it waits for the schema, retries phonexa with a capped backoff,
            and finishes for good the first time phonexa ANSWERS — after that
            phonexa is never consulted again, and a key the operator stored in
            the meantime is never overwritten.

phonexa is still called for the Praat analysis and the Formant Lab handoff,
and for nothing else.
"""

from __future__ import annotations

import threading
import time

from flask import Blueprint, jsonify, request

import phonexa_client
from db.models import ShadowOwner, ShadowSetting
from db.session import get_sessionmaker

settings_bp = Blueprint('appsettings', __name__)

DEFAULT_OWNER_ID = 1  # only ever used if the pin row is somehow missing

# Every key the API knows, with its default. A value is always a JSON object
# so a key can grow a field without changing shape.
DEFAULTS: dict[str, dict] = {
    'transcribeBackend': {'provider': 'hf_whisper'},
    'shadowTrimSilence': {'on': True},
    'shadowAutoplay': {'on': True},          # "Play sentence when opened"
    'shadowAudiobookTrim': {'on': False},    # "Trim in audiobook mode"
}
# What the one-time import may copy from phonexa — the two keys that existed
# there. The two playback keys are new and have nothing to import.
IMPORTED_KEYS = ('transcribeBackend', 'shadowTrimSilence')
# Marks the import as finished for good. Internal: never listed, never writable.
IMPORT_DONE_KEY = '_phonexaImportDone'

IMPORT_FIRST_DELAY_SEC = 2
IMPORT_RETRY_MIN_SEC = 15
IMPORT_RETRY_MAX_SEC = 600


# ── the owner ───────────────────────────────────────────────────────────

_owner_lock = threading.Lock()
_owner_cache: int | None = None


def owner_id(db=None) -> int:
    """The pinned owner id. Cached after the first read: nothing writes it."""
    global _owner_cache
    if _owner_cache is not None:
        return _owner_cache
    with _owner_lock:
        if _owner_cache is not None:
            return _owner_cache
        if db is None:
            with get_sessionmaker()() as own:
                row = own.get(ShadowOwner, 1)
        else:
            row = db.get(ShadowOwner, 1)
        if row is None:
            # Not cached: the migration has not run yet (D157 serves first).
            return DEFAULT_OWNER_ID
        _owner_cache = int(row.user_id)
        return _owner_cache


def _reset_owner_cache() -> None:  # tests
    global _owner_cache
    _owner_cache = None


# ── values ──────────────────────────────────────────────────────────────

def _validate(key: str, value) -> str | None:
    if key not in DEFAULTS:
        return f'unknown setting {key!r}; known: {", ".join(DEFAULTS)}'
    if not isinstance(value, dict):
        return 'value must be a JSON object'
    if key == 'transcribeBackend':
        provider = value.get('provider')
        if not isinstance(provider, str) or not provider.strip():
            return 'transcribeBackend needs {"provider": "<name>"}'
    elif not isinstance(value.get('on'), bool):
        return f'{key} needs {{"on": true|false}}'
    return None


def _normalise(key: str, value) -> dict:
    """The stored shape. A pre-smia transcribeBackend ({backend, url, ...}) has
    no provider; it is NOT believed — the default applies instead."""
    if key == 'transcribeBackend':
        provider = value.get('provider') if isinstance(value, dict) else None
        return {'provider': provider.strip()} if isinstance(provider, str) and provider.strip() \
            else dict(DEFAULTS[key])
    on = value.get('on') if isinstance(value, dict) else None
    return {'on': on} if isinstance(on, bool) else dict(DEFAULTS[key])


def effective_settings(db) -> dict:
    stored = {r.key: r.value for r in db.query(ShadowSetting).all()}
    return {k: _normalise(k, stored[k]) if k in stored else dict(d) for k, d in DEFAULTS.items()}


def get_setting(db, key: str) -> dict:
    row = db.get(ShadowSetting, key)
    return _normalise(key, row.value) if row is not None else dict(DEFAULTS[key])


def _store(db, key: str, value) -> None:
    row = db.get(ShadowSetting, key)
    if row is None:
        db.add(ShadowSetting(key=key, value=value))
    else:
        row.value = value


# ── the API ─────────────────────────────────────────────────────────────

@settings_bp.route('/api/v1/settings')
def list_settings():
    """Every known key -> its effective value. Any `userId` is ignored."""
    with get_sessionmaker()() as db:
        return jsonify(effective_settings(db))


@settings_bp.route('/api/v1/settings/<key>', methods=['PUT'])
def put_setting(key):
    """Body `{"value": {...}}`. Answers `{key, value}` — the stored value."""
    body = request.get_json(silent=True)
    if not isinstance(body, dict) or 'value' not in body:
        return jsonify({'error': 'body must be {"value": ...}'}), 400
    bad = _validate(key, body['value'])
    if bad:
        return jsonify({'error': bad}), 400
    value = _normalise(key, body['value'])
    with get_sessionmaker()() as db:
        _store(db, key, value)
        db.commit()
    return jsonify({'key': key, 'value': value})


# ── the one-time import ────────────────────────────────────────────────

def import_once() -> str:
    """One attempt. Returns 'done', 'retry' (phonexa did not answer) or
    'not-ready' (no schema yet). Raises nothing.

    A key is copied only if shadow has not stored it — the operator may
    already have changed it here while phonexa was down. Finishing writes
    IMPORT_DONE_KEY, after which this is a no-op forever.
    """
    try:
        with get_sessionmaker()() as db:
            if db.get(ShadowSetting, IMPORT_DONE_KEY) is not None:
                return 'done'
            missing = [k for k in IMPORTED_KEYS if db.get(ShadowSetting, k) is None]
            owner = owner_id(db)
            if db.get(ShadowOwner, 1) is None:
                return 'not-ready'
    except Exception:  # noqa: BLE001 — no schema / no database yet
        return 'not-ready'

    imported: dict[str, dict] = {}
    if missing:
        try:
            remote = phonexa_client.get_settings(owner)
        except phonexa_client.PhonexaUnavailable:
            return 'retry'
        except Exception:  # noqa: BLE001
            return 'retry'
        if isinstance(remote, dict):
            for key in missing:
                if key in remote and _validate(key, _normalise(key, remote[key])) is None:
                    imported[key] = _normalise(key, remote[key])

    try:
        with get_sessionmaker()() as db:
            for key, value in imported.items():
                if db.get(ShadowSetting, key) is None:   # still not set here
                    db.add(ShadowSetting(key=key, value=value))
            _store(db, IMPORT_DONE_KEY, {'at': time.time(), 'imported': sorted(imported)})
            db.commit()
    except Exception:  # noqa: BLE001
        return 'not-ready'
    print(f'shadow — settings import from phonexa finished: '
          f'{", ".join(sorted(imported)) or "nothing to import, defaults apply"}', flush=True)
    return 'done'


def start_import_thread(sleep=time.sleep) -> threading.Thread:
    """Background, daemon, never blocks boot. Retries until phonexa answers."""
    def run():
        sleep(IMPORT_FIRST_DELAY_SEC)
        delay = IMPORT_RETRY_MIN_SEC
        while True:
            state = import_once()
            if state == 'done':
                return
            sleep(delay)
            delay = min(delay * 2, IMPORT_RETRY_MAX_SEC)

    t = threading.Thread(target=run, name='shadow-settings-import', daemon=True)
    t.start()
    return t
