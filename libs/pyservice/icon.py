"""
The service tab icon, for the python half of the stack — the twin of
libs/jsservice/icons.js.

The marks live in libs/icons/<name>.svg, ONE file each, because no asset in
this ecosystem exists in two copies. The python services differ from the node
ones in having a static directory already, so here the icon is a real request
for a real file (`/icon.svg`) rather than a data: URI: it is then cached once
per browser instead of riding along in every page.

WHY A ROUTE AND NOT A COPY IN EACH ui/ DIRECTORY. `/libs` is already mounted
read-only into every python container (see each project's compose.yaml, and
PYTHONPATH=/libs), so one `send_file` out of it is the whole mechanism, and
`libs/icons/` stays the only place a mark is edited. The path resolves
identically in the container (`/libs/icons`) and in a native venv
(`../libs/icons` from a project directory), for the same reason the import
spelling does.

ROUTING. Registered as the static rule `/icon.svg`. phonexa and shadow both
end with a `/<path:path>` catch-all; werkzeug ranks a static rule above a
converter rule regardless of registration order, so this wins without either
service's catch-all having to know about it.

Usage, next to the other libs wiring in a service's app.py:

    from pyservice.icon import register_icon
    register_icon(app, "stabbur")

and in the page's <head>, at the service's own prefix:

    <link rel="icon" type="image/svg+xml" href="__STABBUR_PREFIX__/icon.svg">
"""

from __future__ import annotations

from pathlib import Path

from flask import send_file

ICONS_DIR = Path(__file__).resolve().parent.parent / "icons"

# A day. The mark changes on a deploy, never on a request, and the operator
# console is the only consumer — nothing here is worth a revalidation round
# trip, and nothing here is worth an immutable year either.
_CACHE_CONTROL = "public, max-age=86400"


def icon_path(name: str) -> Path:
    """The file for a service's mark. Raises if it is missing, so a typo is a
    boot-time error rather than a silently iconless tab."""
    path = ICONS_DIR / f"{name}.svg"
    if not path.is_file():
        raise FileNotFoundError(f"no icon for {name!r}: {path} does not exist")
    return path


def register_icon(app, name: str) -> None:
    """Serve `libs/icons/<name>.svg` at this service's `/icon.svg`."""
    path = icon_path(name)

    @app.route("/icon.svg", methods=["GET"])
    def _service_icon():
        response = send_file(path, mimetype="image/svg+xml")
        response.headers["Cache-Control"] = _CACHE_CONTROL
        return response
