# shadow-studying-refinements

Batch `shadow-polish`, package **Shadow studying refinements** (D161
workflow, `docs/15-agentic-workflow.md`). Live findings from the operator's
first real sessions with `shadow-studying-mode`, which archived 2026-11-16 —
archived meaning agent-verified, never operator-accepted, which is exactly
the gap this change fills.

## Why

Fifteen findings, falling into four groups.

### 1. Two audio bugs with one root cause

`shadow/audio.py` cuts with `-ss`/`-to` **before** `-i` together with
`-c copy` — input seeking on a stream copy. That lands on the enclosing Ogg
page boundary, not the requested millisecond. Two visible symptoms:

- **Explore's preview bleeds the previous sentence.** Explore plays a server
  cut (`Preview.play` → `GET /segments/<id>/audio`), which starts early.
  Prepare does *not*, because it seeks inside the already-decoded chapter
  chunk — sample-accurate. The operator noticing that one tab is broken and
  the other is not is precisely diagnostic.
- **The playhead desyncs from the audio.** The chunk's true start is earlier
  than `chapter.startMs`, while every manifest offset is computed as if the
  cut were exact. The waveform and the seek share the same wrong offset, so
  the whole displayed *window* is shifted: "when there is a bump there is no
  sound, but after a while there is sound but on the spectogram no audio".

The previous cycle's reviewer raised this as SUSPECTED finding #11 and
judged it "audibly small". It was deferred. The operator hit it within a
day. **That is the lesson, not the ffmpeg flag.**

### 2. Silence is not trimmed

Neither a sentence nor a recorded take skips its leading and trailing
silence, so the loop wastes time on dead air at both ends. The operator
recalls an earlier version doing this — it did, but only for recordings, via
a checkbox that this rewrite removed.

He also named the risk himself: trimming must not disturb doneness.

### 3. The comparison UI is in the wrong shape

The pitch contours are drawn in a separate panel beneath the waveform, which
means reading three graphs to compare two things. The contour is slow, and a
late result can paint onto a sentence the operator has already left. The live
recording meter is nowhere near where the finished take appears.

### 4. Reach and legibility

Done cells are nearly indistinguishable from not-done on the desktop; there
is no way to change chapter from inside Study; pressing play again stops
instead of restarting; Explore's open-in-Study target is a small number; and
the phone spends permanent vertical space on a nav bar during a loop that
needs none of it.

## What changes

- **Every cut becomes sample-accurate.** Precise re-encode, so a cut begins
  at the millisecond asked for. Chapters are pre-cut in the background once
  analysis finishes, so entering a chapter never waits on an encode.
- **Silence trimming**, governed by **one setting covering both the sentence
  and the recording, default on**. It is a *playback and display* attribute:
  analysis records where speech starts and ends inside a sentence, the
  sentence's stored span is unchanged, and marking done still covers the
  **full** span. Doneness, merge, split and cross-config carry-over are
  untouched by construction.
- **Two stacked, aligned waveform lanes** — the sentence above, my take
  below, sharing one time axis so they compare bar for bar. **Each pitch
  contour is drawn on its own lane**; the separate contour panel is deleted.
  Contours are hidable (`P`). The live recording waveform occupies exactly
  the position the finished take will, so nothing moves when recording stops.
- **Study gains** unmistakable done/not-done ticks, chapter stepping
  (`Shift+←` / `Shift+→`), and replay-restarts-the-playhead.
- **Explore**: the whole sentence cell opens Study; ▶ is its own sub-target;
  selection moves behind an explicit select mode.
- **Phone**: nav hidden during study, revealed by pulling down from the top
  edge; smaller buttons, Play no larger than the rest; Done&next joins the
  row as a normal button.

## Non-goals

- **Precomputing the reference pitch contour.** Offered as the fix for "the
  contour is a little slow"; the operator chose the staleness guard only. The
  contour stays as slow as today — recorded here so the latency is not later
  mistaken for a regression.
- **The chapter tick strip on the phone.** Deliberately desktop-only: the
  operator saw it and judged it "too much info on small screen". A later
  session must not "fix" this.
- **Changing what doneness means.** The completed-time-ranges model, the
  coverage rule and the time-position cursor are settled (D162 cycle) and are
  not reopened. Tightening stored sentence boundaries to the trimmed span was
  offered and **rejected**: the silence between sentences would then belong to
  no sentence and could never be marked, so a wider sentence in another
  config would read not-done forever.
- **The device plane.** Nothing here touches `/ota/*`, `/blob/*`,
  `/audio-manifest/*`, `/mjolnir/userdata/*`, or anything under `mjolnir/`.
- **Storing recordings.** Still ephemeral, still never persisted. Trimming a
  take happens in the browser, to bytes that are discarded with the session.
- **The backup set.** The shadow audio volume stays out of it.
