# card-flow-view

## Purpose

TBD — defines the deck ship-order reconstruction view: the shipped, staged,
open, and pending zones that let an operator see a deck's real occurrence
history and drain mechanics at a glance.

## Requirements

### Requirement: A deck's real ship order is reconstructable as shipped, staged, open, and pending zones
The system SHALL expose, per deck, the real sequence of occurrences in the
order they shipped (from `occurrence_shipments`, ordered by id) followed by
the order they are currently staged (from `staged_occurrences`, ordered by
id), followed by a computed "open" count — the occurrences still needed,
beyond what's currently staged, to reach the deck's next multiple of 5 —
followed by the deck's pending occurrences grouped by drain tier. Each
occurrence in the shipped and staged zones SHALL include its card id, side
letter, and source note text where resolvable.

#### Scenario: A deck exactly on the 5-grid with a partial next batch staged
- **WHEN** a deck has shipped a multiple of 5 and has 1-4 occurrences
  currently staged
- **THEN** the open count is `5 - (staged count)`, reported alongside the
  shipped and staged zones

#### Scenario: A deck with no staged occurrences at all
- **WHEN** a deck's staged occurrence count is zero and its shipped count is
  already a multiple of 5
- **THEN** the open count is 0 and no staged zone entries are reported

#### Scenario: Note text is unresolvable for a card
- **WHEN** a shipped or staged occurrence's card has no resolvable source
  note text (e.g. a hand-created card with no backing note)
- **THEN** that occurrence is still included in its zone, reporting its card
  id and side letter without note text, rather than being omitted or
  erroring

### Requirement: The view distinguishes "staged" from "pending" as separate, consistently-labeled concepts
The system SHALL label occurrences held in `staged_occurrences` as
**Staged** and occurrences held in `pending_occurrences` as **Pending**
everywhere in the card-flow view, and SHALL NOT use a combined or ambiguous
term (e.g. "queue depth") for either.

#### Scenario: A deck has both staged and pending occurrences
- **WHEN** a deck has occurrences in both `staged_occurrences` and
  `pending_occurrences`
- **THEN** the view presents them as two distinctly labeled zones ("Staged"
  and "Pending"), never merged under one label or count

### Requirement: Pending occurrences are presented with their real drain mechanic, not implied as a fixed-schedule queue
The system SHALL present pending occurrences grouped by their current
`remaining` value and SHALL include an explanation that all pending rows in
a deck decrement together by that run's count of newly-minted cards, with
whichever rows cross zero draining together in the same run — SHALL NOT
present pending occurrences as draining one at a time in a fixed linear
order.

#### Scenario: Several pending occurrences are close to draining
- **WHEN** one deck has pending occurrences at `remaining` values 1, 2, and
  2
- **THEN** the view's explanatory copy makes clear that a single new card
  landing in that deck could drain more than one of these in the same run,
  not strictly one per run

### Requirement: A deck's grid status reflects whether its shipped total sits on the 5-grid
The system SHALL report each deck's grid status as **On grid** when its
shipped occurrence count is a multiple of 5, and **Stalled**, with how long
it has been off-grid, when it is not.

#### Scenario: A deck shipped a non-multiple-of-5 total before the flush gate existed
- **WHEN** a deck's shipped occurrence count is not a multiple of 5
- **THEN** its grid status is reported as Stalled, including the elapsed
  time since its last shipment

#### Scenario: A deck whose shipped total is currently a multiple of 5
- **WHEN** a deck's shipped occurrence count is an exact multiple of 5
- **THEN** its grid status is reported as On grid, regardless of how many
  occurrences it currently has staged or pending
