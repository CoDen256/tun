# Acceptance criteria — card-preview-popup

Falsifiable, UI-observable end states, testable in dev compose with
claude-in-chrome. A criterion passes only when the described end state was
observed in the running Cards page by an agent that did not write the code
— never by reading code or trusting a log.

**Reference:** the operator locked `mockups/card-preview-popup.html`
(version 6) and asked for it to be implemented exactly. Every look and
interaction below should match the mockup when the two are viewed side by
side; a visible difference in layout, control set, column set or cell
styling is a failure even if no criterion names it.

**Seeding.** Needs at least: one published build whose bundle file is on
disk (and ideally two builds); minted cards covering every occurrence state
— shipped, pending, staged-flushing, staged-held — including one card with
no N, one with an A occurrence whose `A` field is E, one with a grammar
rule, one whose audio clip is missing from the blob cache; > 25 minted
cards. Stock cards named below come from the stock bundle (they are in
every published build). Record the seeding used.

## The renderer (bundle source, stock cards)

### C1. `.center` is not bold
Open `A01001` (`<div class="center">God morgen</div>`). The text is
centred, and its computed font is the Poppins **Regular** face with font
weight 400 and no synthetic bold — the same stroke weight as plain `<div>`
text in `Z01001`'s middle face.

### C2. Default alignment is left
Open `Z01001` with direction E. The middle face's text (`Yes. Long stressed
vowels…`) starts at the left text edge, not centred.

### C3. Only `<b>` is bold, in the accent colour
In `Z01001`'s top face, `long` and `short` are bold; the surrounding words
are Regular. In Light theme `long` is `#246BFD`; in Dark `#3F8CFF`. `.green`
`short` is `#5DD8D0`.

### C4. Nested div resets its parent's class
Open `B01028`, direction E. In the `supWrap` row, `k` is Arial at
`normalize(28)` and the raised `j` is Poppins Regular at `normalize(11)`,
top-aligned with `k`, not rendered with `<sup>`.

### C5. Colours of the colour classes
Open `B12007`, direction E. `Det` is `#FF0000`, `regner` `#00A4BF`,
`ikke` `#8030cf`. Open `B12006`, direction E: `ham` `#cc0066`, `den`
`#ff7733` (unquoted `class=` attributes).

### C6. IPA renders in Arial
Open `B01003`, direction E: the glyph ʂ renders in Arial at
`normalize(28)`, not as a missing-glyph box.

### C7. Wrapping
Open `C01001`, direction E. No line of any face extends past the face's
right text edge; the `&emsp;` rows of the X face wrap inside the face.

### C8. `<br>` semantics
In the editor, set the top face to `<div>line<br></div>`. The face shows
two line boxes (an empty second line), measurably taller than `<div>line</div>`.

### C9. Font size control
At 375 × 812, font 15: a plain div run computes to 15 px. Press + three
times: the stepper reads 18, plain runs compute to 18 px, `.lg` stays 28 px.
The stepper stops at 10 and 22.

### C10. Device scaling
Switch the device from 375 × 812 to 768 × 1024 tablet. The info line shows
the normalize factor ×1.434 (2.048 × 0.7) and a plain run at font 15
computes to ≈ 21.5 px; the card's width is `normalize(342)` at that factor.

### C11. No style is hand-typed
Rename one colour class's anchor in a copy of the bundle and point the
extractor at it: the extractor fails with an error naming the missing
anchor, and the preview shows a loud error rather than a card without that
class. (Restore afterwards.)

## The card

### C12. Card only, no chrome
The popup shows the card alone: deck name uppercase at the top, three faces,
two dividers, an audio icon; **no** status bar, menu button, counters or
Wrong/Hard/Normal/Easy buttons.

### C13. No card background
Switch Light → Dark. Inside the card border the colour is `#FFFFFF` then
`#1B1D21`, identical to the margin around the card in each theme.

