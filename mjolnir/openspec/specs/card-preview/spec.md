# card-preview

## Purpose

Let an operator see, in a popup over the Cards page, how a card will
actually render and sound on-device — using styles, fonts and geometry
extracted from the stock app's own bundle rather than hand-transcribed,
covering both themes, every class and tag the renderer uses, real audio
playback by tapping a face, generated reference tables of symbols and
classes, and a throwaway HTML editor for trying changes without touching
the stored card.

## Requirements

### Requirement: A card's rendered content can be previewed in the stock app's own visual style
The preview SHALL render card HTML by the rules of the device's renderer
(react-native-render-html v6 as configured by the stock bundle), not by
browser defaults. Every style value, font, geometry constant and theme
colour SHALL come from a re-runnable extractor reading the stock bundle and
its font files; no class style SHALL be hand-typed in the preview.

The extractor SHALL emit, at minimum: the tag style map; the complete class
style map as discovered in the bundle (not a fixed list); both themes by
token; the renderer's `systemFonts`; the base font-size default and range;
and the card geometry constants. It SHALL fail loudly when an expected
anchor is missing rather than emit a partial map.

The renderer emulation SHALL:
- apply styles in the order built-in → tag style → each class in attribute
  order → inline style;
- re-apply the `div` tag style on every `<div>`, so an ancestor's class does
  not reach a nested div;
- left-align by default, with `.center` contributing only `textAlign`;
- discard any `fontFamily` not present in the extracted `systemFonts`;
- render each Poppins weight/style from its own font file with no synthetic
  bold or italic;
- give undefined classes (e.g. `.bold`) no effect, and accept unquoted class
  attributes;
- treat every `<br>`, including a trailing one, as a line break;
- wrap text within the face's content width, never overflowing it
  horizontally;
- render `supWrap` and `flex` as flex rows.

Font sizes SHALL scale by `normalize(x) = x × shortSide / 375 × (tablet ?
0.7 : 1)`, rounded to the device pixel, against a selectable simulated
device, from a base size defaulting to 15 and adjustable 10–22.

#### Scenario: Centred text is not bold
- **WHEN** the operator previews a face containing
  `<div class="center">God morgen</div>`
- **THEN** the text is centred and rendered in Poppins Regular, with the
  same stroke weight as plain `<div>` text

#### Scenario: Plain text is left-aligned
- **WHEN** a face contains `<div>Yes. Long stressed vowels…</div>` with no
  class
- **THEN** its lines start at the face's left text edge

#### Scenario: A nested div does not inherit its parent's class
- **WHEN** a face contains `<div class="arialFont supWrap">k<div
  class="sup">j</div>(:)</div>`
- **THEN** `k` renders in Arial at `normalize(28)` and the raised `j`
  renders in Poppins Regular at `normalize(11)`

#### Scenario: Bold comes from the Bold face
- **WHEN** a face contains `a <b class="bold">bold</b> b`
- **THEN** only `bold` is bold, in `headingAccent`, and `.bold` adds nothing

#### Scenario: Font size control
- **WHEN** the operator raises the preview's font size from 15 to 18
- **THEN** every plain-div text run grows to `normalize(18)` and the
  class-sized runs (`.lg`, `.arialFont`, `.sup`) keep their own sizes

### Requirement: The preview reproduces the device's card geometry
The preview SHALL draw only the study card — no status bar, header,
counters or answer buttons — on the theme's screen background: width
`normalize(342)`, radius `normalize(20)`, border `normalize(1)` in
`borderColor`, no card background of its own, the deck name uppercase at
the top, and three faces of `0.29 Xe`, `0.29 Xe` and `0.40 Xe` separated by
dividers 60% wide and `normalize(1)` tall, where `Xe = max(normalize(260),
screenHeight − insets − normalize(185))`.

The top face SHALL NOT scroll; the middle and bottom faces SHALL scroll when
their content overflows and centre it when it fits, without clipping the
top of overflowing content. The card SHALL be scaled to fill the available
space, with an info line stating the simulated device, normalize factor,
card size, text width, resolved font size and display scale.

#### Scenario: No phone chrome
- **WHEN** the popup shows a card
- **THEN** no status bar, menu button, counters or Wrong/Hard/Normal/Easy
  buttons are drawn; only the card on the screen background

#### Scenario: Card background is the screen
- **WHEN** the theme is switched from Light to Dark
- **THEN** the area inside the card's border changes from `#FFFFFF` to
  `#1B1D21`, the same colour as the margin around the card

#### Scenario: A long bottom face
- **WHEN** a card's X content is taller than the bottom face
- **THEN** the bottom face scrolls, its first line is visible at scroll
  position 0, and the top and middle faces are unaffected

#### Scenario: An overflowing top face
- **WHEN** the top face's content is taller than the face
- **THEN** it is clipped, not scrollable, and the info line warns that the
  device clips it

### Requirement: The preview plays a face's audio by tapping the face
The preview SHALL show the audio icon at the top-right of the face that
currently displays the side named by the card's `A` field, and SHALL play
the card's clip when that face is tapped. Tapping any other face SHALL give
a brief, non-blocking "no audio on this face" indication. When the clip is
not in the blob cache, tapping the audio face SHALL say it is unavailable.
No `<audio>` control SHALL be rendered.

