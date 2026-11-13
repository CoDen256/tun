# occurrence-shipment-log

## Purpose

Defines the authoritative record of which build shipped each `(card, side)`
occurrence, written at the moment an occurrence actually ships, so "which
build shipped this side" never depends on inference from any other table.

## Requirements

### Requirement: Every shipped occurrence is recorded at the moment it ships
The system SHALL record a `(card_id, letter, build_id, shipped_at)` row the
moment an occurrence actually ships — meaning the moment it is flushed from
the staging buffer and appended to the deck's `Cards[]` (builder-sliding-
window-shipping), not the moment it first becomes eligible to ship (mint
time for an immediate occurrence, or drain time for a queued one) — and
SHALL NOT rely on any other table to answer "which build shipped this side"
after the fact.

#### Scenario: A newly minted card's immediate occurrence, flushed the same run
- **WHEN** a card is minted, its immediate occurrence (e.g. `A`) is staged,
  and that same run's flush ships it (the deck's staged count reached a
  multiple of 5)
- **THEN** a shipment row is recorded for `(card, "A", that run's build_id)`

#### Scenario: A newly minted card's immediate occurrence, not yet flushed
- **WHEN** a card is minted and its immediate occurrence is staged, but the
  deck's staged count does not reach a multiple of 5 this run
- **THEN** no shipment row is recorded yet for that occurrence — it ships
  (and gets recorded) in whichever future run's flush actually appends it

#### Scenario: A queued occurrence drains and is later flushed
- **WHEN** a pending occurrence's `remaining` reaches `0`, is staged, and is
  later flushed (possibly in the same run, possibly a later one)
- **THEN** a shipment row is recorded for `(card, letter, the flushing run's
  build_id)` — not the run that drained it, if those differ, and even
  though the card may have been minted in a much earlier build

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
- **WHEN** a card's `A` flushes in build X and its `E` drains and later
  flushes in a different build Y
- **THEN** the shipment log holds one row for `(card, "A", X)` and a separate
  row for `(card, "E", Y)`, both independently queryable
