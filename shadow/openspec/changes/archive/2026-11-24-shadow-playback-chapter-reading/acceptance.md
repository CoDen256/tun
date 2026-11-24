# Acceptance criteria — shadow-playback-chapter-reading

The review contract for the build phase. Every criterion is an observable
end state, confirmed in dev compose by looking at the running UI
(claude-in-chrome), the browser's network panel, or the database — never by
reading code or trusting a log line. An agent that did not write the code
verifies these.

Dev setup: the root stack up, shadow reachable through the gateway, and a
book with a real stored Opus master, several chapters and tens of sentences
whose sentences are **distinguishable by ear and by waveform** (e.g. each a
different tone frequency, separated by silence — as in
shadow-studying-refinements' acceptance setup).

Items are numbered in the order they were locked. Stage 2 items are appended
below stage 1.

---

## Stage 1 — locked 2026-11-24

### A1 — Single owner, shadow-owned settings

1. On Library, Explore, Study, Prepare and the settings page, **no profile
   picker** and no profile create/rename/delete control is rendered.
2. With a book that had done sentences and a cursor before the change: after
   deploying, the book's done count and its "chapter · sentence" position in
   the Library are identical to before.
3. Stop the phonexa container. In shadow change trim silence and the STT
   provider, reload: both changed values are shown. The browser's network log
   for the session shows **no request to a `/api/v1/users` endpoint**.
4. Seed phonexa's settings for the owner with provider ≠ `hf_whisper` and
   trim OFF, start a fresh shadow database over the same media data: after
   boot, shadow shows that provider and trim OFF. With phonexa down at first
   boot instead, shadow shows trim ON and `hf_whisper`.
5. Run the migration against a database whose shadow rows carry **two**
   distinct `user_id` values: it fails naming both ids, and a row count and
   checksum of the affected tables are unchanged.
6. Switching the theme on one browser does not change it on a second,
   independent browser session.

### A2 — One player model

1. In Study, play a sentence and press Pause at roughly the middle: audio
   stops and the playhead stays at the same position for 2 s. Press Pause
   again: audio resumes from that point (the waveform position under the
   playhead does not jump back to 0).
2. While paused, press Play (or Space): the playhead jumps to the start and
   the sentence plays from its beginning.
3. Pause is rendered in the control tray as a visibly secondary control, and
   the four primary controls (play, record, compare, done-and-next) are
   unchanged in size and order.
4. The same pause/resume and play-restarts behaviour holds for a Prepare row
   preview and an Explore cell preview. Starting any preview while another
   sentence plays stops the first one (only one sound is audible).

### A3 — Explore plays from chapter chunks

1. Expand a chapter in Explore and play five previews: the network panel
   shows the chapter chunk request(s) and **no `/segments/<id>/audio`
   request**.
2. Each of the five previews plays its own tone (no silence, no neighbour's
   tone) — repeated 10 times rapidly, zero silent previews.
3. A preview's progress indication tracks playback: paused at half, it stops
   at about half (±10 %) and stays there.
4. Expanding a chapter whose chunk is still being prepared shows a loading
   state on the pressed preview, and it plays once the chunk arrives.

### A4 — Microphone only while recording

1. Record a take and stop: within 1 s the browser's tab microphone indicator
   disappears (Chrome's tab/address-bar mic icon is gone;
   `navigator.mediaDevices` has no live audio track). Starting a new take
   records normally without a permission prompt.
2. Leaving Study while recording also clears the indicator.

### A5 — Done-and-next is immediate

1. With the network throttled so the progress POST takes ≥ 2 s
   (DevTools throttling or a delayed route), press Enter: the next sentence's
   position counter and waveform are shown in **under 300 ms**, before the
   POST completes; after it completes the previous sentence reads as done and
   stays done after reload.
2. With the progress endpoint made to fail (e.g. shadow's DB stopped), press
   Enter: an error is shown in-page, and the previous sentence reads as **not
   done** in the strip and in Explore.

### A6 — Trim parity after manual edits

1. In a freshly analysed config, take a sentence whose analysed window trims
   leading silence, split it in two: the first half's window start equals the
   original's analysed window start within 20 ms, and the second half's
   window end equals the original's within 20 ms (read from the manifest /
   segment rows). Merge the halves back: the merged window equals the
   original within 20 ms at both edges.

### A7 — Installable app

1. Chrome (desktop or Android, through the gateway) offers "Install app" for
   shadow; DevTools → Application → Manifest shows name "shadow", start URL
   and scope at shadow's prefix, display `standalone`, and an icon, with no
   manifest errors.
2. The installed app opens shadow's Library in a window without an address
   bar.
3. `/ota/*`, `/blob/*`, `/audio-manifest/*` and `/mjolnir/userdata/*`
   responses are byte-identical in status and headers before and after the
   change (device plane untouched).

---

## Stage 2 — locked 2026-11-24 (UI; mockups to be implemented 1-1)

**Visual contract.** For every item below, the reviewer opens the matching
mockup (`mockups/settings-prepare.html` or `mockups/study.html`) beside the
built screen, at desktop width and at 390×844, in light and dark. Placement,
labels, glyphs, key hints and state transitions must match. Mockup-only
chrome is excluded: the purple dashed notes and the switcher bar. Any
deviation is a failure unless `DECISIONS-MADE.md` records it as tier-2 with a
reason.

### A8 — Settings screen

1. ⚙ in the nav opens Settings inside the same page (the URL stays on the
   app, and the nav remains), with the groups Appearance, Playback,
   Transcription and Books in that order, as in mockup screen A.
2. Flip each of the three Playback switches and change the provider: each
   row shows "✓ saved" and no Save button exists; after reload, all four
   values persist.
3. With smia stopped, the Transcription row reads unreachable and the select
   shows the saved provider only.
4. The Books group is collapsed by default; expanded, it lists every book
   with duration, sentences done and %.
5. No ◐ button exists in the nav on any screen, and the Library shows no Trim
   silence card. Opening the old `settings.html` URL lands on the Settings
   screen.

### A9 — Chapter editing in Prepare

1. Open chapter 2 of the active config and hover between sentences 4 and 5:
   a dashed line and "⤒ Start new chapter here" appear. Click it: an in-page
   confirm lists "Chapter 2 keeps sentences 1–4", the new chapter's start
   time, and the renumbering. Confirm: chapter 2 has 4 sentences, chapter 3
   starts with the former sentence 5, later chapters are renumbered +1, and
   the book's done count is unchanged.
2. Every sentence's start/end (via the segments API or DB) is identical
   before and after A9.1, and so are the progress ranges.
3. The toast after A9.1 offers Undo; clicking it restores the previous
   chapters exactly.
4. "⇣ Merge with next chapter" on a header shows an in-page confirm. After
   confirming, the chapter count falls by one and the sentences are joined.
   The last chapter has no such button.
5. "⤒ Show chapter breaks" pins every break point as a tappable pill; at
   390×844, a break can be made by tapping alone.
6. Make a break in config A, then activate config B: B's chapters are
   unchanged. The config A card reads "✎ N manual edits". Its "Adjust &
   re-analyse" warning names chapter breaks, chapter merges and chapter
   titles, and after re-analysis the break is gone.
7. Merging a chapter's last sentence with the next sentence is refused
   in-page with "merge the chapters first". No browser dialog appears
   anywhere in A9.
8. Title chapter 3 "Første del" via ✎ Title: Explore and Study show
   "Chapter 3 · Første del"; after a break before chapter 3 the title moves
   with that chapter (it becomes chapter 4).

### A10 — Audiobook mode

1. On sentence 12 of a chapter, press "▶▶ Listen" (or `L`): the shown
   sentence, counter, waveform and playhead advance through 13, 14… by
   themselves. After 3 sentences, stop: the done count is unchanged from
   before starting.
2. With "Trim in audiobook mode" off, record the audio output across a
   sentence boundary: it equals the chapter recording over the same span,
   with the original pause and no added silence (no gap > 50 ms beyond the
   master's own).
3. With it on, the inter-sentence silence is skipped: the time between the
   end of one sentence's speech and the start of the next is under 150 ms.
4. During the run, the sentence shown changes within 300 ms of the audio
   crossing a sentence boundary (tab visible). After stopping and
   reloading, the book opens on the last sentence reached.
5. While running, the banner shows "Audiobook mode — reading Chapter N
   automatically", the position, the tempo tag (natural tempo (untrimmed) /
   trimmed) and ■ Stop. On 390×844 the banner is compact at the top, the four
   primary buttons are replaced by "■ Stop audiobook", and "☼ screen stays
   on" is shown.
6. On a phone (adb or a device), the screen does not dim during a run longer
   than the device's screen timeout, and after stopping it dims normally.
7. Each of Stop, Space, Esc, a tap on the sentence waveform, and pressing
   Record stops the mode on the sentence being heard; after the Record press
   no recording is in progress.
8. After stopping on sentence 20, the control reads "▶▶ Resume from 21"
   (phone: "Resume · 21"); pressing it starts at the beginning of sentence 21.
9. Starting on the chapter's second-to-last sentence: after the last
   sentence, playback stops, "End of chapter N" with "next chapter ›" is
   shown, and no audio of chapter N+1 plays.
10. Autoplay does not fire during the run, and stepping to another chapter
    clears the resume offer.

### A11 — Split, reversed (Study)

1. While a sentence plays, press `X` (desktop) or ⋯ → Split… (phone):
   playback stops immediately and a red split line appears with the right
   part shaded and A/B labels. Before pressing split, no split line exists.
2. Drag the line, tap elsewhere on the waveform, and nudge with ←/→: the
   line moves each time, and "at t of d" updates. ▶ hear left plays up to
   the line; ▶ hear right plays from it.
3. Esc / Cancel: the line disappears and the config's sentence count is
   unchanged. Enter / Confirm: the count rises by one, and the two new
   sentences meet at the chosen millisecond (±1 frame).
4. While splitting, Play, Record, Compare and Done & next do nothing, and
   they are shown dimmed.

### A12 — Autoplay

1. With "Play sentence when opened" on, each of done-and-next, →, ←,
   Shift+→, clicking a strip tick, `U`, and opening a sentence from Explore
   starts playback of the new sentence with no further input, and the
   "↻ autoplay" chip flashes.
2. With it off, the same moves leave the sentence silent; the chip reads
   "autoplay off", struck through.
3. Autoplay obeys Trim silence: with trim on, the autoplayed audio starts at
   the speech window.

### A13 — Pause placement and keys

1. On desktop, the pause pill sits directly after Play and is visibly
   smaller than the four primary buttons. On 390×844 it sits above the Play
   column, and the four circles are equal in size. It is disabled when idle
   and reads "▶ resume" while paused. Play shows ↺ while playing.
2. The `?` overlay lists `K` (pause/resume), `L` (audiobook: listen/resume)
   and the split-editing keys.

### A14 — Compact phone header

1. At 390×844, Study's top consists of a grabber and two lines:
   `✕ · book name · ⋯` and `‹ Chapter N › · position · ▶▶ Listen`. Its
   height is no greater than the mockup's (±8 px). No horizontal scroll at
   360 px width.
2. Tapping or dragging the grabber down reveals the nav, which hides after
   the next action. ⋯ opens the sheet with Split…, Merge with next,
   Transcribe, Formant Lab, First unfinished, Previous sentence, Shortcuts
   and Exit to library. ✕ returns to the Library.
