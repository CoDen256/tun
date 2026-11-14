"""
scripts/bootstrap.py — phonexa's container entrypoint (`CMD` in `Dockerfile`),
and now one of three identical spellings of the same mechanism
(libs/pyservice/bootstrap.py).

Replaces scripts/docker-entrypoint.sh, which was `set -e; alembic upgrade
head; exec "$@"`. Its `set -e` was deliberate — "a failed migration aborts the
container instead of serving against a half-built schema" — and that reasoning
is now inverted on purpose: with the database unreachable, aborting meant the
vowel chart, Formant Lab and live speech were unreachable too, none of which
touch Postgres at all. A half-built schema is still never served; it is
reported, per-request, as 503 "database unavailable" on exactly the routes
that need it.

phonexa is the service where the `protect` form of the guard earns its keep:
the database is a minority of this process. `/frames`, `/debug`,
`/analyze-praat`, `/stream` and every static page are pure computation or
pure disk, and keep working through a cluster outage.

(`/transcribe` was in that list until zone-isolation task 3.3 moved it to
the shadow service, along with /transcribe/providers and
/api/v1/youtube-extract. phonexa no longer serves any of the three.)
"""

from __future__ import annotations

import os

from sqlalchemy.exc import OperationalError

from pyservice.bootstrap import create_bootstrap, make_db_check, register_db_guard, register_health
from pyservice.migrate import upgrade_head

from formanter import app  # the Flask app, routes already registered
from db.session import get_engine


def main() -> None:
    # phonexa owns the `phonexa` database's migrations. Once `shadow` is split
    # out it owns its own; neither migrates the other's.
    boot = create_bootstrap(
        name="phonexa-backend",
        prepare=upgrade_head,
        # `SELECT 1`, not `alembic upgrade head`. This container logged
        # "schema ready after 1264 attempt(s)" over six hours — one full
        # migration run every 15 seconds, described in the shared module as
        # "a liveness poll, not a workload".
        check=make_db_check(get_engine),
    )
    boot.start()

    register_health(app, boot)

    # Guard only the database-backed API. Listed as a prefix rather than route
    # by route: /api/v1/ is already the namespace for everything that reads a
    # row — languages, samples, vowels, consonants, tokens, users and
    # settings. (`/api/v1/shadowing/*` was in that list too; shadow owns it
    # now, and guards it in its own process.)
    #
    # No carve-out any more. The one exempt route, /api/v1/youtube-extract,
    # moved to shadow with /transcribe (zone-isolation task 3.3), so every
    # remaining /api/v1/ route really does read a row. Outside the prefix,
    # /audio/<storage_key> serves bytes from the audio volume and /ping is
    # liveness — neither is under /api/v1/ and so neither is guarded.
    #
    # users/settings being guarded here is deliberate and visible: shadow
    # proxies both, so with PHONEXA's database down shadow's profile picker
    # reports it — shadow's own pages and its own segment lists are
    # unaffected, because they are a different database.
    register_db_guard(
        app,
        boot,
        protect=("/api/v1/",),
        db_errors=(OperationalError,),
    )

    # threaded=True preserved from formanter.py's own __main__ block: the
    # WebSocket /stream handler blocks for the life of a session, so a
    # single-threaded server would serve exactly one listener and nothing else.
    print("HTTP + WebSocket :5050", flush=True)
    debug = os.environ.get("FLASK_DEBUG", "0") == "1"
    app.run(host="0.0.0.0", port=5050, threaded=True, debug=debug, use_reloader=False)


if __name__ == "__main__":
    main()
