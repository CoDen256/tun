Tasks are ordered by device safety, not by convenience. Sections 1–3 must
complete and verify in order. The hard constraint is: **the device never breaks.**

## 1. Move the device plane, change nothing about it

- [x] 1.1 Relocated the `/ota/*`, `/blob/*` and `/audio-manifest/*` blocks into
      `grind/Caddyfile` as a literal copy. Same token variable, same header
      match, same `GET|HEAD` restriction (P23), same `no-store` on the current
      descriptor (D26), same immutable caching, no `precompressed` (D49).
- [x] 1.2 `docs/11-ota-contract.md` untouched. If this change seems to
      require editing it, this change is wrong.
- [x] 1.3 Verified with `caddy adapt --adapter caddyfile` that the device blocks
      compile **before** every other route. Read the compiled output; do not
      infer it from file order.
- [x] 1.4 `bin/ota-verify.sh` against the moved gateway: **15 passed, 0 failed,
      1 SKIPPED** — the skip being D53's https assertion under `ALLOW_HTTP=1`,
      which now reports as a skip rather than inflating the count. Identical
      result before and after the move. **Re-verified 2026-11-14 after the
      payload under `mjolnir/data/` was cleaned up by an earlier session:
      same 15/0/1.** `mjolnir/data/` is gitignored (`/data/` in
      `mjolnir/.gitignore`), so the payload cannot be committed — recreate it
      with, from the repository root:

      ```sh
      cd mjolnir && npm install --omit=dev          # bin/* need `commander`
      cp base/smali.mjolnir.merged/assets/index.android.bundle /tmp/stock.js
      ALLOW_HTTP=1 ALLOW_NO_COMPANION=1 \
        bin/ota-publish.sh /tmp/stock.js b000001 "local regression payload"
      ALLOW_HTTP=1 bin/ota-verify.sh http://localhost:8080
      ```

      `ALLOW_NO_COMPANION=1` is required and safe: the stock bundle carries no
      boot-ok companion, and no patched device ever fetches this local
      `b000001`. The published bytes are the v1.5.12 base this contract was
      first measured against — sha256 `b3ad6aee…5741`, 6 003 611 B, exactly
      the pair recorded in `docs/11-ota-contract.md` §7. **`base/` is only
      read, never written** (D04). The D53 assertion is honest as written:
      the `http://` arm calls `skip()`, which increments only `SKIP`, and the
      summary prints "NOT a full proof of the device path" — the inversion
      noted in the handoff is fixed, verified by reading
      `mjolnir/bin/ota-verify.sh` and by the run reporting 15/0/1, not 16/0.
- [x] 1.5 **Byte-compared and identical.** Built a real 2 MB payload, captured
      body hashes and the HTTP/Cache-Control/Content-Type/Content-Length
      headers for `/ota/current.json`, a bundle, a blob and an audio manifest
      with the gateway in `mjolnir/`, then repeated after the move to
      `grind/`: every body hash and header set matches, and no-token is still
      401 with POST still 405. Original: byte-compare against
      the pre-move responses, headers included.
- [x] 1.6 Confirmed: `tun-caddy-1` mounts `mjolnir_caddy_data` and
      `mjolnir_caddy_config` — the same volumes, deliberately keeping the
      `mjolnir_` prefix now that the project is `grind`, because the name is
      an identity on disk rather than a description of where the compose file
      lives. No reissue.

## 2. Carve out device sync — before any operator auth change

- [x] 2.1 Gateway gates `/mjolnir/userdata/*` on `Bearer`, as its own block,
      matched before the operator plane. **Verified on the compiled config**,
      not on file order: `caddy adapt --adapter caddyfile` puts
      `/mjolnir/userdata/*` at route index 6, ahead of `/mjolnir`+`/mjolnir/*`
      at 10, every other operator route (12–16) and the catch-all at 17 — and
      note the compiled order is NOT the written order (Caddy re-sorts the
      `handle` group by matcher specificity, which moved `/ota/*` from first in
      the file to index 9). Inside the block the `302` route compiles at
      subroute index 0 and `reverse_proxy` at 1. Fail-closed at the gateway and
      not merely at the upstream: with `mjolnir-sync` **stopped**, an
      unauthenticated request still gets the 302 while a valid-token request
      502s.
