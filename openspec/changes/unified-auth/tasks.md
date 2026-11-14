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

- [ ] 3.1 `basic_auth` on the operator plane in `grind/Caddyfile`, username
      `operator`.
- [ ] 3.2 `grind/entrypoint.sh` derives the hash from `OPERATOR_TOKEN` at
      start, cost factor 10. No hash is ever typed into a file.
- [ ] 3.3 Delete `PHONEXA_AUTH_HASH`, the dedicated phonexa `basic_auth` block,
      and P35 and P36 from `docs/08-pitfalls.md` with a note of what retired
      them.
- [ ] 3.4 Gateway answers CORS preflight `OPTIONS` **before** the auth check.
      Verify with a real cross-origin request from the extension, not with
      `curl`.
- [ ] 3.5 Gateway strips any inbound copy of the verified-operator marker
      header before proxying. Verify by sending one from outside and asserting
      the service does not see it.
- [ ] 3.6 Verify the device plane is untouched: re-run 1.4, 1.5 and 2.4.

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
