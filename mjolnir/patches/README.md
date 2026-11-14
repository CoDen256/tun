# patches

The patch set applied to Mjølnir's `index.android.bundle` and APK.

- `js/` — bundle patches, of two genuinely different kinds plus the OTA
  companions, all discovered by bundle-tool/bundle-workbench automatically
  (D110/D111) — no separate registration step:
  - **Patch-back pairs**: `<module-id>-name.baseline.js` / `.edited.js` file
    pairs, REPLACE-style (modify an existing module's factory body in
    place), located by the module id named in the filename. The "My
    account" build-version row (`2176-my-account-build-id`, OpenSpec
    `p2-native-ota` task 10.1) is one live example; `953-store-setup`
    (OpenSpec `redux-logger-single-line`) is another — it swaps the stock
    `redux-logger` wiring for `createLogger({ stateTransformer,
    actionTransformer })` so the `%c action`/`%c prev state`/`%c next state`
    entries render as single-line `JSON.stringify`'d `adb logcat` output
    instead of a pretty-printed multi-line tree, matching this project's
    other single-line breadcrumbs (`[mjolnir-ota-debug]` etc., D63).
    `2110-decks-logic` (OpenSpec `pull-decks-status-replace`) is a third —
    it changes `decksLogic.initDecksStatus` from an upsert-by-ID merge to a
    full replace, so a manual cloud-progress pull (or mod 2205's sign-in
    restore) actually overwrites local `decks_info`/`PullCounter` state
    instead of leaving deck entries absent from the server's `decksStatus`
    untouched. Applied via
    `bundle-tool patch-back` directly, or picked in bundle-workbench's
    Patches tab (preview/apply against an open session) and Assemble tab
    (baked into a fresh bundle, by name, via `--patchback-pairs`/
    `patchbackPairNames`).
  - **Companions**: top-level snippets appended after the bundle entry by
    `bundle-tool companion` (no module dependency; see
    `../docs/findings.md` §4a) — `boot-ok-companion.js` (the D52 watchdog
    marker), `config-rotate.js` (the D39 URL/token rotation capability), and
    `ota-debug-report.js` (debug-only tier observability, D63).
  A third kind, **saved patches** (also REPLACE-style, but located by a
  content string instead of a module id, so they survive bundle-version
  changes that renumber modules), lives one level up in `patches/*.json` —
  written via bundle-workbench's Editor tab ("Save as patch"), not checked
  into this repo as fixtures.
- `native/` — smali/Java source for the one-time APK patch. **FROZEN once
  shipped** — see `../docs/findings.md` §4 and `tun/docs/04-delivery.md`.
  Its only job is fetching the bundle (plus the boot watchdog). Anything that
  could ever need a bug fix belongs in `js/` instead (D04).

The patch manifest (`[{id, rev}]`) recorded in each publication is the source of
truth for which patches a build contains; the "logic version" integer is only a
label (D27).
