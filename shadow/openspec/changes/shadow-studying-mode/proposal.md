# shadow-studying-mode

Batch `full-sweep`, package **Shadow studying mode** (D161 workflow,
`docs/15-agentic-workflow.md`). One backlog item, but an `[OVERHAUL]` one
that explicitly says RETHINK THE DESIGN — and the rethink reverses shadow's
founding storage decision.

Backlog item, verbatim:

> [OVERHAUL] shadow shadowing should support studying mode where i just
> press 3 buttons (one makes the audio play, the second compares, the third
> marks as completed and goes to the next one) RETHINK THE DESIGN

## Why

The operator's real workflow is: **a paper book open on the table, the
audiobook open in parallel.** He reads a sentence with his eyes, listens to
that same sentence, *sometimes* practices saying it, and moves on. Next
session he continues from where he stopped — and increasingly that next
session is on a phone, not at the desk.

Today's shadow cannot serve that:

1. **Nothing is on the server but boundaries.** The audio file is decoded in
   the browser that opened it, and nothing else. Continuing on the phone
   means finding the same multi-hour file on the phone, re-picking it
   through a file input (phones have no File System Access API), and
   re-decoding it locally. In practice the phone is not usable at all.
2. **There is no cursor.** Progress is a set of `done` booleans. Leaving a
   sentence without marking it done loses the place entirely.
3. **The UI is a list, not a loop.** Every sentence is a row carrying eight
   buttons. There is no focused single-sentence surface, and there is not
   one keybinding in the whole service.
4. **One split per file, destructively replaced.** Re-splitting with
   different silence thresholds discards the previous segmentation *and*
   its progress, so experimenting with thresholds costs real work.

## What changes

A new studying surface, and the server-side storage that makes it possible
on a phone.

- **Audio is stored server-side.** One mono Opus master per book,
  transcoded once on upload; the original is discarded. Uploads are
  chunked and resumable.
- **Splitting is server-side silence analysis producing RANGES ONLY.** No
  per-sentence clip is ever cut or stored. A book may hold **several named
  split configs**, one active, each independently created, renamed,
  duplicated, deleted and re-analysed.
- **Progress is stored as completed TIME RANGES on the book**, not as
  per-segment booleans, so it carries across split configs. A sentence
  reads as done when its whole span is covered. The cursor is likewise a
  **time position**, resolved to whichever sentence contains it in whatever
  config is open.
- **Four screens** behind one navigation — Library, Explore, Study,
  Prepare.
  - **Study** is the loop: one sentence, a waveform, and four primary
    controls — Play, Record, Compare, Done&next — with keybindings on
    desktop and large thumb-reachable targets on the phone. Secondary
    actions (prev, next, transcribe, Formant Lab, split here, merge with
    next, jump to first unfinished) sit in a tray.
  - **Explore** browses the whole book by chapter and sentence, shows what
    is done, previews any sentence, marks ranges or whole chapters done in
    bulk, and jumps straight into Study at a chosen sentence.
  - **Prepare** manages split configs and manual boundary editing, with a
    per-sentence audio preview so boundaries can be *heard*.
- **The phone downloads one chapter-sized chunk** plus the manifest of
  sentence ranges inside it, prefetched in the background; after that every
  sentence in the chapter plays instantly and offline.
- **Recordings stay ephemeral.** In memory for the session, never written
  to the server, never backed up. Unchanged, and deliberately so.

## The decision this reverses, named explicitly

`shadow/db/models.py`, `shadow/shadowing.py` and **D147** all state that
shadow stores no audio server-side, and D147 states it emphatically ("so
nobody later optimizes those tables out"). The operator reversed it in the
design session on 2026-11-15, knowingly.

What makes the reversal safe is that **the thing originally reverted was
server-side DECODING, not storage**: the old implementation ran a Praat
decode of a multi-hour file on upload, again on split, and again on *every
chapter-audio request*, with nothing cached. This change decodes nothing
per request. It transcodes once on upload, and a chapter chunk is a
stream-copy cut of the Opus master — milliseconds, no re-encode — cached on
disk afterwards.

A new ADR row records the reversal; D147's row is annotated in place so the
stale claim cannot be read without its correction (per CLAUDE.md's
documentation conventions).

## Non-goals

- **Storing recordings.** Explicitly re-affirmed as ephemeral. No take
  history, no server-side takes, nothing for the backup to grow on.
- **Backing up the audio.** The `shadow` audio volume is deliberately NOT
  added to the backup set. Masters are multi-GB and re-uploadable;
  `shadow.sql` already carries split configs, boundaries, progress, cursor
  and transcripts, which are the only irreplaceable things. This is the
  same failure mode the sibling `userdata-history-offload` package exists
  to undo — it is not repeated here.
- **The device plane.** Nothing in this change touches `/ota/*`,
  `/blob/*`, `/audio-manifest/*`, `/mjolnir/userdata/*`, the APK, or any
  file under `mjolnir/`. shadow is operator-plane only.
- **Changing phonexa or smia.** Both integrations already exist and are
  consumed through shadow's own server-side proxy (`phonexa_client.py`,
  `/transcribe`). This change re-binds them to new keys and sends the
  book's audio to Formant Lab; it adds no endpoint to either service.
- **Playback rate control.** The existing slow-playback (0.7×) feature is
  REMOVED at the operator's request, not carried forward.
- **A range selector on upload.** Whole books, always. The old "select the
  time range to load & practice" control existed only because the browser
  had to decode locally; it disappears.
