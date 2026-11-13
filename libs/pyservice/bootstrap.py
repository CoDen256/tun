"""
Serve before you migrate — the Python half of libs/jsservice/bootstrap.js.

The shape this replaces, in three different spellings:

    stabbur/scripts/bootstrap.py   subprocess.run(["alembic","upgrade","head"], check=True)
                                   os.execvp("python", ["python", "app.py"])
    smia/scripts/bootstrap.py      the same, plus ~9M rows of provider import
                                   between the two lines
    phonexa/scripts/docker-        set -e; alembic upgrade head; exec "$@"
      entrypoint.sh

All three shared one property: with Postgres unreachable, `alembic upgrade
head` exits non-zero and the app is never reached, so the container dies
before binding a port and the gateway answers 502 — not "no catalogue", no
page at all. `restart: unless-stopped` then turns that into a crash loop
(reproduced for mjolnir during monorepo-merge: RestartCount 0→9 in 60s).
Three spellings also meant three behaviours to reason about; this is one.

Inverted here, exactly as in jsservice/bootstrap.js: bind the port first, run
schema work in a background thread with retry, and expose readiness as a flag
every database-backed view consults. The cost is that "a running service has a
current schema" stops being an invariant — so `db_ready()` is a real state
pages must handle, and a service that is serving but not ready reports
DEGRADED rather than healthy, so it is visibly wrong instead of quietly wrong.

The device plane is unaffected either way: /ota/*, /blob/* and
/audio-manifest/* are served off disk by the gateway with no process in the
path (D55).

Imported as `pyservice.bootstrap` with `/libs` on PYTHONPATH — the Python
equivalent of jsservice's `/libs` mount (ESM resolves `../../../libs/...`
relative to the importing FILE, which Python has no analogue for; a path on
PYTHONPATH is the nearest thing that works identically in the container and in
a native venv, where it is `PYTHONPATH=../libs` from a project directory).
"""

from __future__ import annotations

import sys
import threading
import time
from typing import Callable, Iterable, Sequence

RETRY_SECONDS = 5.0


class _StderrLog:
    """Default sink. stderr, not logging: these three services print
    operational lines to stderr already and none of them configures a logger,
    so routing through `logging` would make the one message that explains a
    degraded service the only one that could be silently swallowed."""

    def info(self, message: str) -> None:
        print(message, file=sys.stderr, flush=True)

    def error(self, message: str) -> None:
        print(message, file=sys.stderr, flush=True)


class Bootstrap:
    def __init__(self, name: str, prepare, on_ready=None, log=None):
        self.name = name
        self._prepare = prepare
        self._on_ready = on_ready
        self._log = log or _StderrLog()
        # One lock around three fields read from request threads while the
        # bootstrap thread writes them. Flask's dev server is threaded, so
        # "it's only ever one thread" is not true here the way it is in Node.
        self._lock = threading.Lock()
        self._ready = False
        self._last_error: BaseException | None = None
        self._attempts = 0
        self._wake = threading.Event()

    # -- state, read from request threads ----------------------------------
    def db_ready(self) -> bool:
        with self._lock:
            return self._ready

    def last_error(self) -> BaseException | None:
        with self._lock:
            return self._last_error

    def attempts(self) -> int:
        with self._lock:
            return self._attempts

    def status(self) -> str:
        # Liveness vs readiness, kept separate on purpose. A health check that
        # conflates them either restarts a perfectly good degraded service or
        # reports a broken one as fine.
        return "ready" if self.db_ready() else "degraded"

    def mark_degraded(self, error: BaseException) -> None:
        """Called when a request discovers the database has gone away AFTER
        readiness was reached. jsservice's flag is a one-way latch because
        nothing there can observe a later failure; here the db guard's error
        handler can, and a service that keeps claiming "ready" while every
        query fails is precisely the quietly-wrong state this file exists to
        prevent. Re-arms the retry loop rather than waiting out its sleep."""
        with self._lock:
            if not self._ready:
                return
            self._ready = False
            self._last_error = error
        self._log.error(f"[{self.name}] database went away after readiness: {error} — serving degraded, re-checking")
        self._wake.set()

    # -- the loop ----------------------------------------------------------
    def _run(self) -> None:
        while True:
            with self._lock:
                self._attempts += 1
                attempt = self._attempts
            try:
                result = self._prepare()
                with self._lock:
                    self._ready = True
                    self._last_error = None
                suffix = f": {result}" if result else ""
                self._log.info(f"[{self.name}] schema ready after {attempt} attempt(s){suffix}")
                if self._on_ready:
                    self._on_ready()
            except BaseException as err:  # noqa: BLE001 — see below
                # Deliberately not fatal, and deliberately broad: ANY failure
                # of the prepare step (a down database, a bad migration, a
                # half-written provider dump) must leave the service serving
                # degraded rather than killing the process. Narrowing this to
                # OperationalError would reinstate exactly the crash this file
                # removes for every other cause.
                with self._lock:
                    self._ready = False
                    self._last_error = err
                # Logged every time rather than once: a service that has been
                # degraded for hours should keep saying why, not scroll the
                # reason away after the first line.
                self._log.error(
                    f"[{self.name}] schema not ready (attempt {attempt}): {err} "
                    f"— serving degraded, retrying in {RETRY_SECONDS:.0f}s"
                )
            # The thread never exits. Ready: park until mark_degraded() wakes
            # it. Degraded: sleep the retry interval. Both are the same wait,
            # and that symmetry is what makes recovery work without a restart
            # in either direction.
            if self.db_ready():
                self._wake.wait()
            else:
                self._wake.wait(timeout=RETRY_SECONDS)
            self._wake.clear()

    def start(self) -> None:
        # daemon=True: this thread must never hold the process open. A
        # container stopping during a retry sleep should stop, not wait.
        threading.Thread(target=self._run, name=f"{self.name}-bootstrap", daemon=True).start()


