## Why

bundle-tool today is 11 standalone CLI commands plus one `ui <bundle>` command
scoped narrowly to deck/card editing. The workflow that's actually emerged —
investigate a reverse-engineered bundle, compare it across app versions to
see what changed, edit a module in a real IDE and verify the edit is
semantically sound, then save it as a reusable patch to reapply to a later
app version — has no home in that surface. It was being done by hand via raw
git commits against a decompiled APK tree, which breaks the moment a new app
version renumbers modules (something this codebase already works around
everywhere else — deck/card data is located by structural shape, never by a
hardcoded module id, for exactly this reason).

## What Changes

- **BREAKING**: `bundle-tool ui <bundle>` becomes `bundle-tool ui` (no bundle
  argument) — a single persistent app server. Bundle selection moves into the
  UI (a plain path input), and the server can hold multiple bundle sessions
  open at once.
- Add an **Explorer** view wrapping the existing read-only CLI surface
  (index/show/grep/deps/dependents): sortable/filterable module list, search,
  module source view with a deobfuscated toggle.
- Add a **Compare** view: pick two open bundle sessions, see added/removed/
  changed modules between them, matched by content (hash, then `verboseName`)
  rather than module id, since ids are not stable across app versions.
- Extend the statement-level diff engine (`src/diff.js`) to recurse into
  `SwitchStatement` cases (matched by each case's `test` hash, not position)
  and to diff a matched `return Object.assign({}, state, {...})`-shaped
  statement's trailing object literal property-by-property, instead of
  treating the whole statement as one opaque unit. This is what both Compare
  and the Editor's live diff render.
- Add an **Editor** view: no in-browser code editor — pick a module, ensure
  its deobfuscated file exists on disk, "Open in IDE" (server shells out a
  configurable command, default `code {path}`), then poll the on-disk file
  against its baseline and render a live colored diff while the edit panel
  stays open.
- Add **Patches**: named, storable edits persisted as one JSON file per patch
  in a configurable directory (default `./patches/`, CWD-relative, so an
  app's patches live in that app's own project rather than in bundle-tool's
  repo). A patch stores a `locator` (a stable string to find its target
  module in any bundle, e.g. a Redux action-type literal) plus the baseline/
  modified module source. "Apply to current bundle" locates the target by
  content and reapplies via the existing patch-back realignment algorithm.
  Patches can also be saved directly from an Editor session.
- Fold the existing deck/card editor into the new app shell as one more tab,
  shown only when the open bundle actually contains a deck/card-shaped
  module pair.

## Capabilities

### New Capabilities
- `bundle-session-management`: the app-shell pivot — opening/holding multiple
  bundle sessions by path, and the Explorer view over the existing read
  surface.
- `bundle-comparison`: matching modules across two bundle sessions by content
  (not id) and presenting added/removed/changed.
- `diff-engine-nested-structures`: the `SwitchStatement`/`Object.assign`
  recursion added to the existing statement-level diff engine.
- `bundle-editor`: the open-in-IDE + live on-disk-diff workflow.
- `patch-management`: patch file format, locator-based module lookup, save/
  apply/list.

### Modified Capabilities
- `deck-card-editor-ui`: the deck/card editor stops being its own standalone
  server bound to one bundle and becomes a tab inside the shared app shell,
  gated on the open bundle containing a deck/card-shaped module pair. (This
  capability's spec currently lives in the not-yet-archived
  `openspec/changes/deck-card-editor/` change rather than `openspec/specs/`
  — this proposal's delta targets that eventual main spec.)

## Impact

- `bin/bundle-tool.js`: `ui` command loses its `<bundle>` argument.
- `src/commands/ui.js`: becomes the general app server (multi-session,
  routing for Explorer/Compare/Editor/Patches/Deck-Card) rather than a
  single-bundle deck/card server. Deck/card routes are reused, not rewritten.
- `src/diff.js`: `getNestedStatements`/`maybeRecurse` gain the
  `SwitchStatement` + `Object.assign`-return handling described above.
- New files: a patches storage module (locator matching, save/load/apply),
  new UI routes/views for Explorer, Compare, Editor, Patches.
- `src/ui-assets/*`: grows beyond the deck/card frontend into a general app
  shell with view-switching; existing deck/card markup/JS is relocated, not
  discarded.
- No new runtime dependencies (no code-editor library, no websocket library,
  no database).
