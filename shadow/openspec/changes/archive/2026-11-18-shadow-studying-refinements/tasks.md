# Tasks — shadow-studying-refinements

Ordering matters in one place: **section 1 (accurate cuts) before section 2
(trimming)**. Trimming is computed from where speech begins inside a
sentence, and measuring that against an inaccurate cut bakes the error in.

## 1. Sample-accurate cuts

- [x] 1.1 Replace the stream-copy cut in `shadow/audio.py` with a precise
      one: a cut must begin and end at the requested millisecond. The
      current `-ss`/`-to` **before** `-i` with `-c copy` is the defect.
- [x] 1.2 Rewrite the module comment that advertises the stream copy as
      what "makes a chapter chunk cheap" — annotate the old claim in place
      with why it was wrong, per the repo convention.
- [x] 1.3 Pre-cut a configuration's chapter chunks in the background once
      analysis finishes; entering an un-cut chapter must still work, slower.
- [x] 1.4 Invalidate chunks cut the old, inaccurate way — an existing cached
      chunk is wrong and must not be served after this change.
- [x] 1.5 Confirm by measurement that `GET /segments/<id>/audio` no longer
      carries the previous sentence's audio, and that a chapter chunk starts
      at the chapter's start.

## 2. Silence trimming

- [x] 2.1 Compute, per sentence, the window inside its span where speech
      occurs. Conservative at onsets — clipping a soft consonant is the
      failure mode that matters and it is invisible.
- [x] 2.2 Persist or derive that window (tier 2), and recompute it on
      re-analysis. **The stored `start_ms`/`end_ms` must not change.**
- [x] 2.3 Playback and waveform drawing use the speech window; **marking
      done still covers the FULL stored span**. Nothing in `progress.py`
      changes.
- [x] 2.4 Trim the learner's take in the browser, on bytes discarded with
      the session. No take reaches the server for storage.
- [x] 2.5 One setting, default on, governing both lanes, living with the
      application settings — not in the Study control row and not in the
      phone's `⋯` sheet. Off restores full spans for both.
- [x] 2.6 Prove by observation that the done set is identical with trimming
      on and off (acceptance criteria 12–14).

## 3. The two lanes

- [x] 3.1 Replace the single waveform with two stacked, horizontally aligned
      lanes — sentence above, take below — sharing one time axis.
- [x] 3.2 The take lane keeps its height when empty; the controls beneath it
      must not move when a take appears or disappears.
- [x] 3.3 The live recording waveform occupies the take lane's position,
      between the sentence lane and the controls.
- [x] 3.4 Draw each pitch contour on its own lane; **delete the separate
      contour panel**.
- [x] 3.5 `P` toggles both contours; the preference survives moving between
      sentences.
- [x] 3.6 Guard against a late pitch result painting onto a sentence already
      left.

## 4. Study: legibility, navigation, replay

- [x] 4.1 Done vs not-done ticks differ in fill treatment, not only
      lightness; the current sentence is distinct from both.
- [x] 4.2 Chapter stepping on `Shift+←` / `Shift+→`, with controls beside
      the chapter name. Ends of the book must not break.
- [x] 4.3 Pressing play while playing **restarts** the sentence and returns
      the playhead to 0.
- [x] 4.4 `←`/`→` still change sentence without touching any done state.
- [x] 4.5 Shortcut overlay lists `P` and the chapter bindings; still no `S`.

## 5. Explore

- [x] 5.1 Activating a sentence cell anywhere opens Study on it; the preview
      control is its own target and does not navigate.
- [x] 5.2 Selection moves behind an explicit select mode; chapter-header
      selection works in either mode.
- [x] 5.3 Cells are comfortably hittable at 360 px.

## 6. Phone

- [x] 6.1 Hide the top navigation during study; reveal by a pull from the
      top edge; auto-hide on the next action.
- [x] 6.2 Four equal-size primary buttons — play, record, compare,
      done&next. Play is not larger. The full-width done bar is removed.
- [x] 6.3 **Do not render the chapter tick strip at phone viewports.**
      Deliberate; see design.md §6.
- [x] 6.4 Both lanes present and aligned at phone width; no horizontal
      scroll at 360 px.

## 7. Standards and regression

- [x] 7.1 Nothing outside `shadow/` modified. `bin/check-standards.sh`
      passes.
- [x] 7.2 `cd shadow && python -m pytest` green; extend the suite for the
      speech-window rule and for "trimming never alters a stored span".
- [x] 7.3 Serve-before-migrate (D157) still holds.
- [x] 7.4 The completed-time-ranges model, the coverage rule and the
      time-position cursor are untouched — confirm by test, not by reading.
