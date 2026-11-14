## Context

This change implements Phases 3, 4, and 5 of the round-trip pipeline sketched in `module-explode`'s design doc (`openspec/changes/archive/2026-10-15-explode-modules/design.md`), bundled into one change by explicit decision so the full loop can be verified end-to-end rather than landing stages with no payoff until the last one:

```
module-explode (done)                    ← this change builds on top of this
  manifest: { path, start, end, factoryStart, factoryEnd, deps, dependents, classification }
        │
        ▼
Deobfuscate (3)         canonicalize() + rule registry → readable "D" version of each logic module
        │
        ▼
Refactor (human, IDE)   human renames/reformats D → R, outside this tool
        │
        ▼
check (4)               canonicalize(R) ≟ canonicalize(D)  →  pass/fail
        │
        ▼
Modify (human, IDE)     human makes a real edit on top of R → M, outside this tool
        │
        ▼
diff (5a)               canonicalize(R) vs canonicalize(M) → structural diff → report
        │
        ▼
patch-back (5b)         apply diff to original module's AST (O) → re-minify → splice into bundle
```

Carried forward from `module-explode`'s design, still true and load-bearing here:
- Zero `verboseName` metadata exists anywhere in the real bundle (`index.android.bundle`) — any readable naming this change introduces (e.g. `_interopRequireWildcard`) comes from recognizing code *shape*, never from metadata, because none survives.
- All 2207 real modules observed have a uniform 7-parameter factory signature `(global, require, importDefault, importAll, module, exports, dependencyMap)`.
- No app/repackaging step is in scope — the deliverable is "bundle file in, optionally modified bundle file out," nothing downstream.
- `module-explode`'s manifest (`<bundle>.exploded/manifest.json`) is the source of truth for every module's original byte offsets and classification; this change reads it rather than re-deriving offsets.

