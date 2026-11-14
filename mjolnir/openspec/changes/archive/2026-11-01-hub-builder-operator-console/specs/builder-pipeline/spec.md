## MODIFIED Requirements

### Requirement: The forecast reflects the same logic as a real run, without minting
The system SHALL expose a dry-run view that executes the same pull,
eligibility, and deck-assignment logic as a real publish, reporting the
actual `(card, side, note)` occurrences that would ship and the occurrences
that would be newly queued (ships in a later run, not this one) — not a
per-deck count — while performing no writes to `card_slots`, `decks`,
`Cards[]`, `pending_occurrences`, `occurrence_shipments`, or any card
content.

#### Scenario: Forecast after a real publish
- **WHEN** the operator views the forecast immediately after a run that
  published everything currently eligible
- **THEN** no occurrences appear in the "would ship" list, matching the real
  run's outcome

#### Scenario: Forecast distinguishes shipping from queuing
- **WHEN** the forecast includes a newly-eligible word-type note
- **THEN** its `A` occurrence appears in the "would ship" list and its `E`
  occurrence appears separately in the "would queue" list
