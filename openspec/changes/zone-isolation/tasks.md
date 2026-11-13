## 1. Serve-before-migrate

- [x] 1.1 `libs/jsservice/bootstrap.js`: `listen()` first; `migrate()` and
      `seedDecks()` in the background with retry; export a `dbReady` flag.
- [x] 1.2 `libs/pyservice/bootstrap.py`: the same contract, replacing
      stabbur's and smia's `scripts.bootstrap` CMDs and phonexa's
      `docker-entrypoint.sh`.
- [x] 1.3 Health checks distinguish *serving* from *ready*. A service that is
      up but has no schema must report degraded, not healthy.
- [x] 1.4 Exactly one owner of migrations per database. For `mjolnir` that is
      `mjolnir-workbench`; `mjolnir-sync` never migrates.
- [x] 1.5 Implemented as ONE readiness gate ahead of the route list rather
      than a check inside each of twelve handlers — the list of
      database-backed paths is then visible in one place and cannot drift from
      itself. Routes NOT on it keep working with no database at all, which is
      the point: an outage costs the catalogue, not the console.
      Verified with postgres stopped: `/mjolnir` 503 rendering a real
      "Database unavailable" page, `/mjolnir/catalogue.json` 503 JSON,
      `/mjolnir/workbench/` **200** (file-backed), `/ota/current.json`
      unaffected.
- [x] 1.6 Verified. With postgres stopped the workbench container stays
      `running` with no crash loop and serves; database-backed views answer 503
      with a rendered explanation. **Before this change the same test produced
      RestartCount 0→9 in 60s and a bare 502** — the process exited before
      binding a port.

## 2. Split `mjolnir-sync` out of hub

- [x] 2.1 New `mjolnir-sync` service around `userdata.js`, unchanged. Port 8002.
- [x] 2.2 Moved `GET`/`PATCH`/`POST`/`DELETE /mjolnir/userdata/<uid>` to it.
- [x] 2.3 Preserved the device contract exactly, verified by replay: `_justCreated` on an
      auto-created document (D-S4), stripping of `deviceId`, `activeBuildId`,
      `pendingBuildId`, `audioCached`, `audioTotal`, `lastFetchError` from
      `PATCH` bodies, auto-create on `GET` (D-S2), and the same status codes.
- [x] 2.4 Credential check kept exactly as hub does it, including the
      surprising part: an unauthenticated request gets **302 to a login page,
      not 401**, because `requireAuth` answers 401 only for paths containing
      `/api/`. Preserved deliberately — `unified-auth` moves this gate into the
      gateway, which is where it can change with device coordination.
- [x] 2.5 Gateway routes `/mjolnir/userdata/*` to `mjolnir-sync` before the
      `/mjolnir/*` rule — **verified by compiling the Caddyfile**, not by
      reading it: index 5 vs index 9, with the three device routes at 6-8
      unchanged and byte-identical by sha256. Original: Confirm ordering with
      `caddy adapt --adapter caddyfile` — a mis-ordered rule here silently
      sends device traffic to the workbench.
- [x] 2.6 **The gate passed.** Captured the full contract before the split and
      replayed every assertion after: the document byte-identical,
      `_justCreated` present on auto-create and absent on the second GET,
      all six device-status fields stripped from a PATCH while a real field
      survived, 405 on PUT, 302 on no token.
- [x] 2.7 Verified: workbench stopped → `/mjolnir` 502, device sync **200**.
- [x] 2.8 Verified: sync stopped → device sync 502, `/mjolnir` **302** (fine).
- [ ] 2.9 Verify: stop the gateway; `mjolnir-builder` keeps building on
      schedule.

## 3. Split `shadow` out of phonexa

- [x] 3.1 New `shadow/` project: `shadowing.py` blueprint, `shadow.html`,
      `js/shadow.js`, its own Dockerfile. Port 5051.
