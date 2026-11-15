## MODIFIED Requirements

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

## ADDED Requirements

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
