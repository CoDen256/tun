# cards-browser

## Purpose

Defines the operator-facing browsable list of every minted card, with
per-side occurrence status and links back to the card's source note (and
grammar rule, where applicable), built entirely from hub's own records.

## Requirements

### Requirement: Every minted card is browsable, searchable, filterable, and groupable
The Cards page SHALL show one flat, paged table — not one panel per deck —
with the columns Card, Deck, Front (N), Back (E), Occurrences and ↗. Front
and Back SHALL be HTML-stripped, one line, ellipsised, with the full text on
hover; Deck SHALL show the code with the full title on hover.

A **source picker** SHALL select between `Minted (hub ledger)` — every card
in hub's ledger — and each published build in `publications` (newest first,
the current build marked), which lists exactly the cards contained in that
build's published bundle file, read without modifying it. In a bundle
source, cards hub minted SHALL carry a small marker before the id.

A structured filter bar SHALL offer: text search with a scope (all text, N,
E, X, card id, note id, raw HTML); a deck multi-select; per occurrence
letter N, E and A a state filter (Minted: any, none, shipped, staged,
pending, not shipped; bundle: any, present, absent); toggles for X empty,
has IPA, has grammar rule and audio clip missing; and a "uses class" select.
Controls meaningless for the current source SHALL be hidden or disabled.
Active filters SHALL appear as removable labels with a match count and a
Clear all.

The page SHALL sort by card id, deck, minted, last shipped, pending
remaining or front text, ascending or descending, with empty values last;
paginate at 25, 50 or 100 rows; and offer the saved views *Pending E sides*
and *Uses IPA*. The page SHALL NOT embed a preview per row.

#### Scenario: Filtering to cards with a pending E side
- **WHEN** the source is Minted and the operator sets E to "pending"
- **THEN** only cards whose E occurrence is in `pending_occurrences` are
  listed, a removable `E pending ×` label appears, and the count reads
  `<matches> of <minted total> cards`

#### Scenario: Browsing a published build
- **WHEN** the operator picks `Bundle b<NN>` in the source picker
- **THEN** the list holds exactly the cards in that build's bundle,
  including stock cards, hub-minted ones carry the marker, and the pending
  and staged filters are not offered

#### Scenario: Searching raw HTML
- **WHEN** the operator searches `royalRed` with scope "raw HTML"
- **THEN** only cards whose N, E or X markup contains `royalRed` are listed

### Requirement: Each card shows per-side occurrence status, not a single status
Each row SHALL show three fixed-width occurrence slots in the order N, E, A,
aligned identically on every row, drawn in the `builder-ship-strips` cell
vocabulary: shipped (soft green fill), staged and flushing next run (solid
warn fill), staged and held (dashed warn outline), pending (dotted faint
outline), and absent (a faint box with a small dimmed ✕). Build ids and
countdowns SHALL NOT be printed in the row; each slot's hover text SHALL
give them (`N · shipped in b42`, `E · pending · 7 to go`, `A · staged ·
held`, `E · no occurrence`). A one-line legend SHALL appear above the table
for the Minted source. For a bundle source, each letter that bundle
contains SHALL show as shipped.

The same state SHALL look the same on the Cards page and on the ship
strips.

#### Scenario: A card with one shipped side and one pending side
- **WHEN** a card's `A` has shipped in b42 and its `E` is pending with 7 to
  go, and it has no `N`
- **THEN** its row shows a ✕ slot, an E slot in the pending style and an A
  slot in the shipped style, at the same horizontal positions as the N, E
  and A slots of every other row

### Requirement: Each card links to its source note, and to its grammar rule if applicable
The ↗ column SHALL hold an icon link to the card's stabbur note and, when
the card references a grammar rule, a second, muted icon link to the rule.
Both SHALL open in a new tab and SHALL NOT open the preview. Cards with
neither (stock cards) SHALL leave the column blank.

#### Scenario: Following a card to its note
- **WHEN** the operator clicks a row's note ↗
- **THEN** the note's stabbur edit page opens in a new tab and no popup opens

### Requirement: The card list never implies stabbur-side knowledge
The system SHALL present card-to-note linkage entirely from hub's own
records (hub's minted-note ledger), without requiring or implying any
new capability on stabbur's side.

#### Scenario: stabbur is unreachable
- **WHEN** stabbur is down
- **THEN** the Cards list still renders fully from hub's own data; only the
  destination of the "open note" link is unreachable, not the Cards list
  itself