### C14. Face proportions
At any device, the three faces' heights are in the ratio 0.29 : 0.29 : 0.40
of `Xe` (±1 px), and the info line states the card's dp size.

### C15. Scrolling and clipping
Open `C01004`, direction N: the X face scrolls; at scroll position 0 its
first line (`Verbs (except…`) is visible. The top face never shows a
scrollbar; when its content overflows, the info line shows the "device clips
it" warning.

### C16. The card fills the stage
With the tools drawer closed, the card is scaled up so its height (plus the
screen margin) fills the stage height to within the stage padding; the info
line shows a display scale above 100% on a 1080-px-tall window.

## The popup

### C17. Opening and closing
Clicking a row's Front text opens the popup with the page behind visibly
dimmed. Esc closes it; reopening and clicking the dimmed area closes it;
reopening and clicking × closes it.

### C18. Stepping across pages
With 25 per page, open row 25 and press →: the bar shows the 26th card of
the filtered list and `26 / <total>`. Close: the table shows page 2 with
that row highlighted. ← on the first card and → on the last are disabled.
While the cursor is in an editor, ←/→ move the cursor and do not change
the card.

### C19. Direction switch
For a card whose `A` field is E and whose first occurrence is `A`: the popup
opens with **E** selected, E's content on the top face, N's in the middle,
X at the bottom, `A → E` shown, and the audio icon on the top face.
Switching to N swaps the top and middle faces and moves the icon to the
middle face. The switch has exactly two options, N and E.

### C20. Default direction
Set the default-direction picker to N, then open the card from C19: it opens
on N.

### C21. Audio
On a minted card with its clip present, clicking the face showing the `A`
side plays the clip; clicking another face shows "No audio on this face"
briefly; on the seeded clip-missing card the audio face says the clip is
unavailable. There is no `<audio>` element in the popup's DOM.

### C22. Occurrence summary
The popup bar shows the card's occurrences as text, e.g.
`N · shipped in b42 | E · pending · 7 to go`, matching the row's hover text.

## Tools drawer

### C23. Closed by default, resizable, remembered
On first load the drawer is closed. Opening it and dragging its edge to
700 px narrows the card stage live during the drag; the width cannot go
below 320 px or above 75% of the dialog. After reload and reopening, it is
700 px wide. Below 760 px window width it is a bottom sheet resized
vertically.

### C24. Editor layout
Clicking into any of the three editors leaves it directly **below** its
header row (the N/E/X label, slot label and Copy HTML button), at full
drawer width — it does not move beside the Copy button.

### C25. Editor behaviour
The editors highlight tags, attributes and strings in distinct colours and
wrap long lines. Typing in the X editor re-renders the X face within a
second. Selecting `regner` and clicking `.teal` produces
`<span class="teal">regner</span>`. Copy HTML puts that face's HTML on the
clipboard; Copy all puts all three. The `edited (throwaway)` chip appears
after an edit and disappears after Reset. There is no warning banner.

### C26. Edits are not saved
After editing a face, reload: the card shows its stored content, and the
database row (`card_content`) for a minted card is unchanged.

### C27. Classes & tags
The table has exactly three columns: Selector, Resolves to, Sample. In Light
theme, the `.teal`, `.burntOrange`, `.royalRed`, `.blueViolet`, `.dodgerBlue`
and `.red` samples render in `#00A4BF`, `#ff7733`, `#cc0066`, `#8030cf`,
`#0080ff`, `#FF0000`. `.bold` is flagged undefined; `.center` is flagged
"font dropped"; line-metric rows are tagged inferred. Changing font size or
device updates the "Resolves to" sizes.

### C28. Click to copy
Clicking the `.royalRed` row puts `class="royalRed"` on the clipboard and a
"Copied" confirmation appears; the `b` row copies `<b></b>`; the `br` row
copies `<br>`; the `&#649;` symbol row copies `&#649;`; the å row copies
`å`. Enter on a focused row does the same. Line-metric rows copy nothing.

