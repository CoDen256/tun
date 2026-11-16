# Design — shadow-studying-mode

Decisions settled with the operator on 2026-11-15, and the reasoning behind
the ones that could reasonably have gone the other way. Everything here is
tier 1 for the build phase: follow it, do not re-derive it.

## 1. Storage: one Opus master per book

| | decision |
|---|---|
| what is stored | exactly one mono Opus file per book, ~32 kbps |
| the original | **discarded** after a successful transcode |
| why Opus | a 12-hour book goes from ~1.2 GB to ~170 MB, every book is uniform, and a chapter chunk becomes a stream-copy cut rather than a re-encode |
| why not keep both | the operator chose Opus-only explicitly; this is a shadowing reference, not archival audio |

ffmpeg is **already in shadow's image** (it is there for yt-dlp's
audio-extraction postprocessing) — the Dockerfile comment saying "shadow
decodes no audio itself" becomes stale with this change and must be
corrected in place rather than left to mislead.

The master lives in a new named volume mounted into `shadow-backend`. Until
now shadow's compose file carries a comment stating the `libs` mount is
"The ONLY mount, and it is read-only shared code. No audio volume,
deliberately". That comment is now wrong and must be rewritten to record
the reversal and its reason, not silently deleted.

**The volume is not added to the backup set.** `backup/entrypoint.sh`'s
`DATABASES="mjolnir stabbur phonexa shadow"` already dumps everything that
matters. No change to the backup service is required by this package, and
none should be made.

## 2. Splitting produces ranges, never clips

Server-side silence analysis, run on the stored master, emitting
`{kind, start_ms, end_ms}` rows exactly as today. The operator was offered
pre-cut per-sentence clips and rejected them as wasteful: *"splitting is
just analysing and saving that result… not storing each sentence as clip.
So we might do it differently each time for different amount of times."*

Chapters are produced by the same analysis at a coarser threshold, as today.

## 3. The phone's unit of download is a chapter chunk

A chapter chunk is cut from the Opus master **on demand** and cached on
disk; the cache is derivable and may be evicted freely. The client fetches
one chunk plus the manifest of sentence ranges inside it, then plays
sentence ranges by seeking within the already-loaded chunk — so after the
chunk lands, every sentence in that chapter is instant and works with no
connection.

Prefetch the chapter in the background on entering it. A 45-minute chapter
is roughly 11 MB at 32 kbps mono.

Rejected: per-sentence requests (needs clips), and byte-range requests on
the master (a time range is not a byte range in a compressed stream).

## 4. Progress is completed time ranges — this is the subtle part

**A book owns a set of completed time ranges.** A sentence in any split
config reads as **done when its entire span is covered** by those ranges.

Consequences, all intended and all operator-chosen:

- Switching or creating a split config carries progress across for free. A
  freshly analysed config immediately shows ticks.
- **Merging** two sentences yields a done sentence only if *both* halves
  were done — the merged span must be fully covered.
- **Splitting** a done sentence yields two done halves.
- Marking a sentence done adds its span to the set; un-marking removes it.

**The cursor is a time position (ms) on the book**, not a segment id. On
opening any config, the cursor sentence is the one whose span contains that
position. This is what makes "continue where I left off" survive a
re-split, and what lets the desktop and the phone share one position.

`shadowing_segments.done` therefore stops being the source of truth. It may
remain as a derived/denormalised convenience or be dropped — the build
phase decides — but **the existing `done` flags must be migrated into time
ranges exactly once, losslessly**, and the migration is covered by an
acceptance criterion because losing it means losing the operator's place in
a book he is part-way through.

## 5. Split configs

A book holds several named configs; exactly one is active. Each carries its
own silence thresholds, its own boundary rows, and its own manual edits.
Re-analysing a config discards manual boundary edits **in that config
only**, warned in-page. Progress is never discarded by any config
operation, because progress does not live in a config.

Study and Explore always operate on the active config.

## 6. Integrations — both strictly optional, both already proxied

- **smia transcription**: on demand, one sentence, one key (`T`). No batch
  job, no transcribe-ahead. The returned text persists on that sentence.
  Shadow already proxies this at `/transcribe`; no smia change.
- **phonexa Formant Lab**: receives the **audiobook's** sentence audio, not
  the learner's take — *"Formant lab is for saving and analysing vowels of
  natives, not my vowels."* Shadow already proxies phonexa; no phonexa
  change.

No text is shown by default. The paper book is the text.

## 7. Recordings stay ephemeral

In memory for the session only. Never persisted, never backed up. The UI
must not imply a take survives the session. This preserves D147's
statement that the database dump *is* the shadowing backup.

