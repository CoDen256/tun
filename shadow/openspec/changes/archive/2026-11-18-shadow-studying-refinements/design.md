# Design — shadow-studying-refinements

Settled with the operator on 2026-11-16. Tier 1 for the build phase: follow
it, do not re-derive it.

## 1. Sample-accurate cuts

**Decision: precise re-encode everywhere; chapters pre-cut in the
background once analysis finishes.**

Today `shadow/audio.py` builds `-ss`/`-to` **before** `-i` with `-c copy`.
Input seeking plus stream copy cannot be accurate — the output starts at the
enclosing Ogg page. Every cut must instead begin at the requested
millisecond.

| cut | cost | when |
|---|---|---|
| chapter chunk | ~20–30 s for a 45-minute chapter, once, cached | pre-cut in the background right after analysis |
| sentence (Explore preview, Formant Lab) | ~30 ms, a few seconds of audio | live |

Two consequences the build must honour:

- **Entering a chapter must not wait on an encode it could have done
  earlier.** Pre-cutting is what buys the accuracy without the wait. If a
  chapter is entered before its background cut finished, it must still work
  — just slower — not fail.
- **The manifest's offsets become true.** `offsetMs = sentence.startMs −
  chapter.startMs` is correct only once the chunk really starts at
  `chapter.startMs`. Once it does, both the waveform window and the seek are
  right, and the playhead matches what is heard.

Rejected: keeping the stream copy and carrying the chunk's true start as a
correction. It is faster but leaves a signed offset that must stay correct
forever; one wrong sign and the desync is back, silently.

## 2. Silence trimming — a playback attribute, never a boundary

**A sentence's stored span never changes.** Analysis additionally records
where speech actually begins and ends inside that span. Playback and the
drawn waveform use the trimmed window; everything about progress uses the
full span.

```
stored span    |░░░███████░░|     marking done covers the WHOLE span
you hear/see        └█████┘        trimmed
```

Therefore, and this is the whole point:

- coverage ("done when fully covered") is unchanged
- merge stays conjunctive, split stays preserving
- progress still carries across split configs by time
- no migration of progress is required by this change

**Rejected: tightening the stored boundaries to the trimmed span.** The
silence between sentences would then belong to no sentence and could never
be marked done, so a wider sentence in another split config would read
not-done forever. The operator raised this risk unprompted; this is the
answer to it.

Recordings are trimmed in the browser, on bytes that are discarded with the
session. Nothing about "recordings are never persisted" changes.

**One setting governs both lanes, default ON.** It lives in Settings, not in
the Study control row — it is a preference, not a per-sentence action. The
operator first chose always-on with no control and reversed it in session
after being shown the failure mode: a trim that clips a soft consonant onset
does not look broken, it just means shadowing a slightly truncated model,
and without a switch the hypothesis cannot be tested. The detector must
therefore be **conservative at onsets**.

When the setting is off, both lanes draw full spans and playback covers the
whole sentence.

## 3. The two lanes

The centre of the Study screen becomes two vertically stacked, horizontally
aligned waveform lanes sharing one time axis:

1. **The sentence** — the audiobook's reference, accent hue.
2. **My take** — directly beneath, a clearly different but harmonious hue,
   identical width and edges, so the two compare bar for bar.

**Each pitch contour is drawn on its own lane** — reference over reference,
mine over mine. The separate contour panel is **deleted**. Contours are
hidable together with `P`, and the state persists across sentence changes.

**The take lane keeps its height when empty**, showing a quiet "press R to
record" state. While recording it becomes a live red waveform *in exactly
the position the finished take will occupy*, so nothing moves when recording
stops. This is what the operator asked for with "my live red spectogram
should be above the buttons below the line of sentences".

A late pitch result must never paint onto a sentence the operator has
already left — a generation guard, checked before render.

The contour's latency is **not** addressed: precomputing the reference
contour server-side was offered and declined. It stays as slow as today.

## 4. Study: legibility, navigation, replay

- **Done ticks** are solid-filled, not-done hollow outline, current taller
  and ringed. The previous "slightly lighter" treatment failed on the
  operator's own monitor.
- **Chapter stepping** beside the chapter name, bound to `Shift+←` /
  `Shift+→`. Sentence navigation stays plain `←`/`→` and still must not
  change any done state.
- **Pressing play while playing RESTARTS** the sentence from its beginning
  and the playhead jumps back to 0. It currently stops, which is the
  reported complaint.

Full binding set after this change: `Space` play/restart, `R` record,
`C` compare, `Enter` done&next, `←`/`→` sentence, `Shift+←`/`Shift+→`
chapter, `T` transcribe, `F` Formant Lab, `X` split, `M` merge, `U` jump to
first unfinished, `P` contours, `Esc` leave, `?` overlay. There is still no
`S` and no slow playback.

## 5. Explore

A plain click or tap **anywhere on a sentence cell opens it in Study**. The
▶ preview is its own comfortably-sized sub-target inside the cell.
Selection moves behind an **explicit select mode** toggle; chapter-header
checkboxes and the selection action bar are unchanged.

Rationale: the operator reported the open target as hard to hit on both
phone and desktop. Making the cell the target means a stray tap must no
longer be able to start a selection, hence the mode.

## 6. Phone

- The top nav is **hidden while studying** and revealed by a short downward
  pull from the top edge, auto-hiding again on the next action.
- Buttons are **smaller**, and **Play is the same size as the others** — no
  oversized central button.
- **Done&next is a normal button in the same row**: four equal controls
  (Play, Record, Compare, Done&next). The full-width done bar is gone.
- **The chapter tick strip stays desktop-only.** The operator saw it on the
  phone and judged it "too much info on small screen". Deliberate omission,
  not an oversight.

## Deferred to the build phase (tier 2 — decide, one line in DECISIONS-MADE.md)

- the silence-detection threshold and minimum-speech guard, provided it is
  conservative at onsets
- whether the speech window is stored per segment or derived per config at
  analysis time, provided re-analysis recomputes it and doneness is untouched
- the exact ffmpeg flags for the precise cut, provided a cut starts at the
  requested millisecond
- when background chapter pre-cutting triggers and how far ahead, provided
  entering a chapter never waits on an encode it could have done earlier
- the hues for the take lane and the two contours, provided they are
  distinguishable in both themes
- the phone nav's reveal and auto-hide timings
- how an already-cut chapter cache is invalidated when accuracy changes the
  bytes (an existing cached chunk was cut the inaccurate way)

## Tier 3 tripwires (BLOCK, do not improvise)

- changing the stored sentence span to the trimmed span, or anything that
  alters doneness, the coverage rule or the cursor
- persisting a recording, trimmed or otherwise
- adding the audio volume to the backup set
- any change under `mjolnir/`, `grind/`, `backup/`, or to the device plane
- putting the tick strip on the phone
