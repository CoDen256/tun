## 1. Progress reporting

- [x] 1.1 In `runDeobfuscate` (`src/commands/deobfuscate.js`), print a progress line per module as it's processed (module id, size, and running count e.g. `[142/2190]`).

## 2. Size pre-filter

- [x] 2.1 Add a cheap structural size function (AST node count via a lightweight traversal, no canonicalization/generation).
- [x] 2.2 At rule-registration time, compute each registered rule's reference-pattern node count once (alongside its existing precomputed hash).
- [x] 2.3 In `applyRules`, compute a candidate's node count first and skip straight to rejection (no canonicalize/hash) when it falls outside every registered rule's tolerance band; otherwise proceed exactly as today.
- [x] 2.4 Unit test: a synthetic oversized candidate is rejected without triggering canonicalization (e.g. via a spy/counter on the canonicalize call), while a true match within the tolerance band is still detected.

## 3. Verification

- [x] 3.1 Re-run `bundle-tool deobfuscate index.android.bundle` against the real bundle, confirm total runtime drops substantially from the ~54s baseline and progress output is visible throughout, including during modules `158`, `461`, `281`.
- [x] 3.2 Confirm the deobfuscated output for every module is byte-for-byte identical to the pre-change output (e.g. diff the `deobfuscated/` directory before and after).
- [x] 3.3 Run the full existing `npm test` suite and confirm no regressions.
