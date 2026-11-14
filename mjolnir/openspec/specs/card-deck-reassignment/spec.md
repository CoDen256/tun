# card-deck-reassignment

## Purpose

Defines the reassignment operation that moves cards from one deck to
another in the bundle tool's database, including the safety precondition
that gates it, the id allocation rule for reassigned cards, and the
atomicity guarantee covering every referencing table. (TBD: expand with
broader context on when/why reassignment is used as the capability grows.)

## Requirements

### Requirement: A card can be reassigned to a different deck only when no device has ever studied its source deck
The system SHALL provide a reassignment operation that moves one or more
`card_slots` rows (and every row that references them — `card_content`,
`minted_notes`, `pending_occurrences`, `staged_occurrences`,
`occurrence_shipments`) from a source deck to a destination deck, and SHALL
refuse to run if any device's synced `userdata` shows evidence that the
source deck has ever been pulled — a `decksStatus` entry with
`PullCounter > 0` for that deck, or any card id with the source deck's code
prefix present in that device's `totalCards`.

#### Scenario: Source deck has never been pulled by any device
- **WHEN** the reassignment operation is run for cards in a source deck that
  appears in zero devices' `decksStatus` and zero devices' `totalCards`
- **THEN** the reassignment proceeds

#### Scenario: Source deck has been pulled by at least one device
- **WHEN** the reassignment operation is run for cards in a source deck that
  appears in at least one device's `decksStatus` with `PullCounter > 0`, or
  whose code prefixes at least one id in some device's `totalCards`
- **THEN** the operation refuses to run and makes no changes, reporting
  which device/evidence blocked it

#### Scenario: No bypass exists
- **WHEN** the precondition check fails
- **THEN** there is no flag, option, or code path that forces the
  reassignment to proceed anyway

### Requirement: A reassigned card receives a fresh id under the destination deck's normal allocation
The system SHALL assign a reassigned card a new id using the destination
deck's standard next-`card_no` allocation, identical to how a freshly-minted
card in that deck would be numbered — SHALL NOT preserve any part of the
old id or introduce a separate id scheme for reassigned cards.

#### Scenario: Destination deck has existing cards
- **WHEN** a card is reassigned into a destination deck whose highest
  existing `card_no` is N
- **THEN** the reassigned card receives `card_no` N+1, exactly as a new
  mint would

### Requirement: Reassignment is atomic and repoints every referencing table
The system SHALL perform a reassignment's `card_slots` move and every
referencing-table repoint (`card_content`, `minted_notes`,
`pending_occurrences`, `staged_occurrences`, `occurrence_shipments`) within
a single transaction — SHALL NOT leave any referencing row pointing at an id
that no longer exists in `card_slots`.

#### Scenario: A reassigned card has existing shipped occurrences
- **WHEN** a card being reassigned has rows in `occurrence_shipments` under
  its old id
- **THEN** those rows are repointed to the new id in the same transaction
  that creates the new `card_slots` row and removes the old one

#### Scenario: A failure partway through
- **WHEN** any step of the reassignment fails after some but not all
  referencing tables have been repointed
- **THEN** the entire operation rolls back, leaving every table exactly as
  it was before the operation started
