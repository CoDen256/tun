# card-preview

## Purpose

Let an operator see, inline from the Cards list, how a card will actually
render and sound on-device — using styles, fonts and geometry extracted
from the stock app's own bundle rather than hand-transcribed, covering both
themes, every class and tag the renderer uses, real audio playback by
tapping a face, generated reference tables of symbols and classes, and a
throwaway HTML editor for trying changes without touching the stored card.

## Requirements

### Requirement: A card's rendered content can be previewed in the stock app's own visual style
The preview's styles, fonts and geometry SHALL be **extracted from the
stock bundle**, not transcribed by hand. A re-runnable extractor SHALL
read `base/smali.mjolnir.merged/assets/index.android.bundle` and the font
files beside it, and emit what the preview renders with, so the preview
cannot silently drift from the app after an APK rebase.

The extracted surface SHALL cover, at minimum:

- the renderer's **tag styles** — `div` (cardText, `normalize(16)`,
  Poppins-Regular), `b` (Poppins-Bold, headingAccent), `i`
  (Poppins-Regular, italic, underlined), `p` (margin-bottom
  `normalize(6)`), `a` (headingAccent)
- the renderer's **complete class map**, including the four classes the
  current preview omits entirely — `supWrap`, `sup`, `arialFont`,
  `arialFontNormal` — alongside `lg`, `italic`, `boldItalic`, `underline`,
  `green`, `blue`, `darkBlue`, `red`, `teal`, `dodgerBlue`, `royalRed`,
  `blueViolet`, `burntOrange`, `center`, `left` and `tipOfTheDay`
- **both themes**, by token name rather than by copied literal
- the **real font files** — the bundled Poppins family *and* `arial.ttf`,
  served by hub rather than fallen back on

`supWrap` SHALL be rendered as the flex row it actually is
(`flexDirection: row`, `alignItems: flex-start`, `justifyContent: center`,
`marginHorizontal: normalize(4)`), NOT emulated with `<sup>` or
`vertical-align`. `arialFont`/`arialFontNormal` SHALL render in the real
Arial face, because the app switches to it precisely for the IPA glyphs
Poppins lacks.

Font sizes SHALL be scaled by the app's own rule,
`normalize(t) = round(t × width / 375 × (isTablet ? 0.7 : 1))`, against a
selectable simulated device.

The dark theme has **no `cardBackground` key**; `#1B1D21` is a documented
mapping from `archivedBackground` / `navigationRoot` and SHALL be labelled
as the one mapped value rather than presented as extracted.

#### Scenario: Previewing a card with multiple styled fields
- **WHEN** the operator opens the preview for a card whose content uses the
  app's own emphasis classes (e.g. bold, teal, red, left-aligned text)
- **THEN** the preview renders each field with those same visual treatments,
  matching the colors/weights the real app itself uses for them

#### Scenario: Previewing a card with no special styling
- **WHEN** the operator opens the preview for a card with plain, unstyled
  content
- **THEN** the preview still renders using the app's base font and text color

#### Scenario: A class the old preview did not know
- **WHEN** the operator previews a card whose content contains
  `<div class="supWrap">k<div class="sup">j</div>(:)</div>`
- **THEN** the superscript renders raised in a top-aligned row, at the
  `sup` font size, not as unstyled inline text

#### Scenario: An IPA run
- **WHEN** a face contains `<span class="arialFontNormal"> &#649; </span>`
- **THEN** the glyph ʉ renders in Arial at the `arialFontNormal` size, not
  as a missing-glyph box or in Poppins

#### Scenario: Changing the simulated device
- **WHEN** the operator switches the simulated device from 375×812 to
  768×1024
- **THEN** every font size and dimension rescales by the app's own
  `normalize` rule, including its ×0.70 tablet factor

### Requirement: The preview indicates which face carries the card's audio
The system SHALL visually flag whichever of the card's N/E/X faces its audio
is attached to, and SHALL offer real playback of that audio when the
underlying clip is available on disk, degrading to a non-playable indicator
when it is not.

#### Scenario: Audio is available
- **WHEN** the card's audio clip exists in the audio blob cache
- **THEN** the preview's flagged face offers a working audio player for that
  clip

#### Scenario: Audio is not available
- **WHEN** the card's audio clip is not present in the audio blob cache
- **THEN** the preview's flagged face still shows which face the audio
  belongs to, with no non-functional player presented as if it worked

### Requirement: The preview is reached inline from the card's own row, not a separate page
The system SHALL let the operator open a card's preview directly from its
row in the Cards list, expanding in place, rather than navigating to a
separate page — and SHALL ensure at most one card's preview is expanded at a
time, collapsing any other already-open preview when a new one is opened.

#### Scenario: Opening a preview from the Cards list
- **WHEN** the operator selects the preview action on a card's row
- **THEN** that card's preview expands directly under its row, with no
  navigation away from the Cards list

#### Scenario: Opening a second card's preview while one is already open
- **WHEN** the operator opens a different card's preview while another
  card's preview is already expanded
- **THEN** the previously-expanded preview collapses and the newly-selected
  one expands, so at most one is visible at a time

