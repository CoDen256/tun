# Proposal

Package **"Shadow playback, splitting & chapter reading"** of batch
`shadow-smia-pronunciation` (D161). The backlog items are listed verbatim in
`batches/shadow-smia-pronunciation/manifest.md`.

> **Capture state.** This proposal is written in stages as the design
> session locks items in. Stage 1 (below) covers the items that need no
> mockup. The UI items are added once their mockups are accepted: the
> settings screen, audiobook mode, the Study split flow, chapter splitting
> in Prepare, the compact phone header and autoplay. Until then the
> **What Changes** list and the capabilities are incomplete on purpose.

## Why

shadow's study loop works, but it has accumulated friction:

- Explore previews lag, drift from the live line, and sometimes play nothing.
- The browser's microphone indicator stays on after the first take.
- "ready, next" waits on two round trips before it shows anything.
- Pause exists nowhere, and previews in Prepare and Explore don't behave like
  Study's player.
- shadow still depends on phonexa for profiles and settings, although the
  operator uses exactly one profile.

The operator now studies mostly on the phone and wants shadow installable
there as an app.

## What Changes

Stage 1 (locked 2026-11-24):

- **shadow becomes single-user.**
  - The profile picker is removed.
  - shadow stops calling phonexa for users or settings.
  - The `user_id` columns are kept, and every row uses one pinned owner id.
  - Settings move into a shadow-owned store, imported once from phonexa's
    settings rows.
  - phonexa is still used for pitch analysis and the Formant Lab hand-off.
  - **BREAKING** for shadow's `/api/v1/users` and `/api/v1/settings`
    proxies. They are removed or replaced, and no client outside shadow uses
    them.
- **The microphone is held only while recording.** The stream is released as
  soon as a take stops.
- **Explore plays from the chapter chunk.** This replaces live server-side
  per-sentence cuts. The live line follows the real playback position.
- **Done-and-next advances immediately.** The progress write runs in the
  background, and a failure is surfaced, never lost silently.
- **One play/pause model everywhere.** Play restarts the sentence. A
  secondary Pause pauses and resumes. Study, Prepare previews and Explore
  previews behave identically.
- **A freshly split or merged sentence trims exactly like an analysed one.**
  No backfill: existing rows are disposable, and the operator re-analyses a
  book if needed.
- **shadow is installable as a PWA.** It gets a web manifest and an icon,
  opens standalone, and has no offline mode.

Stage 2 (pending mockups) covers:

- the redesigned settings screen
- audiobook (chapter-reading) mode
- the reversed split flow in Study
- chapter split and merge in Prepare
- autoplay on opening a sentence
- the compact phone header

## Capabilities

### New Capabilities
- `app-settings`: shadow's own settings store and its single-owner model.
  Where preferences live, and that no profile concept exists. Stage 2 adds
  the settings screen itself.
- `installable-app`: shadow can be installed from the browser as a
  standalone app.

### Modified Capabilities
- `study-loop`: pause added; the microphone is released after recording;
  done-and-next advances without waiting on the server.
- `book-browsing`: Explore previews play from the chapter chunk with a
  truthful live line and the shared play/pause model.
- `split-configs`: the Prepare sentence preview follows the shared play/pause
  model.
- `silence-trimming`: a manually split or merged sentence's speech window
  equals what analysis would produce. The trim preference is stored by
  shadow, not phonexa.

## Impact

- shadow only (`shadow/`). No change to phonexa's code: shadow simply stops
  calling its users and settings endpoints.
- **New ADR D168:** shadow is single-user and owns its settings. This
  amends how D147 arranged shadow's profiles through phonexa.
- Data: one shadow migration adds the settings store and pins the owner id.
  Stored spans, progress ranges and the cursor are untouched.
- Device plane (`docs/11`): untouched. The PWA lives entirely in the
  operator plane at `/shadow/`.