#### Scenario: The audio face follows the direction switch
- **WHEN** a card's `A` field is `E` and the operator switches the direction
  from N to E
- **THEN** the audio icon moves from the middle face to the top face

### Requirement: The preview ships a generated reference of styles and symbols
The preview's tools drawer SHALL offer a **Classes & tags** table (Selector,
Resolves to, Sample — no Kind column) and a **Symbols** table (Entity,
Glyph, Name, Poppins, Arial, Uses), both generated from the extractor and
from card content.

Classes & tags values SHALL be resolved at the current simulated device,
font size and theme, and each sample SHALL be drawn by the same renderer on
the theme's screen background, so a colour class's sample visibly shows that
colour. Values derived from Android behaviour rather than read from the
bundle SHALL be tagged as inferred; `.bold` SHALL be flagged as undefined
and `.center` as having its font dropped.

Clicking (or pressing Enter on) a row SHALL copy it to the clipboard: a tag
row as `<tag></tag>` (`<br>` for br), a class row as the bare class name (no
`class="..."` wrapper), a symbol row as its entity or, for a literal
character, the character, with a brief confirmation naming what was copied.

#### Scenario: Colour samples are coloured
- **WHEN** the operator opens Classes & tags in the Light theme
- **THEN** the `.teal` sample text is `#00A4BF`, `.burntOrange` is
  `#ff7733` and `.royalRed` is `#cc0066`

#### Scenario: Copying a class
- **WHEN** the operator clicks the `.royalRed` row
- **THEN** the clipboard holds `royalRed` and a "Copied" confirmation
  appears

### Requirement: A card's HTML can be edited throwaway, to see how it would render
The tools drawer SHALL offer an Edit HTML tab with one syntax-highlighted,
line-wrapping, auto-growing editor per face (N, E, X), each labelled with
the face slot it currently occupies. The card SHALL re-render live as any
editor changes. A snippet palette SHALL wrap the current selection in the
chosen tag or class, or insert it at the cursor when nothing is selected.
Each editor SHALL offer Copy HTML, the tab SHALL offer Copy all and Reset to
minted card.

Edits SHALL be throwaway: never persisted, never sent to the builder, never
altering stored content, discarded on reload or Reset. The popup bar SHALL
show an `edited (throwaway)` chip while the shown card differs from its
stored HTML. No warning banner SHALL be shown.

#### Scenario: Wrapping a selection
- **WHEN** the operator selects `regner` in the E editor and clicks `.teal`
- **THEN** the editor reads `<span class="teal">regner</span>` and the card
  shows `regner` in teal

#### Scenario: Edits do not survive
- **WHEN** the operator edits a face and reloads the Cards page
- **THEN** the card renders from its stored content, the chip is gone, and
  the stored content is unchanged

### Requirement: A card's preview opens as a popup over the Cards page
Clicking a card's row (anywhere but its ↗ links) or pressing Enter on it
SHALL open one shared modal over the Cards page with the page dimmed behind
it. Esc, the × button and a click on the dimmed backdrop SHALL close it.

The popup bar SHALL carry previous/next buttons, the card id and its
position in the current list (`3 / 137`), the card's occurrence summary, an
N | E direction switch, a default-direction picker (first occurrence / N /
E), a simulated-device select, a Light/Dark switch, a font-size stepper
(10–22) and a Tools toggle.

Previous/next (buttons and ←/→ keys, not while typing in an editor or form
field) SHALL step through the filtered and sorted list across page
boundaries. On close, the Cards table SHALL show the page containing the
last-shown card with that row highlighted.

#### Scenario: Stepping past the page end
- **WHEN** the page size is 25, the operator opens row 25 and presses →
- **THEN** the popup shows card 26 of the filtered list, and after closing,
  the table shows page 2 with that card's row highlighted

### Requirement: The direction switch arranges faces as the device does
The popup SHALL show the chosen side (N or E) on the top face, the other on
the middle face, and X always on the bottom face. It SHALL open on the side
of the card's first occurrence — an `A` occurrence resolving to the side
named by the card's `A` field — unless the operator's default direction says
N or E. A card with an `A` occurrence SHALL show an `A → N` or `A → E` note.
There SHALL be no A option on the switch.

#### Scenario: A card whose first occurrence is A
- **WHEN** a card's first occurrence is `A` and its `A` field is `E`
- **THEN** the popup opens with E selected, E's content on the top face, and
  the note `A → E` visible

### Requirement: The tools drawer is resizable and remembered
The tools drawer SHALL be closed by default and toggled from the bar. On a
wide screen it SHALL open at the right and be resizable by dragging its
inner edge between 320 px and 75% of the dialog; below ~760 px it SHALL be a
bottom sheet resizable between 160 px and 85% of the popup body. The card
SHALL refit while dragging. The size SHALL persist as an operator setting.

#### Scenario: Widening the drawer
- **WHEN** the operator drags the drawer edge from 520 px to 700 px wide
- **THEN** the card shrinks to fit the narrower stage during the drag, and
  after a page reload the drawer reopens 700 px wide
