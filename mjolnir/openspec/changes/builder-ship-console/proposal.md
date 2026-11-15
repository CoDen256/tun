## Why

Three operator asks from the `full-sweep` batch (package "Builder UI rehaul
& data versioning"), designed together in one session because they all meet
in `runPublish` and the builder console:

1. The Forecast & publish page grew by accretion (totals, rail, four tables,
   per-deck details) and the operator wants a **new page built from scratch
   around the ship-order strip of occurrences** — the strip as the page's
   backbone, state and forecast in one picture, in addition to the existing
   page.
2. The deck descriptions the device shows are static operator prose; the
   operator wants **live card/occurrence counts in each deck's on-device
   description**.
3. The app's My-account version rows are stale by construction: `LABEL` and
   `DATA_VERSION` are baked at assemble time and never updated across
   publishes off the same logic bundle, the display carries no build
   timestamp at all, and the fallback renders `"undefined base:undefined"`
   instead of `embedded`. The operator wants **the time of build displayed
   in the app version**, and the versioning logic rethought so publish-time
   facts are stamped at publish time.

## What Changes

- A new builder console page, **Ship strips**, served by builder and
  re-rendered inside hub (same D109 shared-body mechanism as the existing
  pages). Backbone: the ship-order strip per deck; the forecast is drawn on
  the strips (this run's would-ship/would-hold as marked cells), with an
  occurrence/card inspector on cell click. Final layout chosen by the
  operator from two competing mockups (see `design.md` and `mockups/`).
  The existing Forecast & publish page stays.
- `syncDeckDescription`'s callers append **live counts** to each deck's
  on-device `Description` at every publish — operator prose stays the
  editable part (`decks.description`), counts are regenerated per publish
  and computed **after** the flush so they match the bundle being shipped.
- **Publish-time restamp generalized** (today only `BUILD_ID` is restamped):
  `LABEL`, `DATA_VERSION` and a new `BUILT_AT` are stamped into the bundle at
  publish, right before the sha256 is computed. `BASE_VERSION`/`PATCH_REV`
  remain assemble-time facts (D-L4). The boot-ok companion exposes
  `globalThis.MJOLNIR_BUILT_AT`; the new `__MJOLNIR_BUILT_AT__` placeholder
  rides the existing generic substitution mechanism (D-G1).
- The My-account patch (`2176-my-account-build-id`) collapses to **one full
  App version row** — build id · base · logic · data · built-at — retiring
  the separate Label and Data version rows, and fixing the `&&`/`+`
  precedence bug so the no-companion fallback really shows `embedded`.
- No device-plane change: `current.json`'s read fields, `/ota/*` mechanics
  and the OTA contract (docs/11) are untouched; everything rides inside the
  bundle JS, which is redeployable by design (D04).

## Capabilities

### New Capabilities
- `ship-strips-console`: the new strip-backboned builder page — rails/
  timeline layout, forecast-on-strip, occurrence inspector, publish-now.

### Modified Capabilities
- `builder-pipeline`: deck descriptions gain live counts at publish; the
  publish step restamps `LABEL`/`DATA_VERSION`/`BUILT_AT`.
- `account-build-info`: one consolidated App version row including built-at;
  publish-time values are restamped (supersedes "baked at assemble time"
  for label/data version); fallback fixed to `embedded`.
- `ota-js-companion`: the companion carries `BUILT_AT` and the restamp
  contract (which constants are publish-stamped vs assemble-stamped).

## Impact

- `builder/src/server.js` (new page body, shared with hub), `hub/src/server.js`
  + `hub/src/layout.js` (nav + route), `builder/src/pipeline.js` (description
  counts, restamp call), `src/injectDeck.js` (description sync site),
  `tool/src/otaPublish.js` (generalized restamp), `patches/js/boot-ok-companion.js`,
  `patches/js/2176-my-account-build-id.*`, `src/commands/companion.js`
  (BUILT_AT placeholder validation).
- Depends on nothing in `flush-record-atomicity`; may *display* its
  integrity banner but does not own it. The Device sync package's
  pull-tracking display consumes this change's versioning output (batch
  dependency: this package builds first).
