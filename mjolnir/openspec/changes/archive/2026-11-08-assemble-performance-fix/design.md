## Context

`assembleBundle` (`src/commands/assemble.js:88-115`):

```js
for (const patch of patches) {
  const cache = loadIndex(outputPath);       // full re-parse if stale
  await applyPatch({ bundlePath: outputPath, cache, patch });
}
for (const pair of patchbackPairs) {
  const cache = loadIndex(outputPath);       // full re-parse if stale
  ...
  const outBuffer = reassembleBundle(outputPath, cache.modules, [...]);
  fs.writeFileSync(outputPath, outBuffer);   // invalidates the cache for next iteration
}
```

`loadIndex` (`src/parseBundle.js:214-233`) caches its result in a JSON
sidecar file keyed by the bundle's own size+mtime. Every
`fs.writeFileSync(outputPath, ...)` changes both, so the very next
`loadIndex(outputPath)` call sees a stale cache and calls `parseBundle`
(`src/parseBundle.js:77`) — a full Babel `parse()` of the entire bundle
source — from scratch. Confirmed by reading `parseBundle`: it re-parses the
*whole* ~6MB source every time, not just the changed region. Local
benchmark (this sandbox, 3 patch-back pairs + 2 companions): 3.6s total.
Operator-reported production figure: ~90s. The discrepancy is consistent
with weaker/shared VPS CPU paying a much higher absolute cost for the same
repeated-full-parse pattern — not confirmed by direct profiling on that
hardware, since this sandbox cannot reproduce the 90s figure directly (see
Risks).

## Goals / Non-Goals

**Goals:**
- Total assemble cost should be roughly flat regardless of how many patches
  are applied in one call — not scale linearly with patch count the way it
  does today.
- No behavior change to any caller (CLI, `/api/assemble`, hub's
  assemble-submit) — same inputs produce the same output bundle, just
  faster.
- Add enough timing visibility that the operator can confirm the fix
  actually worked on their own hardware, independent of this sandbox's
  benchmark.

**Non-Goals:**
- Not fixing the same repeated-re-parse pattern anywhere else it might
  exist (e.g. the workbench's standalone one-patch-at-a-time preview flow)
  — that path reads/writes once per discrete user action, not in a tight
  loop, so it doesn't have this specific scaling problem.
- Not changing `loadIndex`'s on-disk cache mechanism itself, or its use by
  other callers outside `assembleBundle`'s loop.

## Decisions

### D-P1 — Parse once, apply every patch against an in-memory representation, serialize once

Build the module index via `parseBundle`/`loadIndex` exactly once, against
the **original** base bundle (before any patch is applied). Every
subsequent patch/patch-back pair in the loop operates against an in-memory
buffer plus an index that's **incrementally updated** after each change —
not re-derived from a fresh parse. A single module's content changing by N
bytes shifts every later module's byte offset by exactly N; recomputing
that shift is O(module count), not O(re-parse the whole file), and the
existing index already has every module's offset recorded. `outputPath` is
only written once, after the last patch/pair/companion/placeholder-pass has
been applied in memory.

Alternative considered: keep writing to disk between steps but make
`loadIndex` smarter (e.g. a content hash instead of mtime, or accepting an
explicit "trust this in-memory cache" override). Rejected — this still
pays for at least the disk I/O round-trip every iteration, and doesn't
address the actual expensive part (the Babel parse itself), only the cache
invalidation check around it.

### D-P2 — Log a wall-clock duration per assemble call

Add one log line (operator-visible, not gated behind a debug flag) at the
end of `assembleBundle` reporting total elapsed time. This is the
verification mechanism — the original performance diagnosis was made by
reading the code and benchmarking locally, which could not reproduce the
reported 90s figure; real confirmation requires the operator comparing
before/after timings on their own deployment, not just trusting a local
number from a different machine.

## Risks / Trade-offs

- **The 90s figure couldn't be reproduced or profiled directly on the
  operator's own hardware before this fix** — the diagnosis (repeated full
  re-parse, cost scaling with patch count) is a strong, code-confirmed
  explanation for the *mechanism*, but the exact magnitude on that specific
  VPS is unverified. Mitigated by D-P2's timing log — the operator can
  confirm post-fix directly, and if the improvement is smaller than
  expected, that's a concrete signal something else is also contributing
  (worth a follow-up investigation, not silently assumed fixed).
- **Incrementally maintaining offsets after each patch is new logic, not
  reusing `parseBundle`'s already-tested full-parse path** — needs its own
  dedicated tests confirming a bundle assembled via the new in-memory loop
  is byte-identical to one assembled via today's (slow) per-step reparse,
  for the same inputs. This is the main implementation risk, not a design
  gap — call it out explicitly in tasks.md as a required equivalence test,
  not just a speed test.