### Requirement: The preview's three faces are arranged vertically, styled from the app's dark theme
The system SHALL arrange a card's N/E/X preview faces in a single vertical
column, and SHALL style them using the real app's dark-theme colors
specifically (not its light theme).

#### Scenario: Viewing a card's preview layout
- **WHEN** the operator views a card's expanded preview
- **THEN** its three faces (N, E, X) are stacked vertically, each styled
  with the app's dark-theme background and text colors

### Requirement: The preview reproduces the device's card geometry
The preview SHALL draw **one** card, not three boxes: width
`normalize(342)`, border radius `normalize(20)`, border `normalize(1)` in
the theme's `borderColor`, and height derived as the app derives it —
`C = screenHeight − normalize(200)` on Android.

That card SHALL be divided into three faces of `0.28 C`, `0.28 C` and
`0.44 C`, separated by the app's own `textDivider` (60% width, centred,
`normalize(1)` tall, `borderColor`). Each face SHALL carry
`paddingHorizontal: normalize(16)`; the two scrollable faces SHALL carry
`paddingVertical: normalize(16)`.

The **E and X faces SHALL scroll** when their content overflows; the **N
face SHALL NOT** — matching the app, where only those two are wrapped in a
`ScrollView`. Content that overflows a scrollable face SHALL be reachable
from its first line: centring SHALL NOT clip the top of an overflowing
face.

#### Scenario: A long Extra face
- **WHEN** the operator previews a card whose X content is taller than the
  X face
- **THEN** the X face scrolls, its first line is visible at scroll
  position 0, and the rest is reachable by scrolling
- **AND** the N and E faces are unaffected

#### Scenario: A short face
- **WHEN** a face's content is shorter than its face height
- **THEN** that content is vertically centred within the face

### Requirement: The preview plays a face's audio by tapping the face
The preview SHALL make each face tappable, as the app does, and SHALL play
the card's audio when the face named by the card's `A` field is tapped.
There SHALL be no separate audio player control.

Tapping a face that carries no audio SHALL give a visible, non-blocking
indication that there is none. When the audio clip is absent from the blob
cache, tapping the audio-carrying face SHALL say so rather than silently
doing nothing or presenting a control that cannot work.

#### Scenario: Tapping the audio face
- **WHEN** the card's `A` is `E` and the operator clicks the E face, with
  the clip present on disk
- **THEN** the clip plays
- **AND** no `<audio>` control is rendered anywhere in the preview

#### Scenario: Tapping a face with no audio
- **WHEN** the operator clicks a face that is not the card's `A` face
- **THEN** a brief indication that this face carries no audio appears and
  fades, and nothing plays

#### Scenario: The clip is missing from the blob cache
- **WHEN** the operator clicks the audio-carrying face of a card whose
  clip is not on disk
- **THEN** the preview states the clip is unavailable

### Requirement: The preview ships a generated reference of styles and symbols
The preview SHALL present two generated reference tables beside the card.

The **class catalogue** SHALL list every class and tag the extractor
found, with the value each resolves to at the currently simulated device
width and a rendered sample.

The **symbol catalogue** SHALL list the special characters that actually
occur in card content — the IPA inventory and the Norwegian letters æ ø å
in both cases — each with its numeric entity, its glyph, its Unicode name,
and the glyph rendered in Poppins and in Arial side by side, so it is
visible which characters require the `arialFont` switch.

Both tables SHALL be generated by the extractor from the bundle, and SHALL
state that they are, so neither can be mistaken for a hand-maintained list
that may be incomplete.

#### Scenario: Looking up a symbol
- **WHEN** the operator opens the symbol catalogue
- **THEN** `&#649;` is listed with its glyph ʉ, its Unicode name, and a
  visible difference between its Poppins and Arial renderings

#### Scenario: Looking up a class
- **WHEN** the operator opens the class catalogue at a simulated width of
  375
- **THEN** `arialFontNormal` is listed as Arial at 18px, and `sup` at 11px

### Requirement: A card's HTML can be edited throwaway, to see how it would render
The preview SHALL offer an editing mode in which the card's N, E and X
HTML are editable as raw text and the card re-renders live as they are
edited, so the operator can find what is wrong with a minted card without
publishing a bundle and opening the phone.

These edits SHALL be **throwaway**: never persisted, never sent to the
builder, never altering the stored card, and discarded on reload. The UI
SHALL say so plainly, and SHALL offer a reset that restores the minted
card's own HTML.

The editor SHALL offer click-to-insert snippets for the available classes
and tags, so a style can be tried without typing its markup from memory.

#### Scenario: Editing a face
- **WHEN** the operator enables editing and changes the X face's HTML
- **THEN** the X face re-renders with the edited HTML, with the full class
  map applied

#### Scenario: Edits do not survive
- **WHEN** the operator edits any face and then reloads the Cards page
- **THEN** the card renders from its stored content, with no trace of the
  edit
- **AND** the card's stored content is unchanged in the database

#### Scenario: Resetting
- **WHEN** the operator has edited one or more faces and presses reset
- **THEN** all three faces return to the minted card's own HTML
