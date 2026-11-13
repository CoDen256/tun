## Why

The stock app's Redux store (module 953) wires `redux-logger`
(`createLogger()`, module 956) with its default options — `collapsed`
unset (so `console.group`/expanded, not `console.groupCollapsed`),
`stateTransformer`/`actionTransformer` as pass-through identity functions.
Every dispatched action prints `%c action`/`%c prev state`/`%c next state`
to `adb logcat` as a pretty-printed, deeply nested object — often dozens
of lines per single action, drowning out the project's own deliberately
single-line breadcrumbs (`[mjolnir-ota-debug]`, `[mjolnir-audio-prefetch]`,
D63's one-line native convention) in the same stream. This makes
`adb logcat` effectively unusable for live debugging during exactly the
kind of manual data-correctness testing (e.g. the recent
`pull-decks-status-replace` investigation) this project does routinely.

## What Changes

- A new patch pair for module 953 (store setup — currently untouched by
  any mjolnir patch) replaces the default `createLogger()` call with one
  configured to emit each of `%c action`/`%c prev state`/`%c next state`
  as a single `console.log` line of `JSON.stringify`'d content, not a
  pretty-printed multi-line object tree.
- No change to what is logged (same actions, same state shape) — only how
  it's rendered to the log stream.

## Capabilities

### New Capabilities
- `redux-state-logging`: defines how the app's Redux action/state stream
  is rendered to `adb logcat` — specifically, that it must render as
  single-line entries, matching this project's existing one-line
  breadcrumb convention (D63) rather than the stock pretty-printed
  multi-line default.

### Modified Capabilities
(none — no existing spec covers this stock-logger behavior)

## Impact

- `index.android.bundle.exploded/953.js` (store setup, `u.logger` /
  `createLogger()` call) — behavior change via a new patch pair.
- No change to `956.js` (`redux-logger`'s own bundled source) — only the
  options object passed to `createLogger()` at the 953 call site changes.
- No change to any existing mjolnir companion or patch's own logging
  (`[mjolnir-ota-debug]`, `[mjolnir-audio-prefetch]`,
  `[mjolnir-progress-sync]`, etc.) — those already log single-line by
  convention; this only brings the stock Redux middleware's own logging
  in line with that convention.
