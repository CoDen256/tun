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
