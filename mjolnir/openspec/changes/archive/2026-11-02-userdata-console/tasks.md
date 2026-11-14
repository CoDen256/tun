## 0. Before you write any code

Read `design.md` in full, especially D-C1 (the backfill is a correction of
the pre-fix scheme, not a general migration pattern) and D-C3 (the content
column always shows `N`, confirmed against `03-data-model.md`'s type table —
don't special-case by occurrence side). Read `progress-sync-shim`'s shipped
`hub/migrations/013_userdata.sql`, `hub/src/userdata.js`, and
`patches/js/progress-sync-restore-companion.js` before touching any of
them — this change extends shipped code, it doesn't re-derive it.

## 1. `device_state` per-device key

- [x] 1.1 Migration: `device_state.uid TEXT`, backfilled from the existing
      `device_id` column (every pre-existing row's `device_id` was actually
      a uid — `uid = device_id` is the correct one-time correction, not a
      general pattern), then `NOT NULL`; index on `uid`.
- [x] 1.2 `hub/src/userdata.js`: the device-status write path accepts
      `{ deviceId, activeBuildId, pendingBuildId, audioCached, audioTotal,
      lastFetchError }` from the request body and upserts `device_state`
      keyed by `deviceId`, storing the path's uid into `device_state.uid`
      alongside it.
- [x] 1.3 `hub/src/server.js`: `PATCH /mjolnir/userdata/:uid` reads
      `deviceId` from the body (required for the device-status half of the
      payload; absent `deviceId` simply skips the `device_state` write,
      same as today's behavior if no device-status fields are present at
      all).
- [x] 1.4 Tests: two `PATCH`s with the same uid but different `deviceId`s
      produce two separate `device_state` rows; a device that stops sending
      requests keeps its last-written row unchanged when a different
      device's later sync arrives; the backfill populates `uid` correctly
      for a pre-existing row.

## 2. Restore companion mints a device id

- [x] 2.1 `patches/js/progress-sync-restore-companion.js`: on first-ever
      launch (no local device-id marker), generate a random id and persist
      it permanently (independent of, never derived from, the signed-in
      uid). Every subsequent piggybacked `PATCH` includes it as `deviceId`.
- [x] 2.2 Tests: the device id is generated exactly once and stays stable
      across subsequent launches, including a sign-out/sign-in on the same
      device.

## 3. The console page

Build exactly to the mockup —
**https://claude.ai/code/artifact/12b08e2e-0eba-4990-8125-584a71c7046a** —
read `design.md` in full first; the mockup is the source of truth for
layout, not a sketch to improve on.

- [x] 3.1 `hub/src/userdata.js` (or a sibling module): `listAccounts()`
      (every distinct `userdata` uid), `listDevicesForAccount(uid)` (every
      `device_state` row with that `uid`, including ones no longer actively
      syncing, per D-C1's Open Question — include devices with no
      `userdata` activity too), `perCardProgress(uid)` (join
      `userdata.doc.totalCards` against `card_content` by card id — same
      join shape as `hub/src/cards.js`'s `cardsList`, reused, not
      reinvented — selecting `card_content.n` only, never `.e`, per D-C3),
      `historyDeltas(uid, {limit})` (each `userdata_history` row summarized
      against its predecessor: session-count delta, `totalCards.length`
      delta — not a full document diff).
- [x] 3.2 `hub/src/server.js`: `GET /mjolnir/device` (route name TBD),
      rendering: identity bar (two independent selects), stat row (last
      synced, active build, audio cached with a completeness-colored pill,
      last fetch error pill), progress snapshot panel (plain label/value
      pairs + raw-JSON toggle), per-card progress table (Card id + Content
      column showing only `N`, stripped of HTML + Side chip + Deck + Stage
      + Status pill + Type + Last reviewed — labeled "Side," never
      "language"), sync history timeline (delta summaries, raw doc per row
      behind a toggle).
- [x] 3.3 Add "Device" to `hub/src/layout.js`'s `NAV` groups, linking to
      the new page.
- [x] 3.4 Tests: the Content column renders a card's `N` text for both its
      `N`-side and `E`-side rows identically; the identity bar's device
      selector includes a device with no recent activity (a "retired"
      device), and selecting it swaps only the device/OTA panels, leaving
      the progress panels on the selected account unchanged.

## 4. Sign-off

- [x] 4.1 Re-run `progress-sync-shim`'s existing `hub/test/userdata.test.js`
      and `test/unit/progressSyncRestoreCompanion.test.js` suites in full —
      this change touches code both already exercise.
- [x] 4.2 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
- [x] 4.3 **(Operator, outside this change)** Confirm on-device/on-page
      (post-D126 simplification): `hub`'s `/mjolnir/device` page shows the
      correct account's progress snapshot/per-card progress/sync history
      under the right uid. Note: this task's original device-id/device-
      selector scope (tasks 1.*/2.*/3.1's `listDevicesForAccount`/3.2's
      device selector+stat row/3.4's retired-device test) was later removed
      entirely — `device_state` turned out to be permanently empty in
      production (nothing on the device ever sent the status fields it
      needed) and was dropped rather than finished, per the operator's
      explicit call. See `tun/docs/07-decisions.md` D126. The page today
      shows only the account picker plus the three uid-scoped panels —
      this is the (smaller) remaining thing to verify.
