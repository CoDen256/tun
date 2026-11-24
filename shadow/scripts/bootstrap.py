"""
scripts/bootstrap.py — shadow's container entrypoint (`CMD` in `Dockerfile`),
the same spelling of the same mechanism phonexa, stabbur and smia use
(libs/pyservice/bootstrap.py).

Shadow never had a migrate-then-exec entrypoint to replace: it was born after
zone-isolation task 1.2 landed, so it adopts serve-before-migrate directly
rather than inheriting phonexa's `alembic upgrade head && exec` shell script.

MIGRATION OWNERSHIP. Shadow owns the `shadow` database's migrations and
nothing else's. phonexa owns `phonexa`'s. The two databases are disjoint and
so are the two alembic histories — no service migrates another's, which is
the rule that keeps two processes off one migration table.

THE GUARD. `protect=("/api/v1/shadowing/", "/api/v1/settings")` and nothing more. Everything
else in this process is deliberately database-free and must survive a
cluster outage:

  /transcribe, /transcribe/providers   smia proxy, no row
  /api/v1/youtube-extract              yt-dlp, no row
  /analyze-praat                       phonexa proxy, no row
  (/api/v1/users and /api/v1/settings were listed here as phonexa
   proxies. Since D168 /users is gone and /settings is shadow's OWN
   table, so it IS guarded now — see `protect` below.)
  the pages, js/ and css/              files on disk

That is the `protect` form rather than the `exempt` form for phonexa's
reason: the database is a minority of this process, and an allowlist would
silently block the next database-free route someone adds.
"""

from __future__ import annotations

import os

from sqlalchemy.exc import OperationalError

from pyservice.bootstrap import create_bootstrap, make_db_check, register_db_guard, register_health
from pyservice.migrate import upgrade_head

from app import app  # the Flask app, routes already registered
from db.session import get_engine
from appsettings import start_import_thread
from shadowing import start_janitor


def main() -> None:
    boot = create_bootstrap(
        name="shadow-backend",
        prepare=upgrade_head,
        check=make_db_check(get_engine),  # `SELECT 1`, not a migration run
    )
    boot.start()

    register_health(app, boot)

    register_db_guard(
        app,
        boot,
        protect=("/api/v1/shadowing/", "/api/v1/settings"),
        db_errors=(OperationalError,),
    )

    # Stuck-state reconciliation and abandoned-upload cleanup (task 1.5).
    # One daemon thread that blocks nothing and whose first pass is
    # delayed, so serve-before-migrate is untouched and a database that is
    # not up yet costs the janitor one pass, never the boot.
    #
    # The first pass IS the crash recovery: a process that died mid
    # transcode or mid analysis left `audio_state='transcoding'` /
    # `analysis_state='running'` in the database with no thread behind
    # them, and the book polled "analysing…" for ever. It is deliberately
    # here and not in `prepare`: recovery must not be able to delay the
    # port binding (D157).
    start_janitor()

    # The one-time, best-effort import of the owner's two settings from
    # phonexa (D168). A daemon thread for D157's reason: it waits for the
    # schema and for phonexa without ever touching the port binding, and
    # stops for good once phonexa has answered once.
    start_import_thread()

    print("shadow — HTTP :5051", flush=True)
    debug = os.environ.get("FLASK_DEBUG", "0") == "1"
    app.run(host="0.0.0.0", port=5051, threaded=True, debug=debug, use_reloader=False)


if __name__ == "__main__":
    main()
