## 1. Diff engine: nested-structure recursion

- [x] 1.1 In `src/diff.js`, add a `SwitchStatement` branch to
      `getNestedStatements`/`maybeRecurse`: treat `node.cases` as a diffable
      list, pairing each `SwitchCase` by the hash of its `test` node (or a
      sentinel for `default`), reusing `pairByHash` unchanged.
- [x] 1.2 Detect the `return Object.assign({}, <identifier>, {<object literal>})`
      shape (and its canonicalized object-spread equivalent) on a matched
      pair of `ReturnStatement`s; when both sides match this shape, diff the
      trailing object literal's properties by key instead of treating the
      whole statement as one unit. Fall back to whole-statement diffing for
      any other shape.
- [x] 1.3 Verify `buildPatchedFactoryStatements` (patch-back's existing
      realignment) correctly reapplies a `modified` entry that now carries
      `children` from 1.1/1.2 without requiring changes to that function —
      confirm via a test that an unrelated switch-case present only in the
      reapplication target survives being patched.
- [x] 1.4 Unit tests: a single changed case in an otherwise-identical switch
      is reported as one modified entry, not a whole-statement change; an
      added/removed case is reported as added/removed; a property added to
      an `Object.assign({}, state, {...})` return is reported as one added
      property; a statement that doesn't match the recognized shape falls
      back to whole-statement diffing; reapplying a diff onto a target with
      an unrelated extra switch case preserves that case.

## 2. App shell: multi-session bundle management

- [x] 2.1 Rework `src/commands/ui.js`'s server bootstrap to start without a
      bundle path: an in-memory session map keyed by resolved absolute
      bundle path, created on demand when a path is successfully opened.
- [x] 2.2 Add API endpoints to open a bundle session by path (building/
      reusing its module index, erroring clearly on a missing/unparseable
      path) and to list currently open sessions.
- [x] 2.3 Update `bin/bundle-tool.js`'s `ui` command to drop the `<bundle>`
      positional argument.
- [x] 2.4 Rework every existing per-bundle route (deck/card editor's
      existing routes included) to resolve its target bundle from a session
      id in the request rather than a server-wide closed-over bundle path.
- [x] 2.5 Tests: opening a valid bundle path creates a session; opening an
      invalid path errors without creating one; two sessions can be open
      concurrently and are independently addressable; a fresh server has no
      sessions open.

## 3. Explorer view

- [x] 3.1 Add API endpoints for an open session equivalent to the existing
      `index`/`show`/`grep`/`deps`/`dependents` commands: module list with
      size/classification/verboseName, module source (raw + deobfuscated
      toggle), search, and dependency/dependent listing.
- [x] 3.2 Frontend: a module list view (sort/filter), a search box, and a
      module detail view with the deobfuscated toggle and deps/dependents.
- [x] 3.3 Tests: API-level tests for each new endpoint against a fixture
      bundle, confirming parity with the existing CLI commands' output.

## 4. Bundle comparison

- [x] 4.1 Implement module matching between two sessions: exact
      canonicalized factory-hash match first; fall back to a unique
      `verboseName` match on both sides; otherwise added/removed.
- [x] 4.2 API endpoint: given two session ids, return added/removed/changed/
      unchanged module lists.
- [x] 4.3 API endpoint: given two session ids and a changed module, return
      its structural diff (reusing the extended diff engine from §1).
- [x] 4.4 Frontend: a Compare view — pick two open sessions, see the added/
      removed/changed summary, drill into a changed module's diff rendered
      as colored blocks (unchanged/modified/added/removed).
- [x] 4.5 Tests: a module whose id differs but content is identical across
      two fixture bundles is reported unchanged; a module matched only by
      verboseName with differing content is reported changed; a module
      present in only one bundle is reported added/removed; an ambiguous or
      missing verboseName match falls back to added+removed rather than a
      guessed pairing.

## 5. Patch management

- [x] 5.1 Implement patch file read/write: one JSON file per patch under a
      configurable directory (`--patches-dir`, default `./patches/`),
      containing `{name, description, locator, baseline, modified,
      createdAt, verifiedAgainstVersions}`.
