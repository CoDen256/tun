# ship-strips-console

## ADDED Requirements

### Requirement: The builder's primary page is a per-deck ship-strip console
The system SHALL serve, at builder's primary route, a page whose backbone is
one always-expanded ship-order strip per deck, replacing the previous
forecast page. It SHALL carry the active-logic-bundle banner, the degraded-
dependency banner, the global totals and the publish action, and SHALL NOT
carry a pipeline-stage rail or a past-batches section.

#### Scenario: Opening the page with decks that have history
- **WHEN** the operator opens builder's primary page and at least one deck
  has shipped occurrences
- **THEN** every deck's full strip is visible without expanding anything,
  and no pipeline-stage rail or past-batches list appears on the page

#### Scenario: The upstream note source is unreachable
- **WHEN** the forecast cannot be computed because the note source is
  unavailable
- **THEN** the page renders a visibly degraded state that cannot be mistaken
  for a healthy, idle pipeline

### Requirement: Occurrence state is encoded on orthogonal visual axes, with no text inside the strip
The system SHALL render each occurrence as one cell whose fill encodes its
lifecycle (shipped, staged-and-flushing-this-run, staged-and-held, open,
pending, or distance filler), whose outline encodes whether this run adds it,
and which carries a distinct marker when this publish rewrites its card's
content. The cell's glyph SHALL be the occurrence letter, or a placeholder
for cells that hold no card. No text SHALL be rendered inside the strip's
cell grid.

#### Scenario: A run both stages new occurrences and holds some
- **WHEN** a deck's staged occurrences include some that reach the next
  multiple of 5 and some that do not
- **THEN** the flushing and held occurrences are distinguishable by fill,
  and any of them added by this run additionally carries the new-this-run
  outline

#### Scenario: Grid alignment is preserved
- **WHEN** a deck's strip is rendered
- **THEN** cells wrap in rows of a fixed cell count with a divider after
  every block of 5, and row labels sit outside the cell grid so that no
  label consumes a cell position

### Requirement: A pending tier's drain distance is rendered as cells, not as a label
The system SHALL render, immediately after each pending tier's own cells, one
distance-filler cell per remaining unit of that tier's countdown, so the
number of further cards awaited is read off the strip rather than from text.

#### Scenario: A deck with several pending tiers
- **WHEN** a deck holds pending occurrences at more than one countdown value
- **THEN** each tier's cells are followed by exactly as many filler cells as
  that tier's remaining countdown, in ascending countdown order

#### Scenario: A deck whose family never queues
- **WHEN** a deck's note family produces one occurrence per card and
  therefore never queues
- **THEN** the strip shows no pending zone for that deck

### Requirement: The countdown is described in cards
The system SHALL describe the pending countdown as a number of brand-new
cards minted into that deck, matching the implemented decrement, and SHALL
make available the fact that several tiers can drain in one publish.

#### Scenario: Reading what a pending tier waits for
- **WHEN** the operator inspects what a pending occurrence is waiting for
- **THEN** the quantity is expressed as new cards into that deck, not as
  occurrences and not as batches

### Requirement: Hovering an occurrence reports what this publish changes about its card
The system SHALL show, on hover, the occurrence's strip index, card id and
letter, together with what this publish does to its card's content: which
faces are rewritten, or that nothing changes, or that the card is new, or
that the cell holds no card. The system SHALL simultaneously highlight the
same card's other occurrence wherever it sits in the strip.

#### Scenario: Hovering a shipped occurrence whose card's content changes
- **WHEN** the operator hovers a shipped occurrence belonging to a card whose
  projection differs from its stored content in some faces but not others
- **THEN** the changed faces are named specifically, rather than the card
  being reported as merely "changed"

#### Scenario: Hovering an occurrence whose card has a second occurrence
- **WHEN** the operator hovers an occurrence of a card that has another
  occurrence anywhere in the same strip
- **THEN** that other occurrence becomes visually distinguishable while the
  hover lasts

#### Scenario: Hovering a cell that holds no card
- **WHEN** the operator hovers an open or distance-filler cell
- **THEN** the readout says the slot holds no card, rather than reporting a
  card id or a change state

### Requirement: Clicking an occurrence opens a detail view that keeps the strip visible
The system SHALL open, on click, a detail view carrying the occurrence's full
state — its shipping build and timestamp where it has shipped, its
flush-or-hold outcome where it is staged, its remaining countdown where it is
pending, and its sibling occurrence's position — together with a rendering of
the card through the card-preview capability. The strip SHALL remain visible
while the detail view is open.

#### Scenario: Inspecting a shipped occurrence
- **WHEN** the operator clicks a shipped occurrence
- **THEN** the detail view names the build that shipped it and when, and the
  strip is still visible alongside

#### Scenario: Inspecting an occurrence whose card is being rewritten
- **WHEN** the operator clicks an occurrence whose card's content this
  publish rewrites
- **THEN** the detail view states that the rendered card shows the new
  content rather than what is currently installed on the device

### Requirement: Totals use one order and one vocabulary everywhere, with this run's deltas
The system SHALL present cards minted, eventual occurrences, shipped, staged
and pending in that same order, with the same labels and icons, both in the
page's global totals and in every deck's own header, each accompanied by this
run's delta. A zero delta SHALL be rendered as absence rather than as an
explicit zero.

#### Scenario: A deck where nothing moves this run
- **WHEN** a deck has no newly eligible cards and nothing would flush
- **THEN** its header shows its absolute figures in the same five positions
  with no delta annotations