The archived design flagged one unresolved ambiguity that this change must resolve, not defer again: `idea.md`'s "deterministic path+shape hash" for stable node identity didn't say whether identity was position-based (breaks under sibling insertion/deletion, which real edits require) or content-based (needs a collision tiebreaker for structurally identical siblings, e.g. two equivalent `return null;` statements). **Resolved here**: node identity for diffing is content-hash-based (hash of a node's own canonicalized subtree, independent of its position), with the *index of occurrence among same-hash siblings under the same parent* used only as a tiebreaker when hashes collide. This is specified precisely in the Decisions section below.

## Goals / Non-Goals

**Goals:**
- Make known minified idioms in logic modules readable without relying on any metadata (none exists).
- Let a human safely confirm a rename/reformat pass changed nothing semantically, before they build further edits on top of it.
- Let a human make a real logic edit and get that edit — and only that edit — reflected in a newly assembled bundle, with everything else byte-identical to the original.
- Prove the whole loop actually works by running it against a small, real, human-readable demo bundle, both as an automated end-to-end test and as a manual walkthrough a person can repeat.

**Non-Goals:**
- No generic deobfuscation rule DSL — one rule (interop-wildcard) ships; the registry is extensible but not over-built for rules that don't exist yet.
- No data-module editing (decks/cards) — that's a separate, still-unplanned change; `patch-back`/`reassemble` here only apply to logic modules the manifest classifies as `logic`.
- No support for structural module-graph changes (new modules, changed dependency arrays, added/removed dependencies) — `diff`/`patch-back` only change a module's factory body contents; the `__d(factory, id, deps)` wrapper's `id` and `deps` are never altered by this change.
- No attempt at byte-identical output for a *changed* module — only unchanged modules are byte-identical to the original; a changed module is a new variant, re-minified fresh, with no "original" to match (this was called out explicitly in exploration: byte-identity is only a well-posed goal for untouched regions).
- No GumTree-style general tree-edit-distance algorithm — R and M are always closely related versions of the same file (not arbitrary unrelated trees), so a simpler recursive structural diff suffices; building a general algorithm would be solving a harder problem than this pipeline has.

## Decisions

**`canonicalize(ast)` — the one function underpinning all three capabilities.**
Walks the AST using `@babel/traverse`'s scope tracking. For every binding introduced by a function parameter, `var`/`let`/`const` declarator, or `catch` clause parameter, rename it (and every reference resolved to it via `path.scope.getBinding`) to a name derived purely from the order bindings are first encountered in a deterministic (pre-order) traversal: `_b0`, `_b1`, `_b2`, ... Property keys, member-expression property names, string/numeric/boolean/null literals, and unresolved/global identifiers are never touched — renaming those would be a real semantic difference in JS (e.g. renaming `console` or `.default`), not a cosmetic one. Output of `canonicalize` is itself a (new) AST; two alpha-equivalent programs produce canonicalized ASTs that generate to byte-identical source.
- Alternative considered: canonicalize to a string hash immediately instead of keeping an AST. Rejected — both the rule-matching step (3) and the diff step (5) need to walk the canonicalized *tree*, not just compare whole-module equality; a bare hash would only support check (4)'s whole-module pass/fail, not fine-grained diffing.

**Node identity for diffing: content-hash of the canonicalized subtree, with a sibling-position tiebreaker on collision.**
Every node in a canonicalized AST gets a hash computed bottom-up from its own canonicalized `generate()` output (so it's independent of where the node sits in the tree, and survives insertions/deletions of unrelated siblings elsewhere). When matching nodes between R's and M's canonicalized trees, nodes are first matched by hash; if two or more sibling nodes under the same parent share a hash (e.g. two structurally identical `return null;` statements), they are disambiguated by matching occurrence order among same-hash siblings (1st `return null;` in R matches 1st `return null;` in M, 2nd matches 2nd, etc.) — only falling back to position when content alone is ambiguous, never using position as the primary key. A synthetic fixture exercising exactly this collision case is required test coverage (see tasks.md).

**Structural diff: simple recursive tree walk, not general tree-edit-distance.**
Walk R's and M's canonicalized top-level statement lists (and recurse into matched compound nodes — blocks, function bodies) pairing nodes by the identity rule above. A node present in both with equal canonical form is unchanged. A node present in both with different canonical form is "modified" (recurse to localize further, or report the whole node changed if it's a leaf-ish statement). A node in M with no match in R is "added." A node in R with no match in M is "removed." This is sufficient because R and M are the same file before/after a human edit — not arbitrary diff targets — so there's no need for the generality (and cost) of GumTree-class algorithms.

**Deobfuscation rule shape and registry.**
A rule is `{ match: (canonicalizedNodeHash) => boolean, replace: (node) => Node }`. The one shipped rule recognizes the `_interopRequireWildcard`-shaped IIFE (observed as module `300`'s structure, and ~1390 occurrences bundle-wide via the `"__esModule"` string count) by canonicalizing a hand-written reference implementation of that IIFE once at module load time, hashing it, and comparing against the hash of every call-expression-shaped subtree encountered while walking a logic module's AST. A match is replaced with a call to a named helper (`_interopRequireWildcard(...)`), with the helper's own definition emitted once per exploded-and-deobfuscated output (not reconstructed bundle — this rewrite only ever applies to the *readable* D view, never to code heading back into `patch-back`, since `patch-back` always operates against the original un-deobfuscated AST `O`). The registry is a plain array rules are pushed onto — no DSL beyond `match`/`replace`.

**Deobfuscation output location: a sibling directory, not a new manifest field.**
`deobfuscate <bundle>` reads `<bundle>.exploded/manifest.json` (produced by `module-explode`) and writes readable module files to `<bundle>.exploded/deobfuscated/<id>.js`, one per `logic`-classified module (data modules are skipped — nothing to deobfuscate). This is the "D" baseline both `check` and the human's editing workflow reference. `check`/`diff`/`patch-back` all take an explicit baseline-vs-current file pair rather than inventing additional manifest state to track "current" status — keeps this change from having to design a stateful workflow tracker.

**Re-minification: add `terser` as a new dependency.**
`package.json` currently has only `@babel/*` packages and `commander` — none of them minify (only parse/generate/traverse). `@babel/generator`'s `compact: true` option shrinks whitespace but does not mangle names or perform the dead-code/constant-folding passes a real minifier does, and matching "looks like the rest of this bundle" isn't a goal (re-minified output doesn't need to resemble the original minifier's style, only be correct and reasonably small). `terser` is the standard, well-maintained choice for this and needs no further justification beyond "nothing already in the tree does this job."

**Test runner: Node's built-in `node:test`, no new dependency.**
The project has no test framework yet. Given the minimal-dependency posture already established (five total runtime dependencies), `node:test` + `node:assert` (bundled with Node, no install needed) covers everything this change's tests need: synchronous unit tests for `canonicalize`/diff/rule-matching, and a scripted end-to-end test driving the CLI commands as child processes or direct function calls against the demo fixture.

**Demo fixture: `test/fixtures/demo.bundle`, hand-assembled from real extracted modules.**
Built from a small number of real modules copied out of `index.android.bundle` (module `300` for the interop-wildcard pattern; one or two small, dependency-light logic modules; no module anywhere near `2113`'s scale), wrapped in a minimal valid Metro-bundle shape (`__d(factory, id, deps)` calls plus a trailing `__r(entryId)`) that `parseBundle.js`'s existing parser accepts as-is. This fixture is small enough to read in full and is what both the automated end-to-end test and the manual verification checklist (tasks.md) run against — real code, not purely synthetic, but small enough to reason about by hand.

## Risks / Trade-offs

- [Risk] The interop-wildcard rule is validated against one bundle's one pattern; a different app's bundle may minify the same helper to a structurally different shape (different Terser version/settings), causing the rule to silently miss matches. → Mitigation: `match` works off canonicalized-hash comparison, which already absorbs identifier-naming differences across Terser runs; if the *structure* differs further, that's a new rule to add later, not a defect in this one — not blocking, since this change only commits to covering the one pattern confirmed present in the real bundle.
- [Risk] The recursive top-level-statement diff may mis-localize a change that restructures control flow significantly (e.g. wrapping existing statements in a new `if` block) as "remove everything, add everything" rather than a localized change. → Mitigation: acceptable for this change — the output is still a *correct* patch (the new code is used verbatim), just a less minimal diff report shown to the user; `diff`'s job is correctness of what gets applied, not minimality of the reported delta.
- [Risk] Re-minifying a changed module with `terser` could trip over edge cases Babel's own generator wouldn't (e.g. top-level `"use strict"` directive placement inside the factory). → Mitigation: the demo bundle's end-to-end test specifically re-parses `patch-back`'s output and confirms it still parses and executes, catching this class of problem before it reaches a real bundle.
- [Risk] Bundling three capabilities into one change is a larger unit of work with no intermediate shippable checkpoint. → Mitigation: explicit user decision, accepted trade-off in exchange for verifying the full loop together; `tasks.md` still sequences work as three internally-checkpointed milestones (3 → 4 → 5) each with their own tests, so a problem in one doesn't require re-verifying everything from scratch.

## Migration Plan

N/A — purely additive new commands (`deobfuscate`, `check`, `diff`, `patch-back`) and one new library module (`canonicalize.js`); no changes to existing command behavior or output formats.

## Post-Implementation Correction

Verification (manually running the sanctioned rename-then-edit workflow, not just the committed test suite) found that `patch-back`'s original `realignFactoryParams` only re-threaded the 7 fixed Metro factory parameters back onto O's names. Any *other* local variable the human renamed during refactor (e.g. `var e` → `var bugReportingModule`) broke at runtime (`ReferenceError`) whenever a later edited statement referenced the renamed variable, because the kept-verbatim O statement still declared the old name while the spliced-in M statement referenced the new one. The committed tests didn't catch this because they only renamed factory params and edited a literal on the same statement already using that param — never a renamed *internal* variable referenced from a separately-edited statement.

Fixed by generalizing realignment: `buildFactoryBindingRenameMap` now builds the R-name → O-name map from every top-level binding correspondence implied by the existing R↔O statement pairing (`oForR`), not just the 7 params, and `realignFactoryBindings` (replacing `realignFactoryParams`) applies that full map. A regression test (`test/unit/patchback.test.js`, "patch-back realigns a renamed top-level local variable referenced by a later edited statement") reproduces the original failure and actually executes the patched factory to confirm no `ReferenceError`, not just that the source text looks right.

## Open Questions

- Should `check`/`diff` eventually track "last known-good baseline" state automatically (e.g. a `.baseline.json` updated whenever `check` passes), rather than requiring the baseline file path to be passed explicitly each time? Left open — explicit paths are simpler and sufficient to prove the pipeline works; a stateful workflow tracker can be added later if manually passing paths proves tedious in practice.
