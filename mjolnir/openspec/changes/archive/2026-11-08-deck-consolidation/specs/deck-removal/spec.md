## ADDED Requirements

### Requirement: A deck with zero remaining card references can be removed
The system SHALL remove a deck's entry from the decks array only after
confirming zero `card_slots` rows reference it, and SHALL refuse to remove
a deck that still has any card referencing it.

#### Scenario: Removing a deck with no remaining cards
- **WHEN** a deck has had every one of its cards migrated elsewhere (zero
  `card_slots` rows reference its code)
- **THEN** its entry is removed from the decks array and its `decks` table
  row is deleted

#### Scenario: Refusing to remove a deck still in use
- **WHEN** removal is attempted on a deck that still has at least one
  `card_slots` row referencing it
- **THEN** the removal is refused with a clear error, and the deck entry
  is left untouched

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