- [x] 2.2 Set its expected value to the **current** `OPERATOR_TOKEN`. The
      matcher is `not header Authorization "Bearer {$OPERATOR_TOKEN}"` and
      `grind/compose.yaml` already passes `OPERATOR_TOKEN:
      ${OPERATOR_AUTH_TOKEN}` — the exact value the phone carries today. No
      compose, `.env` or device change. Task 7.1 changes only the right-hand
      side of that one matcher.
- [x] 2.3 Replayed through the gateway before and after, same host, same
      credential: GET 200 with `_justCreated`, re-read 200 without it, PATCH
      200 with all six status fields stripped and `realField` merged, PUT 405
      `method not allowed`, no-token **302** and bad-token **302** to
      `/mjolnir/login?next=%2Fmjolnir%2Fuserdata%2F<uid>` with an empty body.
      Codes, bodies and full header sets are byte-identical after normalising
      only the uid and the timestamps — **with one inherent exception, on the
      rejected path only**: the gateway now answers where it used to proxy, so
      the 302 carries `Server: Caddy` + `Content-Length: 0` instead of
      `Via: 1.1 Caddy` + `Transfer-Encoding: chunked`. Status, empty body and
      `Location` are identical; no device request takes that path. The
      `Location` value is reproduced via the literal matched prefix plus
      `{http.request.uri.path.2}` because Caddy has no url-escaping
      placeholder (both `{...path.escaped}` and `uri replace "/" "%2F"` were
      tried and neither works). Separately, the whole compiled config was
      diffed against `HEAD`'s: the ONLY difference anywhere is this gate, so
      `/ota/*`, `/blob/*`, `/audio-manifest/*` and `handle_errors` are
      provably untouched.
