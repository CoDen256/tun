## MODIFIED Requirements

### Requirement: Every publish regenerates all existing minted cards' content
The system SHALL regenerate the `N`/`E`/`X`/`A` content of every
previously-minted card from stabbur's current note state on every publish
that runs, not only for newly-minted cards, while never altering an existing
card's id, deck assignment, or `Cards[]` position, and SHALL persist each
regenerated card's content into `card_content` so it survives independently
of any bundle file.

#### Scenario: A note is edited after being minted
- **WHEN** a note whose card was minted in an earlier publish is edited on
  stabbur before the next publish
- **THEN** the next publish's bundle reflects the edited content for that
  card's existing id, with its `Cards[]` position and `card_slots` row
  unchanged, and `card_content` for that card is overwritten with the new
  content

#### Scenario: A note is tombstoned after being minted
- **WHEN** a note whose card was minted in an earlier publish is later
  tombstoned on stabbur (excluded from every future pull)
- **THEN** the next publish's bundle still includes that card with its last
  known content, read from `card_content`, not blank or missing

## ADDED Requirements

### Requirement: The pipeline is a stateless projection onto the active logic bundle
The system SHALL NOT depend on any single persistent, incrementally-mutated
bundle file to carry forward deck/card state between publishes. Every
publish run SHALL start from the currently-active `logic_bundles` entry and
fully reconstruct the deck/card data from `card_slots`, `card_content`,
`occurrence_shipments`, and `pending_occurrences`, before minting or
appending anything newly eligible.

#### Scenario: The active logic bundle changes between two publishes
- **WHEN** an operator activates a different `logic_bundles` row between one
  publish and the next
- **THEN** the next publish builds its deck/card data onto the newly-active
  bundle, with every previously-minted card's content and occurrence order
  reconstructed from `hub`'s own tables, not read from any file left behind
  by the previous publish

#### Scenario: Occurrence order is reconstructed, not read from a file
- **WHEN** a publish run reconstructs a deck's `Cards[]` array
- **THEN** the order matches `occurrence_shipments` ordered by id for that
  deck, exactly as it was when each occurrence actually shipped
