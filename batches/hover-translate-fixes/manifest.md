# hover-translate-fixes

## Package 1: Hover translate fixes

projects: hover-translate, stabbur

### note popup
[ux] i need to be able to create a note just by entering enter/ctrl enter when in that popup, so i entered the text and then just sent. also let me also add optionally context for that note
[ux] also add a keybinding to open "new card" popup, so that i can go directly and add it quickly

### audio capture
[ux] when sending audio to stabbur(not attaching to note), it should just create a new note with that audio attached, since there is no way to check orphan audios at all.
[ux] would be nice to have some indicator that the audio is being recorded and how much is being recorded
[ux] add ability to send only a selection of audio to stabbur's note/orphan note, not the whole recorded one, and preview of that slice of course

### capture selection
[ux] when capturing a selection it should open a small inline popup with that text prefilled and context as well, that i can check before sending. 
do not send it immediately to stabbur, let me review it. This, if possible should be a popup on the place of the cursor, not extension popup directly. It's just an alternative way to create a note, but it has to have the same functionality as the extension popup when creating note (text/type/context + translation, translation called by default btw and visible when the popup opens), it just has additionally a source field, prefilled with what is going to stabbur as source and edtiable. 
[ux] also add an option just to open an inline popup anywhere, either by clicking on the page, not necessarily selecting anything, but 

### on hover popup
[ux] the translation popup has way to big text and it has different size each time, probably because of the original subtitle font
[ux] rehaul the ui of the popup, it should be modern and minimal, but very slick, really put effort in it.

## Status

| Package | Status | Change(s) |
|---------|--------|-----------|
| Hover translate fixes | designed | `hover-translate/openspec/changes/capture-and-tooltip-ux` |

Designed 2026-11-24. **No items dropped or deferred** — all nine were settled.
Nothing in the package touches `stabbur`: every endpoint and field it needs
already exists, so despite the triage listing `stabbur` as a touched project,
the change is entirely within `hover-translate`.

### Build prompt

    /tun-build batch hover-translate-fixes, package Hover translate fixes

No dependency direction — this is the batch's only package, so nothing must
build before it.

### Settled against the backlog text

Two items were decided differently from how they were written, both on
operator direction during design:

- *"some indicator that the audio is being recorded"* grew into the pill being
  the **primary recording control**: `Alt+Shift+R` now toggles the pill's
  visibility rather than starting a recording, and the pill itself starts,
  stops, collapses and closes (design D6, D11). This is the largest
  implementation item in the package.
- *"there is no way to check orphan audios at all"* rests on a false premise.
  A standalone recording already creates a draft note carrying its audio
  (`stabbur/routes/captures.py:105-119`); the real defect was the
  `"(audio capture)"` placeholder title. The operator chose to keep that
  placeholder as the blank-send fallback and add an optional note form in
  front of it, which is why no stabbur change is needed (design D8).

### Deferred to the builder's judgement (tier 2)

Recorded in full as T1–T7 in the change's `design.md`; each needs one line in
`DECISIONS-MADE.md`:

| | |
|---|---|
| T1 | how the band-and-chip block is shared between `extension/` and `popup/` |
| T2 | the pill's persistence store for per-tab visibility and per-origin position |
| T3 | whether cross-tab recording state is polled or pushed |
| T4 | waveform rendering and resolution in a 380–550px column |
| T5 | the inline popup's isolation mechanism from host-page CSS |
| T6 | whether a `"none"` note-type chip exists in the audio form |
| T7 | the inline popup's light/dark rule |

### Raised to Quick Log, not fixed here

- YouTube captures set `cueStartMs` and `cueEndMs` to the same value
  (`captureService.ts:50-53`), so every video capture's cue range is
  zero-length.
- `captureService` sends no `type`, so every capture defaults to `word`
  server-side regardless of content.