- [x] 2.4 **Done on the real handset (Redmi Note 7, `107e47a6`), 2026-11-14.**
      `adb reverse tcp:8080 tcp:8080`, the app's own progress-sync companion
      driven in-process (MIUI refuses `adb shell input` with
      `SecurityException: INJECT_EVENTS`, so the account screen's "Pull/Push
      cloud progress" buttons were replayed by calling the same two globals
      the buttons call — no new request shape). The gateway access log shows
      `User-Agent: okhttp/4.9.2` — React Native's fetch, not curl:
      `GET /mjolnir/userdata/q1Px3MgvOZVBdkpM9DKmFBnDnMi1 -> 200` then
      `PATCH … -> 200` with `bytes_read: 8739`. Device-side logcat:
      `[mjolnir-progress-sync] restored cloud progress` /
      `pushed cloud progress`. Postgres confirms the write landed:
      `userdata.updated_at` for that uid moved
      `2026-11-09 19:56:03.806266+00` → `2026-11-14 11:44:50.659381+00` (the
      gateway's PATCH timestamp to the millisecond) and
      `userdata_history` gained row id 87, 48 → 49 rows for that uid. The
      `doc` md5 is unchanged, correctly: the device pulled and pushed back the
      same state. Rejection was also exercised from the handset — no token and
      a wrong token both give `302` to
      `/mjolnir/login?next=%2Fmjolnir%2Fuserdata%2F<uid>` with
      `Content-Length: 0` (P46).

      **The one thing this does NOT prove, and it matters for the cutover.**
      The sync base URL and token are baked into the JS bundle at assemble
      time, *not* read from `config.json` — contract §5's escape hatch covers
      the OTA channel only, and native requires `https` there (D53), so it
      cannot point at a plain-HTTP local gateway at all. Redirecting the
      device therefore meant sideloading a copy of its own production bundle
      with the two literals rewritten. The production bundle `b000052` on the
      handset carries `SYNC_TOKEN = 'changeme'`. **Whether production's
      `OPERATOR_AUTH_TOKEN` is also `changeme` was NOT verified** — if it is
      not, 2.2's matcher will 302 the real device the moment this gateway
      deploys. Check it on the VPS before cutover.
- [x] 2.5 Gate cleared: 2.3 and 2.4 both pass, so section 3 may begin — with
      the production-token check in 2.4 carried into `DEPLOY.md` §8 as a
      pre-cutover step, because it is a deploy-time fact and not a code one.

## 3. Operator plane

- [x] 3.1 `basic_auth` on the operator plane in `grind/caddy/Caddyfile`,
      username `operator` — the WHOLE plane, not just phonexa. One
      `(operator_gate)` snippet, `import`ed by seven blocks: `/mjolnir`
      + `/mjolnir/*`, `/builder` + `/builder/*`, `/stabbur/*`, `/smia/*`,
      `/phonexa/*`, `/shadow/*` and `/adminer/*`. Adminer had never been gated
      at all; it is now. Verified on the COMPILED config, not the file: every
      one of compiled route indices 10-16 contains an `authentication`
      handler, and none of 6-9 (the device plane) does. Live, with no
      credential, all seven answer **401**; with `-u operator:testoperator`,
      `/stabbur/ui` `/smia/ui` `/phonexa/` `/shadow/` `/adminer/` answer 200
      and `/mjolnir/` `/builder/` answer 302 (hub's and builder's own login
      redirect, which section 4 removes — the gateway gate passed).

      **The status page is part of this.** `handle_errors` catches
      `basic_auth`'s 401, so the full 7 019-byte status page — every zone's
      prefix, label and description — was being served to clients with no
      credential, and a wrong password rendered "phonexa is not responding"
      with a healthy container struck out as down. A `handle_errors 401 403`
      branch now answers `respond "" {err.status_code}`: 401 with
      `Content-Length: 0`. `WWW-Authenticate: Basic realm="restricted"`
      survives it (verified live — basic_auth sets the header before returning
      the error and `respond` does not clear it), so the browser prompt still
      works. An upstream's own 401 is NOT affected: it is a proxied response,
      not a Caddy error, and still arrives with its body
      (`{"error":"unauthorized"}`, `Server: Werkzeug`, `Via: 1.1 Caddy`).

      **Two things deliberately left ungated,** both stated as decisions:
      the final `handle {}` catch-all, which serves one hard-coded word,
      reaches nothing, and is the path an ACME HTTP-01 challenge would use —
      an expired certificate is a worse failure than an unauthenticated 404;
      and the five bare-prefix `redir … 308` routes (compiled indices 0-4),
      which were already unauthenticated redirects and carry no content.

      **Proven to add no failure point** (the spec requirement): with every
      application service AND postgres stopped — `caddy` the only container
      running — all seven zones still answered 401 unauthenticated, an
      authenticated `/phonexa/` answered 502, and the device plane still
      served (`/ota/current.json` 200 with the token, 401 without).
- [x] 3.2 `grind/entrypoint.sh` derives the hash from `OPERATOR_TOKEN` at
      start, cost factor 10. No hash is typed into a file. **It was already
      doing this and the result was dead:** the script exported
      `OPERATOR_HASH` while the Caddyfile still read the hand-made
      `PHONEXA_AUTH_HASH`, so the derivation ran on every boot and nothing
      consumed it. `(operator_gate)` now reads
      `{$OPERATOR_HASH:<locked default>}`, which is what makes the file
      load-bearing; a comment in the entrypoint records what consumes it.
      The variable name is plane-wide because the gate is: it had stopped
      being phonexa's even before this change, since it also gated `/shadow/*`.
- [x] 3.3 `PHONEXA_AUTH_HASH` is gone as a configured value: deleted from the
      root `.env`, from `grind/compose.yaml`'s `environment:` (the
      `${PHONEXA_AUTH_HASH:-$$2a$$14$$…}` line with its duplicated
      fail-closed default), and from `mjolnir/.env.example`, whose
      "/phonexa gate" section is replaced by an "operator gate" section that
      says there is nothing to set. The dedicated phonexa `basic_auth` block
      and shadow's copy of it are both replaced by `import operator_gate`.
      Verified it is not merely unused but absent:
      `docker compose exec caddy printenv PHONEXA_AUTH_HASH` exits non-zero.
      `bin/check-standards.sh` now has the variable in its `dead` list — the
      file's own comment said to add it "then", and this is then — so it
      FAILS if a hash is ever typed into a `.env.example` again.
      P35 and P36 are **annotated RETIRED in place** in `docs/08-pitfalls.md`,
      naming what retired them, per this repository's convention of marking
      rather than deleting (the task text's "delete" predates it). Both
      annotations keep the underlying Caddy/compose traps as facts and retire
      only their live instances, which is the accurate claim. `DEPLOY.md` §4
      is rewritten from "derive a hash by hand" to "there is nothing to
      configure", its auth routing table now shows the gateway gate on all
      seven zones, and its stale `ota-verify` expectation (16/0) is corrected
      to 15/0/1.
- [x] 3.4 The gateway answers the CORS preflight **before** the auth check.
      In `(operator_gate)`, wrapped in `route` so the written order is the
      compiled order: CORS response headers, then the reflected
      `Access-Control-Allow-Headers`, then `respond "" 204`, then
      `basic_auth`. Confirmed in the compiled JSON — subroute indices 0, 1, 2,
      3 in exactly that order, inside every one of the seven operator blocks.

      Live, with **no credential**, against `/smia/translate`,
      `/stabbur/api/notes`, `/phonexa/api/v1/x`, `/mjolnir/x` and `/adminer/`:

      ```sh
      curl -X OPTIONS -H 'Origin: https://example.com' \
           -H 'Access-Control-Request-Method: POST' \
           -H 'Access-Control-Request-Headers: authorization,content-type' \
           http://localhost:8080/smia/translate
      ```
      → `204`, `Access-Control-Allow-Origin: *`,
      `Access-Control-Allow-Methods: GET, HEAD, POST, PUT, PATCH, DELETE,
      OPTIONS`, `Access-Control-Allow-Headers: authorization,content-type`
      (reflected), `Access-Control-Max-Age: 600`,
      `Vary: Origin, Access-Control-Request-Method,
      Access-Control-Request-Headers`, empty body.

      The exemption is the actual CORS definition of a preflight, not "method
      OPTIONS": a bare `OPTIONS` with no `Origin`, and an `OPTIONS` with
      `Origin` but no `Access-Control-Request-Method`, both still answer
      **401**. With no `Access-Control-Request-Headers` asked, the fallback
      `Authorization, Content-Type` is sent — it cannot be `*`, because the
      Fetch standard excludes `Authorization` from that wildcard, which is the
      one header the operator credential travels in. And the real request
      after the preflight is still authenticated: `POST /smia/translate` with
      no credential is 401 at the gateway.

      **What this does NOT prove.** The task says "from the extension, not
      with `curl`". hover-translate is not in this repository (D154) and there
      was no browser in this session, so the browser-driven check is still
      open; it is task 6.2's, which has to run from the extension anyway.
      What is proven is the protocol: a credential-free preflight gets a 2xx
      with the access-control-* headers a browser needs, which is the exact
      failure mode the task exists to prevent.
- [x] 3.5 The gateway strips any inbound copy of the verified-operator marker
      header. The header is `X-Tun-Operator` (section 4 sets it; the strip
      lands first on purpose, so the bypass window never exists). ONE
      site-level `request_header -X-Tun-Operator`, written before the device
      blocks, compiling to route index 5 — **ahead of the entire `handle`
      group** (verified in the compiled JSON), so it covers every zone
      INCLUDING the device plane. `mjolnir-sync` adopts the shared check in
      4.1, so a forged marker aimed at `/mjolnir/userdata/*` has to be
      stripped too, and one unconditional directive is the only version of
      this that cannot be forgotten for one block.

      **Verified against a real echo upstream, not by reading.** A
      header-echoing HTTP server was attached to the compose network with
      `--network-alias stabbur-backend` while `stabbur-backend` was stopped,
      so the production Caddyfile proxied to it with no config edit. Sending
      `-H 'X-Tun-Operator: 1' -H 'x-tun-operator: forged-lowercase'` through
      `/stabbur/probe`, the upstream saw: Host, User-Agent, Accept,
      Authorization, Via, X-Forwarded-{For,Host,Prefix,Proto},
      Accept-Encoding — and no `x-tun-operator` in any casing. Repeated on the
      DEVICE path with the echo aliased as `mjolnir-sync`: same result,
      marker absent. **Non-vacuous control:** in the same request,
      `X-Not-Stripped: yes` and the near-miss `X-Tun-Operatorz: control` both
      arrived intact, so the test is observing a deletion and not a header
      that never travels.
- [x] 3.6 The device plane is untouched. Three independent checks:

      1. **Compiled config.** Adapted HEAD's Caddyfile and the new one with
         identical environment and diffed per route: `/ota/*`, `/blob/*`,
         `/audio-manifest/*` and `/mjolnir/userdata/*`, and the device branch
         of `handle_errors`, are **byte-identical** apart from Caddy's
         auto-generated mutual-exclusion `group` id (`group16` → `group24`,
         renumbered because the snippet adds groups; all four device routes
         still share one group, as before). Compiled indices unchanged: 6, 7,
         8, 9. No `authentication` handler and no `Access-Control` header
         anywhere inside them.
      2. **Live A/B on fresh state.** A second gateway was run on port 8081
         from `git show HEAD:grind/caddy/Caddyfile`, on the same network and
         the same `mjolnir/data`, and a 12-request device probe was replayed
         against both with a fresh uid each (`uaHEAD1` / `uaNEW1`): GET,
         re-read, PATCH, PUT, no-token, bad-token, `/ota/current.json` with
         and without the token, `POST /ota/current.json`, and a missing
         object under each of `/ota`, `/audio-manifest` and `/blob`. **All 12
         responses byte-identical** — bodies and every header except `Date`
         and `Alt-Svc`, `Server`/`Via`/`Content-Length`/`Cache-Control`
         included. (1.4 and 1.5's checks, re-run as a differential.)
      3. **`ota-verify`.** `cd mjolnir && ALLOW_HTTP=1 bash
         bin/ota-verify.sh http://localhost:8080` → **15 passed, 0 failed, 1
         SKIPPED**, the same as before the change. 16/0 would mean D53's
         assertion had been re-inverted.

      **Not re-run: 2.4, the handset.** There was no phone in this session.
      That is the one check 3.6 asks for that is still open, and it is open
      for the same reason it was in section 2 — it needs the device. The A/B
      in (2) covers the gateway's half of it byte-for-byte, including the
      rejected path; what it cannot cover is okhttp's own behaviour, which
      2.4 already proved against a gateway whose device routes are now
      provably identical.

## 4. One check per service

- [ ] 4.1 `libs/pyservice/auth.py` and `libs/jsservice/auth.js`: accept the
      gateway marker, or `INTERNAL_TOKEN`; otherwise 401.
- [ ] 4.2 Delete `stabbur/auth.py`, `smia/auth.py`, `hub/src/auth.js`,
      `builder/src/auth.js` and their login pages.
- [ ] 4.3 phonexa and shadow adopt the same check. Neither has auth of its own
      today; phonexa exposes destructive import/export endpoints.
- [ ] 4.4 Adminer is behind the gate. It has never been gated.
- [ ] 4.5 Delete every carve-out: `/ui`, `/blob/*`, the TTS preview, `OPTIONS`.
- [ ] 4.6 `INTERNAL_TOKEN` replaces the per-pair tokens on builder → stabbur,
      stabbur → smia, shadow → smia, shadow → phonexa. Delete
      `STABBUR_AUTH_TOKEN` and `SMIA_AUTH_TOKEN` from all five `.env` files.
- [ ] 4.7 No service publishes a port outside the loopback interface in
      production. The marker-header trust model depends on it.

## 5. UI at the prefix root

- [ ] 5.1 stabbur and smia serve their UI at `/` and assets under `/static/`,
      following phonexa's existing `X-Forwarded-Prefix` pattern.
- [ ] 5.2 `libs/pyservice/prefix.py`: one implementation replacing three
      near-copies.
- [ ] 5.3 Verify `https://<host>/stabbur/` returns the UI, not 401. This is a
      live defect today.
- [ ] 5.4 Update every link to `/stabbur/ui` and `/smia/ui`, including
      `hub/src/layout.js:317` and `STABBUR_UI_BASE`'s consumers. Delete
      `STABBUR_UI_BASE`.
- [ ] 5.5 Supersede D46's `/ui` convention in the ADR log.

## 6. Clients

- [ ] 6.1 hover-translate holds one `operatorToken`, sent to one origin,
      replacing `smiaToken` and `stabburToken`.
- [ ] 6.2 Verify translation and capture both work from the extension, and
      that each degrades independently when its service is stopped.

## 7. Optional, later, device-coordinated

- [ ] 7.1 Give `SYNC_TOKEN` a value distinct from `OPERATOR_TOKEN`; push via
      `config.json` (D39) using `patches/js/config-rotate.js`; switch the
      gateway's expected value only once devices have taken it.
- [ ] 7.2 Until 7.1 is done, record in `DEPLOY.md` that rotating
      `OPERATOR_TOKEN` requires the same `config.json` push, because the device
      still carries that value.

## 8. Documentation

- [ ] 8.1 Collapse D-H6, D-N1 and D-S6 into one ADR; supersede D148's auth
      half; supersede D46's `/ui` convention.
- [ ] 8.2 New ADR: three zones, three credentials, auth inside the gateway, and
      why `forward_auth` was rejected on isolation grounds.
- [ ] 8.3 Record the `SYNC_TOKEN` = `OPERATOR_TOKEN` finding and its resolution
      in `docs/08-pitfalls.md` — it was invisible for as long as it existed.
- [ ] 8.4 `DEPLOY.md`: one login, one credential, what rotating it affects.