**Corrected 2026-11-20, live operator feedback:** a class row now copies the
bare class name (`royalRed`), not `class="royalRed"` — the operator's actual
use was pasting into an existing `class="..."` attribute, where the wrapper
just had to be retyped around it every time. See commit `bdd4e2f8`; the main
spec (`card-preview/spec.md`) is updated to match.

## The Cards page

### C29. One flat table, these columns
The page has no per-deck panels. The header reads exactly Card, Deck, Front
(N), Back (E), Occurrences, ↗. Deck cells show the code only; hovering
shows the deck title. Front/Back are single-line with an ellipsis on long
text and the full text on hover. Every row is the same height.

### C30. No per-row preview payload
The page's HTML contains no hidden per-row preview markup and only one copy
of the renderer data, regardless of row count.

### C31. Occurrence slots align
Every row's occurrence cell has three slots at the same horizontal positions
(N, E, A). A missing letter shows a faint box with a small dimmed ✕ that is
no taller or wider than a letter slot and visibly smaller than the letter
glyphs. Rows with N·E·A, with only E·A and with only N all have identical
cell widths.

### C32. Occurrence states look like the ship strips
For the seeded cards: shipped = soft green fill; staged flushing = solid
warn fill; staged held = dashed warn outline; pending = dotted faint
outline. Each slot's hover text names the state and its detail. The legend
above the table shows these four plus nothing else and is visible only for
the Minted source. Put side by side with the builder ship strips (once
built), the same state is visually identical.

### C33. ↗ links
A minted card with a grammar rule shows two ↗ icons, the rule's muted. Each
opens a new tab and does not open the popup. Stock cards in a bundle source
show nothing in the column.

### C34. Source picker
The picker lists `Minted (hub ledger)` then every published build newest
first, the current one marked. Picking a build lists exactly that bundle's
cards (the count equals the bundle's distinct card ids), stock decks
included; hub-minted ids carry a dot; every present occurrence slot is in
the shipped style; the pending/staged/not-shipped options, *has grammar
rule*, *audio clip missing*, the note-id scope and the minted / last shipped
/ pending sorts are not offered.

### C35. Filters
With the Minted source, setting E to "pending" lists only cards whose E is
in `pending_occurrences`, shows a removable `E pending ×` label and a
`<n> of <total> cards` count; × removes it; Clear all removes all filters.
Raw-HTML search for `royalRed` in a bundle source lists only cards whose
markup contains it. *Uses class* `.arialFont` lists only cards using it.

### C36. Sort, pagination, saved views
Sorting by front text ascending orders rows A→Z by stripped front; the
toggle reverses it; cards with no value for the sort key sit last in both
directions. Page size 50 shows 50 rows and `Showing 1–50 of <n>`; numbered
pages with an ellipsis appear when there are more than five pages. *Pending
E sides* sets the E pending filter and sorts by pending remaining; *Uses
IPA* sets has-IPA.

## Operator settings

### C37. Settings persist server-side
Set a bundle source, deck sort descending, 50 per page, Dark, font 18,
drawer 700 px on the Classes tab. Open the Cards page in a fresh browser
profile (no cookies beyond login, no local storage): all of these are
restored. The hub database's settings table holds them.

### C38. Stale settings degrade
Save a view whose source is a build, then delete that build's row from
`publications` (dev only): the Cards page loads on the Minted source with no
error.

### C39. Database outage
Stop the Postgres service and open the Cards page: it renders (with an
explanation for any database-backed source) using default settings instead
of failing to load.

## Boundaries

### C40. Device plane untouched
Before and after the change, fetch `/ota/current.json` and one
`/ota/bundle/<buildId>.js`: byte-identical. No file under
`data/ota/bundle/` changes mtime after browsing bundle sources.

### C41. Style isolation
With the page's filter labels present and the "no cards match" empty state
shown at least once, the card faces, editor and occurrence slots still
match C24 and C31 — no page-level class (`active`, `empty`, `hidden`
handling) alters their layout.
