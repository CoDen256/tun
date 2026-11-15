# Acceptance criteria — shadow-studying-mode

The review contract for the build phase. Every criterion is an observable
end state, confirmed by looking at the running UI in dev compose
(claude-in-chrome) or at the database, never by reading code or trusting a
log line. An agent that did not write the code verifies these.

Dev setup assumed: the root stack up, shadow reachable, at least one
phonexa profile selectable, and a real audio file of at least 10 minutes
containing clear sentence pauses available to upload. A second, shorter
file is useful for the upload criteria.

---

## Item 1 — Upload, transcode, and the stored master

1. Dropping an audio file on the Library screen shows a determinate upload
   progress bar whose percentage increases, and which names the number of
   bytes sent out of the total.
2. Killing the upload mid-flight (closing the tab at roughly 50%) and
   re-dropping the **same** file resumes: the progress bar starts at
   approximately the percentage where it stopped, not at 0%, and the
   completed book's duration matches the source file.
3. After upload completes, exactly one file exists for that book in
   shadow's audio volume, and `ffprobe` on it reports codec `opus`, **1**
   channel. No file in the volume is a copy of the uploaded original
   (the original's byte size does not appear in the volume).
4. The book appears in the Library list with its duration, and the
   duration is within 1 second of the source file's real duration.
5. During server-side analysis, the Library row shows a determinate
   "analysing" state; when it finishes, the row shows a chapter count ≥ 1
   and a sentence count > 1.
6. No page in shadow offers a "select the time range to load" control.

## Item 2 — Splitting produces ranges only, never clips

7. After a split of a book of at least 10 minutes with at least 50
   sentences, the number of files in the audio volume attributable to that
   book is **1** (the master), plus at most the chapter-chunk cache —
   there is **no** file per sentence. Specifically: the file count does not
   scale with the sentence count.
8. `shadowing_segments` holds one row per sentence with `start_ms` and
   `end_ms` set, and successive sentences within a chapter have
   non-overlapping, ascending ranges.
9. Re-running analysis on the same config with different thresholds
   changes the sentence count and leaves the number of stored audio files
   unchanged.

## Item 3 — Split configs

10. The Prepare screen lists the book's split configs; creating a second
    config with different thresholds leaves the first config's sentence
    count and boundary rows unchanged, verifiable by switching back to it.
11. Exactly one config is marked active at any time; making another active
    changes which sentences Study and Explore show, without any upload or
    re-transcode (the audio volume's file count and master mtime are
    unchanged).
12. Renaming a config changes its displayed name and nothing else;
    duplicating produces a second config with the same sentence count;
    deleting removes it from the list and leaves the other configs' rows
    intact.
13. Deleting a config and re-analysing another config both present an
    in-page confirmation — **no** browser `confirm()`/`alert()` dialog
    appears at any point (verified by driving the UI with
    claude-in-chrome, which would hang on a modal dialog).
14. Re-analysing a config states in-page that manual boundary edits in
    *that config* are discarded; after confirming, another config's
    manually split boundary is still present.

## Item 4 — Progress as completed time ranges, carried across configs

15. Marking sentence N done in config A, then switching to config B whose
    boundaries differ, shows the sentences in B that fall entirely inside
    N's span as done.
16. Merging two sentences where **only one** was done yields a merged
    sentence displayed as **not** done. Merging two sentences where
    **both** were done yields a merged sentence displayed as done.
17. Splitting a done sentence yields two sentences, **both** displayed as
    done.
18. Marking a sentence not-done removes its span: a different config's
    sentence lying entirely inside that span is no longer shown as done.
19. **Migration (the one that must not be got wrong).** Starting from a
    database holding pre-change `shadowing_segments` rows with `done =
    true`, running the migration and opening the book shows **exactly the
    same set of sentences marked done** as before the migration — verified
    by capturing the done segment ids and their `start_ms`/`end_ms` before
    migrating and comparing the rendered done set after. Zero sentences
    gained, zero lost.

## Item 5 — The cursor

20. Marking several sentences done, then navigating to sentence N without
    marking it, then reloading the page and reopening the book, lands on
    sentence **N** — not on the first unfinished sentence, and not at the
    start.
21. The cursor set on one browser is observed in a second, independent
    browser session for the same profile after reload (this is the
    desktop→phone continuity, verified with two browser contexts).
22. After a re-split that changes boundaries, reopening the book lands on
    the sentence whose span contains the previously stored time position.

## Item 6 — Study: the loop and its keybindings

23. The Study screen shows exactly four primary controls — Play, Record,
    Compare, Done&next — each displaying its key.
24. Pressing `Space` plays the current sentence's audio and the playhead
    animates across the waveform; playback stops at the sentence's end and
    does not continue into the next sentence.
25. Pressing `Enter` marks the current sentence done, advances the counter
    by one, and shows the next sentence. The done state survives a page
    reload.
26. `←` and `→` move to the previous and next sentence **without**
    changing any done state (verified by the counter of done sentences
    being unchanged after pressing `→` five times).
27. `R` starts recording and shows a live input level and a timer; `R`
    again stops it. Reloading the page and returning to that sentence
    offers **no** stored take, and no request carrying audio to the server
    was made during or after recording (verified in the network log).
28. `C` plays the reference, then the take, and renders two distinguishable
    pitch contours with a legend.
29. `T` fetches a transcript for the current sentence, displays it labelled
    as coming from smia, and the text is still there after a page reload.
    No sentence other than the one asked for acquires text.
30. `F` opens phonexa's Formant Lab carrying the **audiobook's** audio for
    that sentence. With a recording present, `F` still sends the
    audiobook's audio, not the take.
31. `U` jumps to the first sentence not marked done.
32. `X` splits the current sentence at the parked playhead, producing two
    sentences and increasing the sentence count by one; `M` merges the
    current sentence with the next, decreasing it by one. Both are reached
    from the tray and both work from the keyboard.
33. `?` opens a shortcut overlay listing every binding above, and it is
    dismissible.
34. **There is no slow-playback control and no `S` binding anywhere** in
    shadow — searching the rendered DOM for a slow/0.7× control returns
    nothing, and pressing `S` changes nothing.

## Item 7 — Mobile

35. At a 390×844 viewport, the Study screen shows Record, Play and Compare
    as large controls plus a full-width "Done & next" bar, all within the
    bottom half of the viewport.
36. The `⋯ more` trigger is in the **top** region of the phone viewport,
    not adjacent to the primary cluster; opening it reveals transcribe,
    Formant Lab, split and merge.
37. The page does not scroll horizontally at 360 px width on any of the
    four screens (document scrollWidth equals clientWidth).
38. On entering a chapter, one network request fetches that chapter's audio
    chunk; playing five different sentences in that chapter afterwards
    issues **no** further audio requests.

## Item 8 — Explore

39. Explore lists chapters collapsed, each with a done count of the form
    "n / m" and a progress bar; expanding one reveals its sentences with
    number, done state and duration.
40. Clicking a sentence's ▶ preview plays only that sentence's audio.
41. Clicking sentence A then shift-clicking sentence B (B after A) selects
    the contiguous range A..B and the selection bar reports the correct
    count.
42. The chapter header checkbox selects every sentence in that chapter and
    the count matches the chapter's sentence count.
43. "Mark done" on a selection of k sentences increases the book's done
    count by exactly the number of those that were not already done, and
    the change survives a reload.
44. "Mark not done" on a selection reverses it, and a *different* split
    config's overlapping sentences lose their done state accordingly
    (this is criterion 18 observed from Explore).
45. Clicking a sentence number opens Study positioned on that sentence.

## Item 9 — Prepare: hearing what you are editing

46. Every sentence row in Prepare shows a waveform for that sentence and a
    ▶ preview that plays only that sentence.
47. Choosing Split on a row opens an inline scrubber; clicking a position
    and confirming produces two rows whose ranges meet exactly at the
    chosen millisecond (first row's `end_ms` equals second row's
    `start_ms`).
48. Choosing Merge on a row joins it with the following row; the resulting
    row's `start_ms` is the first's and `end_ms` is the second's.

## Item 10 — Navigation, zones and the things that must not change

49. One navigation bar offers Library, Explore, Study and Prepare. No
    screen renders a second tab row beneath it.
50. Nothing under `mjolnir/`, `grind/`, `phonexa/`, `smia/`, `stabbur/`,
    `postgres/` or `backup/` is modified by this change (verified against
    the diff). In particular `backup/entrypoint.sh` is byte-identical.
51. The shadow audio volume is **not** present in the backup service's
    mirror set, and no file under the backup repo grows with audiobook
    content after a backup run.
52. `bin/check-standards.sh` passes.
53. `/_health` answers 200 when the database is up, and with the Postgres
    cluster stopped shadow still serves its pages (serve-before-migrate,
    D157) — the Library degrades rather than the page failing to load.
54. The Dockerfile comment claiming "shadow decodes no audio itself" and
    the compose comment claiming "No audio volume, deliberately" are both
    corrected in place to record the reversal and its reason, not deleted.
55. `docs/07-decisions.md` carries a new ADR row recording the reversal of
    the no-server-side-audio decision, and D147's row is annotated in
    place so its stale claim cannot be read without the correction.
