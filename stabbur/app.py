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
# flask-cors IS STILL LIVE HERE, AND THAT IS NOT WHAT THE SURROUNDING
# DOCUMENTATION USED TO SAY (corrected 2026-11-14, P57). `libs/pyservice/auth.py`
# claimed the service-side CORS answer had been removed in favour of the
# gateway's, and grind/caddy/Caddyfile reasons at length about "the gateway's
# `*` policy" as though it were the only one. Measured, with the stack up:
#
#   curl -H 'Origin: https://evil.example' .../smia/health
#       -> Access-Control-Allow-Origin: https://evil.example
#
# So there are TWO policies, in two places, and they disagree: the gateway
# answers the PREFLIGHT with `*`, and this line answers the ACTUAL request by
# REFLECTING whatever Origin asked.
#
# Kept, deliberately, until the extension lands (unified-auth 6.1/6.2). The
# gateway sets Access-Control-Allow-Origin on the preflight only — nothing in
# the Caddyfile adds it to a real response — so deleting this line would let
# a cross-origin preflight succeed and then have the browser discard the
# answer to the request it authorised. hover-translate (D154) is exactly that
# client and it is not in this repository, so the regression could not be
# caught here.
#
# Not exploitable as it stands: `Access-Control-Allow-Credentials` is never
# set, so a browser will not attach the operator cookie or basic credential to
# a cross-origin request, and a response read this way carries no authority
# the caller did not already have. It is a documentation defect, recorded
# rather than silently left: two CORS policies with a comment claiming one.
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
