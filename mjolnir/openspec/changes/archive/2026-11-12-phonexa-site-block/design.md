## Context

`caddy/Caddyfile` has one site block, `{$TUN_SITE_ADDRESS}`, with `handle`/`handle_path` routes; the caddy service gets its env from an explicit `environment:` list in `compose.yaml` (not `env_file`), joins `tun-shared`, and holds ACME certs in `caddy_data`. `OPERATOR_AUTH_TOKEN` is enforced in `hub/src/server.js` and the builder, not by Caddy; `/ota/*` uses a Caddy header matcher, which suits scripts but not browsers.

phonexa after `deployable-in-tun`: `phonexa-backend:5050` on `tun-shared`, Flask + flask-sock on **one port** (HTTP and `/stream` WebSocket), absolute-path frontend, no auth, destructive admin endpoints.

## Goals / Non-Goals

**Goals:** HTTPS phonexa on its own hostname, authenticated with the operator token, WebSocket working, zero impact on existing routes, mjolnir still deployable without phonexa.
**Non-Goals:** app-level auth, cross-links, path prefix, changes to phonexa's code.

## Decisions

### 1. Subdomain site block, not a path
```
 https://tun.example.net/…        → existing site block (unchanged)
 https://phonexa.example.net/…    → NEW block → basic_auth → reverse_proxy phonexa-backend:5050
```
A `handle_path /phonexa/*` would have to rewrite every absolute `/api/v1/…` and the frozen `/stream` URL. A subdomain needs zero frontend change. Caddy's `reverse_proxy` upgrades WebSockets transparently, so `/stream` needs no special config. Cost: a DNS record and one more certificate (automatic).

### 2. Auth: Caddy `basic_auth`, password = the operator token
- **Why not reuse hub's cookie login:** it lives in application code; phonexa would need its own gate in `formanter.py` — a global `before_request` in front of the frozen `/stream`. Putting the gate in Caddy leaves phonexa untouched and protects every phonexa route, including the destructive admin endpoints, uniformly.
- **Why a hash:** `basic_auth` only accepts bcrypt/argon hashes. The operator generates it once from the token they already have: `docker run --rm caddy:2-alpine caddy hash-password --plaintext "$OPERATOR_AUTH_TOKEN"`. Username fixed to `operator`.
- **Trade-off:** the browser's native prompt, not a login page; and the hash is not derived automatically from `OPERATOR_AUTH_TOKEN`, so rotating the token requires regenerating `PHONEXA_AUTH_HASH`. Documented.
- **Bcrypt cost:** basic_auth checks every request; Caddy caches successful verifications briefly, and the cost factor used by `hash-password` by default is acceptable for a single operator.

### 3. Fail-closed, non-breaking defaults
Unset must not break mjolnir-only deployments (a Caddy site with an empty address or an empty hash is a startup error) and must never serve phonexa open:
- `{$PHONEXA_SITE_ADDRESS:phonexa.localhost}` — `.localhost` names are served with Caddy's internal CA and never trigger ACME, and the upstream is unreachable/irrelevant when phonexa isn't deployed.
- `{$PHONEXA_AUTH_HASH:<bcrypt of a random, discarded string>}` — a syntactically valid hash nobody knows the plaintext of, so an unconfigured block rejects everyone.
- `{$PHONEXA_UPSTREAM:phonexa-backend:5050}`.
Both defaults must be proven with `caddy validate`/a live start with the vars unset (tasks), including in the local `TUN_SITE_ADDRESS=:8080` plain-HTTP mode, where a second HTTPS site could interfere with port 443 or auto-HTTPS redirects. If it does, the fallback default is an HTTP-only inert address.

### 4. `$` handling for the hash
A bcrypt hash contains `$`. Compose interpolates `$` in `.env` values, so `.env` must hold it single-quoted (`PHONEXA_AUTH_HASH='$2a$14$…'`); the interpolated result is passed to the container as-is via `environment:` (interpolation is not applied twice). Verified in tasks by reading the variable inside the container. DEPLOY.md and `.env.example` carry the warning.

### 5. Scope of protection
Everything on the phonexa hostname is behind `basic_auth`, including static assets and `/ping`. phonexa's healthcheck is container-internal (not through Caddy), so no exemption is needed.

### 6. Body size and timeouts
No request-body limit is configured (Formant Lab uploads and trim/ingest posts can be several MB). `reverse_proxy` defaults are used; the `/stream` WebSocket is long-lived, and Caddy does not time out upgraded connections by default.

## Risks / Trade-offs

- **Browser may not re-send basic-auth credentials on the WebSocket handshake** — same-origin handshakes normally do; if not, the live mic tracker would fail while everything else works. → Explicit verification task; fallback would be a cookie-based gate (a different design, raised if needed).
- **Token reuse across two systems with different verification paths** (plaintext at hub, hash at Caddy) → rotation must touch both; documented.
- **Default-site behaviour with `.localhost`** (internal cert generation) → proven with a live start; fallback specified.
- **Basic auth over the public internet is only as good as HTTPS** → Caddy's automatic HTTPS applies; no HTTP fallback is configured for this host.
- **Native prompt UX is clunkier than hub's login** → accepted; single operator.

## Migration Plan

1. Create the DNS record for the phonexa hostname → the VPS.
2. Generate the hash; set `PHONEXA_SITE_ADDRESS`, `PHONEXA_AUTH_HASH` (single-quoted) in `mjolnir/.env`.
3. `docker compose up -d` in `tun`; watch Caddy's log for the certificate.
4. Rollback: unset/remove the vars — the block returns to its inert default; existing routes were never touched.

## Open Questions

- None blocking; the two verification risks above decide whether a fallback is needed.
