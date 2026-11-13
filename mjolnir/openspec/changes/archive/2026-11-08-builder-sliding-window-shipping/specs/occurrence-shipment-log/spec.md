## MODIFIED Requirements

### Requirement: Every shipped occurrence is recorded at the moment it ships
The system SHALL record a `(card_id, letter, build_id, shipped_at)` row the
moment an occurrence actually ships — meaning the moment it is flushed
from the staging buffer and appended to the deck's `Cards[]`, not the
moment it first becomes eligible to ship (mint time for an immediate
occurrence, or drain time for a queued one) — and SHALL NOT rely on any
other table to answer "which build shipped this side" after the fact.

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
- **WHEN** a pending occurrence's `remaining` reaches `0`, is staged, and
  is later flushed (possibly in the same run, possibly a later one)
- **THEN** a shipment row is recorded for `(card, letter, the flushing
  run's build_id)` — not the run that drained it, if those differ
