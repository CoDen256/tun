## Why

Two real, narrow bugs were found during an independent review of the shipped
`p4-builder` implementation (archived 2026-10-25) and deliberately kept out
of that review's own fix pass as their own proposal, per operator direction
— both are small, unrelated to each other, and shouldn't block or get lost
inside the larger hub/builder UI work.

## What Changes

- **Audio trim is read.** `audio_sel_ms` is set by stabbur's authoring UI
  (a selection range inside a wider blob) but `builder`'s audio pipeline
  (`audioSnapshot.js`) never reads it — every card ships the full, untrimmed
  blob. Fix: trim to `audio_sel_ms` when building the per-card audio that
  reaches the device's snapshot, falling back to the untrimmed clip when
  `audio_sel_ms` is null (a note's audio need not be trimmed at all).
- **Deterministic drain order.** `pendingOccurrences.js`'s drain query has no
  `ORDER BY`, so when multiple queued occurrences cross `remaining <= 0` in
  the same run, they append to `Cards[]` in whatever order Postgres's
  physical storage happens to return — not reproducible, and not
  necessarily oldest-first. Fix: `ORDER BY id ASC` (insertion order), so the
  longest-waiting occurrence always drains first and a re-run from the same
  inputs produces the same bundle.

## Capabilities

### New Capabilities
<!-- None. -->

### Modified Capabilities
- `builder-pipeline`: the audio-snapshot step now trims to `audio_sel_ms`
  when present, instead of always shipping the full blob.

## Impact

- `builder/src/audioSnapshot.js` — trim logic (needs an audio-trimming
  approach; see design.md for the options and the one chosen).
- `builder/src/pendingOccurrences.js` — one `ORDER BY` added to the drain
  query in `drainPendingOccurrences`.
- No schema change, no new dependency beyond whatever the trim approach
  needs (see design.md).
- Depends on nothing else; independent of the hub/builder UI work in
  `hub-builder-operator-console` and the deployment work in the other two
  repos' proposals. Safe to implement and ship first.
