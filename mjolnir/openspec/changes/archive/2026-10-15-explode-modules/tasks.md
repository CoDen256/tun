## 1. Classification

- [x] 1.1 Add a `classifyModule(ast, factoryNode, deps)` helper (e.g. in `src/parseBundle.js` or a new `src/classify.js`) implementing the structural heuristic from design.md: `data` iff `deps.length === 0` and the factory body is a single return/assignment of an array or object literal with no nested `FunctionDeclaration`/`FunctionExpression`/`ArrowFunctionExpression`; otherwise `logic`.
- [x] 1.2 Validate the heuristic against modules `2110`, `2111`, `2113`, `2119`, `2124`, `2131` in `index.android.bundle` (expected: `2111` and `2113` → `data`; the other four → `logic`).

## 2. Explode command

- [x] 2.1 Add `src/commands/explode.js` with `runExplode(bundlePath, opts)`: load the index via `loadIndex`, compute the output directory path (`<bundle>.exploded/`), and remove/recreate it fresh on each run.
- [x] 2.2 For each module in the index, read its source via `readModuleSource`, pretty-print it using the same parse/`@babel/generator` path as `runShow`, falling back to raw source on re-parse failure, and write it to `<bundle>.exploded/<id>.js`.
- [x] 2.3 Run `classifyModule` for each module and collect `{ path, start, end, factoryStart, factoryEnd, deps, dependents, classification }` per module id.
- [x] 2.4 Write the collected per-module data as `<bundle>.exploded/manifest.json`.
- [x] 2.5 Print a short summary to stdout on completion (output directory path, module count, data-vs-logic counts).

## 3. CLI wiring

- [x] 3.1 Register an `explode <bundle>` command in `bin/bundle-tool.js` calling `runExplode`.
- [x] 3.2 Add `*.exploded/` to `.gitignore`, matching the existing treatment of `*.analysis.json`.

## 4. Verification

- [x] 4.1 Run `bundle-tool explode index.android.bundle` and confirm the output directory contains 2207 files plus `manifest.json`.
- [x] 4.2 Spot-check `manifest.json` entries for modules `504`, `2111`, `2113` against the existing `.analysis.json` cache to confirm offsets/deps match.
- [x] 4.3 Confirm re-running explode overwrites the directory cleanly (no stale files left from a prior run with a different module count, e.g. by temporarily renaming the output dir and diffing module counts).
