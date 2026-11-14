"""
auth.py — THE operator/internal check for every Python service.

One implementation, replacing `stabbur/auth.py` and `smia/auth.py` (which
were near-copies of each other, D-N1 copying D-S6) and adding the check to
phonexa and shadow, which had none at all.

The rule, from `unified-auth/design.md`:

    allow if  the gateway-verified marker header is present
    allow if  Authorization: Bearer INTERNAL_TOKEN
    else      401

THE MARKER IS ONLY TRUSTWORTHY BECAUSE OF TWO THINGS OUTSIDE THIS FILE, and
both are requirements rather than conventions:

  1. the gateway deletes any inbound `X-Tun-Operator` before a single route is
     considered (`request_header -X-Tun-Operator`, site-level, compiled ahead
     of the whole handle group — unified-auth 3.5), and sets it only after
     `basic_auth` has passed;
  2. no service publishes a port outside the loopback interface in production
     (unified-auth 4.7, enforced by `bin/check-standards.sh`).

If either stops being true, `curl -H 'X-Tun-Operator: 1'` is a complete
bypass of every zone.

EVERY CARVE-OUT IS GONE (unified-auth 4.5). `/ui`, `/blob/<sha256>`,
`/api/enrich/tts/preview/<sha256>` and the blanket `OPTIONS` exemption each
existed for a reason the gateway removes: there is one browser credential
now, it is attached by the browser to `<audio src=...>` and every other
subresource on the origin, and the CORS preflight is answered BY THE GATEWAY
before the auth check (`(operator_gate)`'s `@preflight` route). Answering a
preflight here as well would be dead code at best and a second place to get
it wrong at worst.

The ONE exemption that remains is `/_health`: it is the container probe
(libs/pyservice/bootstrap.py), it carries no data, it is never routed through
the gateway, and a Docker health check cannot present a credential.
"""

from __future__ import annotations

import os

from flask import jsonify, request

MARKER_HEADER = "X-Tun-Operator"
"""Set by the gateway on requests that passed `basic_auth`. Stripped on the
way in, so a client cannot mint it."""

INTERNAL_TOKEN_ENV = "INTERNAL_TOKEN"
"""One value for every service-to-service call (builder -> stabbur,
stabbur -> smia, shadow -> smia, shadow -> phonexa). Replaces
STABBUR_AUTH_TOKEN and SMIA_AUTH_TOKEN, which are retired names — see the
`dead` list in bin/check-standards.sh."""

UNAUTHENTICATED_PATHS = ("/_health",)


def is_authorized() -> bool:
    """True when the current request carries the gateway marker or the
    internal token. Exposed separately so a service can reuse the same
    decision outside the before_request hook."""
    if request.headers.get(MARKER_HEADER):
        return True

    token = os.environ.get(INTERNAL_TOKEN_ENV)
    header = request.headers.get("Authorization", "")
    provided = header[len("Bearer "):] if header.startswith("Bearer ") else None

    # An unset token and a wrong token both resolve to "no", not to two
    # different statuses: a caller can never distinguish "no token
    # configured" from "wrong token" anyway, and a 500 here would leak the
    # server's misconfiguration to any unauthenticated caller.
    return bool(token) and provided == token


def register_auth(app):
    @app.before_request
    def _require_operator_or_internal():
        if request.path in UNAUTHENTICATED_PATHS:
            return None
        if is_authorized():
            return None
        return jsonify({"error": "unauthorized"}), 401
