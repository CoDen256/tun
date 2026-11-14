## 1. Caddyfile

- [x] 1.1 Delete the `{$PHONEXA_SITE_ADDRESS:phonexa.localhost}` site block at the
      bottom of `caddy/Caddyfile`, keeping its `basic_auth` account and the locked
      default hash for reuse below
- [x] 1.2 Inside the main site block, with the other `handle` blocks and before
      the catch-all: `redir /phonexa /phonexa/ 308` then
      `handle_path /phonexa/* { basic_auth { operator {$PHONEXA_AUTH_HASH:<locked
      default>} } ; reverse_proxy {$PHONEXA_UPSTREAM:phonexa-backend:5050} {
      header_up X-Forwarded-Prefix /phonexa } }`
- [x] 1.3 Replace the "phonexa is NOT routed here" comment with one describing the
      new block: why a prefix works now (phonexa's `path-prefix-routing`), why the
      `redir` is load-bearing (relative assets), and why the gate is at the proxy
- [x] 1.4 Confirm with `caddy adapt --adapter caddyfile` that the phonexa route
      lands **before** the catch-all, the same index check D99 established —
      **done: `/phonexa/*` is route 11 (authentication + rewrite + reverse_proxy),
      the catch-all is route 14; the `redir` is route 1**

## 2. Compose and config

- [x] 2.1 `compose.yaml`: remove `PHONEXA_SITE_ADDRESS` from caddy's
      `environment:`; keep `PHONEXA_UPSTREAM` and the valueless `PHONEXA_AUTH_HASH:`
      key form, and update the long comment that explains the valueless form (its
      "empty site address makes Caddy read the block as a global options block"
      reasoning no longer applies to the address, but the absent-vs-empty fallback
      rule still applies to the hash)
- [x] 2.2 `.env.example`: remove `PHONEXA_SITE_ADDRESS` and the DNS prerequisite;
      keep the hash, the single-quote rule and the rotation rule; note the shared
      origin
- [x] 2.3 `DEPLOY.md`: rewrite "Optional: phonexa on its own hostname" as
      "Optional: phonexa at `/phonexa`" — drop the DNS record step, keep
      `caddy hash-password`, quoting, rotation and what the browser shows; state
      that phonexa now shares the main origin with hub and builder

## 3. Verification

- [x] 3.1 `caddy validate` with phonexa vars unset, and with them set
- [x] 3.2 Existing-route regression: `/ota/…`, `/blob/…`, `/audio-manifest/…`,
      `/mjolnir/ui`, `/builder/ui`, `/stabbur/ui`, `/smia/ui`, `/adminer/` respond
      exactly as before — **done by running the pre-change Caddyfile side by side
      and diffing every route's status code: identical, including the `/ota` token
      check and the catch-all**
- [x] 3.3 With a real hash and a stand-in upstream: no creds → 401, wrong password
      → 401, `operator` + token → proxied; a phonexa admin endpoint without creds
      → 401; a static asset without creds → 401
- [x] 3.4 Hash unset → every `/phonexa/*` request 401 (fail closed)
- [x] 3.4b **Env-var DELIVERY in the deployment mode actually used.** Added
      2026-11-13 after a live 401: `docker compose exec caddy printenv
      PHONEXA_AUTH_HASH` from the directory you deploy from (`tun`, not
      `mjolnir`). The valueless key form passed 3.1-3.4 standalone and still
      dropped the variable under `include:` — a correct hash in `mjolnir/.env`
      401'd every login. compose now uses `${VAR:-<locked default>}`; verified
      from `tun` with the hash in `mjolnir/.env`, in `tun/.env`, and in neither
      (locked default, still fails closed)
- [x] 3.5 Prefix stripping: a request to `/phonexa/api/v1/languages` arrives at the
      upstream as `/api/v1/languages` with `X-Forwarded-Prefix: /phonexa`
- [x] 3.6 `/phonexa` (no trailing slash) → 308 → `/phonexa/`
- [x] 3.7 WebSocket: `/phonexa/stream` upgrades, arrives at the upstream as
      `/stream`, and a data frame flows; rejected without credentials — **done
      against the real phonexa: same f1/f2 frame as a direct `/stream` capture**
- [x] 3.7b **WebSocket with BROWSER-style headers, not just a client library's.**
      Added 2026-11-13 after the mic tracker failed live with "Invalid frame
      header" while 3.7 passed: a browser offers
      `Sec-WebSocket-Extensions: permessage-deflate`, flask-sock accepts it and
      sets RSV1 on every frame; the Node client used in 3.7 never offered it, so
      the compressed path was never exercised through the real edge. Caddy now
      strips the offer upstream (`header_up -Sec-WebSocket-Extensions`), so
      frames are plain. Verified with a raw handshake advertising exactly what
      Chrome advertises: RSV1=0 and frames flow
- [x] 3.8 End-to-end against a real phonexa built from its `path-prefix-routing`
      branch: every page loads, audio plays, mic tracker connects — **done: all 9
      pages 200, a prefixed `representativeAudioUrl` serves audio/mpeg, and zero
      requests reached the catch-all**
- [x] 3.9 Rotate: change the token, regenerate the hash, confirm the old password
      stops working

## 4. Sequencing

- [x] 4.1 Do not merge before phonexa's `path-prefix-routing` has landed
      (`design.md` §6) — **satisfied: phonexa's change landed first**
