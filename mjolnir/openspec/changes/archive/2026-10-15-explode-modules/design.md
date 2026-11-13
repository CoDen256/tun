## Context

This is Phase 1 of a larger round-trip pipeline sketched out in exploration (not yet formalized as separate changes, but recorded here so the reasoning isn't lost):

```
Phase 1 (THIS CHANGE) — Explode
  one file per module + manifest (offsets, deps, data/logic classification)
        │
        ├── Phase 2 (future) — Data-module editing
        │     keyed diff by ID/Name across coupled data modules, splice back
        │
        └── Phase 3 (future) — Deobfuscation rule engine (logic modules)
              fingerprint known minified idioms via AST canonicalization
                    │
                    ▼
              Phase 4 (future) — Refactor-safety check
              confirm a human's rename/reformat pass was behavior-preserving
                    │
                    ▼
              Phase 5 (future) — Logic-module patch-back
              canonicalized structural diff → apply to original AST → re-minify
        │
        ▼
Phase 6 (future) — Reassemble (shared by Phase 2 and Phase 5)
  byte-copy every untouched module verbatim, splice in patched modules
```

Context established during exploration of the actual bundle that constrains all of the above:

- This is a **production/release** Metro bundle: all 2207 modules have `verboseName: null` (confirmed via the existing analysis cache). There is no recoverable file path or package name metadata anywhere in the file — any later "readable" naming has to come from pattern fingerprinting of code shape, never from metadata, because none survives.
- Every module's factory has a uniform 7-parameter signature — `(global, require, importDefault, importAll, module, exports, dependencyMap)` — with no trailing-parameter dropping observed across any of the 2207 modules. This held for this build; it's an empirical fact about this file, not a guarantee to assume for other Metro/Terser configurations.
- At least two modules (`2111`, a deck catalog, and `2113`, card content — both `deps: []`) are large plain data arrays, not code, and are referentially coupled to each other (every `2111[].Cards[].Card` must match a `2113[].ID`; every `2113[].DECK_ID` must match a `2111[].Name`). Phase 2 will need a classifier to route these away from the deobfuscation path and a cross-module validation pass — not needed in this change, but the `data`/`logic` classification this change produces is exactly the hook Phase 2 will key off of.
- There is no app and no repackaging step in scope for this tool at any phase: the deliverable is "bundle file in, optionally modified bundle file out." Nothing downstream (Hermes compilation, APK signing, etc.) is this tool's concern.
- A prior draft (`idea.md`) proposed a pipeline with similar stages but rested on assumptions that don't hold for this bundle, corrected during exploration: it assumed dependency-array entries carry real package names (false — they are bare numeric ids, confirmed above); it assumed a `_$$_REQUIRE`-named helper call survives into the bundle for pattern-matching (false — `require(dependencyMap[n])` has been minified down to an anonymous single-letter parameter call, e.g. `n(i[0])`, with no helper name left anywhere); and it proposed identifying stable AST nodes via a "deterministic path+shape hash" without specifying whether identity is position-based (breaks under sibling insertion/deletion, which Phase 2/5 both need to support — e.g. adding a new card or a new statement) or content-hash-based (needs an explicit collision tiebreaker for structurally identical siblings, e.g. two `return null;` statements). Phase 5's design will need to resolve this explicitly as content-hash-based identity with a sibling-position tiebreaker only on hash collision — noted here so it isn't lost before that change starts.

## Goals / Non-Goals

**Goals:**
- Turn the single-file bundle into a directory of per-module files that can be opened, searched, and read in a normal IDE.
- Produce a manifest that is the single source of truth later phases read from: module id ↔ exploded file path ↔ original byte offsets ↔ dependency ids ↔ data/logic classification.
- Make the classification heuristic structural and cheap (no need to fully understand a module's semantics to classify it) so it runs as part of explode with no separate pass.

**Non-Goals:**
- No reassembly / patch-back of any kind — this change only reads the bundle and writes exploded files, it never writes back into a `.bundle` file.
- No deobfuscation rules (Phase 3) — exploded logic-module files are pretty-printed with Babel's generator only, same as the existing `show` command already does; no pattern rewriting.
- No editing workflow or validation for data modules (Phase 2) — classification is produced here, but nothing consumes it yet beyond labeling.
- No incremental explode (only touching changed modules on re-run) — every `explode` invocation does a full rebuild of the output directory from the current index.

## Decisions

**Output layout: `<bundle>.exploded/<id>.js` + `<bundle>.exploded/manifest.json`.**
Mirrors the existing `<bundle>.analysis.json` cache convention (sibling of the bundle, derived/gitignored, size/mtime-dependent). One file per module id (not per `verboseName`, since none exist) keeps the mapping trivial and avoids inventing a naming scheme prematurely — later phases are free to add human-assigned names without this change having to guess them.

**Classification heuristic: structural, not content-sniffed.**
A module is `data` iff its dependency array is empty AND its factory body is exactly one statement that is a `return <ArrayExpression|ObjectExpression>` or `<exports-param>.<prop> = <ArrayExpression|ObjectExpression>` (or `module.exports = ...`), with no nested `FunctionDeclaration`/`FunctionExpression`/`ArrowFunctionExpression` anywhere inside that literal. Everything else is `logic`. This was validated by hand against modules `2110`/`2111`/`2113`/`2119`/`2124`/`2131` during exploration: it correctly classifies `2111` and `2113` as `data` (bare exported literals, no functions, no deps) and `2110`/`2119`/`2124`/`2131` as `logic` (they reference `.DECK_ID` as a property access inside real control flow, not as array contents) — confirming the heuristic doesn't fall for "the data-looking identifier `DECK_ID` appears in the source" the way a text-based classifier would.
- Alternative considered: classify by size alone (e.g. anything over some KB threshold is data). Rejected — module `158` (196KB) and `461` (200KB) are large *logic* modules in this bundle (per the earlier `index --top` output), so size alone would misclassify them.
- Alternative considered: content-sniff for JSON-like repetition (e.g. many similarly-shaped object literals). Rejected as strictly more work than checking "is the whole factory body just one literal" for the same result on every case observed so far; can be revisited in Phase 2 if a bundle with a less clean-cut data module shows up.

**Pretty-printing: reuse `show`'s existing Babel generate path, not a new printer.**
`runShow` in `src/commands/show.js` already does parse → `@babel/generator` → fallback-to-raw-on-failure. `explode` calls the same re-parse/generate logic per module rather than introducing a second pretty-printing implementation.

**Manifest schema is intentionally flat and JSON, not a database.**
2207 entries keyed by module id, each `{ path, start, end, factoryStart, factoryEnd, deps, dependents, classification }`. No new dependency needed; consistent with the existing `.analysis.json` cache format already produced by `buildAndCacheIndex`.

## Risks / Trade-offs

- [Risk] Pretty-printing every module (including the 1MB data module) could be slow or produce an unreadable multi-thousand-line file for `2113`. → Mitigation: data-classified modules are written with Babel's default generator settings same as logic modules in this change (no special-casing yet); if `2113`'s exploded form turns out to be unusable for Phase 2's editing workflow, that's Phase 2's problem to solve with a dedicated array-literal formatter, not blocking this change.
- [Risk] The data/logic heuristic is a snapshot validated against one bundle's six candidate modules; a differently-shaped module (e.g. a logic module that degenerately reduces to a single return of an object literal with no functions, like a pure constants module) would be misclassified as `data`. → Mitigation: classification is informational metadata in the manifest, not a gate on whether a module gets exploded — every module still gets a file regardless of classification, so a wrong label only misleads a later phase's defaults, it doesn't lose data or block explode.
- [Risk] Exploding 2207 files on every invocation (no incremental mode) could be slow for repeated use during iterative work. → Mitigation: out of scope for this change; the existing stale-cache-rebuild pattern in `parseBundle.js` already keeps the underlying index fast, and explode's own output directory can gain incremental behavior later if it proves necessary.

## Migration Plan

N/A — purely additive new command, no existing behavior changes, no data migration.

## Open Questions

- Should the exploded output directory structure change (e.g. group by classification into `exploded/data/` and `exploded/logic/` subfolders) once Phase 2/3 start consuming it, or is a flat `exploded/<id>.js` with classification only in the manifest sufficient long-term? Left unresolved — flat is simpler and this change doesn't need to predict Phase 2/3's exact needs.
