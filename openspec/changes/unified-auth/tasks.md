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

- [x] 4.1 `libs/pyservice/auth.py` and `libs/jsservice/auth.js`: accept the
      gateway marker, or `INTERNAL_TOKEN`; otherwise 401. ONE implementation
      each, both replacing what was there rather than sitting beside it.
      The marker is `X-Tun-Operator` and the gateway now **sets** it, in two
      places and only after a credential has been checked: inside
      `(operator_gate)`'s `route`, immediately after `basic_auth` — verified
      on the COMPILED config, where every one of the seven operator routes
      (indices 10–16) reads `… authentication, headers[X-Tun-Operator],
      reverse_proxy` in that order — and inside the `/mjolnir/userdata/*`
      block after the device's `Bearer` check, where the compiled subroute is
      `redir(bad token)` at index 0 and `headers[X-Tun-Operator] +
      reverse_proxy` at index 1. The device plane proper (`/ota/*`,
      `/blob/*`, `/audio-manifest/*`, compiled 7/8/9) contains neither an
      `authentication` handler nor the string `X-Tun-Operator` and is
      **byte-identical to `HEAD`'s compiled routes**, `handle_errors`
      included.
- [x] 4.2 Deleted. `stabbur/auth.py` and `smia/auth.py` are gone from the
      tree and from both Dockerfiles' `COPY` lines (the build fails loudly
      otherwise, which is how the second one was caught).
      `hub/src/auth.js` and `builder/src/auth.js` had already been merged
      into `libs/jsservice/auth.js` by zone-isolation; what was deleted there
      is the mechanism — `renderLoginPage`, `handleLoginPost`, the
      `operator_token` cookie, and the `/mjolnir/login` and `/builder/login`
      GET/POST routes. Both services answered `302 → /…/login` for a page
      load before this; both now answer `401 {"error":"unauthorized"}`, and
      through the gateway with a credential both answer **200** where they
      answered 302 before (measured: `/mjolnir/` and `/builder/`
      `-u operator:testoperator` → 200).

      **One real hole was created and then caught by the service's own
      test.** hub checked auth twice: once inside the `/mjolnir/workbench`
      branch, which returns before the per-route gate, and once below it.
      Deleting the first copy left the embedded workbench and
      `/mjolnir/workbench/api/patches` open. The fix is one check placed
      above every branch (`/mjolnir/_health` is the only thing above it),
      which is the version that cannot be half-removed. Verified after the
      fix: `/mjolnir/workbench/` with no credential → **401**, with the
      operator credential → 200.
- [x] 4.3 phonexa and shadow adopt the same check — a real tightening, since
      neither had any auth of its own. Proven non-vacuous on the destructive
      endpoint the task names: direct to the container on the compose
      network, `POST /api/v1/admin/export` → **401** with no credential and
      **200** with `X-Tun-Operator: 1`. Same for `GET /` on both services
      (401 → 200). `/_health` stays open on both, which is why the
      containers are still `healthy`.
- [x] 4.4 Verified, not redone: `/adminer/` answers **401** with no
      credential and **200** with `-u operator:testoperator`. Section 3.1
      put it behind the gate; adminer is a third-party image with no code of
      ours in it, so the gateway is the whole of its auth and there is
      nothing to adopt in 4.1's sense.
- [x] 4.5 Every carve-out deleted, and each one re-tested in the direction
      that would hide a mistake:
      * `/ui` — gone as a route as well as an exemption (5.1).
        `/stabbur/ui` and `/smia/ui` are **404**.
      * `/blob/<sha256>` — stabbur's OWN carve-out, deleted. Direct to the
        container with no credential: **401**. This is NOT the gateway's
        device-plane `/blob/*`, which is a different route in a different
        zone and is untouched — proven by the compiled-config diff above and
        by `ota-verify` still passing its blob assertions.
      * `/api/enrich/tts/preview/<sha256>` — deleted; stabbur's own tests
        now send the credential, and failed loudly (401 vs 502/200) until
        they did.
      * `OPTIONS` — smia's blanket method exemption deleted. Direct to the
        container, a full preflight shape now gets **401**; through the
        gateway the same preflight gets **204** with the access-control-*
        headers, because 3.4 answers it before the auth check. The real
        `POST /smia/translate` with no credential is still 401.
