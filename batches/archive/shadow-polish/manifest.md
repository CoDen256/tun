# shadow-polish

Batch opened 2026-11-16 from live operator testing of `full-sweep`'s
**Shadow studying mode** package, which archived the same day. D161's cycle
working as designed: archived ≠ operator-accepted, and what the operator
found on the real phone and the real audiobook returns here as new work.

## Dependencies

Single package. Nothing to order.

## Status

| package | status |
|---|---|
| Shadow studying refinements | archived — `../../../shadow/openspec/changes/archive/2026-11-18-shadow-studying-refinements` |

## Packages

### Shadow studying refinements
projects: shadow
status: archived 2026-11-18 — `../../../shadow/openspec/changes/archive/2026-11-18-shadow-studying-refinements`

Operator findings, verbatim:

> The split sentences should also be trimmed to ignore silence, i think the
> previous version did exactly that. And when recording my recording should
> also be trimmed to ignore silences. But this should somehow not break our
> doneness of time ranges thing. The live cursor on the audio doesn't match
> the audio i hear. when there is a bump there is no sound, but after a
> while there is sound but on the spectogram no audio, so the cursor
> sometimes is in desync with audio, but sometimes its fine. When i press
> multiple times it should also restart the live cursor. 2. When on explore
> tab and i click a sentence, its for some reason has a little audio from
> previous sentece, even though on prepare tab there is no such bug. IN the
> desktop mode the done "cells" in study mode are hard to distinguish from
> not done ones, its just a little more lighter, but not enough. I also want
> a way to go to next/previous chapter from within the study mode. The pitch
> contour is a little slow and sometimes it's shown across different
> sentences, even though its already a different sentece. Also when
> recording myself, my live red spectogram should be above the buttons below
> the line of sentences. But also i want to see my spectogram also aligned
> with the one in the sentence just below it in some different color but
> still modern and stylish minimalistic. Also let the pitch contour be drawn
> a top of each ones spectogram, not together in a separate graph, but my
> pitch on my spectogram, and sentences on the sentence. Also Make this
> contour hidable/optional. Phone UI: explore hard to click on the number to
> open it in study mode(actually same goes for desktop). Make the top bar
> (library/explore/study/profile) in the phone hidable, only if i pull it
> should be shown. Make the buttons smaller, make the play button the same
> size as others. put done and next as a separate button along the other ones

**Two of the reported bugs have ONE root cause, found by reading during
design.** `../../../shadow/audio.py` cuts with `-ss`/`-to` *before* `-i` plus
`-c copy` — input seeking on a stream copy, which lands on the enclosing Ogg
page boundary rather than the requested millisecond. That is why Explore's
preview bleeds the previous sentence (it plays a server cut) while Prepare
does not (it seeks inside the already-decoded chapter chunk), and why the
playhead desyncs (the chunk's true start is earlier than `chapter.startMs`,
but every manifest offset assumes the cut was exact, so the displayed window
is shifted relative to the audio). **The previous cycle's reviewer flagged
this as SUSPECTED finding #11 and judged it "audibly small"; it was
deferred, and the operator hit it within a day.** That is the lesson worth
carrying, not the line of code.

The one the operator worried about himself — trimming vs doneness — is
resolved by making trimming a **playback/display attribute only**: analysis
records where speech starts and ends inside a sentence, but the sentence's
stored span is unchanged and marking done still covers the FULL span. So
coverage, merge-is-conjunctive, split-preserves and cross-config carry-over
all behave exactly as they do today. Tightening the stored boundaries was
offered and rejected in session, because the silence between sentences would
then belong to no sentence and could never be marked, leaving a wider
sentence in another config permanently not-done.

Operator reversed one decision mid-session: trimming was first chosen as
always-on with no control, then changed to **one toggle governing both lanes,
default on**, after the design agent flagged that a trim clipping a soft
consonant onset would silently change what he shadows against with no way to
test the hypothesis.

Accepted mockup:
`shadow/openspec/changes/shadow-studying-refinements/mockups/shadow-studying-refinements.html`.

**Deliberately NOT on the phone:** the chapter tick strip / done overview.
The operator looked at it and chose to keep it desktop-only — "too much info
on small screen". This is a decision, not an omission; a future session must
not "fix" it.

Deferred to the builder's judgement (tier 2, not guesses):
- the silence-detection threshold and minimum-speech guard used to compute a
  sentence's speech window, provided it is conservative at onsets
- whether the speech window is stored per segment or derived per config at
  analysis time, provided re-analysis recomputes it and doneness is untouched
- ffmpeg flags for the precise cut, provided a cut starts at the requested
  millisecond
- when exactly background chapter pre-cutting is triggered and how many
  chapters ahead, provided entering a chapter never waits on an encode it
  could have done earlier
- the exact hues for the take lane and the two contours, provided they are
  distinguishable in both themes
- the phone nav's reveal/auto-hide timings

## Dropped / deferred

- **Reference pitch contour precomputed server-side** — offered as the fix
  for "the contour is a little slow"; the operator chose the staleness guard
  only. The contour therefore stays as slow as it is today; making it
  hidable (`P`) and drawing it inline is what reduces the annoyance. Recorded
  so the latency is not later read as a regression.

## Build notes (2026-11-18)

**Verification result: 44 of 45 acceptance criteria observed passing, 0
failed.** Criterion 45 (shadow serves while the Postgres cluster is down)
was NOT re-verified and is deliberately left so: verifying it means stopping
the shared cluster while other sessions build against it. It passed in the
previous cycle and nothing here touches the boot path.

**Criterion 1 was wrong when written and is corrected in place** (commit
`8a994c24`): it demanded the clip's first 50 ms contain the sentence's tone,
which is unsatisfiable — a stored span legitimately begins with silence,
because the segmenter cuts AT silence, and the detector keeps a deliberate
onset guard. Cut accuracy is onset error against the master, which criterion
3 already measures properly (observed 0.00–0.06 ms).

**The reviewer confirmed seven defects after the tester had passed
everything** — a reminder that the two stages catch different classes. The
worst, and the one no test session could have caught because it unfolds over
twenty minutes: re-analysing a split config **silently cancelled its own
pre-cutting**, because the guard de-duplicated on config id and re-analysis
reuses that id. The orphaned thread kept encoding deleted segments while the
new boundaries were never pre-cut, and the on-demand fallback was swallowed
by the same guard — so every chapter entered paid a full ~25 s encode, in
exactly the workflow split configs exist for. Also fixed: duplicating a
config lost its speech windows (the copy played untrimmed while the switch
read "On", recoverable only by a re-analysis that would destroy the
hand-fixed boundaries the duplicate existed to preserve), a book-wide chunk
invalidation that destroyed every other config's chunks, an hour-long
timeout on the synchronous request path, ffmpeg running inside an open write
transaction, and a janitor that could not reclaim its own `.partial` files.

**A latent clock bug was found while fixing, not by the review**: detected
silences landed `CUT_SEEK_PAD_MS` (500 ms) late, which would have skewed
every locally-probed speech window. Commit `a7775628`.

Tests 62 → **80**. The tier-3 tripwire guarding "trimming must never become
a boundary change" was upgraded from a one-line regex to an AST check, with
a test that proves the guard catches the two-line form it exists for.

Verification limits worth carrying into the next cycle:
- **no microphone on the host** — the tester substituted only the input
  device, so shadow's own record/trim/compare code ran for real, but a real
  mic remains the operator's test
- **the compositor ignores window resizing** — the phone criteria were
  verified by hosting the app in a same-origin iframe sized to a true
  390×844 and 360×800, which is genuine media-query width rather than
  emulation
