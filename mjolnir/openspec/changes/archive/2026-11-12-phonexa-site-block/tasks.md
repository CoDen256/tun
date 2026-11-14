## 1. Caddy

- [x] 1.1 Add a second site block `{$PHONEXA_SITE_ADDRESS:phonexa.localhost}` to `caddy/Caddyfile` with `log`, `encode gzip`, `basic_auth` (`operator` + `{$PHONEXA_AUTH_HASH:<locked default hash>}`) and `reverse_proxy {$PHONEXA_UPSTREAM:phonexa-backend:5050}`
- [x] 1.2 Generate the locked default: a valid bcrypt hash of a random string that is discarded (never recorded); confirm `{$VAR:default}` parses a default containing `$`, otherwise use an alternative fail-closed construct (e.g. a `respond 401` handle when the hash is the placeholder)
- [x] 1.3 Replace the stale commented `reverse_proxy /phonexa/* phonexa:8000` with a comment pointing at the new block and why a subdomain was chosen

## 2. Compose and config

- [x] 2.1 `compose.yaml` caddy `environment:`: add `PHONEXA_SITE_ADDRESS`, `PHONEXA_UPSTREAM` (`${…:-phonexa-backend:5050}`), `PHONEXA_AUTH_HASH` (all optional)
- [x] 2.2 `.env.example`: document the three vars, the single-quote rule for the hash, and the DNS prerequisite
- [x] 2.3 `DEPLOY.md`: DNS record, `docker run --rm caddy:2-alpine caddy hash-password --plaintext "$OPERATOR_AUTH_TOKEN"`, quoting, rotation rule, what the browser shows

## 3. Verification

- [x] 3.1 `caddy validate` with all phonexa vars unset, and with them set
- [x] 3.2 Live start with `TUN_SITE_ADDRESS=:8080` (local mode) and no phonexa vars: starts, main routes unchanged, no ACME attempt for `phonexa.localhost`; if it interferes, switch the inert default to an HTTP-only address
- [x] 3.3 Existing routes regression: `/ota/…`, `/blob/…`, `/mjolnir/ui`, `/builder/ui`, `/stabbur/ui`, `/smia/ui`, `/adminer/` respond as before
- [x] 3.4 With a real hash: no creds → 401, wrong password → 401, `operator` + token → phonexa; an admin endpoint without creds → 401
- [x] 3.5 Read `PHONEXA_AUTH_HASH` inside the running caddy container and confirm the `$…` hash arrived intact (quoting rule works)
- [x] 3.6 With hash unset but a hostname set: every request 401 (fail closed)
- [x] 3.7 Over HTTPS: verified at the protocol level against a stand-in upstream — `/stream` handshake returns `101 Switching Protocols` with the correct `Sec-WebSocket-Accept` and a data frame flows, with credentials; without them it is 401 before the upstream is contacted. Absolute-path API calls reach the upstream unrewritten (`path=/api/v1/languages`). **Caddy's `basic_auth` does not block the upgrade, so no cookie-based fallback is needed.** The remaining browser-specific question — whether a browser re-sends its *cached* basic-auth credentials on the WS handshake — needs a real deploy with real phonexa and is the one item left to confirm on the VPS; same-origin handshakes normally do.
- [x] 3.8 Rotate: change the token, regenerate the hash, confirm the old password stops working
