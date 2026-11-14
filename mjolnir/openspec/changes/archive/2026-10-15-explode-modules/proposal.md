## Why

The bundle-analysis tool (archived: `2026-10-15-bundle-analysis-tool`) lets you query a Metro production bundle one module at a time, but every module still lives inside a single 6MB file. To read, deobfuscate, or eventually edit this bundle's modules in an IDE, each module needs to exist as its own file on disk, with its place in the dependency graph and its data-vs-logic nature known up front. This is the first stage of a larger round-trip pipeline (deobfuscate → refactor → modify → reassemble) explored separately; this change only builds the foundation that pipeline depends on — it does not implement reassembly.

## What Changes

- Add an `explode` command that writes every module in the bundle to its own file under a predictable output directory (`<bundle>.exploded/`), reusing the existing `loadIndex`/`readModuleSource` functions rather than re-parsing.
- Each exploded file contains the module's factory source, pretty-printed (not raw minified text), since the files are meant to be read and navigated in an IDE.
- Add a manifest file (`<bundle>.exploded/manifest.json`) recording, per module id: its exploded file path, its original byte offsets (`start`/`end`/`factoryStart`/`factoryEnd`), its dependency ids, and its classification (`data` or `logic`).
- Classify each module as `data` or `logic` during explode, using a structural heuristic (no dependencies, and a factory body that is a single return/assignment of an array or object literal containing no function declarations/expressions) rather than content sniffing.
- Re-exploding an already-exploded bundle overwrites the output directory from a fresh parse (no incremental/partial explode in this change).

## Capabilities

### New Capabilities
- `module-explode`: splitting a parsed bundle's modules into individual on-disk files plus a manifest describing each module's location, byte offsets, dependencies, and data/logic classification.

### Modified Capabilities
(none — `bundle-analysis`'s existing requirements are unchanged; this change only adds a new command built on top of its exports)

## Impact

- New files: `src/commands/explode.js`, wiring in `bin/bundle-tool.js`.
- Reused, unmodified: `src/parseBundle.js` (`loadIndex`, `readModuleSource`).
- New on-disk output: `<bundle>.exploded/` directory (module files + `manifest.json`) alongside the analyzed bundle — not committed to version control (gitignored), same treatment as the existing `.analysis.json` cache.
- No changes to existing commands (`index`, `show`, `grep`, `deps`/`dependents`).
- No reassembly, no deobfuscation rules, no editing workflow — those are later changes building on this one's manifest.
