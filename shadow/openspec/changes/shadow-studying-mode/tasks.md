# Tasks — shadow-studying-mode

Order matters in one place only: **task 4.3 (the progress migration) must
land before any UI reads progress**, and it must be verified before the old
`done` flags stop being written.

## 1. Server-side storage of the master

- [x] 1.1 Add a named volume for shadow's audio to `shadow/compose.yaml`
      and mount it. **Rewrite** the existing comment claiming "The ONLY
      mount… No audio volume, deliberately" to record the reversal and its
      reason — do not delete it.
- [x] 1.2 Correct the `shadow/Dockerfile` comment claiming ffmpeg is there
      "for yt-dlp's audio-extraction postprocessing step, nothing else —
      shadow decodes no audio itself".
- [x] 1.3 Chunked, resumable upload endpoint: slices appended to a temp
      file, streamed to disk, with an endpoint the client can ask "how much
      of this upload do you already have".
- [x] 1.4 One-time transcode to a mono Opus master on the final slice;
      discard the original; record duration, sample rate and channels.
- [x] 1.5 Abandoned-upload cleanup for temp files.
- [x] 1.6 Book deletion removes the master, the chapter-chunk cache and the
      database rows.

## 2. Chapter chunks

- [x] 2.1 Cut a chapter chunk from the master on demand as a **stream
      copy**; cache it; serve it with the sentence ranges it contains.
- [x] 2.2 Invalidate or key the cache so a changed chapter boundary cannot
      serve a stale chunk.
- [x] 2.3 Client fetches the chunk on entering a chapter, prefetches in the
      background, and plays sentence ranges by seeking within it.
      *(Server half done: `GET /chapters/<id>/manifest` gives every sentence
      an `offsetMs` inside the chunk returned by `GET /chapters/<id>/chunk`,
      so the client needs no further audio request. The fetching/prefetching
      itself belongs to the frontend work in sections 5–8.)*

## 3. Split configurations

- [x] 3.1 Model: a book owns many configs; a config owns its thresholds and
      its segment rows; exactly one is active.
- [x] 3.2 Server-side silence analysis over the master producing chapter
      and sentence ranges — ranges only, no audio written.
- [x] 3.3 Create / make active / rename / duplicate / delete, and
      re-analyse with an in-page warning scoped to that config.
- [x] 3.4 Manual split and merge, operating on the active config, reachable
      from Prepare and from Study.
- [x] 3.5 Migrate existing single-segmentation books into one config named
      so the operator recognises it.

## 4. Progress as time ranges

- [x] 4.1 Model: a book owns a set of completed time ranges, per user.
      Normalise on write (merge adjacent/overlapping ranges) so the set
      cannot grow without bound.
- [x] 4.2 Derive a sentence's done state as "span fully covered"; mark and
      un-mark by adding and removing spans.
- [x] 4.3 **Migration**: convert every existing `shadowing_segments.done =
      true` row into its time range. Capture the done set before and after
      and prove they are identical (acceptance criterion 19). Only after
      this passes, stop treating the boolean as authoritative.
- [x] 4.4 Cursor as a time position per book per user, written on
      navigation, resolved to the containing sentence on open.

## 5. Study screen

- [x] 5.1 Single-sentence surface: waveform, chapter, position, chapter
      tick strip.
- [x] 5.2 Primary controls — play, record, compare, done&next — with keys
      `Space` `R` `C` `Enter` and visible key badges.
- [x] 5.3 Secondary tray — prev/next (`←` `→`), transcribe (`T`), Formant
      Lab (`F`), split here (`X`), merge with next (`M`), jump to first
      unfinished (`U`), leave (`Esc`), overlay (`?`).
- [x] 5.4 Compare: reference then take, plus overlaid pitch contours with a
      legend.
- [x] 5.5 Recording stays in memory; nothing is uploaded; the UI never
      implies a take persists.
- [x] 5.6 Transcribe through the existing `/transcribe` smia proxy, one
      sentence, persisted on that sentence, labelled.
- [x] 5.7 Formant Lab handoff sends the **book's** sentence audio.
- [x] 5.8 **Remove** slow playback (0.7×) and its `S` binding entirely.
- [x] 5.9 Phone layout: record/play/compare plus a full-width done bar in
      the lower half; the `⋯` disclosure at the top.

## 6. Explore screen

- [x] 6.1 Collapsible chapters with done counts and progress.
- [x] 6.2 Dense sentence grid: number, done state, duration, ▶ preview.
- [x] 6.3 Range selection (first then last; shift-click on desktop, tap-tap
      on touch) and a whole-chapter selection control on the header.
- [x] 6.4 Selection bar: count, mark done, mark not done, clear — writing
      through the time-range record.
- [x] 6.5 Clicking a sentence opens Study positioned on it.

## 7. Prepare screen

- [x] 7.1 Split-config manager per task 3.3, with in-page confirms only.
- [x] 7.2 Per-sentence waveform and ▶ preview on every row.
- [x] 7.3 Inline split scrubber (click sets the position, then confirm) and
      merge-with-next.
- [x] 7.4 A one-line explainer that progress carries across configs by time
      coverage.

## 8. Library, navigation and removals

- [x] 8.1 One navigation — Library, Explore, Study, Prepare. No second tab
      row anywhere.
- [x] 8.2 Library rows: duration, chapters, progress, cursor as "Chapter N
      · sentence M of K"; upload drop zone; determinate analysing state.
- [x] 8.3 **Remove** the upload time-range selector and the client-side
      decode/segmentation path it served.
- [x] 8.4 No browser `alert` / `confirm` / `prompt` anywhere in shadow.

## 9. Documentation and standards

- [x] 9.1 New ADR row in `docs/07-decisions.md` recording the reversal of
      the no-server-side-audio rule, with the distinction that made it safe
      (one-time transcode, never a per-request decode) and the explicit
      carve-outs: recordings still ephemeral, audio still outside the
      backup set.
- [x] 9.2 Annotate **D147** in place so its claim that shadow stores no
      audio cannot be read without the correction.
- [x] 9.3 Update `shadow/db/models.py` and `shadow/shadowing.py` module
      docstrings, which both assert audio is never stored.
- [x] 9.4 `bin/check-standards.sh` passes; no host port published outside
      loopback; serve-before-migrate (D157) still holds.
- [x] 9.5 Confirm by diff that nothing outside `shadow/` and `docs/` is
      modified — in particular `backup/entrypoint.sh` is untouched.

## 10. Tests

- [x] 10.1 Keep `shadow/tests/test_zone_boundary.py` passing.
- [x] 10.2 Cover the coverage rule: fully-covered is done, partially is
      not; merge is conjunctive; split preserves.
- [x] 10.3 Cover the migration with a fixture holding done segments.
- [x] 10.4 Cover cursor resolution across a boundary change.
