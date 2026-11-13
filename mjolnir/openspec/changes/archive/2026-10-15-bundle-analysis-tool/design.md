## Context

`index.android.bundle` is a Metro production bundle: a short runtime prelude followed by ~2207 `__d(factory, moduleId, dependencyArray)` calls, terminated by `__r(<entryId>)`. It has no shipped source map (the `//# sourceMappingURL` comment points at a file that doesn't exist alongside it) and no original source — this bundle, as-is, is the permanent ground truth we'll keep re-analyzing as upstream rebuilds replace it.

Two properties of the real file drove the design:
- Module bodies are not reliably one-per-line: some vendor code (e.g. URI.js) is bundled unminified, with license-comment blocks containing literal newlines, so a module's `__d(...)` call can span many physical lines.
- Module sizes vary by four orders of magnitude (237 bytes to >1MB for a data blob), and some modules (generic interop helpers) have 800+ dependents — any tool here has to assume both "module content" and "query results" can be too large to print in full.

## Goals / Non-Goals

**Goals:**
- Parse the bundle exactly once per analysis (full Babel AST parse), cache the result, and answer all subsequent queries from the cache without re-parsing.
- Make module boundaries exact regardless of embedded newlines/comments (must use AST node boundaries, not line splitting).
- Guarantee no command can dump an unbounded amount of text — large modules and high-fanout dependency queries must truncate predictably.
- Provide the dependency graph in both directions (deps and dependents) since Metro's dependencyMap already encodes it directly as module ids — no extra resolution step needed.

**Non-Goals:**
- Deobfuscation/renaming of identifiers (next stage).
- Splitting the bundle into per-module files on disk (Explode stage).
- Any mutation of the bundle (this stage is read-only analysis).
- Byte-identical round-trip guarantees (relevant to the later Patch-back stage, not here).

## Decisions

- **Full Babel parse over regex/line-splitting.** Regex-based `__d(` splitting breaks on the URI.js-style multi-line modules found during inspection. A real parse of the whole file, walking only top-level `Program.body` statements for `__d`/`__r` calls, is the only reliable way to get exact byte boundaries. Cost: one ~6MB parse, which is acceptable since it only happens on cache miss.
- **Byte-offset cache, not AST cache.** The cache (`<bundle>.analysis.json`) stores `{start, end, factoryStart, factoryEnd, deps, dependents, size, looksMinified, ...}` per module id, keyed by file size+mtime for invalidation — not the parsed AST itself (too large/non-serializable cheaply). `show`/`grep` re-slice the raw file by byte offset and parse only the requested module in isolation, so per-query cost stays O(module size), not O(file size).
- **Dependency graph for free.** Metro's `dependencyMap` arrays already contain real moduleIds (not local indices needing resolution), so the forward graph is read directly off each `__d` call's third argument; the reverse graph (dependents) is built by a single inversion pass over all modules after parsing.
- **Heuristic minified-vs-vendor detection.** `looksMinified` is approximated by whether the factory body's source slice contains any newlines — pre-minified app code is always single-line, vendor code bundled as-is retains its original formatting. This is a cheap signal to route modules differently in the future Deobfuscation stage (don't apply terser-pattern rules to already-readable vendor code), not a guarantee.
- **Output capping over pagination.** `deps`/`dependents` cap at 40 printed ids per depth level with an explicit "...and N more" rather than requiring a `--page`/`--offset` flag — simpler, and the cases that would matter (hub modules with hundreds of dependents) are better served by "it's a hub, move on" than by paging through all of them.

## Risks / Trade-offs

- [Risk] The `looksMinified` newline heuristic could misclassify minified code that happens to contain a template literal with an embedded `\n`, or wrongly flag a vendor module minified by the same pipeline as app code. → Mitigation: it's advisory only, feeding the next stage's rule selection, not a hard gate; can be refined with an identifier-length-ratio signal if it proves unreliable once we're deep in the Deobfuscation stage.
- [Risk] JSON cache could grow stale silently if something touches the bundle without changing size or mtime (unlikely but possible on some filesystems/tools). → Mitigation: `--force`-style rebuild is just deleting the `*.analysis.json` file; no further action needed given how cheap that recovery is.
- [Risk] A single full-file Babel parse is the dominant cost and will grow linearly as the bundle grows across upstream rebuilds. → Mitigation: acceptable now (sub-few-seconds on 6MB); revisit only if it becomes a bottleneck.

## Open Questions

- Should the minified/vendor signal be strengthened (e.g. identifier-length histogram) before the Deobfuscation stage relies on it to decide which rule set to apply per module?
