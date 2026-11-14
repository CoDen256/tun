## Why

`module-explode` (archived) turns a bundle into per-module files you can read, but minified logic modules are still unreadable, and there is no way to get hand-edited code back into a bundle at all. The next usable capability is the full loop for logic modules: make a module readable, let a human rename/reformat it safely, let them make a real change, and get a correct bundle back out. Shipping deobfuscation alone (with no patch-back) or patch-back alone (with nothing readable to edit) would each be useless on their own — this change ships the whole loop together so it can be verified end-to-end in one pass, per explicit decision to avoid landing intermediate stages with no payoff.

## What Changes

- Add a deobfuscation step that produces a readable ("D") version of each logic module by fingerprinting known minified idioms via AST canonicalization and rewriting matches to named helper calls. Ships with one rule: the `__esModule`/interop-wildcard IIFE pattern (observed ~1390 times in `index.android.bundle`, cleanly exemplified by module `300`).
- Add a `check` command that verifies a human's refactor-only edit (renames/reformatting) of a deobfuscated module didn't change its behavior, by canonicalizing and comparing against the deobfuscated baseline.
- Add a `diff` command that reports the semantic changes between a refactor-baseline module and its currently-edited version, computed on canonicalized ASTs so identifier renames never appear as false differences. This is a separate, inspectable step — not fused into patch-back.
- Add a `patch-back` command that applies a module's diffed semantic changes to the *original* (pre-deobfuscation) module AST, re-minifies only that module, and reassembles a full bundle: every untouched module copied byte-for-byte from its original offsets, changed modules spliced in.
- Add `canonicalize()` as a shared library function (alpha-equivalence renaming of local bindings via Babel scope resolution) used by all three of the above — deobfuscation's pattern matching, `check`'s equivalence test, and `diff`'s structural comparison.
- Add `terser` as a new dependency for the re-minification step in `patch-back` (no existing dependency does minification; `@babel/generator` only pretty-prints).
- Add a committed small demo bundle fixture (a handful of real, small modules extracted from `index.android.bundle`) used by both automated tests and a manual verification walkthrough.
- Add automated tests (using Node's built-in `node:test` runner — no new test-framework dependency) covering canonicalization edge cases (including a hash-collision case for structurally identical sibling statements), the interop-wildcard rule, and an end-to-end run of the whole pipeline against the demo bundle.

## Capabilities

### New Capabilities
- `module-deobfuscate`: canonicalization-based fingerprinting and rewriting of known minified idioms in logic modules into readable named-helper form.
- `refactor-safety-check`: verifying that a human's rename/reformat pass over a deobfuscated module preserved behavior.
- `logic-patch-back`: diffing a human's semantic edits against a refactor baseline and reassembling a bundle with those edits applied to the original module, everything else byte-exact.

### Modified Capabilities
(none — `bundle-analysis` and `module-explode` are consumed as-is via their existing exports/manifest; no requirement changes to either)

## Impact

- New files: `src/canonicalize.js`, `src/rules/` (rule registry + interop-wildcard rule), `src/commands/deobfuscate.js`, `src/commands/check.js`, `src/commands/diff.js`, `src/commands/patchback.js`, `src/reassemble.js`.
- New dependency: `terser` (re-minification).
- New dev dependency/tooling: none — tests use Node's built-in `node:test` + `assert`.
- New test fixtures: `test/fixtures/demo.bundle` (small, real-module-derived, Metro-bundle-shaped) and associated unit/integration/e2e tests under `test/`.
- Reused, unmodified: `src/parseBundle.js` (`loadIndex`, `readModuleSource`), the `module-explode` manifest format.
- No changes to existing commands (`index`, `show`, `grep`, `deps`/`dependents`, `explode`).
- Still out of scope: data-module editing (decks/cards), and anything beyond producing a modified `.bundle` file (no app/repackaging step).
