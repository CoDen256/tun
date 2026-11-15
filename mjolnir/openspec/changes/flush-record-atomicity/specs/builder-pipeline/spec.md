## MODIFIED Requirements

### Requirement: A failed publish consumes no occurrences
`runPublish` SHALL NOT delete a `staged_occurrences` or
`pending_occurrences` row unless the occurrence that row represents is
durably recorded in `occurrence_shipments` by the same run. A run that
fails at any point SHALL leave both tables exactly as it found them.

This extends D-H1's existing one-directional guarantee ("a run that fails
anywhere above this line leaves zero shipment rows") to cover the opposite
direction. Today `flushShippable` deletes the staged rows it returns and
`drainPendingOccurrences` deletes the queue rows that reached
`remaining <= 0`, both from inside `flushDeck` — which runs before
`publish()`, `writePublication` and `recordShipments`, with no transaction
spanning them. Since `replay()` reconstructs every deck's `Cards[]` purely
from `occurrence_shipments`, an occurrence deleted but never recorded is
unrecoverable: the only other copy lived in the in-memory model that
`runPublish`'s `finally` discards.

The D86 self-heal path masks most of this (a card absent from the bundle
gets its occurrences re-staged from scratch) but SHALL NOT be relied on as
the recovery mechanism: it only triggers for cards missing from the rebuilt
model, so any card that already has a shipped occurrence is recreated by
`replay`, seen as present, and never re-staged. Occurrences lost for such a
card are lost permanently.

#### Scenario: a run that dies after the flush loses nothing
- **GIVEN** a deck whose staged occurrences have just been flushed into the
  in-memory model by `flushDeck`
- **AND** the card owning one of those occurrences already has an earlier
  occurrence in `occurrence_shipments`
- **WHEN** the run fails before `recordShipments` (for any reason — a
  throwing `ensureBlobsPresent`, a failed `publish()`, or the process being
  killed outright)
- **THEN** that occurrence SHALL still be present in `staged_occurrences`
  (or `pending_occurrences`, per where it was before the run)
- **AND** a subsequent successful publish SHALL ship it
- **AND** no manual database repair SHALL be required

#### Scenario: a queued occurrence whose countdown drained is not lost
- **GIVEN** a `pending_occurrences` row that reaches `remaining <= 0` during
  a run and is therefore staged by `drainPendingOccurrences`
- **WHEN** the run fails before `recordShipments`
- **THEN** that row SHALL still be queued at its pre-run `remaining` value,
  so the next run drains it again rather than dropping the occurrence

#### Scenario: a crash between record and publish loses nothing and reuses no id
- **GIVEN** a run whose consumption transaction has committed (publication
  row, shipment rows, deletes) but whose `publish()` never ran
- **WHEN** the next publish runs
- **THEN** it SHALL use a fresh buildId (never the committed one with
  different bytes), and its bundle SHALL contain every occurrence the
  committed shipment rows recorded, because `replay` rebuilds from
  `occurrence_shipments`

## ADDED Requirements

### Requirement: An occurrence ships exactly once, A before E
The pipeline SHALL enforce uniqueness of `(card_id, letter)` across each of
`staged_occurrences`, `pending_occurrences` and `occurrence_shipments` with
database constraints, and the D86 recovery path SHALL drain the pending
queue at most once per deck per run, after that deck's recovered `A`
occurrences are staged.

#### Scenario: mass recovery into a deck with a non-empty queue
- **GIVEN** a deck recovering many cards via D86 while `pending_occurrences`
  holds queued `E` rows
- **WHEN** the run completes
- **THEN** no `(card_id, letter)` SHALL appear twice in
  `occurrence_shipments` or `staged_occurrences`
- **AND** no already-drained `E` SHALL be re-queued
- **AND** for every recovered card with both letters, its `A` SHALL precede
  its `E` in shipment order

### Requirement: Occurrence-ledger integrity is operator-visible
The console SHALL surface an integrity check: every owed occurrence of every
minted card exists in exactly one of shipped/staged/pending, with no
duplicate `(card, letter)` and no shipped `E` whose own `A` is unshipped. A
banner listing offending card ids SHALL render when and only when anomalies
exist.

#### Scenario: a duplicate row becomes visible
- **GIVEN** a duplicate staged row inserted directly via SQL
- **WHEN** the operator opens the builder page
- **THEN** an integrity banner SHALL name that card id
- **AND** removing the row SHALL make the banner disappear on reload
