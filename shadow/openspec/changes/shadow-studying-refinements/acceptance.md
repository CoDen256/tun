# Acceptance criteria — shadow-studying-refinements

The review contract for the build phase. Every criterion is an observable
end state, confirmed by looking at the running UI in dev compose
(claude-in-chrome) or at the filesystem/database — never by reading code or
trusting a log line. An agent that did not write the code verifies these.

Dev setup: the root stack up, shadow reachable through the gateway, and a
book with a real stored Opus master, several chapters and tens of sentences.
Where a criterion needs audio content, synthesise a book whose sentences are
**distinguishable by ear and by waveform** — e.g. each sentence a different
tone frequency, separated by silence. That makes "did I hear the previous
sentence" and "does the drawn bump match the sound" mechanically checkable
rather than impressionistic.

---

## Item 1 — Cuts are sample-accurate

1. Take a book whose sentence N is a tone of frequency A and sentence N−1 is
   a clearly different frequency B. Fetch `GET /segments/<N>/audio` and
   analyse the returned audio: **no component of frequency B is present**.
   (Before this change the clip began with audible B.)

   **CORRECTED 2026-11-17, during verification.** This criterion originally
   added "and the clip's first 50 ms already contains frequency A". That
   clause is unsatisfiable by construction and was wrong when written: a
   stored span legitimately begins with silence (the segmenter cuts at
   silence), and the speech detector deliberately keeps an onset guard ahead
   of the first sound, so the first 50 ms of a correct clip is silent in the
   master too. Cut accuracy is instead measured as **onset error against the
   master**, which criterion 3 already does properly. Measured: 0.00–0.06 ms.
   The clause is corrected rather than deleted so the mistake stays readable.
2. The returned clip's duration equals the sentence's stored span within
   **±15 ms**.
3. Fetch a chapter chunk and compare its first audio content against the
   chapter's `startMs` in the master: the chunk begins at the requested
   millisecond within **±15 ms**, not at an earlier page boundary.
4. In Explore, pressing ▶ on five consecutive sentences plays five clips and
   **none of them begins with the preceding sentence's tone** — confirmed by
   listening/analysis of the fetched bytes, not by the UI reporting success.
5. After analysis of a freshly uploaded book completes, chapter chunks exist
   on disk **without any chapter having been opened** (background pre-cut):
   `ls` of the chunk cache shows at least one chunk for a book never entered.
6. Entering a chapter whose background cut has not yet finished still plays —
   it may take longer, but it must not error and must not play the wrong
   audio.

## Item 2 — The playhead matches the audio

7. Play a sentence in Study and sample the playhead position against
   `audio.currentTime` at ≥5 points: the playhead's proportional position
   tracks elapsed time within **±3%** across the whole sentence.
8. With a book whose sentences are distinct tones, play sentence N and
   confirm the tone heard is N's tone while the playhead is inside N's drawn
   waveform — i.e. the drawn bump and the audible sound coincide. The
   previously reported "bump with no sound, then sound with no bump" must be
   absent.
9. Pressing `Space` while a sentence is already playing **restarts it**: the
   playhead returns to position 0 and sweeps again, and playback is audibly
   from the sentence's beginning. It does not stop.

## Item 3 — Silence trimming

10. With the trim setting ON, a sentence whose stored span begins with
    ≥300 ms of silence starts producing sound within **150 ms** of playback
    starting.
11. The same sentence's drawn waveform in the sentence lane shows the
    **trimmed** window — the leading silence is not rendered as empty space.
12. **Doneness is untouched by trimming.** Record the set of sentences
    reading as done, toggle trimming off, reload, and record it again: the
    two sets are **identical**. Repeat with trimming on. No sentence changes
    state.
13. Marking a sentence done while trimming is ON covers its **full stored
    span**: after marking, a different split config's sentence lying entirely
    inside the full (untrimmed) span reads as done. (This is the criterion
    that proves trimming did not quietly become a boundary change.)
14. The stored `start_ms`/`end_ms` of every segment are **unchanged** by
    enabling, disabling or recomputing trimming — compare the full segment
    table before and after; zero rows differ.
15. With the trim setting OFF, the same sentence plays its full span
    including the leading silence, and its waveform redraws to the full span.
16. The trim setting lives in Settings, is **on by default**, and governs
    **both** the sentence and the recording — there is exactly one such
    control in the entire UI, and none in the Study control row or the
    phone's `⋯` sheet.
