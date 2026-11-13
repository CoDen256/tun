"""
`alembic upgrade head`, once, for the three services that were each spelling
it themselves.

Still a subprocess rather than alembic's Python API: each service's
alembic/env.py already resolves its own DATABASE_URL and model metadata from
the process environment and its alembic.ini, and running it in-process would
import that config into a long-lived server where it has no business being.
The subprocess also keeps a migration failure — including a half-applied one
— strictly outside the serving process.

Output is captured, not streamed, so a failure can be re-raised WITH alembic's
own last words attached: the retry loop in bootstrap.py logs the exception
text and nothing else, and "command returned 1" would tell an operator
nothing.
"""

from __future__ import annotations

import subprocess


class MigrationError(RuntimeError):
    pass


def upgrade_head(timeout: float = 900.0) -> str:
    result = subprocess.run(
        ["alembic", "upgrade", "head"],
        capture_output=True,
        text=True,
        timeout=timeout,
    )
    if result.returncode != 0:
        tail = (result.stderr or result.stdout or "").strip().splitlines()
        raise MigrationError(
            "alembic upgrade head failed: " + (tail[-1] if tail else f"exit {result.returncode}")
        )
    return "alembic at head"
