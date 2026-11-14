## 1. Project setup

- [x] 1.1 Initialize `package.json` (ESM, `bin/bundle-tool.js` entry) with `@babel/parser`, `@babel/generator`, `@babel/traverse`, `@babel/types`, `commander` dependencies
- [x] 1.2 Add `.gitignore` for `node_modules/` and generated `*.analysis.json` cache files

## 2. Module index extraction

- [x] 2.1 Implement `parseBundle` in `src/parseBundle.js`: full Babel parse of the bundle, walking top-level `Program.body` statements
- [x] 2.2 Identify `__d(factory, moduleId, dependencyArray[, verboseName])` calls and record byte start/end for both the full statement and the factory node
- [x] 2.3 Identify the trailing `__r(entryId)` call and record the entry module id
- [x] 2.4 Build the reverse dependency graph (dependents) by inverting each module's dependency array
- [x] 2.5 Add the `looksMinified` heuristic (newline presence in the factory body source slice)
- [x] 2.6 Verify against the real bundle that a module spanning multiple physical lines (URI.js, embedded block-comment newlines) is captured as a single module with correct byte offsets

## 3. Cache layer

- [x] 3.1 Implement `buildAndCacheIndex`: write `{bundleSize, bundleMtimeMs, entryId, moduleCount, modules: {...}}` to `<bundle>.analysis.json`
- [x] 3.2 Implement `loadIndex`: reuse the cache when bundle size/mtime match, rebuild automatically otherwise
- [x] 3.3 Implement `readModuleSource`: read a single module's raw bytes by cached byte offset without loading the full file

## 4. CLI commands

- [x] 4.1 `index <bundle> [--top n]` — build/refresh the cache and print summary stats (module count, entry id, largest modules, minified-vs-vendor split)
- [x] 4.2 `show <bundle> <id> [--raw]` — print one module's source, pretty-printed by default via isolated re-parse + `@babel/generator`, with fallback to raw source on re-parse failure
- [x] 4.3 `grep <bundle> <pattern> [--regex] [--limit n]` — per-module literal/regex search with bounded context snippets and a match limit
- [x] 4.4 `deps` / `dependents <bundle> <id> [--depth n]` — graph walk in either direction, capped at 40 printed ids per depth level with an explicit remainder count
- [x] 4.5 Wire all commands into `bin/bundle-tool.js` via `commander`

## 5. Validation

- [x] 5.1 Fix `@babel/generator` ESM default-export interop bug (`generatorPkg.default ?? generatorPkg`) found during validation
- [x] 5.2 Run `index` against `index.android.bundle`: confirm 2207 modules, entry id 0, correct minified/vendor split
- [x] 5.3 Run `show` against the huge data-blob module (2113, >1MB) and confirm only that module's bytes are read/printed
- [x] 5.4 Run `show` against the URI.js vendor module and confirm correct parsing/formatting despite embedded comments
- [x] 5.5 Run `grep` and confirm bounded, snippet-only output
- [x] 5.6 Run `deps`/`dependents` and confirm the 40-id-per-depth cap triggers correctly on a high-fanout module (855 dependents)
