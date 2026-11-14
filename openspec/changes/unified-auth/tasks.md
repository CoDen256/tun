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
      result before and after the move.
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

- [ ] 2.1 Gateway gates `/mjolnir/userdata/*` on `Bearer`, as its own block,
      matched before the operator plane.
- [ ] 2.2 Set its expected value to the **current** `OPERATOR_TOKEN`. The
      device sends exactly what it sends today. Nothing on the device changes.
- [ ] 2.3 Capture a real device sync request and response before this step;
      replay after. Identical, or stop.
- [ ] 2.4 Verify a real device completes a sync round-trip.
- [ ] 2.5 Only once 2.3 and 2.4 pass does section 3 begin. This is a gate, not
      a guideline.

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
