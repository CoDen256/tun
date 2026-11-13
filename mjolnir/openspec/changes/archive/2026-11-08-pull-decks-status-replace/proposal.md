## Why

The "Pull cloud progress" button (`progress-sync-manual-pull`) is documented
to only ever overwrite local progress from the server. In practice, the
per-deck `decks_info`/`PullCounter` state it restores is merged by deck ID
(`decksLogic.initDecksStatus`, module 2110) rather than replaced: any local
deck entry whose ID has no matching entry in the server's `decksStatus`
array is left completely untouched. Confirmed live — clearing server-side
decksStatus entries and pressing the pull button left the corresponding
local `PullCounter` values unchanged, surviving even an app relaunch (the
value is persisted via `redux-persist`, so this is not a transient render
issue). This silently violates the "pull overwrites local" guarantee and is
inconsistent with how the same pull already handles `total_cards`
(`setTotalCards` — always a full wholesale replace).

## What Changes

- `decksLogic.initDecksStatus` (module 2110, stock app code — no existing
  mjolnir patch touches this module) changes from an upsert-by-ID merge to
  a full replace: the resulting `decks_info` is built entirely from the
  incoming `doc.decksStatus`, falling back to the static per-deck defaults
  (same static deck-defs module `initDecksStatus` already references) for
  any deck ID not present in the incoming array.
- Requires a new patch pair for module 2110 (`2110-decks-logic.baseline.js`
  / `2110-decks-logic.edited.js`), following this project's existing
  baseline/edited patch-back convention (same as 968/2176/2219/1440/2080).
- No change to `progress-sync-manual-companion.js` itself — it already
  calls `initDecksStatus(currentDecksInfo, doc.decksStatus || [])` and
  dispatches the result via `setDecksInfo`; only the function's own
  behavior changes.
- No change to `pushCloudProgress` or the push direction — `getDecksStatus`
  (the push-side reader) is unaffected by this fix.

## Capabilities

### New Capabilities
(none)

### Modified Capabilities
- `manual-progress-restore`: the restore guarantee ("pull overwrites local
  progress from the server") is tightened to explicitly cover per-deck
  `decks_info`/`PullCounter` state, not just `total_cards` — a deck ID
  absent from the server's `decksStatus` array must result in that deck's
  local counter being reset to its static default, not left untouched.

## Impact

- `index.android.bundle.exploded/2110.js` (`initDecksStatus`) — behavior
  change, via a new patch pair.
- `patches/js/progress-sync-manual-companion.js` — no code change, but its
  documented behavior (`restoreFromDoc`) now actually matches what D-M
  decisions in `progress-sync-manual-pull` already claimed.
- No change to `2080-progress-sync-shim.edited.js`, the hub, or the push
  direction.
