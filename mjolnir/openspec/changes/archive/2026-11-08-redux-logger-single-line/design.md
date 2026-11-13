## Context

Store setup, `index.android.bundle.exploded/953.js`:

```js
var v = (0, o.default)();  // redux-thunk
y = (0, l.createStore)((0, c.persistReducer)(n, s.default), (0, l.applyMiddleware)(v, u.logger));
```

`u` is module 956 (bundled `redux-logger`), and `u.logger` is
`createLogger()` called with no arguments — its full default options
object (`956.js`, `C`, lines ~461-498):

```js
C = {
  level: 'log', logger: console, logErrors: true,
  collapsed: void 0,               // falsy -> always console.group (expanded)
  predicate: void 0, duration: false, timestamp: true,
  stateTransformer: e => e,        // raw object passed straight to console.log
  actionTransformer: e => e,
  diff: false, diffPredicate: void 0,
}
```

The `%c prev state`/`%c action`/`%c next state` lines are built in `m()`
(956.js, ~lines 249-310), e.g. `r[F]('%c next state', M, w)` where `w` is
the raw next-state object — `console.log` then pretty-prints that object
across many lines in logcat's Node-style inspector output.

This is **stock app code** — confirmed no existing mjolnir patch touches
modules 953/954/956. The logger is wired unconditionally, with no
`__DEV__` gate visible in 953.js.

## Goals / Non-Goals

**Goals:**
- Every `%c action`/`%c prev state`/`%c next state` entry renders as
  exactly one `console.log` call producing one logical line of
  `JSON.stringify`'d content.
- No change to which actions are logged or what state is captured — only
  the rendering.

**Non-Goals:**
- Not reducing log *volume* (e.g. via `predicate` filtering or `diff`
  mode) — explicitly decided against for this change; the ask is strictly
  "single line," volume/noise reduction is a separate concern not in
  scope here.
- Not changing any existing mjolnir companion's own logging
  (`[mjolnir-ota-debug]` etc.) — those are already single-line.

## Decisions

### D1 — `createLogger({ stateTransformer, actionTransformer: JSON.stringify, collapsed: true })`, not a bespoke middleware

Replace the bare `u.logger` reference at the 953 call site with:

```js
u.createLogger({
  collapsed: true,
  diff: false,
  stateTransformer: function (state) { return JSON.stringify(state); },
  actionTransformer: function (action) { return JSON.stringify(action); },
})
```

`redux-logger` already supports `stateTransformer`/`actionTransformer` as
first-class options (confirmed in 956.js's option handling) — no need to
hand-roll a replacement middleware. `collapsed: true` is kept so the
`console.group` wrapper itself collapses (fewer visual lines around the
one-line payload), though the primary fix is the transformers.

Alternative considered: swap `u.logger`/`createLogger` out entirely for a
hand-written middleware that does one `console.log(JSON.stringify({type: action.type, prevState, action, nextState}))`
per dispatch. Rejected — more code, reinvents formatting/timestamp/level
handling `redux-logger` already does correctly; using its own transformer
hooks is the smaller, more maintainable change.

### D2 — Patch module 953 directly (new patch pair), not a runtime monkey-patch from a companion

Since the `createStore`/`applyMiddleware` call is a one-time, module-load-
time expression inside 953.js itself, there is no later hook point a
companion could intercept (the store is already constructed and exported
by the time any companion code runs). This requires a direct patch to
953.js's source, following this project's standard baseline/edited
convention: `patches/js/953-store-setup.baseline.js` /
`953-store-setup.edited.js`.

## Risks / Trade-offs

- **A single-line `JSON.stringify` of a large state tree can still wrap
  across many terminal rows in `adb logcat`, just without the visual
  indentation structure** → accepted trade-off, explicitly requested:
  the goal is one *logical* log line (parseable as one JSON value via
  `grep | jq`, filterable, diffable line-by-line in a log file), not
  necessarily one *visual* terminal row. Noted here so this isn't
  mistaken for an oversight if long lines still wrap on screen.
- **`JSON.stringify` on a very large `deckStats.total_cards` array adds
  noticeable string-building cost on every dispatch** → likely
  negligible at this app's data scale (observed `total_cards` arrays are
  tens of entries, not thousands); flag for reconsideration only if a
  real performance regression is observed on-device.
- **Circular references or non-JSON-safe values (e.g. `Date` objects,
  functions) in state/action would throw or serialize unexpectedly in
  `JSON.stringify`** → confirm at implementation time whether any action
  payload or state slice contains such values; redux-logger's own default
  `stateTransformer` never had this problem since it never serialized.

## Open Questions

- None — scope and approach confirmed by the user (truly single-line
  output accepted over volume/noise reduction as the goal).
