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
