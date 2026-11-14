## MODIFIED Requirements

### Requirement: A deck with zero remaining card references can be removed
The system SHALL remove a deck's entry from the decks array only after
confirming BOTH that the deck is marked `managed_by_hub` (hub has a
positive record of having minted into it) AND that zero `card_slots` rows
reference it, and SHALL refuse to remove a deck that either still has any
card referencing it, or that is not marked `managed_by_hub` — regardless
of how many `card_slots` rows reference it.

#### Scenario: Removing a deck with no remaining cards
- **WHEN** a deck is marked `managed_by_hub` and has had every one of its
  cards migrated elsewhere (zero `card_slots` rows reference its code)
- **THEN** its entry is removed from the decks array and its `decks` table
  row is deleted

#### Scenario: Refusing to remove a deck still in use
- **WHEN** removal is attempted on a deck that still has at least one
  `card_slots` row referencing it
- **THEN** the removal is refused with a clear error, and the deck entry
  is left untouched

#### Scenario: Refusing to remove a deck hub never minted into
- **WHEN** removal is attempted on a deck code with zero `card_slots`
  rows, but that deck is not marked `managed_by_hub` (e.g. a stock deck
  baked into the original bundle, which hub has never minted into)
- **THEN** the removal is refused — zero `card_slots` rows alone is never
  sufficient grounds to remove a deck hub does not own

### Requirement: Removal preserves same-category contiguity for remaining decks
The system SHALL NOT reorder the remaining decks in the decks array as a
side effect of removing one — every deck sharing a category prefix with
the removed deck SHALL remain part of one contiguous block afterward.

#### Scenario: Removing a deck from the middle of a category block
- **WHEN** a "C"-prefixed deck is removed and other "C"-prefixed decks
  exist before and after it in the array
- **THEN** every remaining "C"-prefixed deck still forms one contiguous
  block, with no non-"C" deck now sitting between two "C" decks that
  weren't already adjacent before the removal
