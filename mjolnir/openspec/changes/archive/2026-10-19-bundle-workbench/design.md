## Context

bundle-tool has grown from a pure CLI (`index`/`show`/`grep`/`deps`/`explode`/
`deobfuscate`/`check`/`diff`/`patch-back`) into also having one narrow web UI
(`ui <bundle>`, the deck/card editor from the `deck-card-editor` change) bound
to a single bundle for the lifetime of that server process. The workflow that
has actually emerged across several sessions reverse-engineering a real app
needs three things none of that surface provides: comparing two versions of
the same bundle (module ids are not stable across versions — confirmed
repeatedly, e.g. `deckData.js` already locates its target modules by
structural shape rather than id for exactly this reason), a repeatable way to
verify and save a hand-made edit, and a way to reapply that edit to a later,
differently-numbered bundle. All three were being done by hand via git commits
against a decompiled APK tree, which breaks across module renumbering.

This also compounds an existing usability problem: eleven standalone CLI
commands, each taking a bundle path, is a lot of surface for one investigation
session. Folding the read-only commands and the new workflows into one
persistent app addresses both at once.

## Goals / Non-Goals

**Goals:**
- One persistent server (`bundle-tool ui`, no bundle argument) that can hold
  multiple bundle sessions open — needed for Compare, and generally nicer
  than restarting a CLI command per bundle.
- Make the existing read-only CLI commands (index/show/grep/deps/dependents)
  available as views in that app, not just text output.
- Compare two bundle sessions by module *content*, not id.
- Extend the existing statement-level diff engine just enough to handle the
  patterns actually observed (switch-case additions, `Object.assign` property
  additions) without silently dropping unrelated changes when reapplied to a
  different bundle version.
- Support an edit-in-your-own-IDE workflow with a live diff, not an
  in-browser editor.
- Persist verified edits as named, reusable, git-friendly patch files that
  can be reapplied to a different bundle by locating their target module via
  a stable content anchor instead of a module id.
- Fold the existing deck/card editor into the new shell without rewriting it.

**Non-Goals:**
- A general/fully-general AST diff algorithm. Only `SwitchStatement`-case
  recursion and the specific `Object.assign`-return refinement are in scope;
  any other nested-expression diffing is explicitly deferred.
- An in-browser code editor (no CodeMirror/Monaco). Editing happens in the
  user's real IDE; the app only renders diffs and hands off via a shell
  command.
- A file-browser/upload UI for opening bundles. A plain text path input only.
- Websocket/SSE infrastructure. Polling is sufficient at the cadence the
  Editor's live-diff view needs (on the order of 1-2s, only while that panel
  is open).
- A database for patch storage. Plain JSON files, one per patch, in a
  configurable directory.

## Decisions

**App shell: one server, multiple in-memory bundle sessions, keyed by path.**
`runUi()` no longer takes a bundle path; it starts a server with an empty
session map. A session is created when the UI's path input successfully
opens a bundle (`loadIndex`, lazily `explode` if needed), keyed by the
resolved absolute path, held in memory for the server's lifetime. Every
existing per-bundle route (index/show/grep/deps, deck/card editor, future
Editor/Patches routes) takes a session id instead of implicitly closing over
one bundle path. This is the minimum change needed to support Compare's
"two bundles open at once" without any new storage or persistence layer —
sessions are not saved across server restarts, matching the tool's existing
"re-derive from the bundle file, never trust stale state" posture (the same
reasoning that makes `loadIndex` auto-rebuild its cache on a stale bundle).
- Alternative considered: a single global "current bundle," swapped via a
  dropdown. Rejected — breaks Compare outright, and multi-session is barely
  more code (a `Map`, not a database).

**Cross-version module matching: hash first, `verboseName` second, nothing
else.** Metro already embeds each module's real source path as a string
literal argument to `__d()` (`parseBundle.js` extracts this as `verboseName`
today but nothing consumes it). Matching tier:
1. Canonicalized factory-body hash exact match → unchanged, regardless of id.
2. No hash match → match by `verboseName` if both sides have a non-null one
   and it's unique on both sides → changed (drill in with the diff engine).
3. No match at all → added (bundle-B-only) or removed (bundle-A-only).
- Alternative considered: dependency-graph-position matching (module reached
  via the same `require()` path from a stable entry point) as a third tier.
  Rejected for v1 as unnecessary complexity — `verboseName` is a strong,
  already-available signal and good enough as the two-tier fallback; revisit
  only if real comparisons show modules with duplicate/missing
  `verboseName`s. **Not deferring without a reason**: if the module-matching
  rate on a real before/after pair turns out poor, this is the next lever,
  not a reduced-scope "we never built it."

**Diff engine: extend `getNestedStatements`, not `diffStatementList`'s
model.** `SwitchStatement` gets a dedicated branch: its `cases` are diffed as
a list, each `SwitchCase` matched by the hash of its `test` node (`null` for
`default`), reusing `pairByHash` unchanged — the same algorithm already used
for every other statement list, one level deeper. Separately, when two
matched statements are both `return`-of-`Object.assign({}, <ident>, {...})`
(or an equivalent object-spread return — same shape, structurally detected,
not string-matched), the trailing object literal's properties are diffed by
key instead of the whole `ReturnStatement` being treated as one opaque node.
Both extensions slot into the existing `entries` model (`unchanged`/
`modified`/`added`/`removed`) — nothing about `buildPatchedFactoryStatements`
or the realignment algorithm changes, they just now receive finer-grained
`modified` entries with `children` to descend into, instead of a single
coarse one.
- Alternative considered: a general tree-diff (e.g. diffing arbitrary nested
  expressions via a generic structural-edit-distance algorithm). Rejected as
  explicit non-goal — real patches observed so far are exactly these two
  shapes; building for hypothetical future shapes before they're observed is
  the kind of premature generality this project's own conventions avoid.

