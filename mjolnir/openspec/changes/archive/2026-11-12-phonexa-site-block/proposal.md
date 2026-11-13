## Why

mjolnir owns the one deployable Caddy (D84), and it is the only thing in the Tun stack that terminates TLS. For phonexa to be reachable once it joins `tun`'s compose stack, Caddy needs a route to it — and it needs one that works for phonexa's frontend, which hardcodes absolute paths (`fetch('/api/v1/…')`) and opens its live-mic WebSocket at `location.host + '/stream'`; `/stream` and `js/realtime.js` are frozen. A `/phonexa/` path prefix would break both, so phonexa gets its own **subdomain**. Browser microphone access also requires HTTPS, which Caddy provides there automatically.

phonexa has no authentication of its own (profiles are name-only, with no password, and it exposes destructive DB import/export endpoints), so it must not be reachable on the internet unauthenticated. The operator token (`OPERATOR_AUTH_TOKEN`) is enforced inside hub's and builder's own application code (login page + cookie), not at Caddy, so there is nothing to simply "reuse" at the proxy.

## What Changes

- `caddy/Caddyfile`: add a second site block for `{$PHONEXA_SITE_ADDRESS}` that reverse-proxies everything (including the `/stream` WebSocket) to `{$PHONEXA_UPSTREAM}`, guarded by Caddy `basic_auth` — username `operator`, password = the operator token, stored as a bcrypt hash in `{$PHONEXA_AUTH_HASH}`. Replace the stale commented-out `reverse_proxy /phonexa/* phonexa:8000` placeholder with a pointer to the new block.
- Safe defaults so mjolnir still starts without phonexa: when the vars are unset, the phonexa site must be inert and **fail closed** (never serve phonexa unauthenticated, never ask for a certificate for a public name).
- `compose.yaml`: pass `PHONEXA_SITE_ADDRESS`, `PHONEXA_UPSTREAM` (default `phonexa-backend:5050`) and `PHONEXA_AUTH_HASH` to the `caddy` service's `environment:`.
- `.env.example` and `DEPLOY.md`: the DNS A/AAAA record for the phonexa hostname, how to generate the hash from the existing token (`caddy hash-password`), the single-quote requirement for `$`-containing values in `.env`, and the rotation rule (changing `OPERATOR_AUTH_TOKEN` means regenerating the hash — they are not linked automatically).

**Non-goals:**
- No change to the existing `/ota`, `/blob`, `/mjolnir`, `/builder`, `/stabbur`, `/smia`, `/adminer` routes, or to hub/builder auth.
- No cross-links from the operator UIs to phonexa (different origin and a separate login prompt; can be added later).
- No application-level auth in phonexa, no session/cookie login page, no per-user identity.
- No path-prefix (`/phonexa/…`) routing and no change to phonexa's frontend or its frozen code.
- No auth for the shared `/adminer` route (unchanged, pre-existing).

## Capabilities

### New Capabilities
- `phonexa-site-routing`: Caddy exposes phonexa on its own authenticated HTTPS hostname without affecting any existing route.

### Modified Capabilities
- None.

## Impact

- `caddy/Caddyfile`, `compose.yaml` (caddy `environment:` only), `.env.example`, `DEPLOY.md`.
- Operators gain a DNS prerequisite (a hostname for phonexa) and a one-time hash-generation step.
- Browsers show the native basic-auth prompt for phonexa (not the hub's login page); credentials are cached per-origin by the browser.
- Depends on the `phonexa` change `deployable-in-tun` (service name `phonexa-backend`, reachable over `tun-shared`) and is consumed by `tun`'s `add-phonexa-to-stack` (docs/ADR).
