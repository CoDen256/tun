## Why

The account screen currently shows "App version" as `<buildId> base:
<baseVersion>` (from `globalThis.MJOLNIR_BUILD_ID`/`MJOLNIR_BASE_VERSION`,
baked by `boot-ok-companion.js`). It has no way to show which `data_rev`
(content/data version, auto-bumped by builder on every publish) or which
operator-chosen `label` (the same free-text field already used in
`publications.label`/shown in hub's OTA console) a given installed build
actually carries — useful for the operator to confirm on-device exactly
what shipped, without cross-referencing a buildId against hub's own
publish history.

## What Changes

- `boot-ok-companion.js` gains two more baked globals:
  `globalThis.MJOLNIR_LABEL` and `globalThis.MJOLNIR_DATA_VERSION`, baked
  via `__MJOLNIR_LABEL__`/`__MJOLNIR_DATA_VERSION__` — ordinary entries in
  the generic placeholder map (`generic-placeholder-substitution`), no new
  bespoke flags or validation.
- The account screen (module 2176) gains two more rows, "Label" and "Data
  version", alongside the existing "App version" row.
- The workbench's Assemble tab pre-fills `LABEL`/`DATA_VERSION` rows in its
  key/value editor with the current values from hub's `publications` table
  (same source the OTA console's own label/data-version columns already
  read from) — editable like any other row, not specially locked.

## Capabilities

### New Capabilities
- `account-build-info`: the account screen's display of which build is
  actually installed — buildId, base version, label, and data version.

### Modified Capabilities
(none — no existing main spec describes module 2176's account-screen
build-info display; this is new display surface, not a change to
`userdata-console`, which covers hub's own operator-facing console, a
different capability)

## Impact

- `patches/js/boot-ok-companion.js`: two new baked globals.
- `patches/js/2176-my-account-build-id.edited.js`: two new display rows
  (same pattern as the existing "App version" row).
- Workbench Assemble tab: pre-fill logic for the new rows, reading
  current `label`/`data_rev` from hub's publications data the same way
  `BUILD_ID`'s next-id suggestion and `PATCH_REV`'s next-rev suggestion
  already work.
- Depends on `generic-placeholder-substitution` landing first — this
  change adds no new placeholder plumbing of its own, only new keys fed
  through that mechanism.