**CORRECTION, 2026-11-16.** This section said a recording is "never
uploaded". That was never quite true of the code, and the wording is
corrected in place rather than left to be discovered as a contradiction.
Compare draws the two pitch contours overlaid (§8), and the take's contour
comes from `POST /analyze-praat` — Compare (`shadow/js/study.js`) hands the
recorded take to `Pitch.analyse` (`shadow/js/waveform.js`), which posts it
to shadow, which forwards it to phonexa's parselmouth and relays the
numbers back. This is pre-existing behaviour, predates this change, and is not
altered by it.

Precisely, then: **the take is transmitted transiently for pitch analysis
and is never stored anywhere.** shadow's `/analyze-praat` is a pure proxy
— it writes no file, creates no row, and the audio volume never sees it;
phonexa analyses the bytes in the request and keeps nothing. The invariant
that matters is unchanged and is the one the tests enforce
(`shadow/tests/test_zone_boundary.py`): no route in shadow may persist the
learner's own audio, in any style, and the two body-reading proxies must
never open a file.

What is still forbidden outright: storing a take, backing one up, or any
endpoint that accepts one for keeping. "Sent for analysis and forgotten"
and "uploaded" are different things, and §7 now says which one happens.

## 8. Navigation and the four screens

One navigation bar: **Library · Explore · Study · Prepare**. The operator
rejected a second per-book tab row as redundant.

**Study** — the loop. Primary controls, in the order of the real workflow:

| control | key |
|---|---|
| ▶ Play the sentence | `Space` |
| ● Record / stop | `R` |
| ⇄ Compare | `C` |
| ✓ Done & next | `Enter` |

Secondary, in a tray (and in the phone's `⋯` sheet, whose trigger sits at
the **top** of the phone screen so the bottom stays reserved for the
primaries):

| control | key |
|---|---|
| ← prev / → next without marking | `←` `→` |
| 📝 transcribe via smia | `T` |
| 🔬 send to Formant Lab | `F` |
| ✂ split here (at the playhead) | `X` |
| ⇢⇠ merge with next | `M` |
| ⤓ jump to first unfinished | `U` |
| back | `Esc` |
| shortcut overlay | `?` |

**Compare** plays reference then the user's take back to back **and** draws
the two pitch contours overlaid. It is a primary control on the phone too —
the operator was asked whether it could be demoted and said no.

**Explore** — collapsible chapters with per-chapter done counts; a dense
sentence grid carrying number, done state, duration and a ▶ preview;
click-then-shift-click to select a contiguous range (tap start, tap end on
touch); a checkbox on each chapter header to select the whole chapter; a
selection bar offering mark done / mark not done / clear; clicking a
sentence jumps into Study there.

**Prepare** — the split-config manager plus manual boundary editing. Every
sentence row carries a ▶ preview and its own small waveform, because the
operator cannot judge a boundary he cannot hear. Split opens an inline
scrubber where a click sets the point.

**Library** — books with duration, chapter count, progress and the cursor
("Chapter 3 · sentence 47 of 212"), an upload drop zone, and a determinate
"analysing…" state while a split runs.

Removed outright: **slow playback (0.7×) and its `S` key**, and the
**upload range selector**.

## 9. Upload

Chunked and resumable: the browser sends ~8 MB slices, the server appends
to a temp file, and transcoding starts when the last slice lands. A dropped
connection resumes from the last good chunk. A single 1 GB POST was
rejected — it gives no honest progress and no recovery.

The gateway imposes no request-body limit today (verified: no
`request_body` directive anywhere in `grind/caddy/`), so chunk size is a
client/server choice, not a gateway constraint. The server must stream
chunks to disk, never buffer a whole book in memory.

## 10. Identity

Unchanged. Books belong to a `user_id` which is phonexa's `users.id`, a
plain integer with no foreign key (D42), validated over HTTP via
`phonexa_client.verify_user` and accepted when phonexa cannot be reached.
The `fingerprint` mechanism survives as re-upload deduplication, not as the
resume mechanism — resume is now server-side by construction.

## Deferred to the build phase (tier 2 — decide, record one line in DECISIONS-MADE.md)

- Chunk size for resumable upload, and the temp-file cleanup policy for
  abandoned uploads.
- The exact Opus bitrate and ffmpeg flags, provided the master is mono and
  a chapter cut is a stream copy.
- Whether `shadowing_segments.done` is dropped or kept as a derived column.
- The chapter-chunk cache's location, naming and eviction policy, provided
  the cache is derivable and its loss costs only a re-cut.
- The silence-analysis implementation on the server, provided re-analysis
  is repeatable and its parameters are the two thresholds already in the
  data model.
- Waveform rendering detail, and how many sentences Explore renders before
  virtualising.
- Exact wording of the in-page confirms and warnings.

## Tier 3 tripwires (BLOCK, do not improvise)

- Any change under `mjolnir/`, or to `/ota/*`, `/blob/*`,
  `/audio-manifest/*`, `/mjolnir/userdata/*`.
- Adding the shadow audio volume to the backup set.
- Persisting recordings in any form.
- A migration that cannot demonstrate the existing `done` flags survived.
