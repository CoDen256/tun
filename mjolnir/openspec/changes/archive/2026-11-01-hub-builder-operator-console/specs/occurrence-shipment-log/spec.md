## ADDED Requirements

### Requirement: Every shipped occurrence is recorded at the moment it ships
The system SHALL record a `(card_id, letter, build_id, shipped_at)` row the
moment an occurrence actually ships — whether as an immediate occurrence at
mint time or as a drained occurrence from the pending queue — and SHALL NOT
rely on any other table to answer "which build shipped this side" after the
fact.

#### Scenario: A newly minted card's immediate occurrence
- **WHEN** a card is minted and its `A` occurrence is appended immediately
- **THEN** a shipment row is recorded for `(card, "A", that run's build_id)`

#### Scenario: A queued occurrence drains
- **WHEN** a pending occurrence's `remaining` reaches `0` and it is appended
  to the deck's `Cards[]`
- **THEN** a shipment row is recorded for `(card, letter, the draining run's
  build_id)`, even though the card may have been minted in a much earlier
  build

### Requirement: Shipment rows are only ever written for a run that actually published
The system SHALL NOT write a shipment row naming a build that did not
successfully publish.

#### Scenario: A run fails after minting but before publishing
- **WHEN** a run mints cards and computes their occurrences, then fails
  before the bundle is successfully published
- **THEN** no shipment row exists naming that run's build id

### Requirement: A card's occurrences may be recorded under different builds
The system SHALL NOT assume or enforce that a single card's occurrences all
belong to the same build.

#### Scenario: A word card's two sides ship in different builds
- **WHEN** a card's `A` ships at mint time in build X and its `E` drains in
  a later build Y
- **THEN** the shipment log holds one row for `(card, "A", X)` and a separate
  row for `(card, "E", Y)`, both independently queryable
