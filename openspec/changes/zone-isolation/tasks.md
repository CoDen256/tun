## 1. Serve-before-migrate

- [ ] 1.1 `libs/jsservice/bootstrap.js`: `listen()` first; `migrate()` and
      `seedDecks()` in the background with retry; export a `dbReady` flag.
- [ ] 1.2 `libs/pyservice/bootstrap.py`: the same contract, replacing
      stabbur's and smia's `scripts.bootstrap` CMDs and phonexa's
      `docker-entrypoint.sh`.
- [ ] 1.3 Health checks distinguish *serving* from *ready*. A service that is
      up but has no schema must report degraded, not healthy.
- [ ] 1.4 Exactly one owner of migrations per database. For `mjolnir` that is
      `mjolnir-workbench`; `mjolnir-sync` never migrates.
- [ ] 1.5 Every page that reads the database consults `dbReady` and renders a
      degraded panel instead of throwing.
- [ ] 1.6 Verify: with the cluster stopped, `/mjolnir` renders the shell, the
      Assemble tab and the OTA verify tool; catalogue, Cards, Decks and Device
      show "database unavailable"; publish is refused with a reason.

## 2. Split `mjolnir-sync` out of hub

- [ ] 2.1 New `mjolnir-sync` service around `userdata.js`, unchanged.
      Port 8002.
- [ ] 2.2 Move `GET`/`PATCH`/`POST`/`DELETE /mjolnir/userdata/<uid>` to it.
- [ ] 2.3 Preserve the device contract exactly: `_justCreated` on an
      auto-created document (D-S4), stripping of `deviceId`, `activeBuildId`,
      `pendingBuildId`, `audioCached`, `audioTotal`, `lastFetchError` from
      `PATCH` bodies, auto-create on `GET` (D-S2), and the same status codes.
- [ ] 2.4 Keep the credential check **exactly as hub does it today**. This
      change alters no auth behaviour.
- [ ] 2.5 Gateway routes `/mjolnir/userdata/*` to `mjolnir-sync` **before** the
      `/mjolnir/*` rule. Confirm ordering with
      `caddy adapt --adapter caddyfile` — a mis-ordered rule here silently
      sends device traffic to the workbench.
- [ ] 2.6 Capture a real device request/response pair before the split and
      replay it after. Byte-identical, or the split does not ship.
- [ ] 2.7 Verify: stop `mjolnir-workbench`; a device sync still succeeds.
- [ ] 2.8 Verify: stop `mjolnir-sync`; the workbench is unaffected.
- [ ] 2.9 Verify: stop the gateway; `mjolnir-builder` keeps building on
      schedule.

## 3. Split `shadow` out of phonexa

- [ ] 3.1 New `shadow/` project: `shadowing.py` blueprint, `shadow.html`,
      `js/shadow.js`, its own Dockerfile. Port 5051.
- [ ] 3.2 Move `ShadowingMedia` and `ShadowingSegment` to shadow's models;
      drop `shadowing_media.user_id`'s foreign key, keep the column as a plain
      integer (D42: no cross-service foreign keys).
- [ ] 3.3 Move `/transcribe`, `/transcribe/providers` and
      `/api/v1/youtube-extract` to shadow — all three are stateless.
- [ ] 3.4 Shadow stores audio by calling phonexa's storage API. Shadow does not
      mount the audio volume.
- [ ] 3.5 Migrate `shadowing_media` and `shadowing_segments` from the `phonexa`
      database into `shadow`, preserving ids. Row counts verified both sides.
      Run in the same window as `postgres-consolidation`.
- [ ] 3.6 Gateway routes `/shadow/*` to `shadow-backend`,
      `X-Forwarded-Prefix` as for every other service.
- [ ] 3.7 Verify: stop shadow; the vowel chart, language editing, Formant Lab
      and live speech are unaffected.
- [ ] 3.8 Verify: stop phonexa; shadow still lists and plays existing segments,
      reports ingest unavailable, and shows profile ids without names.
- [ ] 3.9 Verify: stop smia; shadow still works except transcription, and
      stabbur still loads the note editor without suggestions.

## 4. One console

- [ ] 4.1 `libs/jsservice/layout.js`: one navigation, rendered by all three
      mjolnir containers. Amend D46's vendoring rule in the ADR log.
- [ ] 4.2 Navigation lists every zone, including those in other projects.
- [ ] 4.3 Gateway `handle_errors` serves a static status page on 502: which
      zone is unreachable, links to the live ones. Static HTML in the gateway,
      no backing process.
- [ ] 4.4 Verify: with a zone stopped, visiting it yields the status page, not
      a bare gateway error, and the links to live zones work.

## 5. Documentation

- [ ] 5.1 New ADR rows: the zone model, the two splits, the degradation
      contract, serve-before-migrate, the dropped FK, shadow's audio
      dependency on phonexa.
- [ ] 5.2 Amend D46 for `libs/` layout sharing, with the reason.
- [ ] 5.3 `docs/02-services.md`: eight zones and the dependency table.
- [ ] 5.4 `docs/08-pitfalls.md`: gateway route ordering (task 2.5); two
      services racing one migration table (task 1.4).

## 6. Verification — the whole matrix

- [ ] 6.1 Stop each zone in turn and assert every other zone's documented
      behaviour from the dependency table in `design.md`.
- [ ] 6.2 Stop the database cluster: `/ota/*` entirely unaffected, device
      updates continue, workbench renders degraded.
- [ ] 6.3 `bin/ota-verify.sh` 16/16 throughout.
- [ ] 6.4 A real device completes a sync round-trip after the split.
