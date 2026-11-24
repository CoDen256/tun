# Design

> Staged like the proposal: stage 1 (D1–D8) covers the items without UI,
> stage 2 (D9–D16) the UI items. **The mockups in `mockups/` are to be
> implemented 1-1** (operator, 2026-11-24): layout, placement, labels, key
> bindings and states as shown. The mockup-only chrome is excluded: the
> dashed purple notes and the top switcher bar.

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

### D9. Settings is a screen inside the app (`mockups/settings-prepare.html`, screen A)

- ⚙ in the one nav opens a fifth screen, Settings, in the same page. The
  old `settings.html` stops being a separate page and redirects to that
  screen (tier-2 for the exact mechanism).
- The nav's ◐ theme button is **removed**. Theme is chosen only in Settings.
- Groups, exactly as in the mockup:
  - **Appearance:** Theme as System / Light / Dark, tagged "this device
    only", stored in the browser.
  - **Playback:**
    - Trim silence (default on);
    - Play sentence when opened (default on);
    - Trim in audiobook mode (default off).
  - **Transcription:** the STT provider select with the smia reachability
    hint. When smia is unreachable it shows the saved choice only.
  - **Books:** a read-only overview, collapsed by default. The operator
    chose to keep it.
- Every change saves immediately, with a per-row "✓ saved". There is no Save
  button and no browser dialog.
- The Library loses the Trim silence card.

### D10. Audiobook mode (`mockups/study.html`, item 3)

This is client-side behaviour. Nothing new is stored except the cursor,
which already exists.

- **Start:** "▶▶ Listen" beside the chapter name (desktop top bar; phone
  header line 2), or `L`. It reads the *current chapter* from the *current
  sentence*.
- **Untrimmed:** "Trim in audiobook mode" off, the default. The chapter
  chunk plays **continuously** from the current sentence's start, original
  pauses intact. The UI follows the playback position:
  - the shown sentence, the counter, the waveform and the live playhead
    advance as the position crosses each sentence boundary;
  - the cursor is saved per sentence.
- **Trimmed:** each sentence's speech window plays back to back.
- **Nothing is marked done.** Doneness is never written by audiobook mode.
- **While running:**
  - the banner (desktop: full width under the top bar; phone: compact at the
    top), showing the animated indicator, the chapter, the position, the
    tempo tag and a big ■ Stop;
  - on the phone, the four primary controls are replaced by "■ Stop
    audiobook";
  - a **screen wake lock** is held, shown on the phone as "☼ screen stays on".
- **Stop paths:**
  - banner Stop;
  - Space;
  - `Esc`;
  - a tap or click on the sentence waveform;
  - **any study action** (play, pause, record, compare, done-and-next,
    navigation, split, merge, transcribe, Formant Lab, first unfinished).

  A stop press **only stops**; it does not also perform the action. Stopping
  lands on the sentence being heard, in the normal study loop (trimmed play,
  etc.), and releases the wake lock.
- **Resume:** the same button reads "▶▶ Resume from N+1" and continues from
  the start of the **next** sentence. Navigating away (chapter step) clears
  the resume point.
- **Chapter end:** it stops with "End of chapter N" and a "next chapter ›"
  offer. It never runs into the next chapter.
- Autoplay (D12) does not apply inside audiobook mode.

### D11. Pause placement

- Pause is a small outlined pill "❚❚ pause K" directly after Play on
  desktop, not one of the four primary controls.
- On the phone it is a satellite pill above the Play column, so the four
  equal circles are unchanged (the existing equal-controls requirement
  holds).
- It is disabled when nothing plays and reads "▶ resume" while paused. The
  paused playhead shows a hollow cap.
- Play's glyph reads ↺ while the sentence plays.

### D12. Autoplay

- With "Play sentence when opened" on, every operator-initiated move to a
  sentence starts it playing at once:
  - done-and-next;
  - ←/→;
  - chapter step;
  - a strip tick;
  - first unfinished;
  - opening a sentence from Explore.
- A "↻ autoplay" chip sits in the lanes header ("autoplay off", struck
  through, when disabled) and flashes when it fires. The state line reads
  "autoplay ▸ playing".
- Autoplay obeys Trim silence like any play.

### D13. Split, reversed