**Editor: file-on-disk is the source of truth, the browser only watches it.**
"Open in IDE" writes/ensures `<bundle>.exploded/deobfuscated/<id>.js` exists
(reusing `deobfuscate`'s existing per-module logic) and shells out a
configurable command template (default `code {path}`) from the server — not
the browser, which can't launch local processes directly. While the Editor
panel for that module stays open, the browser polls a `GET` endpoint that
re-reads the file, diffs it against the stored baseline via the (now
extended) diff engine, and re-renders. No file watcher (`fs.watch`) — polling
is simpler, has no platform-specific quirks, and this isn't a latency-
sensitive use case.
- Alternative considered: `fs.watch`-based push instead of polling. Rejected
  for v1 — adds a stateful watcher per open panel for a UX improvement
  (sub-second vs ~1.5s latency) that doesn't matter here.

**Patches: one JSON file per patch, found by content locator, applied via
the existing patch-back algorithm.** A patch file is
`{name, description, locator, baseline, modified, createdAt,
verifiedAgainstVersions}`. `locator` is `{contains: <string>}` — a stable
string (e.g. a Redux action-type literal like `"SET_PAYWALL_VISIBLE"`) grepped
across a bundle's exploded modules to find the target without any module id.
Applying: locate → `diffModuleFactories(baseline, modified)` →
`buildPatchedFactoryStatements({oFactory: located-module, rFactory: baseline,
mFactory: modified})` — this is `logic-patch-back`'s own realignment
algorithm, completely unmodified, just fed a persisted/named pair and an
auto-located target instead of CLI-supplied files and an explicit module id.
Storage directory is configurable (`--patches-dir`, default `./patches/`,
CWD-relative) specifically so an app's patches live in that app's own project
directory rather than accumulating inside bundle-tool's own repo.
- Alternative considered: a sqlite/embedded-db store. Rejected — loses
  git-diffability and hand-inspectability, which is the entire reason this
  design exists (the alternative being evaluated going in was raw git
  commits against a decompiled tree; JSON files keep that git-friendliness
  while adding the locator-based reapplication git alone doesn't give you).
- Alternative considered: locator as a structural-shape predicate (like
  `deckData.js`'s "has a `Cards` property") instead of a plain string
  search. Deferred — `{contains: string}` covers every patch actually made so
  far (both are anchored on a stable action-type literal); a predicate-based
  locator is a strict superset that can be added later without migrating
  existing patch files if `contains` ever proves insufficient.

**Locating a module by a `locator` reuses `grep`'s existing search, not a new
index.** No new per-module fingerprint/metadata needs precomputing — a
locator lookup is exactly a `grep`-style scan over exploded module sources
for a literal substring, already proven as the mechanism `src/commands/
grep.js` uses today.

## Risks / Trade-offs

- [Risk] `verboseName` matching fails to disambiguate if an app's build
  process ever produces duplicate or missing verbose names across modules.
  → Mitigation: treat an ambiguous/missing match as "added + removed" (a
  conservative false negative) rather than guessing wrong; surface the
  module in Compare's output either way so it's never silently invisible.
- [Risk] The `Object.assign`-return refinement is structurally detected, not
  string-matched, but real minified code has many superficially-similar
  shapes (`Object.assign({}, a, b)` vs `Object.assign({}, a, {...})` vs a
  spread-literal compiled differently by a different build). → Mitigation:
  scope the detection narrowly (exactly `Object.assign({}, <single-ident>,
  {<object-literal>})` or the canonicalized-equivalent spread form) and fall
  back to whole-statement replacement — never guess at a shape it doesn't
  recognize; a coarser-than-ideal diff is safe, a wrong structural diff is not.
  Existing tests already cover param-rename-tolerant diffing for this
  pattern category and should extend here.
  - [Risk] `Open in IDE` shelling out a configurable command is inherently
  platform/editor-dependent (the default `code {path}` assumes VS Code's CLI
  is on `PATH`). → Mitigation: make the failure visible (surface the shell
  command's exit code/stderr in the UI) rather than silently no-op; the panel
  still shows the file's absolute path so a user can open it manually
  regardless of whether the configured command works.
- [Risk] Folding the deck/card editor into the shared shell risks regressing
  its 71 existing tests if routes/response shapes change during the move.
  → Mitigation: this proposal explicitly scopes the integration as
  "mounted, not rewritten" — reuse `deckData.js` and the existing route
  handlers verbatim, changing only how the server resolves which bundle
  session a request targets.

## Migration Plan

`bundle-tool ui <bundle>` → `bundle-tool ui` is a breaking CLI change (the
positional argument is removed). No stored state migrates since bundle
sessions were never persisted across server restarts. No data format changes
to the bundle files themselves. `--patches-dir` is new and optional
(defaults to `./patches/`), so existing invocations of every other command
are unaffected.

## Open Questions

(none outstanding — all resolved during exploration prior to this proposal)
