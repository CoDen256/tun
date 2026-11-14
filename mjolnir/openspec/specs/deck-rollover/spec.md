# deck-rollover

## Purpose

A deck family's automatic overflow to the next code in its sequence once
the currently-active deck hits its 999-card capacity. A deck's card id is
`<deckCode><3-digit card_no>` — exactly 6 characters — which caps any
single deck at 999 cards; rollover is the mechanism that lets a family
keep minting past that cap by moving on to its next configured code.

## Requirements

### Requirement: A family mints into its currently-active code, resolved by capacity
The system SHALL resolve, for each deck family, which of its configured
codes is currently active (the first one whose minted card count is below
999) before minting any note assigned to that family, and SHALL mint into
that code.

#### Scenario: A family's starting code has room
- **WHEN** a family's first configured code has fewer than 999 minted cards
- **THEN** every note assigned to that family mints into that code

#### Scenario: A family's starting code is full
- **WHEN** a family's first configured code has exactly 999 minted cards
- **THEN** notes assigned to that family mint into the family's next
  configured code instead, not the full one

### Requirement: A rollover deck is created on first use, with a derived title and no description
The system SHALL create a new `decks` row for a family's overflow code the
first time it becomes active, with a title derived from the family's base
title and its position in the sequence (e.g. `"Lexic II"` for the second
code), and an empty description.

#### Scenario: A family rolls over for the first time
- **WHEN** a family's first code fills and its second configured code is
  used for the first time
- **THEN** a `decks` row for that second code is created automatically,
  titled `"<family title> II"`, with an empty description

### Requirement: A family that exhausts every configured code fails loudly
The system SHALL raise a clear, named error — not mint into an over-capacity
deck and not silently drop the note — when every code configured for a
family has reached 999 cards.

#### Scenario: Every configured code is full
- **WHEN** a note is assigned to a family whose every configured code
  already has 999 minted cards
- **THEN** the run fails with an error naming the exhausted family, rather
  than minting past the 999 cap or silently skipping the note