- [x] 3.2 Move `ShadowingMedia` and `ShadowingSegment` to shadow's models;
      drop `shadowing_media.user_id`'s foreign key, keep the column as a plain
      integer (D42: no cross-service foreign keys).
- [x] 3.3 Moved `/transcribe`, `/transcribe/providers` and
      `/api/v1/youtube-extract` to shadow — all three are stateless.
- [x] 3.4 Shadow stores audio by calling phonexa's storage API. Shadow does not
      mount the audio volume.
- [x] 3.5 Migrate `shadowing_media` and `shadowing_segments` from the `phonexa`
      database into `shadow`, preserving ids. Row counts verified both sides.
      Run in the same window as `postgres-consolidation`.
- [x] 3.5a **The old tables in `phonexa` are RETAINED, deliberately, and are
      not a divergence hazard.** `shadowing_media` and `shadowing_segments`
      still hold their 3 and 2,739 rows in the `phonexa` database after the
      copy. Nothing can write them: `phonexa/shadowing.py` is deleted, the
      blueprint registration is gone, and the two models are no longer defined
      in `phonexa/db/models.py` — so phonexa cannot read or write that copy
      even by accident. They are the rollback, exactly like the retained
      pre-consolidation volumes, and like those they must be dropped **by
      hand** after a verified backup cycle covers `shadow`. Nothing automated
      should ever drop them.

- [x] 3.6 Gateway routes `/shadow/*` to `shadow-backend`,
      `X-Forwarded-Prefix` as for every other service.
- [ ] 3.7 Verify: stop shadow; the vowel chart, language editing, Formant Lab
      and live speech are unaffected.
- [ ] 3.8 Verify: stop phonexa; shadow still lists and plays existing segments,
      reports ingest unavailable, and shows profile ids without names.
- [ ] 3.9 Verify: stop smia; shadow still works except transcription, and
      stabbur still loads the note editor without suggestions.

## 4. One console

- [x] 4.1 `libs/jsservice/layout.js`: one navigation, rendered by all three
      mjolnir containers. Amend D46's vendoring rule in the ADR log.
- [x] 4.2 Navigation lists every zone, including those in other projects.
- [x] 4.3 Gateway `handle_errors` serves a static status page on 502: which
      zone is unreachable, links to the live ones. Static HTML in the gateway,
      no backing process.
- [x] 4.4 Verified: with a zone stopped, visiting it yields the status page, not
      a bare gateway error, and the links to live zones work.

## 5. Documentation

- [x] 5.1 New ADR rows: the zone model, the two splits, the degradation
      **Done:** D157 (serve before you migrate) and D158 (the device-plane
      split) added; P45 records the readiness high-water-mark outage.
      contract, serve-before-migrate, the dropped FK, shadow's audio
      dependency on phonexa.
- [x] 5.2 Amend D46 for `libs/` layout sharing, with the reason.
      **Done:** D46 amended in place — its "vendored CSS, not a package"
      half is reversed for `libs/`, its "one domain, one UI, by path" half
      stands.
- [x] 5.3 `docs/02-services.md`: eight zones and the dependency table.
      **Done:** the graph now distinguishes the two halves of the device
      plane and carries the nine-row dependency table.
- [x] 5.4 `docs/08-pitfalls.md`: gateway route ordering (task 2.5); two
      **Done:** P43 (empty `volumes:` key panics compose), P44 (a backup
      excluding a TABLE is not restorable), P45 (readiness as a high-water
      mark). Gateway route ordering is covered by the Caddyfile's own
      comment plus the compile-order check in tasks 2.5 and 3.6.
      services racing one migration table (task 1.4).

## 6. Verification — the whole matrix

- [ ] 6.1 Stop each zone in turn and assert every other zone's documented
      behaviour from the dependency table in `design.md`.
- [ ] 6.2 Stop the database cluster: `/ota/*` entirely unaffected, device
      updates continue, workbench renders degraded.
- [ ] 6.3 `bin/ota-verify.sh` 16/16 throughout.
- [ ] 6.4 A real device completes a sync round-trip after the split.
