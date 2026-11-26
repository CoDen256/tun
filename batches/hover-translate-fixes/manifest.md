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

## Package 2: Sizing, click-to-capture, audio page

projects: hover-translate

Live findings from the operator's manual pass over Package 1's build, raised
2026-11-26. Package 1 is `archived`, so this package is independent of it in
the D161 sense — but it is entirely *about* Package 1's surfaces, so it must
build after it (which it already does: package 1 is archived).

### sizing
[ux] the font size should be easy to customize with some values, not just small/medium/large
[ux] Also the popup is too small, maybe that's just the text size and it will solve it
[ux] the hover translation tooltip should not display the selected text atop, its already clear

### selection popup
[ux] i should be able to close the selection popup with some button as well

### subtitle click
[ux] When pressed on the subtitle it should always open the same popup with the selected subtitle just as i would select the text normally, not send it to dictionary by default

### audio page
[ux] the audio page of the popup extension looks nothing like the mockup this should be redone

## Status

| Package | Status | Change(s) |
|---------|--------|-----------|
| Hover translate fixes | archived | `hover-translate/openspec/changes/capture-and-tooltip-ux` |
| Sizing, click-to-capture, audio page | building | `hover-translate/openspec/changes/sizing-and-surface-fixes` |

### Build prompts

Package 2 is the one that is ready to build:

    /tun-build batch hover-translate-fixes, package Sizing, click-to-capture, audio page

Package 1 is already archived. No dependency direction needs enforcing —
package 2 modifies surfaces package 1 built, and package 1 is done.

---

## Package 1 — notes (archived)

Designed 2026-11-24. **No items dropped or deferred** — all nine were settled.
Nothing in the package touches `stabbur`: every endpoint and field it needs
already exists, so despite the triage listing `stabbur` as a touched project,
the change is entirely within `hover-translate`.

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
`DECISIONS-MADE.md`. **All seven were decided during the build** — see
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

---

## Package 2 — notes

Designed 2026-11-26. **No items dropped** — all six were settled (five from
the operator's message plus one raised in session: the tooltip's redundant
header row).

Three of the six are **implementation gaps against Package 1's own accepted
contract**, not new features:

- The inline popup's close button **was in the approved mockup and was not
  built** (`mockups/inline-popup.html:894`, styled `:245-251`). Shipped
  behaviour is Esc-only.
- The tooltip size setting **silently does not reach the note surfaces**,
  despite its own locale string claiming it covers "the inline note's
  translations block". `tt-size-*` is applied only in
  `tooltipService.applyTooltipSize`; the inline popup and Quick Note mount the
  block with no size class, so both are pinned at the 13px base.
- The Audio page **was never in the restyle's scope**. Package 1's criterion
  N11 named only the Quick Note page. The builder satisfied the contract as
  written; the contract was too narrow. This is a design-phase miss, not a
  build-phase one.

### Deferred to the builder's judgement (tier 2)

Recorded in full as T1–T4 in the change's `design.md`; each needs one line in
`DECISIONS-MADE.md`:

| | |
|---|---|
| T1 | the scale custom property's exact derivation (one `--tt-scale` multiplier vs. per-element px) |
| T2 | where the `smia unreachable` fallback tag goes once the header row is removed |
| T3 | whether the Audio page's MUI structural lists (Sent history, Re-home) are rebuilt on `ns-*` primitives or kept |
| T4 | how the 4 new settings migrate over a stored `tooltipTheme: {size: "small"\|"medium"\|"large"}` |
