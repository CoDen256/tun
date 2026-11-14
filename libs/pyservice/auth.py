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

CORRECTION, 2026-11-14 (P57): the sentence above is about the blanket OPTIONS
exemption in THIS module, and only about that. It was read — including by this
file's own author — as saying that service-side CORS is gone. It is not:
`flask_cors.CORS(app)` is still live in smia/app.py, stabbur/app.py,
phonexa/formanter.py and shadow/app.py, and it REFLECTS the requesting Origin
on the actual response, where the gateway's `*` covers the preflight only. Two
policies, in two places, documented as one. The four call sites now carry the
measurement and the reason they are kept; see also the Caddyfile's CORS notes.
Nothing here is exploitable — `Access-Control-Allow-Credentials` is never set
— but a claim like this one must not be readable without its correction.

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
"""The ONE exemption, and the Node half now agrees: `libs/jsservice/auth.js`
owns the same predicate for mjolnir-hub / mjolnir-builder / mjolnir-sync,
which each pass their URL prefix (`/mjolnir`, `/builder`, ``) instead of
open-coding a health branch above their own gate. Before 2026-11-14 the
sentence above this line was true of Python only, and three hand-written
exemptions sat above three `requireAuth` calls — P50's shape, three times
(P54)."""


def require_internal_token() -> str:
    """Read INTERNAL_TOKEN or refuse to start.

    ONE CONTRACT, BOTH LANGUAGES (2026-11-14, P55). The three implementations
    disagreed: `mjolnir/builder/src/config.js` threw at boot, hub read the
    variable and carried on, and Python never looked at it until a request
    arrived. All three fail CLOSED, so none of them was a hole — but "fail
    closed" is not the same as "same contract", and the difference is exactly
    the kind that is invisible until the day one of them is relaxed.

    REQUIRED EVERYWHERE is the behaviour chosen, for three reasons:

      * it is one ecosystem-wide credential living in one file (the root
        `.env`, D151), and every compose fragment already passes it to every
        service — so a service that starts without it is misconfigured, full
        stop, not configured differently;
      * the alternative — tolerate it and close the internal door — turns a
        boot-time misconfiguration into a 401 on a cross-service call hours
        later, at a caller that has no way to name the cause. That is the
        house's defining defect class, where the failure surfaces somewhere
        other than where it happened;
      * refusing to start is loud, immediate and cannot be mistaken for
        health: the container never reports healthy, instead of reporting
        healthy while one of its two ways in is silently dead.

    The marker header deliberately needs NO configured value, so this can
    never be what leaves a service open — only what keeps it from starting.
    """
    token = os.environ.get(INTERNAL_TOKEN_ENV)
    if not token:
        raise RuntimeError(
            f"{INTERNAL_TOKEN_ENV} is required (the one service-to-service "
            "token; it lives in the repository root .env and every compose "
            "fragment passes it through)"
        )
    return token


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
    # Asserted at registration — i.e. at boot — not on the first request.
    require_internal_token()

    @app.before_request
    def _require_operator_or_internal():
        if request.path in UNAUTHENTICATED_PATHS:
            return None
        if is_authorized():
            return None
        return jsonify({"error": "unauthorized"}), 401
