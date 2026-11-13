## 0. Before you write any code

Read `design.md` in full, especially D-P1 (parse once, incrementally
update offsets, serialize once) and the Risks section's equivalence-test
requirement. Read `src/parseBundle.js`'s `parseBundle`/`buildAndCacheIndex`/
`loadIndex`, `src/patches.js`'s `applyPatch`/`computePatchedModuleSource`,
and `src/reassemble.js`'s `reassembleBundle` in full before changing
`assembleBundle` — understand exactly what each currently reads from disk
vs. takes as an in-memory parameter, so the new in-memory-first path reuses
as much of the existing module-locating/splicing logic as possible rather
than reimplementing it.

## 1. In-memory assemble loop

- [x] 1.1 `assembleBundle` builds the module index once, against the
      original base bundle copy, before the patch loop begins.
- [x] 1.2 Each patch/patch-back pair application updates an in-memory
      buffer and incrementally recomputes affected module offsets (shift
      every module after the edited region by the size delta), instead of
      writing to disk and calling `loadIndex` again.
- [x] 1.3 Companions and the final placeholder-substitution pass also
      operate against the in-memory buffer, not a freshly-read file.
- [x] 1.4 `outputPath` is written exactly once, after every
      patch/pair/companion/placeholder step has been applied in memory.
- [x] 1.5 Failure handling is unchanged: a failure at any step still
      results in no partial output file on disk (task 5.3's existing
      guarantee from `builder-logic-bundle-store`/D-L7 — re-verify this
      still holds with the new in-memory-first flow).

## 2. Timing

- [x] 2.1 Log total wall-clock duration at the end of `assembleBundle`
      (success and failure paths both), operator-visible without a debug
      flag (D-P2).

## 3. Tests

- [x] 3.1 Equivalence test: assembling the same inputs (base folder,
      patches, patch-back pairs, companions, placeholder values) via the
      new implementation produces byte-identical output to a fixture
      captured from the current (pre-fix) implementation — this is the
      most important test in this change; a speed improvement that
      silently changes output bytes is worse than the bug being fixed.
- [x] 3.2 Test: assembling with an increasing number of patches/pairs does
      NOT call the underlying full-bundle parse more than once (assert on
      a call-count spy/mock around `parseBundle`, or equivalent), proving
      the actual fix rather than just a wall-clock speed assertion (which
      would be flaky/hardware-dependent in CI).
- [x] 3.3 Re-run every existing test touching `assembleBundle` (CLI
      `assemble` command tests, `/api/assemble` tests, hub's
      assemble-submit tests) — confirm none assumed the old per-step
      file-write-then-reread behavior in a way that breaks.

## 4. Sign-off

- [x] 4.1 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
- [x] 4.2 **(Operator, outside this change)** Assemble the project's full,
      real patch set on the actual production VPS (not this sandbox) and
      compare the new timing log's reported duration against the
      previously-observed ~90s — confirm it's now in the few-seconds
      range this sandbox's benchmark predicted. If it isn't, that's a
      signal something beyond the diagnosed mechanism is also
      contributing — report back rather than assuming success.
