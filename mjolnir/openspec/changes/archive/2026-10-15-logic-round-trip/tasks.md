## 1. Shared foundation

- [x] 1.1 Add `terser` to `package.json` dependencies.
- [x] 1.2 Extract 3-4 small real modules from `index.android.bundle` (module `300` for the interop-wildcard pattern, plus 1-2 small dependency-light logic modules) and hand-assemble `test/fixtures/demo.bundle`: valid `__d(factory, id, deps)` calls for each plus a trailing `__r(entryId)`, parseable by the existing `parseBundle.js`.
- [x] 1.3 Implement `canonicalize(ast)` in `src/canonicalize.js`: Babel-scope-based renaming of every local binding (function params, var/let/const declarators, catch params) to deterministic position-derived names (`_b0`, `_b1`, ...); leave property names, member-expression properties, literals, and unbound identifiers untouched.
- [x] 1.4 Implement a content-hash function for canonicalized AST subtrees (hash of the subtree's own canonicalized generated source, independent of position in its parent).
- [x] 1.5 Unit tests for `canonicalize`/hashing against small hand-written fixtures: alpha-equivalent-but-differently-named modules canonicalize identically; property names and globals are preserved; two structurally identical sibling statements produce the same hash (sets up the collision case for milestone 3).

## 2. Deobfuscation (Phase 3)

- [x] 2.1 Build the interop-wildcard reference pattern (hand-written snippet matching module `300`'s IIFE shape), canonicalize and hash it once at module load.
- [x] 2.2 Implement the rule registry (`src/rules/`) as a plain array of `{ match, replace }` rules; implement the interop-wildcard rule using the hash from 2.1.
- [x] 2.3 Implement `src/commands/deobfuscate.js`: read `<bundle>.exploded/manifest.json`, for each `logic`-classified module walk its AST applying registered rules, write result to `<bundle>.exploded/deobfuscated/<id>.js`; skip `data`-classified modules.
- [x] 2.4 Wire `deobfuscate <bundle>` into `bin/bundle-tool.js`.
- [x] 2.5 Test: run deobfuscate against the demo bundle, confirm module `300`'s pattern is rewritten to a named `_interopRequireWildcard` call and non-matching modules are left alone.

## 3. Refactor-safety check (Phase 4)

- [x] 3.1 Implement `src/commands/check.js`: given a baseline file path and a current file path, canonicalize both, compare for structural equality, report pass/fail with the canonicalized diff on failure.
- [x] 3.2 Wire `check <baseline-file> <current-file>` into `bin/bundle-tool.js`.
- [x] 3.3 Test: a rename-and-reformat-only edit of a deobfuscated demo-bundle module passes `check`; a module with an added statement or changed literal fails `check` with a reported difference.

## 4. Diff and patch-back (Phase 5)

- [x] 4.1 Implement the structural diff algorithm in `src/diff.js`: recursive pairing of canonicalized top-level statements (and recursing into matched compound nodes) using content-hash identity, with same-hash-sibling occurrence order as the sole tiebreaker on collision; classify each pairing as unchanged/modified/added/removed.
- [x] 4.2 Unit test: a synthetic fixture with two structurally identical sibling statements (e.g. two equivalent `return null;`-shaped statements) where only one is edited, confirming the diff attributes the change to the correct occurrence and leaves the other unchanged.
- [x] 4.3 Implement `src/commands/diff.js`: given a baseline file and a current (modified) file, run the diff and print the detected semantic changes in readable form; writes nothing.
- [x] 4.4 Implement `src/reassemble.js`: given the bundle's original bytes, the explode manifest, and a set of `{ moduleId, newSource }` patches, produce the full reassembled bundle buffer — byte-copy every module not in the patch set from its original offsets, splice in re-minified (via `terser`) patched modules, preserve prelude/`__r(...)` trailer unchanged.
- [x] 4.5 Implement `src/commands/patchback.js`: given a baseline file and a modified file for one or more modules, compute each module's diff, apply changes to that module's *original* AST (from the manifest's byte offsets, not the deobfuscated/refactored version), re-minify, call `reassemble`, write the resulting `.bundle` file.
- [x] 4.6 Wire `diff <baseline-file> <current-file>` and `patch-back <bundle> <module-id>=<baseline-file>:<current-file> [...] <output-bundle>` (exact arg shape at implementer's discretion) into `bin/bundle-tool.js`.
- [x] 4.7 Test: reassembling with zero patched modules against the demo bundle produces byte-identical output to the demo bundle. Reassembling with one patched module leaves every other module's bytes identical to the original and reflects the edit in the patched module's bytes.

## 5. End-to-end verification

- [x] 5.1 Write an automated end-to-end test that runs the full pipeline once against `test/fixtures/demo.bundle`: explode → deobfuscate → apply a scripted rename-only edit to one module and confirm `check` passes → apply a scripted real semantic edit on top and confirm `diff` reports exactly that change → run `patch-back` → confirm the output bundle parses successfully, has byte-identical untouched modules, and the patched module's new source reflects the semantic edit when read back.
- [x] 5.2 Add an npm script (e.g. `npm test`) running all `node:test` suites added in this change.

## 6. Manual verification walkthrough

- [x] 6.1 Run `bundle-tool explode test/fixtures/demo.bundle` and confirm the exploded module files look as expected.
- [x] 6.2 Run `bundle-tool deobfuscate test/fixtures/demo.bundle` and visually confirm the interop-wildcard IIFE in the relevant module's deobfuscated file now reads as a named `_interopRequireWildcard(...)` call instead of an inline IIFE.
- [x] 6.3 Hand-edit one deobfuscated module's file with a rename-only change (rename a local variable, reformat spacing); run `check` against it and confirm it reports pass.
- [x] 6.4 On the same file, make a real logic change (e.g. change a literal value or add a statement); run `diff` and confirm the reported change matches what was actually typed, and that the earlier rename does not appear as a reported change.
- [x] 6.5 Run `patch-back` to produce a new bundle file; confirm the command completes without error.
- [x] 6.6 Byte-compare the new bundle against `test/fixtures/demo.bundle` for every module except the one edited, confirming they are identical (e.g. via the exploded manifest's offsets).
- [x] 6.7 Run `bundle-tool show <new-bundle> <edited-module-id> --raw` and confirm the edited module's source reflects the logic change made in step 6.4.
