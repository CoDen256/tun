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

import re
import subprocess

# The line worth reporting. A failing `alembic upgrade head` ends with a full
# traceback whose genuinely LAST line is SQLAlchemy's documentation link
# ("(Background on this error at: https://sqlalche.me/e/20/e3q8)") — taking
# the tail naively reports that and drops `could not translate host name
# "postgres" to address`, which is the entire content of the message.
_EXCEPTION_LINE = re.compile(r"^[A-Za-z_][\w.]*(Error|Exception)\b.*:")
_NOISE = ("(Background on this error at:",)


class MigrationError(RuntimeError):
    pass


def _summarize(output: str, returncode: int) -> str:
    lines = [ln.rstrip() for ln in output.strip().splitlines()]
    lines = [ln for ln in lines if ln and not ln.startswith(_NOISE)]
    for line in reversed(lines):
        if _EXCEPTION_LINE.match(line):
            return line
    return lines[-1] if lines else f"exit {returncode}"


def upgrade_head(timeout: float = 900.0) -> str:
    result = subprocess.run(
        ["alembic", "upgrade", "head"],
        capture_output=True,
        text=True,
        timeout=timeout,
    )
    if result.returncode != 0:
        raise MigrationError(
            "alembic upgrade head failed: "
            + _summarize(result.stderr or result.stdout or "", result.returncode)
        )
    return "alembic at head"
