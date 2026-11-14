## Why

Adding one new named placeholder today touches 5-6 files (`src/commands/
companion.js`, `src/commands/assemble.js`, `bin/bundle-tool.js`, `src/
commands/ui.js`, `hub/src/server.js`, `src/ui-assets/index.html`/`app.js`)
with validation that isn't even consistent across the existing ones
(`buildId`/`baseVersion` share a charset regex, `patchRev` has bespoke
integer logic, `syncToken` has none, the two URL placeholders share an
https-only regex). Two more placeholders are already wanted
(`label`/`dataVersion`, see `boot-companion-label-data-version`) and more
will keep coming — this needs to become a generic mechanism, not another
bespoke flag.

## What Changes

- **BREAKING**: remove every existing named placeholder flag/option
  entirely (`--build-id`, `--base-version`, `--patch-rev`, `--sync-base-url`,
  `--sync-token`, `--audio-base-url` on both `bundle-tool companion` and
  `bundle-tool assemble`; the equivalent named fields in `/api/assemble`
  and `/mjolnir/ota/assemble-submit`'s request bodies). Replaced by one
  generic mechanism: any `KEY: value` pair substitutes `__MJOLNIR_KEY__`
  wherever it appears in a companion's source or an assembled bundle.
- `appendCompanion`/`substituteBakedPlaceholders` take a single
  `placeholders` map instead of a fixed list of named options.
- Validation narrows to what's actually load-bearing, applied generically
  by key-name convention: a key ending in `_URL` must be `https://`;
  `BUILD_ID`/`BASE_VERSION` keep their existing charset check;
  `PATCH_REV` keeps its non-negative-integer check. Every other key is
  free-form.
- CLI: `--set KEY=VALUE`, repeatable, on both `companion` and `assemble`.
- The workbench's Assemble tab replaces its fixed named fields with a
  dynamic key/value list (add/remove rows), pre-filled on load with the
  known keys this project already uses (`BUILD_ID`, `PATCH_REV`,
  `SYNC_BASE_URL`, `SYNC_TOKEN`, `AUDIO_BASE_URL`) and whatever default
  values those fields already compute today (e.g. `TUN_PUBLIC_BASE`-derived
  defaults) — editable/removable like any other row, not specially pinned.
- `BASE_VERSION` is the one exception: it's read automatically from the
  base folder's own `apktool.yml` today (`readBaseVersion`), never typed by
  an operator — it stays auto-supplied by `assembleBundle` itself, merged
  into the placeholder map before substitution, not an editable row in the
  UI's key/value list.

## Capabilities

### New Capabilities
- `generic-placeholder-substitution`: a free-form key/value mechanism for
  baking values into companions and assembled bundles, replacing the fixed
  set of named placeholder options.

### Modified Capabilities
(none — no existing main spec describes the prior named-flag mechanism in
spec form; it was never synced, since `progress-sync-shim`/`audio-link-
playback-minimal` — the changes that introduced the sync/audio
placeholders — were both deleted rather than archived, D127/D125)

## Impact

- `src/commands/companion.js`: `appendCompanion`/`substituteBakedPlaceholders`
  signatures change to accept a generic map; the six named-constant
  placeholder exports collapse into the generic mechanism.
- `src/commands/assemble.js`: `assembleBundle` accepts `placeholders` (a
  map) instead of six named params; merges in the auto-computed
  `BASE_VERSION`.
- `bin/bundle-tool.js`: `--set KEY=VALUE` replaces every named flag on
  `companion`/`assemble`.
- `src/commands/ui.js`, `hub/src/server.js`: `/api/assemble` and
  `/mjolnir/ota/assemble-submit` accept a `placeholders` map in the request
  body instead of named fields; default-computation helpers
  (`defaultSyncBaseUrl`/`defaultAudioBaseUrl`) move to populating the
  generic map's pre-filled defaults, not special-cased fields.
- `src/ui-assets/index.html`/`app.js`: Assemble tab's fixed fields replaced
  by a dynamic key/value editor, pre-filled with known keys/defaults.
- Every existing patch that uses a placeholder (`2080-progress-sync-shim`,
  `1440-audio-link-playback`, `progress-sync-pull-companion`, `boot-ok-
  companion`) keeps using the exact same `__MJOLNIR_X__` strings — only
  how values get supplied at assemble time changes, not what the patches
  themselves contain.