- "✂ split…" (`X`; the phone's ⋯ sheet "Split…") **stops playback
  immediately** and enters split editing:
  - a red line on the sentence waveform, at the paused or playing position
    if it was inside the sentence, else at the middle;
  - the right part is shaded, the halves are labelled A / B, and the line
    can be dragged or tapped; ←/→ nudge it (Shift for coarse steps);
  - a split bar shows "splitting sentence N at t of d", with ▶ hear left,
    ▶ hear right, Cancel (`Esc`) and ✂ Confirm split (`Enter`);
  - the primary and secondary controls are dimmed and inert.
- **No split line exists before Split is pressed.** The old "split at the
  playhead" immediate action is gone.
- The split position maps back to an absolute millisecond through the drawn
  (possibly trimmed) window, clamped inside the stored span, as today.

### D14. Compact phone header

- At phone viewports the Study top is a grabber plus two lines:
  - `✕` (exit to Library) · book name · `⋯` (the secondary-actions sheet);
  - `‹ Chapter N ›` · `12 / 87` · `▶▶ Listen`.
- Pulling the grabber down, or tapping it, reveals the nav, which hides
  again after about 3 s or the next action.
- The ⋯ sheet holds Split…, Merge with next, Transcribe, Formant Lab, First
  unfinished, Previous sentence, Shortcuts, and Exit to library.
- There is no progress strip on the phone (existing requirement).

### D15. Chapter editing in Prepare (`mockups/settings-prepare.html`, screen B)

- **Data model.** Chapters stay `kind='chapter'` rows of the config.
  - **Start new chapter at sentence k:** shortens the chapter to end at
    sentence k's start, inserts a new chapter row from there to the old
    end, and re-parents sentences k… to it. Every later chapter's
    `order_index` shifts.
  - **Merge with next chapter:** extends the first chapter to the second's
    end, re-parents the second's sentences, and deletes the second row.
  - **Chapter title:** a new nullable `title` column on segments, used only
    for chapters. On merge the first chapter's title wins, else the second's.
- **No progress is touched.** Sentence spans are unchanged. Chapter chunks
  are keyed by boundaries, so new chunks are cut, and background preparation
  (audio-accuracy) covers them.
- **UI, exactly as the mockup:**
  - between two sentences of an open chapter, hover shows a dashed line and
    "⤒ Start new chapter here";
  - "⤒ Show chapter breaks" pins every break point (the touch path);
  - an in-page confirm lists what stays, where the new chapter starts, the
    renumbering, and "▶ hear the boundary";
  - after confirming, the new header flashes and a toast offers **Undo**;
  - each chapter header except the last has "⇣ Merge with next chapter",
    with an in-page confirm;
  - "✎ Title" edits inline. The number stays automatic; the title is shown
    in Explore and in Study's chapter label;
  - a sentence-level "⇣ Merge" on a chapter's last sentence explains that
    the chapters must be merged first.
- Chapter edits count as **manual edits of the active config**. The config
  card shows "✎ N manual edits". The re-analyse warning names chapter
  breaks, chapter merges and titles among what it discards. Other configs
  are untouched.
- **Undo** is the inverse operation (merge back / split back / restore
  title), offered for the toast's lifetime.

### D16. What the mockup does *not* decide (tier-2, builder's judgment)

- the exact redirect mechanism from the old `settings.html`;
- the PWA icon artwork;
- the wake-lock fallback when the API is unavailable (state it in the
  banner; never fail audiobook mode for it);
- the precise boundary-crossing detection for continuous playback, provided
  that acceptance A10's tolerance holds.

## Risks / Trade-offs

- [The chapter chunk is larger than one sentence, so Explore uses more data
  on the phone] → chunks are already prepared server-side and cached
  client-side (LRU of 3). Explore loads only expanded chapters.
- [The optimistic advance can disagree with the server] → reconcile on the
  response; a failure reverts and shows an error.
- [Basic auth inside a standalone PWA window may prompt once] → documented in
  OPERATOR-CHECKLIST. No code mitigation; the gateway auth (D160) is not
  altered.
- [Continuous playback needs boundary tracking off one `<audio>` element,
  and a background tab throttles rAF] → the chapter player already has a
  `timeupdate` backstop (audio-accuracy). The sentence shown may lag the
  audio by ≤ 250 ms in a hidden tab; the wake lock keeps the phone visible.
- [Chapter edits change chunk keys, so the next entry to an edited chapter
  re-cuts it] → the existing background preparation and the 503-preparing
  retry cover it.
- [More than one owner id in prod data] → the migration aborts loudly
  (D1). The operator resolves it by hand.

## Migration Plan

1. The shadow migration adds the settings store, adds the nullable chapter
   `title` column, and pins the owner id (aborting on more than one).
2. A background import copies the two phonexa settings once.
3. Rollback: the previous image still works against the kept columns.
   Settings written after the cutover would be lost on rollback, which is
   acceptable.