- [x] 4.6 `INTERNAL_TOKEN` replaces the per-pair tokens. One value in the
      root `.env`, passed to all seven application services;
      `STABBUR_AUTH_TOKEN` and `SMIA_AUTH_TOKEN` are deleted from every
      `.env`, `.env.example` and `compose.yaml`, and from the code that read
      them (`stabbur/smia_client.py`, `shadow/app.py`,
      `builder/src/config.js`, `hub/src/config.js`, both stabbur scripts).
      Both names are added to `bin/check-standards.sh`'s `dead` list, so
      retyping either into a `.env.example` is a FAIL rather than a
      discovery. Exercised live, end to end: builder → stabbur
      (`GET /api/notes` 200 in stabbur's log, forecast renders), stabbur →
      smia (`POST /stabbur/api/enrich/inflections` returns smia's own
      provider list), shadow → smia (`/shadow/transcribe/providers` 200).
- [x] 4.7 Asserted, as a check rather than a convention —
      `bin/check-standards.sh` now fails if any compose file except
      `grind/compose.yaml` publishes a mapping whose host IP is not
      `127.0.0.1`/`::1`, including the bare `"5056:5056"` form. It is
      TEXT-level and covers every file, because the rendered-config check
      beside it sees only the root project and is blind to a per-project
      `compose.override.yaml` — which is exactly where a dev port gets
      added. Proven non-vacuous by breaking it on purpose twice
      (`0.0.0.0:5056:5056` and `5056:5056` both FAIL, exit 1) and restoring.
      Today: `grind` publishes 80/443, the root `adminer` publishes
      `127.0.0.1:8082`, every project override publishes `127.0.0.1:…`, and
      no project `compose.yaml` publishes a service port at all.

## 5. UI at the prefix root

- [x] 5.1 stabbur and smia serve their UI at `/` with assets under
      `/static/`, via `Flask(__name__, static_folder="ui",
      static_url_path="/static")` — Flask's own static handler, so there is
      no hand-rolled path join to get wrong. The `/ui` and `/ui/<path>`
      routes are deleted. Live through the gateway with the operator
      credential: `/stabbur/` and `/smia/` return the HTML with
      `__*_PREFIX__` substituted (`<link rel="stylesheet"
      href="/stabbur/static/ui.css">`), and all four of
      `/stabbur/static/ui.{css,js}` and `/smia/static/ui.{css,js}` return
      200 with the right content types.

      **The token box is gone from both pages**, with its localStorage
      persistence and its `Authorization` header. That is the point of the
      carve-out deletion: the credential is the browser's now.
      `authHeaders()` is kept as a function returning `{}` so the ~55 call
      sites stay one edit away from any future header.
- [x] 5.2 `libs/pyservice/prefix.py`: `forwarded_prefix()`, `render_page()`
      and `safe_page_path()`, replacing FOUR near-copies (stabbur's and
      smia's inline `request.headers.get("X-Forwarded-Prefix", "")…`,
      phonexa's `_prefix()`/`_serve_page()` pair and shadow's copy of that
      pair, including its duplicate `safe_join`-then-`abort(404)` block).
      phonexa and shadow keep a one-line `_prefix = forwarded_prefix` alias
      because each has its own SECOND prefix to substitute
      (`__SHADOW_PREFIX__` / `__PHONEXA_PREFIX__`), which is per-service
      data, not another implementation.
- [x] 5.3 Verified. `/stabbur/` with no credential → 401 (the gateway), with
      `-u operator:testoperator` → **200 and the UI**. Before this change it
      was 401 with a correct credential too, because stabbur had no route at
      `/` at all — that is the live defect the task names, and it is fixed.
      All seven zones measured together: 401 unauthenticated / 200
      authenticated, `/mjolnir/` and `/builder/` included (they were 302
      before 4.2).
- [x] 5.4 Every link updated and `STABBUR_UI_BASE` deleted —
      `libs/jsservice/layout.js`'s `ZONES` (the file `hub/src/layout.js:317`
      became when zone-isolation moved it; the two entries are now
      `/stabbur/` and `/smia/`), the gateway status page's zone table,
      `docs/02-services.md`, `DEPLOY.md`, `mjolnir/DEPLOY.md`,
      `mjolnir/.env.example` and both services' own nav. Verified by reading
      the RENDERED pages, not the source: `/mjolnir/`, `/builder/` and the
      status page served for an unreachable zone all emit
      `href="/stabbur/"` and `href="/smia/"` and no `/ui` variant.
      The variable is gone from `mjolnir/compose.yaml`; hub derives
      `${TUN_PUBLIC_BASE}/stabbur/` in `config.js`, which is D151's rule
      (derivable → computed, typed nowhere). `STABBUR_UI_BASE` was already
      in `check-standards.sh`'s `dead` list and stays there.
