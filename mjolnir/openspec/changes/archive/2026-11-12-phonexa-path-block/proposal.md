## Why

`phonexa-site-block` (implemented 2026-11-12) serves phonexa from a dedicated
hostname with `basic_auth`, because its frontend hardcoded absolute
`fetch('/api/v1/…')` paths and opened its live-mic WebSocket at
`location.host + '/stream'` — and `js/realtime.js` was frozen. A
`handle_path /phonexa/*` would have broken both.

The operator has since directed that phonexa be routed like every other service
in the stack: **`https://<host>/phonexa/`, no subdomain** — and phonexa's sibling
change `path-prefix-routing` removes the blocker by adopting the same
`X-Forwarded-Prefix` → `window.PHONEXA_PREFIX` → `API_BASE` pattern that
`stabbur` (D46) and `smia` (D119) already use. This is the third time that
pattern has been applied for exactly this reason; D119 records what happens
without it: *"every absolute asset/API request inside it would escape the
`/smia/*` proxy prefix and 404."*

So this change finishes the job on the Caddy side. It supersedes
`phonexa-site-block`'s **routing** half; its **auth** half — `basic_auth` with
username `operator` against a bcrypt hash of `OPERATOR_AUTH_TOKEN` — survives
unchanged, only moving from a site block to a `handle` block.

## What Changes

- `caddy/Caddyfile`: delete the `{$PHONEXA_SITE_ADDRESS}` site block. Inside the
  main site, add `redir /phonexa /phonexa/ 308` plus a
  `handle_path /phonexa/* { basic_auth … ; reverse_proxy {$PHONEXA_UPSTREAM} }`
  block that passes `header_up X-Forwarded-Prefix /phonexa`, mirroring the
  `/stabbur` and `/smia` blocks exactly.
- The block must be a `handle_path`, placed with the other `handle` blocks and
  before the catch-all — the ordering trap the Caddyfile already documents at
  length (a bare `reverse_proxy` compiles *after* the `handle` group and silently
  never runs).
- `compose.yaml`: drop `PHONEXA_SITE_ADDRESS` from caddy's `environment:`. Keep
  `PHONEXA_UPSTREAM` and `PHONEXA_AUTH_HASH` (both still used), including the
  valueless-key form for the hash.
- Fail-closed behaviour is preserved differently: there is no hostname to leave
  inert any more, so an unset `PHONEXA_AUTH_HASH` must still make `/phonexa/*`
  answer 401 for every request — the locked default hash stays.
- `.env.example` and `DEPLOY.md`: remove the DNS prerequisite and the hostname
  variable; keep hash generation, the single-quote rule and the rotation rule.
  State that phonexa now shares the main origin.

**Non-goals:**
- No change to `/ota`, `/blob`, `/audio-manifest`, `/mjolnir`, `/builder`,
  `/stabbur`, `/smia` or `/adminer`, or to hub/builder auth.
- No subdomain kept as an alias — the operator does not want one.
- No application-level auth in phonexa; the gate stays at the proxy.
- No change to phonexa's own code (that is phonexa's `path-prefix-routing`).

## Capabilities

### New Capabilities
- None.

### Modified Capabilities
- `phonexa-site-routing`: phonexa is reached at a path prefix on the main site
  rather than on a dedicated hostname, and the proxy tells it which prefix it is
  mounted under. The authentication, fail-closed and deployable-without-phonexa
  requirements are restated, not relaxed.

## Impact

- `caddy/Caddyfile`, `compose.yaml` (caddy `environment:` only), `.env.example`,
  `DEPLOY.md`.
- Operators lose a DNS prerequisite and one variable; the basic-auth prompt now
  appears on the main hostname, and credentials are cached for that whole origin.
- **Ordering:** phonexa's `path-prefix-routing` must land first. phonexa's change
  is a no-op without the header; this one is not safe without phonexa's, because
  a stripped prefix in front of a backend still emitting root-absolute URLs
  serves a broken page.
- Shared-origin trade-off accepted by the operator: hub's and builder's session
  cookie is `Path=/` (`hub/src/auth.js:85`), so it is sent on requests a phonexa
  page initiates. `HttpOnly` prevents reading it; it does not prevent riding it.
- Supersedes `2026-11-12-phonexa-site-block`, which stays in the record for its
  verified findings — notably that `basic_auth` does not block the WebSocket
  upgrade, and the two Caddy/compose facts about `{$VAR:default}` defaults
  containing `$` and set-but-empty variables never falling back.
