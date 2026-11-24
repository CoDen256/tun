# Design

> Staged like the proposal. Stage 1 decisions are below. Stage 2 (UI items)
> is appended when its mockups are accepted.

## Context

See proposal.md for the motivation. The current state that shapes the
approach:

- **Profiles and settings.** shadow proxies `/api/v1/users` and
  `/api/v1/settings` to phonexa (`phonexa_client.py`).
  - Preferences live in phonexa's `settings` table: `transcribeBackend` and
    `shadowTrimSilence`.
  - Every shadow table carries a plain-integer `user_id`, with no FK (D42).
- **Explore previews.** They use `Preview`, an `<audio>` whose source is
  `GET /segments/<id>/audio`, a decode-accurate ffmpeg cut per request.
  - The "live line" is a CSS animation of fixed duration, not tied to
    playback.
  - Prepare already plays from the chapter chunk (`ChapterAudio`) when it is
    loaded.
- **Microphone.** Study caches the `getUserMedia` stream (`st.micStream`) and
  never stops its tracks.
- **Done-and-next.** `go()` awaits the progress POST, then
  `App.refreshBook()` (the whole book detail), before rendering the next
  sentence.
- **Split and merge trims.** These compute their speech window with
  `audio.local_speech_window`, corrected on 2026-11-17. Rows produced
  before that fix keep skewed windows.

## Goals / Non-Goals

**Goals:**
- Remove shadow's runtime dependency on phonexa for users and settings.
- Give every player surface one behaviour: Play restarts, Pause
  pauses/resumes, and the playhead is truthful.
- Remove every visible wait from the study loop's hot path.

**Non-Goals:**
- **No backfill of old speech windows.** The operator re-analyses a book
  when it matters.
- **No offline mode and no service worker** for the PWA.
- **No change to phonexa's code.** phonexa's `users` and `settings` rows are
  left in place, only no longer read by shadow after the one-time import.
- **No `user_id` column drop.** The operator chose to keep the columns.

## Decisions

### D1. Single owner, pinned id, columns kept

shadow has exactly one owner, and the `user_id` columns stay.

- **The owner id is pinned once, by migration.**
  - If shadow's data holds exactly one distinct `user_id` across media,
    uploads, progress ranges and cursors, that id is the owner.
  - With no data, the owner is a constant default.
  - With **more than one distinct id**, the migration aborts with a message
    naming them. It never merges silently. In the build that is a tier-3
    condition: data would be destroyed or merged.
- **Every request uses the owner id server-side.** The client stops sending
  `userId`, and the server ignores one if sent. That keeps old tabs working.
- **Upload no longer asks phonexa** whether the user exists.
- *Alternative rejected:* dropping the columns. The operator's choice: less
  migration risk, and the columns cost nothing.

### D2. Settings are owned by shadow

Preferences live in one shadow-owned store: a table in shadow's database, so
they are covered by the existing `shadow.sql` dump. This is D165's "one
authoritative place the service owns".

- Keys at stage 1: the STT provider and trim silence.
- Stage 2 adds autoplay-on-open and trim-in-audiobook-mode.
- **One-time import.** A best-effort import reads the owner's
  `transcribeBackend` and `shadowTrimSilence` from phonexa.
  - It runs after migration, retried in the background (D157 serves before
    it migrates).
  - If phonexa is unreachable or has no value, the defaults apply: trim ON,
    provider `hf_whisper`.
  - Once a value is stored, phonexa is never consulted again for it.
- **Theme stays per device** (browser storage). It is not in this store.
- *Alternative rejected:* keep proxying phonexa settings. It keeps a runtime
  coupling the operator asked to remove.

### D3. Explore uses chapter chunks

- Expanding a chapter in Explore ensures that chapter's chunk via the same
  cache Study and Prepare use. A preview is then a bounded seek within it.
- If the chunk is still preparing, the preview shows a loading state on that
  cell and plays when ready. It never plays silence and never plays a
  neighbour.
- The per-sentence endpoint stays for the Formant Lab hand-off and other
  callers.
- *Alternative rejected:* cache per-sentence cuts. Still a request per
  sentence, and the live line would still need real timing.

### D4. One player model

All sentence players share these semantics: Study's lane, Prepare's row
preview and Explore's cell preview.

| control | when stopped | when playing | when paused |
|---|---|---|---|
| ▶ (Space in Study) | play from start | **restart** from start | restart from start |
| ⏸ (secondary) | — (disabled) | pause, playhead frozen | resume from paused point |

- Starting any player stops every other one on the page.
- In Study, Pause is a **secondary** control in the control tray. Its exact
  placement and key binding are fixed with the stage-2 Study mockup.

### D5. Microphone lifetime

`getUserMedia` is acquired when recording starts. Every track is stopped
when recording stops, is cancelled, or the screen is left. Re-acquiring per
take costs a few hundred ms at most. Permission persists, so there is no
prompt.

### D6. Optimistic done-and-next

- **Done-and-next:**
  1. Marks the sentence done in the client's state.
  2. Renders the next sentence and starts its chapter audio at once.
  3. Writes progress in the background.
  4. Reconciles from the server's answer. The book is not fully reloaded on
     every step.
- **On failure:** a visible, persistent error. The sentence reverts to
  not-done in the strip and counts, so the operator never believes something
  is saved that isn't.

### D7. Split/merge trim parity

The speech window computed after a manual split or merge SHALL equal what
analysis would compute for the same span with the same config thresholds,
within a small tolerance. `local_speech_window` already intends this since
2026-11-17. The build verifies it and fixes any remaining difference. No
backfill of older rows.

### D8. PWA

- A web manifest (name "shadow", start URL and scope `/shadow/`,
  `display: standalone`, theme colours from studio.css) plus icons.
- The manifest link is fetched with credentials, because the gateway's
  operator `basic_auth` covers `/shadow/`.
- No service worker.
- This is operator plane only. The gateway configuration changes only if the
  manifest's MIME type needs it, and never on device-plane routes.

## Risks / Trade-offs

- [The chapter chunk is larger than one sentence, so Explore uses more data
  on the phone] → chunks are already prepared server-side and cached
  client-side (LRU of 3). Explore loads only expanded chapters.
- [The optimistic advance can disagree with the server] → reconcile on the
  response; a failure reverts and shows an error.
- [Basic auth inside a standalone PWA window may prompt once] → documented in
  OPERATOR-CHECKLIST. No code mitigation; the gateway auth (D160) is not
  altered.
- [More than one owner id in prod data] → the migration aborts loudly
  (D1). The operator resolves it by hand.

## Migration Plan

1. The shadow migration adds the settings store and pins the owner id
   (aborting on more than one).
2. A background import copies the two phonexa settings once.
3. Rollback: the previous image still works against the kept columns.
   Settings written after the cutover would be lost on rollback, which is
   acceptable.
