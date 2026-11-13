## Why

Assembling a bundle with the project's current full patch set takes roughly
90 seconds in production (operator-reported), while the identical CLI
invocation on this sandbox's hardware takes ~3.6 seconds. Root cause found:
`assembleBundle` (`src/commands/assemble.js`) calls `loadIndex(outputPath)`
fresh before every patch and every patch-back pair, but it also rewrites
`outputPath` in place after each one — changing the file's size/mtime, which
invalidates `loadIndex`'s own on-disk cache (`src/parseBundle.js`, keyed by
size+mtime) on the very next iteration. The result: a full Babel parse of the
entire ~6MB bundle happens once per patch/pair applied, not once total — a
cost that scales with how many patches exist, not a fixed cost per assemble.
On weaker/shared VPS hardware this compounds into the reported 90s, and it
will keep getting worse as more patches are added over time.

## What Changes

- `assembleBundle` holds one in-memory representation of the bundle across
  its whole patch/patch-back-pair loop, applying every patch against that
  representation, and serializes to disk exactly once at the end — instead
  of writing-then-immediately-re-reading-and-re-parsing between every step.
- Scoped to `assembleBundle`'s own loop only — the workbench's standalone
  one-patch-at-a-time preview/apply flow (which already reads/writes once
  per user action, not in a tight loop) is explicitly out of scope.
- Add timing output (logged, not just silently fast) so the operator can
  verify the fix actually worked on their own hardware after this ships —
  the original diagnosis was made by reading the code plus a local
  benchmark that could not reproduce the 90s figure directly, so the real
  verification has to happen against the operator's own VPS.

## Capabilities

### New Capabilities
- `assemble-performance`: assembling a bundle must not re-parse the whole
  bundle once per patch/patch-back pair applied; cost should be roughly
  flat regardless of how many patches are in a given assemble call.

### Modified Capabilities
(none — no existing main spec describes `assembleBundle`'s internal
performance characteristics)

## Impact

- `src/commands/assemble.js`: `assembleBundle`'s patch/patch-back-pair loop
  is restructured to avoid the repeated full re-parse.
- `src/parseBundle.js` / `src/patches.js` / `src/reassemble.js`: whichever
  of these need a new in-memory-first code path (exact shape decided in
  design.md) — their existing file-path-based APIs, used elsewhere (e.g.
  the workbench's standalone patch preview), must keep working unchanged.
- No change to `bin/bundle-tool.js`'s CLI surface, `src/commands/ui.js`'s
  `/api/assemble` route, or `hub/src/server.js`'s assemble-submit route —
  this is purely an internal performance fix with no behavior change to any
  caller.
