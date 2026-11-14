## Why

`index.android.bundle` is a 6MB, single-line-per-module Metro production bundle with no source map and no original source — it's the only artifact we have, and future upstream builds will keep replacing it. Before we can explode it into readable per-module files, write deobfuscation rules, or support lossless patch-back, we need a way to parse it once and query its structure (module boundaries, dependency graph, size, minified-vs-vendor-code) without ever loading the whole file into an editor or an LLM context window — some modules exceed 1MB and the file mixes genuinely minified app code with unminified vendor bundles (e.g. URI.js) that span many physical lines due to embedded comments.

This change documents the analysis tool already built and validated against the real bundle (2207 modules, entry module 0, confirmed correct dependency graph and vendor-code detection) — it's the foundation stage before Explode, Deobfuscation rules, and Patch-back.

## What Changes

- Add a `bundle-tool` CLI (`bin/bundle-tool.js`) with subcommands:
  - `index <bundle>` — single full Babel parse of the bundle; builds and caches a module index (byte offsets, dependency/dependent ids, size, minified-vs-vendor heuristic) alongside the bundle as `<bundle>.analysis.json`
  - `show <bundle> <id> [--raw]` — pretty-prints one module's factory body in isolation, with its deps/dependents in a header
  - `grep <bundle> <pattern> [--regex]` — searches module source per-module, returning only small context snippets, never the full match surface
  - `deps` / `dependents <bundle> <id> [--depth n]` — walks the dependency graph in either direction, capped at 40 printed ids per depth level to avoid flooding output on widely-shared utility modules (one module here has 855 direct dependents)
- Cache invalidation is automatic: the index is rebuilt whenever the bundle's size or mtime no longer matches the cached metadata.

## Capabilities

### New Capabilities
- `bundle-analysis`: parsing a Metro bundle into a queryable module index (boundaries, dependency graph, size/minification signal) and exposing it via a chunk-safe CLI, without requiring the full file to be loaded at once by a human or an LLM.

### Modified Capabilities
(none — first capability in this project)

## Impact

- New files: `package.json`, `bin/bundle-tool.js`, `src/parseBundle.js`, `src/commands/{index,show,grep,deps}.js`
- New dependency: `@babel/parser`, `@babel/generator`, `@babel/traverse`, `@babel/types`, `commander`
- Generates `*.analysis.json` cache files alongside any bundle analyzed (gitignored)
- No changes to `index.android.bundle` itself — read-only analysis
