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

POLL_SECONDS = 15.0
"""How often a READY service re-checks the database with no traffic."""

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
    def __init__(self, name: str, prepare, check=None, on_ready=None, log=None):
        self.name = name
        self._prepare = prepare
        # THE POLL IS NOT THE PREPARE STEP. It used to be: the 15s re-check
        # called `prepare()`, which is `alembic upgrade head` — a full
        # migration subprocess every 15 seconds for the life of the container
        # (measured: 1,429 "schema ready" lines from one phonexa-backend, and
        # smia re-ran its whole provider-import emptiness sweep with them).
        # The comment below the loop called it "a liveness poll, not a
        # workload"; it was a workload. `check` is the liveness poll — one
        # `SELECT 1` on a pooled connection — and `prepare` now runs only
        # while the service is NOT ready, which is the only time a migration
        # can have anything to do.
        self._check = check or prepare
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
        # Populated by register_db_guard when a prefix in `protect`/`exempt`
        # matches no route this app actually registered. Read by
        # health_payload.
        self.guard_warnings: list[str] = []

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
        readiness was reached.

        A service that keeps claiming "ready" while every query fails is
        precisely the quietly-wrong state this file exists to prevent. Re-arms
        the retry loop rather than waiting out its sleep.

        (An earlier version of this docstring said jsservice's flag was a
        one-way latch "because nothing there can observe a later failure".
        That was true when written and is no longer: P45 records the outage it
        caused — the same database loss answered 503 by a freshly booted
        process and 500 by one that had been ready — and
        libs/jsservice/bootstrap.js now has the equivalent `markLost`, called
        from each server's catch block. The two languages implement one
        contract; keep them that way.)"""
        with self._lock:
            if not self._ready:
                return
            self._ready = False
            self._last_error = error
        self._log.error(f"[{self.name}] database went away after readiness: {error} — serving degraded, re-checking")
        self._wake.set()

    def log_transient(self, error: BaseException) -> None:
        """A query failed, a fresh connection succeeded. Readiness untouched.

        Logged rather than swallowed: if these start appearing in bursts the
        pool or the server is genuinely unwell, and the only record of it is
        this line."""
        self._log.error(
            f"[{self.name}] transient database error, a fresh connection succeeded "
            f"— readiness unchanged: {error}"
        )

    # -- the probe ---------------------------------------------------------
    def probe(self) -> BaseException | None:
        """Run the cheap check once, now. Returns the exception if the
        database did not answer, or None if it did.

        Exists so a failed query can be told apart from a failed DATABASE.
        An `OperationalError` on one request used to be taken as proof the
        cluster was gone — but a dropped keep-alive raises exactly the same
        class, and P45's own cure note already said the scope has to be
        tight or "one bad query becomes a self-inflicted outage". Observed
        twice with postgres at RestartCount=0 throughout: phonexa and shadow
        each flipped to degraded, 503'd, and recovered on the next poll.
        A fresh connection is the only thing that can settle it, so ask."""
        try:
            self._check()
            return None
        except BaseException as err:  # noqa: BLE001 — the caller decides
            return err

    # -- the loop ----------------------------------------------------------
    def _run(self) -> None:
        while True:
            if not self.db_ready():
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
                    # Deliberately not fatal, and deliberately broad: ANY
                    # failure of the prepare step (a down database, a bad
                    # migration, a half-written provider dump) must leave the
                    # service serving degraded rather than killing the
                    # process. Narrowing this to OperationalError would
                    # reinstate exactly the crash this file removes for every
                    # other cause.
                    with self._lock:
                        self._ready = False
                        self._last_error = err
                    # Logged every time rather than once: a service that has
                    # been degraded for hours should keep saying why, not
                    # scroll the reason away after the first line.
                    self._log.error(
                        f"[{self.name}] schema not ready (attempt {attempt}): {err} "
                        f"— serving degraded, retrying in {RETRY_SECONDS:.0f}s"
                    )
                    self._wake.wait(timeout=RETRY_SECONDS)
                    self._wake.clear()
                    continue
                # `on_ready` now fires once per transition into readiness,
                # not once per loop pass. The old loop re-entered `prepare`
                # from the top on every single 15s tick, so smia's provider
                # import re-ran its emptiness sweep 4 times a minute forever.

            # READY. Park until mark_degraded() wakes us or the poll expires.
            #
            # PROACTIVE RE-CHECK rather than parking forever: mark_degraded()
            # only fires on a request that touches the database, so a
            # low-traffic service stayed ready — and reported healthy — right
            # through a total outage for as long as nobody asked it anything
            # (P47). Measured: with postgres stopped, smia sat at
            # {"status":"ready","db":true} for over two minutes.
            #
            # Cheap on purpose, and now actually cheap: `check`, not
            # `prepare`.
            woke = self._wake.wait(timeout=POLL_SECONDS)
            self._wake.clear()
            if woke:
                continue
            if not self.db_ready():
                continue
            err = self.probe()
            if err is not None:
                self.mark_degraded(err)

    def start(self) -> None:
        # daemon=True: this thread must never hold the process open. A
        # container stopping during a retry sleep should stop, not wait.
        threading.Thread(target=self._run, name=f"{self.name}-bootstrap", daemon=True).start()


def create_bootstrap(
    name: str,
    prepare: Callable[[], object],
    check: Callable[[], object] | None = None,
    on_ready=None,
    log=None,
) -> Bootstrap:
    return Bootstrap(name=name, prepare=prepare, check=check, on_ready=on_ready, log=log)


def make_db_check(get_engine: Callable[[], object], statement: str = "SELECT 1"):
    """The liveness poll every service passes as `check`.

    One round trip on a pooled connection. With `pool_pre_ping=True` on the
    engine (which all four services now set) a stale pooled connection is
    discarded and replaced inside `connect()`, so this answers the question
    that actually matters — "can this process reach the database RIGHT NOW"
    — rather than "did the connection I was handed happen to still be open".

    `sqlalchemy` is imported inside the function, not at module scope: this
    module is deliberately dependency-free so it can be imported by anything
    on PYTHONPATH, and the caller is the one who already depends on
    SQLAlchemy.
    """

    def _check() -> None:
        from sqlalchemy import text

        engine = get_engine()
        with engine.connect() as conn:
            conn.execute(text(statement))

    return _check


# ---------------------------------------------------------------------------
# Flask wiring. Two functions, because "serving but not ready" has to be
# visible in two places: to the container health check, and to every request
# that would otherwise touch a database that is not there.
# ---------------------------------------------------------------------------

HEALTH_PATH = "/_health"


# What a degraded service says OUT LOUD, to anyone who can reach the page.
#
# It used to say this, on /stabbur/, /smia/ and every guarded API route:
#
#   {"detail":"alembic upgrade head failed: sqlalchemy.exc.OperationalError:
#    (psycopg2.OperationalError) could not translate host name \"postgres\"
#    to address: Name or service not known", ...}
#
# Not a stack trace, but an internal hostname, the driver, the migration tool
# and its exit path — to an operator who can do nothing with any of it, and
# on a surface that the gateway serves to whoever holds the one credential.
# The exception text has not gone anywhere: `mark_degraded` and the retry
# loop both log it in full, every time, which is where an operator who needs
# it should be looking anyway.
DEGRADED_MESSAGE = "The database is not reachable. This page is running in a degraded state; data-backed features are unavailable until it returns."
TRANSIENT_MESSAGE = "A database query failed but the database is responding. Retry this request."


def health_payload(boot: Bootstrap) -> dict:
    body = {
        "service": boot.name,
        "status": boot.status(),
        "db": boot.db_ready(),
        "attempts": boot.attempts(),
    }
    if not boot.db_ready():
        body["detail"] = DEGRADED_MESSAGE
    if boot.guard_warnings:
        # A dead guard prefix is a configuration defect that is otherwise
        # completely silent — see register_db_guard. Surfaced here so it is
        # visible from outside the process, not only in a boot log line that
        # scrolled away hours ago.
        body["guard_warnings"] = list(boot.guard_warnings)
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
        if prefix == "/":
            # "/" IS A ROUTE, NOT A PREFIX. Every path starts with "/", so
            # treating it as one would exempt (or protect) the entire
            # service in one character. The UI shells live at "/" since
            # unified-auth 5.1, so this entry is now load-bearing and has to
            # mean exactly the index.
            if path == "/":
                return True
            continue
        if path == prefix or path == prefix.rstrip("/") or path.startswith(prefix):
            return True
    return False


def _dead_prefixes(app, prefixes: Sequence[str]) -> list[str]:
    """Prefixes that match no rule this app registered.

    THE DEFECT THIS EXISTS FOR. stabbur exempted `("/ui", "/blob/",
    "/api/enrich/tts/preview/")` and smia exempted `("/ui",)`, both with a
    comment promising the shell would still render during a database outage.
    unified-auth 5.1 then moved both UIs from `/ui` to the prefix root, and
    the gateway STRIPS `/stabbur` before forwarding — so the shell's path
    inside Flask became `/`, matched no exemption, and both services
    answered a JSON 503 for their own front page. Measured with postgres
    stopped: `/stabbur/` 503, `/smia/` 503, `/stabbur/static/ui.js` 503.
    Two of eight zones lost their page entirely, and nothing anywhere said
    the exemption had stopped matching anything.

    A denylist whose entries can quietly stop existing is the same
    failure-reports-success shape as everything else in 08-pitfalls.md. The
    list is now checked against `app.url_map` at registration, so a prefix
    that points at nothing is a visible warning instead of silent dead code.
    """
    rules = [rule.rule for rule in app.url_map.iter_rules()]
    dead = []
    for prefix in prefixes:
        if prefix == "/":
            if "/" not in rules:
                dead.append(prefix)
            continue
        bare = prefix.rstrip("/")
        if not any(r == prefix or r == bare or r.startswith(prefix) for r in rules):
            dead.append(prefix)
    return dead


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

    for label, prefixes in (("protect", protect or ()), ("exempt", exempt)):
        for dead in _dead_prefixes(app, prefixes):
            warning = f"db-guard {label} prefix {dead!r} matches no registered route"
            boot.guard_warnings.append(warning)
            boot._log.error(f"[{boot.name}] {warning}")

    def _degraded_response():
        # No driver text, no hostname, no migration-tool wording — see
        # DEGRADED_MESSAGE. The exception itself is logged, in full, by
        # mark_degraded() and by every pass of the retry loop.
        body = {
            "error": "database unavailable",
            "service": boot.name,
            "status": "degraded",
            "detail": DEGRADED_MESSAGE,
        }
        response = jsonify(body)
        # Honest, and actionable: the retry loop runs on this interval, so a
        # client that waits that long has a real chance of a different answer.
        response.headers["Retry-After"] = str(int(RETRY_SECONDS))
        return response, 503

    def _transient_response():
        body = {
            "error": "database query failed",
            "service": boot.name,
            "status": "ready",
            "detail": TRANSIENT_MESSAGE,
        }
        response = jsonify(body)
        response.headers["Retry-After"] = "1"
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
            # SCOPED, as P45's own cure note required and the first
            # implementation did not: "a constraint violation or a syntax
            # error must NOT degrade the service, or one bad query becomes a
            # self-inflicted outage". A dead keep-alive is that category and
            # was not scoped out — SQLAlchemy raises OperationalError for
            # "server closed the connection unexpectedly" exactly as it does
            # for "the host does not resolve", so one stale pooled connection
            # took readiness down and 503'd a perfectly healthy service.
            # Observed twice unprompted with postgres at RestartCount=0.
            #
            # So: ask the database before declaring it gone. One extra round
            # trip, on the error path only.
            probe_error = boot.probe()
            if probe_error is None:
                boot.log_transient(err)
                return _transient_response()
            boot.mark_degraded(err)
            return _degraded_response()

        for exc in db_errors:
            app.register_error_handler(exc, _handle_db_error)