- [x] 5.5 D46 is annotated in place in `docs/07-decisions.md` — marked, not
      deleted, per this repository's convention. The annotation records that
      the `/ui` MOUNT POINT is superseded, why it existed (the bare prefix
      was a JSON API root that 401'd a plain navigation, and the page had to
      load unauthenticated so a token could be pasted into it), that both
      reasons are gone, and that `/mjolnir/ui` and `/builder/ui` remain as
      aliases for their bare prefixes — which is all they ever were. The
      rest of D46, and D157/D158's earlier amendment of it, stand.

      Not done here: 8.1 also asks for D46's `/ui` convention to be
      superseded. This is that work; 8.1 remains open for its other two
      halves (collapsing D-H6/D-N1/D-S6, and D148's auth half).

## 6. Clients

**Scope note (D154).** `hover-translate` is NOT in this repository — it is a
fork, standalone, never deployed. The work for both tasks therefore lives in
`/home/coden/dev/hover-translate`, on branch `extension-operator-credential`,
commit `4d870d4`, **committed and deliberately unpushed** (operator
direction, 2026-11-14). Ticked here because the tasks are done, not because
the code is in this tree.

- [x] 6.1 **Done** (`4d870d4`, 5 files, +197/-36). One `operatorToken`
      replaces `smiaToken`+`stabburToken`, sent as
      `Authorization: Basic base64("operator:<token>")` — Basic, not Bearer,
      because the gateway's operator gate is Caddy `basic_auth` with the
      username hardcoded `operator` (3.1). One origin: `<host>/smia/…` and
      `<host>/stabbur/…`. A legacy two-token record migrates lazily on read
      (smia's value wins, stabbur's is the fallback) rather than being
      dropped; the rewrite is idempotent. Settings UI collapsed to one field.
      `npm run build` exits 0 for both workspaces; `tsc --noEmit` clean;
      `grep -o Bearer extension/dist/*.js` finds nothing.
- [x] 6.2 **Independent degradation CONFIRMED — it was already true, and was
      not observable.** No module imports both clients; translation is
      content-script → `SmiaClient` → `/smia`, capture is
      `chrome.runtime.sendMessage` → `OutboxService` → `StabburClient` →
      `/stabbur`. Proven by stubbing a 502 on one prefix at a time against
      the real clients: smia down → `SmiaTransportError` → Google fallback,
      capture unaffected (`pending=0 failed=0`); stabbur down → capture
      stays in the outbox `failed=1` for retry, translation `OK`.
      **What was fixed:** "Test connection" probed smia only, so a
      stabbur-only outage was invisible — added `StabburClient.testConnection()`
      and the form now shows two independent results.
      **NOT verified, stated plainly:** no browser was driven. The extension
      was never loaded unpacked, no real hover-translate or capture was
      performed, and no real 401/CORS preflight from a content script was
      observed. **This commit targets the POST-§3 gateway and will 401
      against a pre-§3 one** — so it must not be loaded until the cutover
      lands.

## 7. Optional, later, device-coordinated

- [ ] 7.1 Give `SYNC_TOKEN` a value distinct from `OPERATOR_TOKEN`; ~~push via
      `config.json` (D39) using `patches/js/config-rotate.js`~~; switch the
      gateway's expected value only once devices have taken it.

      **CORRECTION (8.3, verified 2026-11-14): `config.json` CANNOT carry
      `SYNC_TOKEN`.** The value is baked into the JS bundle at assemble time
      (`patches/js/2080-progress-sync-shim.edited.js:57`, substituted by
      `substituteBakedPlaceholders` in `mjolnir/src/commands/assemble.js`;
      defaulted from `process.env.OPERATOR_AUTH_TOKEN` at
      `mjolnir/src/commands/ui.js:983`). D39 / contract §5's escape hatch
      covers the **OTA channel's** URL and token only, and no JS-side reader
      for `config.json` exists — the patch's own comment says so. 7.1 is
      therefore an **assemble + publish + confirm-the-handset** operation,
      not a config push. Recorded as **P48**.
- [x] 7.2 Done by 8.4 — but recording the **corrected** mechanism, not the
      one this line asked for. Root `DEPLOY.md` §4 now carries a dedicated
      "Rotating `OPERATOR_AUTH_TOKEN`" subsection with a per-consequence
      table and the hazard stated as a block quote: rotation requires a **new
      OTA bundle publish**, not a `config.json` push. `mjolnir/DEPLOY.md`'s
      old contradicting claim ("regenerate the hash in the same change") is
      struck through and corrected in place.

## 8. Documentation

- [x] 8.1 **D159** in `docs/07-decisions.md` collapses D-S6, D-N1 and D-H6
      into one ADR: the four implementations are deleted, `libs/pyservice/
      auth.py` + `libs/jsservice/auth.js` are the only ones left, one rule
      (gateway marker or `Bearer INTERNAL_TOKEN`), every carve-out deleted,
      phonexa/shadow/adminer gated for the first time. Superseded rows
      **marked, not deleted**: D95 (D-H6's cookie + login pages) and D96
      (`/login` path namespacing) are marked SUPERSEDED by D159; D85's
      `STABBUR_AUTH_TOKEN` is marked a retired name; D113 is AMENDED with
      the P48 finding; **D148's auth half** is marked superseded by D160
      with its no-longer-true rotation clause called out. D46's `/ui`
      convention was already annotated by 5.1/5.5 — verified, not
      duplicated.
- [x] 8.2 **D160** in `docs/07-decisions.md`: the three zones and their three
      credentials, `basic_auth` inside the gateway with the hash derived at
      boot at cost 10, and `vakt`/`forward_auth` withdrawn **because Caddy
      has no `forward_auth` response cache** — one container down would 401
      all eight zones at once, the exact shared failure point
      `zone-isolation` exists to remove. Also records the two ordering rules
      (preflight answered before the auth check; `handle_errors 401 403` with
      an empty body) and that compiled route order != file order.
- [x] 8.3 **P48** (the baked `SYNC_TOKEN`, with the rotation correction),
      **P49** (`handle_errors` serving the full status page to
      unauthenticated clients) and **P50** (hub's duplicated auth check
      leaving the embedded workbench open) added to `docs/08-pitfalls.md`
      under "Will bite you". All three are the house's "failure reports
      success" class.
- [x] 8.4 Root `DEPLOY.md`: the `.env` key table now names `INTERNAL_TOKEN`
      and marks `STABBUR_AUTH_TOKEN`/`SMIA_AUTH_TOKEN` retired; §4 gained the
      "Rotating `OPERATOR_AUTH_TOKEN`" subsection (see 7.2); §6's route table
      shows one shared check behind the gate instead of three per-service
      ones. `mjolnir/DEPLOY.md` no longer documents the hand-made hash: its
      `/phonexa` gate section is struck through and replaced with a pointer
      to the root file plus the facts that survived, and the gateway's move
      to `grind/` is flagged in its header banner.

      Also corrected while verifying: `docs/02-services.md` (adminer no
      longer "unauthenticated at the gateway", the `/ui` claim, the gateway's
      location, `/mjolnir/userdata/*` and `/shadow/*` added to the route
      table), `docs/06-smia.md` (`GET /ui` -> `GET /`), `docs/README.md`
      (grind/shadow/postgres/libs exist now) and
      `docs/14-restructure-handoff.md` (§1 counts, §5, §8).
