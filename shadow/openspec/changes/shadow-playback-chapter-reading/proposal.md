# Proposal

Package **"Shadow playback, splitting & chapter reading"** of batch
`shadow-smia-pronunciation` (D161). The backlog items are listed verbatim in
`batches/shadow-smia-pronunciation/manifest.md`.

> **Capture state: complete.** Stage 1 (items without UI) was locked on
> 2026-11-24, and stage 2 (UI items) was locked the same day after the
> operator accepted both mockups in `mockups/`. The operator's instruction:
> **"this should be implemented 1-1"**. The mockups are the visual contract
> for layout, placement, labels and states, not inspiration.

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

Stage 2 (locked 2026-11-24; the mockups are `mockups/settings-prepare.html`
and `mockups/study.html`):

- **Settings becomes a screen inside the app,** opened from ⚙ in the one
  nav, replacing the old phonexa-styled `settings.html`. It has these
  groups:
  - Appearance: Theme as System / Light / Dark, this device only.
  - Playback: Trim silence (moved from Library), Play sentence when opened,
    and Trim in audiobook mode.
  - Transcription: the STT provider, with a smia reachability hint.
  - Books: a read-only overview, collapsed.

  Changes save instantly with a per-row "✓ saved". The nav's ◐ theme button
  is removed.
- **Audiobook mode.**
  - "▶▶ Listen" (`L`) beside the chapter name reads the current chapter
    from the current sentence, without marking anything done.
  - Untrimmed it plays continuously at natural tempo; with "trim in
    audiobook mode" on, it plays the trimmed sentences back to back.
  - A banner with a big Stop marks the running state, and a wake lock keeps
    the phone's screen on.
  - Stop, Space, a tap on the waveform or any study action stops it on the
    current sentence. "▶▶ Resume from N+1" continues from the next sentence.
  - It stops at the end of the chapter.
- **Pause** (`K`) is a secondary pill beside Play.
- **Split, reversed.** Split stops playback and only then shows a draggable
  split line, with hear left / hear right and Confirm / Cancel.
- **Autoplay.** Moving to a sentence plays it at once. A setting controls
  this, with a "↻ autoplay" chip shown above the waveforms.
- **The phone header is compacted** to a grabber and two lines:
  - ✕ · book · ⋯
  - ‹ chapter › · position · ▶▶ Listen
- **Chapters can be customised in Prepare:**
  - "⤒ Start new chapter here" between any two sentences;
  - "⇣ Merge with next chapter" on each chapter header;
  - an optional chapter title.

  These edits are manual edits of the active split config.

## Capabilities

### New Capabilities
- `app-settings`: shadow's own settings store, its single-owner model and
  the in-app Settings screen.
- `installable-app`: shadow can be installed from the browser as a
  standalone app.
- `audiobook-mode`: hands-free reading of a chapter, sentence by sentence,
  with the ability to stop into the study loop and resume.

### Modified Capabilities
- `study-loop`:
  - pause added;
  - the microphone is released after recording;
  - done-and-next advances without waiting on the server;
  - the split flow is reversed;
  - autoplay on moving to a sentence;
  - new bindings (`K`, `L`);
  - the compact phone header.
- `book-browsing`: the nav loses ◐ and gains the ⚙ Settings screen. Library
  no longer holds the trim switch.
- `book-browsing`: Explore previews play from the chapter chunk with a
  truthful live line and the shared play/pause model.
- `split-configs`:
  - the Prepare sentence preview follows the shared play/pause model;
  - chapters can be split, merged and titled by hand;
  - re-analysis discards those chapter edits too.
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
