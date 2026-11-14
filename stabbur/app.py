"""
app.py — stabbur's Flask entrypoint. Mirrors smia's app.py shape (D-N1):
registers auth, then mounts blob storage and notes routes.

Run: `flask --app app run` (dev) with DATABASE_URL set. Auth is the shared
check (libs/pyservice/auth.py) — the gateway marker or INTERNAL_TOKEN.
"""

from __future__ import annotations

import os

from flask import Flask
from flask_cors import CORS
from pyservice.auth import register_auth
from pyservice.prefix import forwarded_prefix, render_page

from routes.blobs import register_blob_routes
from routes.captures import register_capture_routes
from routes.enrich import register_enrich_routes
from routes.notes import register_notes_routes
from routes.settings import register_settings_routes

# static_folder="ui" / static_url_path="/static" is what moves the UI to the
# prefix root (unified-auth 5.1, superseding D46's /ui convention): the page
# itself is served at `/` and Flask's own static handler serves ui/ under
# `/static/`. Behind the gateway that is `/stabbur/` and `/stabbur/static/`.
app = Flask(__name__, static_folder="ui", static_url_path="/static")
CORS(app)
app.json.ensure_ascii = False  # Norwegian characters as literal UTF-8, not \uXXXX escapes
register_auth(app)
register_blob_routes(app)
register_notes_routes(app)
register_capture_routes(app)
register_enrich_routes(app)
register_settings_routes(app)


@app.route("/", methods=["GET"])
def ui_index():
    # Mounted at the domain root in local dev and under /stabbur/ behind the
    # gateway, which strips that prefix before forwarding (so every other
    # route stays prefix-agnostic) and passes it on as X-Forwarded-Prefix.
    # ui/ui.js reads it back via `window.STABBUR_PREFIX` for its own absolute
    # asset/API requests. One implementation now, in libs/pyservice/prefix.py.
    return render_page(app.root_path, "ui/index.html", STABBUR_PREFIX=forwarded_prefix())


if __name__ == "__main__":
    debug = os.environ.get("FLASK_DEBUG", "0") == "1"
    app.run(host="0.0.0.0", port=5056, debug=debug)