17. A recorded take with leading silence plays back trimmed when the setting
    is on. **No request carrying recorded audio is sent to the server for
    storage**, and after a reload no take exists (the ephemeral guarantee is
    unchanged by trimming).

## Item 4 — The two stacked lanes

18. The Study screen shows **two** waveform lanes, the sentence above and
    the take below, with identical left and right edges (measured: the two
    lanes' bounding boxes share the same x and width within 2 px).
19. With no take recorded, the take lane **still occupies its height** and
    shows its empty state. Recording and then stopping does **not** change
    the vertical position of the control buttons (measured before and after:
    the buttons' y differs by 0).
20. While recording, the take lane shows a live, animating waveform in red,
    positioned **between the sentence lane and the control buttons**.
21. **There is no separate pitch-contour panel.** Searching the rendered DOM
    finds no standalone contour graph; instead a contour is drawn within the
    sentence lane and within the take lane.
22. The reference contour is rendered over the sentence lane and the take's
    contour over the take lane, in distinguishable colours, in **both** light
    and dark themes.
23. Pressing `P` hides both contours; pressing `P` again shows them. The
    state persists when moving to another sentence.
24. **Stale contours cannot appear.** Trigger Compare on sentence N, move to
    sentence N+1 before the analysis returns, and confirm no contour for N
    ever paints onto N+1's lanes.

## Item 5 — Study legibility and navigation

25. In the chapter tick strip, done and not-done cells are rendered with
    **different fill styles** (solid vs outline), not merely different
    lightness — verified by inspecting the computed styles of one of each,
    which must differ in more than a lightness value.
26. `Shift+→` moves to the next chapter and `Shift+←` to the previous one;
    the chapter name in the header changes and the sentence counter resets to
    that chapter's first sentence. Controls for the same action are visible
    beside the chapter name.
27. `Shift+→` on the last chapter does not error or wrap silently into a
    broken state; the same for `Shift+←` on the first.
28. Plain `←`/`→` still change sentence **without** changing the done count
    (press `→` five times; the done count is unchanged).
29. The shortcut overlay (`?`) lists `P` and the chapter bindings alongside
    the existing ones, and still lists no `S`/slow-playback binding.

## Item 6 — Explore click targets

30. Clicking or tapping anywhere on a sentence cell — not only its number —
    opens Study positioned on that sentence. Verified at both a desktop
    viewport and 390×844.
31. The ▶ preview inside a cell plays that sentence and does **not** open
    Study.
32. With select mode OFF, clicking cells never adds anything to a selection
    (the selection bar does not appear).
33. With select mode ON, clicking cells selects them and the selection bar
    reports the correct count; chapter-header checkboxes still select a whole
    chapter in either mode.
34. Marking done from the selection bar still writes through the
    time-range record: the book's done count moves by exactly the number of
    selected sentences that were not already done, and survives a reload.

## Item 7 — Phone

35. At 390×844 in Study, the top navigation is **not visible**.
36. A downward pull/drag from the top edge reveals the navigation; after the
    next action it hides again.
37. The primary control row holds **four buttons of equal size** — Play,
    Record, Compare, Done&next. Measured: all four have the same width and
    height within 2 px, and Play is not larger than the others.
38. There is **no full-width "Done & next" bar**; Done&next is one of the
    four buttons.
39. The chapter tick strip is **absent** at phone viewports — deliberately.
    Its absence is a requirement, not a defect.
40. The two stacked lanes are present and aligned at phone width, and the
    page does not scroll horizontally at 360 px on any screen.

## Item 8 — Nothing that was settled has moved

41. The completed-time-ranges model is intact: `shadowing_progress_ranges`
    still holds progress, `shadowing_segments.done` is still neither read nor
    written as truth, and the cursor is still a time position resolved to the
    containing sentence.
42. A re-split still carries progress across configs by coverage (mark a
    sentence done in one config, re-analyse another, confirm the enclosed
    sentences read done).
43. Nothing under `mjolnir/`, `grind/`, `backup/`, `phonexa/`, `smia/`,
    `stabbur/` or `postgres/` is modified by this change — verified against
    the diff.
44. `bin/check-standards.sh` passes, and `cd shadow && python -m pytest` is
    green.
45. With the Postgres cluster stopped, shadow still serves its pages
    (serve-before-migrate, D157) — the Library degrades rather than the page
    failing to load.
