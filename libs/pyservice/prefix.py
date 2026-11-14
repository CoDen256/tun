"""
prefix.py — the one `X-Forwarded-Prefix` implementation (unified-auth 5.2).

It existed four times, in four spellings: `stabbur/app.py`'s inline
`request.headers.get("X-Forwarded-Prefix", "").rstrip("/")`, smia's copy of
that, `phonexa/formanter.py`'s `_prefix()` + `_serve_page()` pair and
`shadow/app.py`'s copy of the pair. Same behaviour, four places to fix.

The shape, unchanged: the gateway strips the mount prefix off the path
before forwarding (`handle_path /stabbur/*`) so every route stays
prefix-agnostic, and passes the prefix along in `X-Forwarded-Prefix` so the
URLs the page hands back to the BROWSER carry it. Empty in standalone
development, where the service IS mounted at the root — nothing to configure.
"""

from __future__ import annotations

import os
from pathlib import Path

from flask import abort, request
from werkzeug.utils import safe_join

HEADER = "X-Forwarded-Prefix"


def forwarded_prefix() -> str:
    """The path prefix this request arrived under, '' when mounted at root.

    Always without a trailing slash, so `f"{forwarded_prefix()}/static/x.js"`
    is correct both behind the gateway and standalone.
    """
    return request.headers.get(HEADER, "").rstrip("/")


def render_page(root_path, filename: str, **substitutions):
    """Read an HTML file and substitute `__NAME__` placeholders into it.

    `render_page(app.root_path, "index.html", STABBUR_PREFIX=...)` replaces
    `__STABBUR_PREFIX__`. Only HTML is read-and-rewritten anywhere in this
    ecosystem; every other asset streams through Flask's static handler
    untouched.
    """
    html = (Path(root_path) / filename).read_text(encoding="utf-8")
    for name, value in substitutions.items():
        html = html.replace(f"__{name}__", value)
    return html, 200, {"Content-Type": "text/html; charset=utf-8"}


def safe_page_path(root_path, path: str) -> str:
    """Resolve a request path to an HTML file inside `root_path`, or 404.

    `send_from_directory`'s safe_join rules still apply when a service reads
    the file itself in order to substitute prefixes into it — phonexa and
    shadow both serve a whole directory of pages this way.
    """
    safe = safe_join(str(root_path), path)
    if safe is None or not os.path.isfile(safe):
        abort(404)
    return os.path.relpath(safe, str(root_path))
