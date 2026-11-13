# inject-deck

## Purpose

Defines how builder creates new cards and upserts existing card content into
the deck/card bundle model, including interleaving new occurrences at
minimum lag 11, reusing the existing module-location and save path rather
than reimplementing bundle reassembly.

## Requirements

### Requirement: New cards are created with externally-supplied ids
The system SHALL accept a card id as a caller-supplied value when creating a
new card, and SHALL NOT derive or generate a card id by scanning the bundle's
existing cards.

#### Scenario: Creating a card with a hub-minted id
- **WHEN** `createCard` is called with an id already minted into
  `card_slots` by `hub`
- **THEN** the new card object is added to the card-content array with
  exactly that id, unmodified

### Requirement: Multiple new occurrences interleave at minimum lag 11
The system SHALL compute an insertion order for a batch of new cards'
occurrences such that, within the resulting `Cards[]` block, each card's own
occurrences are separated by at least 11 entries, and SHALL append them to
the deck's `Cards[]` in that order using the existing single-occurrence
append primitive.

#### Scenario: A block of 6 two-occurrence cards
- **WHEN** 6 new cards are interleaved, each needing one `N` and one `E`
  occurrence
- **THEN** the appended block of 12 entries places each card's `N` and `E`
  at least 11 positions apart from each other

#### Scenario: A block too small to achieve full separation
- **WHEN** fewer cards are interleaved than the lag-11 rule can fully satisfy
  for the requested occurrence shape
- **THEN** the system still appends every occurrence, achieving the maximum
  separation the block size allows, and never fails outright

### Requirement: Existing card content is upserted by id, not recreated
The system SHALL locate an existing card by its id and overwrite only its
content fields (`N`, `E`, `X`, `A`), leaving `DECK_ID`, the id itself, and
every `Cards[]` entry referencing it untouched.

#### Scenario: Regenerating a previously-minted card's content
- **WHEN** `upsertCardContent` is called with an id that already exists in
  the card-content array
- **THEN** that card's `N`/`E`/`X`/`A` fields are overwritten with the given
  values, and no other card, no deck's `Cards[]`, and no `card_slots`
  assignment changes

#### Scenario: The id does not exist
- **WHEN** `upsertCardContent` is called with an id not present in the
  card-content array
- **THEN** the system raises an error rather than silently creating a new
  card or silently doing nothing

### Requirement: Reuses the existing module-location and save path
The system SHALL perform all deck/card mutations against the in-memory model
returned by the existing `loadDeckCardModel`, and SHALL persist changes via
the existing `saveDeckCardModel`, without reimplementing module location or
bundle reassembly.

#### Scenario: Saving a batch of new and updated cards
- **WHEN** a publish run has created new cards, interleaved their
  occurrences, and upserted existing cards' content
- **THEN** calling the existing save path reassembles the bundle with every
  other module byte-identical to before, exactly as it does for the manual
  editor
