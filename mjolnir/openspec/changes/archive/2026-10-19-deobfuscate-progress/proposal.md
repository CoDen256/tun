## Why

Running `deobfuscate` against the real `index.android.bundle` (2190 logic modules) takes ~54 seconds with zero output until it finishes, which reads as hung. Profiling found the time is wildly uneven: four modules containing one giant top-level IIFE each (module `158`: 294KB, `461`: 300KB, `281`: 333KB, `2029`) account for ~50 of the 54 seconds, because `applyRules` fully canonicalizes and `generate()`s every IIFE-shaped candidate subtree to hash it — paying cost proportional to the candidate's size even though the only registered rule (`interop-wildcard`) is a small, fixed-size pattern that a 300KB subtree can never match.

## What Changes

- `deobfuscate` prints per-module progress as it runs (e.g. `[142/2190] module 461 (300KB)...`), so a long-running pass is visibly alive rather than silent.
- `applyRules` adds a cheap pre-filter before paying for canonicalize+hash on a candidate subtree: reject candidates whose node count falls outside a tolerance band around each registered rule's own reference-pattern size, before doing any expensive work. Rules remain correct (no match is skipped that the current implementation would have found) since the band is sized to the known rule's exact shape.

## Capabilities

### New Capabilities
(none)

### Modified Capabilities
- `module-deobfuscate`: adds a requirement for progress reporting during a deobfuscate run, and a requirement that candidate subtrees grossly larger than any registered rule's pattern are rejected without full canonicalization.

## Impact

- Modified files: `src/commands/deobfuscate.js` (progress output), `src/commands/deobfuscate.js`'s `applyRules` (or a new small helper) for the size pre-filter.
- No change to rule-matching correctness or output format of deobfuscated files — this only changes how fast/visibly the pass runs.
- No new dependencies.
