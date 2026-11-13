"""
scripts/bootstrap.py — stabbur's container entrypoint (`CMD` in `Dockerfile`),
and now one of three identical spellings of the same mechanism
(libs/pyservice/bootstrap.py).

It used to be: `alembic upgrade head`, then exec `app.py`. With Postgres
unreachable alembic exits non-zero and Flask never bound 5056, so `/stabbur`
answered 502 — the note editor did not load at all, including the parts of it
that need no database. `restart: unless-stopped` made that a crash loop.

Now: bind the port first, run the migration in the background behind a
readiness flag. The UI shell always loads; the API answers 503 "database
unavailable" with a reason while the schema is not ready, and starts answering
normally the moment it is, without a restart.

The exec is gone with it — the app runs in this process. The old comment
claimed exec was needed for signals and the inherited environment: the
environment was inherited either way, and this module is PID 1 now, so SIGTERM
reaches the server directly for the same reason it did before.
"""

from __future__ import annotations

import os

from sqlalchemy.exc import OperationalError

from pyservice.bootstrap import create_bootstrap, register_db_guard, register_health
from pyservice.migrate import upgrade_head

from app import app  # imports Flask app + registers auth before the guard below


def main() -> None:
    # stabbur owns the `stabbur` database's migrations outright — no other
    # service touches that schema, so there is no ownership question here the
    # way there is between mjolnir's workbench and sync.
    boot = create_bootstrap(name="stabbur-backend", prepare=upgrade_head)
    boot.start()

    register_health(app, boot)

    # Guard everything EXCEPT the routes that genuinely need no database.
    # That is the same short list auth.py exempts, and for related reasons:
    #   /ui, /ui/*                      the shell, read off disk — it must
    #                                   render so the operator can SEE that
    #                                   the database is unavailable
    #   /blob/<sha256>                  content-addressed audio, served from
    #                                   the stabbur-blobs volume, no row read
    #   /api/enrich/tts/preview/<sha>   a straight pass-through to smia
    # Everything else reads or writes Postgres, so the default is the guard.
    register_db_guard(
        app,
        boot,
        exempt=("/ui", "/blob/", "/api/enrich/tts/preview/"),
        db_errors=(OperationalError,),
    )

    # use_reloader=False even in debug: the reloader forks a second process,
    # which would mean two bootstrap threads racing one migration — the exact
    # failure mode the "one owner per database" rule exists to prevent.
    debug = os.environ.get("FLASK_DEBUG", "0") == "1"
    app.run(host="0.0.0.0", port=5056, debug=debug, use_reloader=False)


if __name__ == "__main__":
    main()