- [x] 5.2 Implement locator-based module lookup: given a bundle session and
      a `{contains: string}` locator, scan its exploded modules (reusing the
      existing `grep` search mechanism) for a unique match.
- [x] 5.3 Implement patch application: locate target → `diffModuleFactories
      (baseline, modified)` → `buildPatchedFactoryStatements` against the
      located module → regenerate/minify/`reassembleBundle`, matching
      `patch-back`'s existing write path.
- [x] 5.4 API endpoints: list patches, preview applying a patch to an open
      session (diff only, no write), commit applying a patch (write +
      reassemble), save a new patch directly (name, description, locator,
      baseline, modified).
- [x] 5.5 Frontend: a Patches view — list stored patches with name/
      description/locator, preview+apply to the current session, and a save
      form usable standalone or launched from an Editor session (§6).
- [x] 5.6 Tests: saving a patch writes the expected JSON shape; locating a
      target by a locator string that matches a module not at the id it had
      at authoring time succeeds; a locator matching zero modules reports a
      clear error and applies nothing; applying a patch whose target hasn't
      diverged from its recorded baseline reproduces the modified source
      exactly (modulo realignment); preview never writes to the bundle file.

## 6. Editor view

- [x] 6.1 API endpoint: given a session and module id, ensure
      `<bundle>.exploded/deobfuscated/<id>.js` exists (reusing
      `deobfuscate`'s per-module logic if not), and return its path.
- [x] 6.2 API endpoint: "open in IDE" — server-side shells out a configurable
      command template (default `code {path}`) substituting the file path;
      surfaces the command's exit code/stderr on failure rather than failing
      silently.
- [x] 6.3 API endpoint: given a session and module id, re-read its
      deobfuscated file from disk and return its structural diff against the
      module's original baseline (reusing the extended diff engine from §1).
- [x] 6.4 Frontend: an Editor view — open a module, "Open in IDE" button,
      polling (~1.5s) live diff rendered as colored blocks while the panel
      is open, "Save as patch" form wired to §5's save endpoint.
- [x] 6.5 Tests: opening a module without an existing deobfuscated file
      creates one; opening one that already exists does not regenerate it;
      the live-diff endpoint reflects an on-disk edit made between two polls;
      an editor-command failure is reported with the file's path still
      available; saving from the Editor view produces a patch file
      equivalent to one saved directly via §5's save endpoint.

## 7. Deck/Card editor integration

- [x] 7.1 Mount the existing deck/card editor routes (`src/commands/ui.js`'s
      current deck/card API, `src/deckData.js` unchanged) onto the new
      session-based routing from §2, resolving the target bundle from a
      session id instead of a server-wide bundle path.
- [x] 7.2 Gate the deck/card editor's availability in the shell on
      `locateDeckCardModules` succeeding for the open session's bundle; hide
      the tab/view otherwise.
- [x] 7.3 Confirm the existing deck/card frontend continues to work mounted
      inside the new shell (view-switching, relative asset paths).
- [x] 7.4 Re-run the existing deck/card editor test suite (71 tests as of
      the last deck-card-editor change) against the session-based routing
      and confirm no regressions; update any tests that assumed a single
      server-wide bundle.

## 8. Manual verification walkthrough

- [x] 8.1 Run `bundle-tool ui`, open the real bundle by path, confirm the
      Explorer lists modules with correct sizes/classifications and search
      works.
- [x] 8.2 Open two versions of the same bundle (or two distinct bundles) in
      Compare, confirm added/removed/changed modules are reported
      correctly, including at least one module whose id shifted between the
      two.
- [x] 8.3 Open a real module in the Editor, confirm "Open in IDE" launches
      the configured editor, make a small edit (e.g. add a property to an
      `Object.assign` return inside a `switch` case), confirm the live diff
      reflects it, and save it as a patch.
- [x] 8.4 Apply that saved patch to a different bundle where the target
      module's id differs from authoring time, confirm it locates and
      applies correctly, and confirm an unrelated switch case present only
      in that target bundle survives the reapplication.
- [x] 8.5 Confirm the deck/card editor tab appears for the real bundle
      (which has a deck/card pair) and is absent for a bundle fixture
      without one.