def create_bootstrap(name: str, prepare: Callable[[], object], on_ready=None, log=None) -> Bootstrap:
    return Bootstrap(name=name, prepare=prepare, on_ready=on_ready, log=log)


# ---------------------------------------------------------------------------
# Flask wiring. Two functions, because "serving but not ready" has to be
# visible in two places: to the container health check, and to every request
# that would otherwise touch a database that is not there.
# ---------------------------------------------------------------------------

HEALTH_PATH = "/_health"


def health_payload(boot: Bootstrap) -> dict:
    err = boot.last_error()
    body = {
        "service": boot.name,
        "status": boot.status(),
        "db": boot.db_ready(),
        "attempts": boot.attempts(),
    }
    if err is not None:
        body["error"] = str(err)
    return body


def register_health(app, boot: Bootstrap, path: str = HEALTH_PATH) -> None:
    """`GET /_health` — the same path and the same `{status, db}` shape
    mjolnir-sync already serves, so there is one predicate across the stack.

    200 when ready, 503 when degraded. Docker has only healthy/unhealthy, so
    degraded maps to unhealthy — which is the honest end: nothing in this
    stack `depends_on: service_healthy` a backend (only postgres), so an
    unhealthy backend cascades nowhere, and `docker ps` showing a degraded
    service as healthy would be the quietly-wrong state again.

    Must be exempted from the service's auth gate by the caller: a probe
    cannot carry a credential.
    """
    from flask import jsonify

    def _health():
        body = health_payload(boot)
        return jsonify(body), (200 if boot.db_ready() else 503)

    app.add_url_rule(path, "pyservice_health", _health, methods=["GET"])


def _matches(path: str, prefixes: Sequence[str]) -> bool:
    for prefix in prefixes:
        if path == prefix or path == prefix.rstrip("/") or path.startswith(prefix):
            return True
    return False


def register_db_guard(
    app,
    boot: Bootstrap,
    protect: Iterable[str] | None = None,
    exempt: Iterable[str] = (),
    db_errors: tuple = (),
) -> None:
    """Degrade to a lost feature, never to a lost page.

    One `before_request` hook instead of a `db_ready()` check hand-written
    into a hundred view functions: a guard you can only add by editing every
    endpoint is a guard that is wrong the first time someone adds an endpoint.

    Two modes, because the two shapes of service genuinely differ:

      protect=("/api/v1/",)  guard ONLY these prefixes. For a service whose
                             non-database features (phonexa's live formant
                             analysis, its static pages) must keep working
                             through a database outage — blocking those would
                             re-create the cascade this change removes, and an
                             allowlist would silently block the NEXT
                             database-free route someone adds.
      exempt=("/ui",)        with no `protect`, guard everything else. For a
                             service that is essentially all database
                             (stabbur, smia), where the short list is what
                             must still render: the UI shell and the
                             disk-backed routes. `exempt` also applies inside
                             `protect` mode, as a carve-out.

    `db_errors` is the exception classes that mean "the database went away"
    (SQLAlchemy's OperationalError for all three services). Passed in rather
    than imported so this module keeps no dependency of its own. A view that
    catches its own exceptions still answers for itself — this only covers
    what propagates.
    """
    from flask import jsonify, request

    protect = tuple(protect) if protect is not None else None
    exempt = tuple(exempt)

    def _degraded_response():
        err = boot.last_error()
        body = {
            "error": "database unavailable",
            "service": boot.name,
            "status": "degraded",
        }
        if err is not None:
            body["detail"] = str(err)
        response = jsonify(body)
        # Honest, and actionable: the retry loop runs on this interval, so a
        # client that waits that long has a real chance of a different answer.
        response.headers["Retry-After"] = str(int(RETRY_SECONDS))
        return response, 503

    @app.before_request
    def _guard_db_routes():
        if boot.db_ready():
            return None
        path = request.path
        if path == HEALTH_PATH:
            return None
        # `exempt` wins in both modes: under `protect` it is the carve-out for
        # a database-free endpoint that happens to sit under a guarded prefix
        # (phonexa's /api/v1/youtube-extract shells to yt-dlp and reads no
        # row), which is otherwise unreachable without moving the route.
        if _matches(path, exempt):
            return None
        if protect is not None:
            return _degraded_response() if _matches(path, protect) else None
        return _degraded_response()

    if db_errors:
        def _handle_db_error(err):
            boot.mark_degraded(err)
            return _degraded_response()

        for exc in db_errors:
            app.register_error_handler(exc, _handle_db_error)
