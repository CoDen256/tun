## ADDED Requirements

### Requirement: A past batch's contents are reconstructable at occurrence granularity
The system SHALL show, for any previously published build, the exact set of
`(card, side, note)` occurrences it shipped — not a card count, and not an
assumption that a card's sides shipped together.

#### Scenario: Viewing a past batch with mixed new mints and drained queue entries
- **WHEN** the operator opens a past build that both minted new cards and
  drained some older cards' queued occurrences
- **THEN** both kinds of shipped occurrence appear in that batch's contents,
  each correctly attributed to the build that actually shipped it

### Requirement: The next batch's preview distinguishes what ships now from what only queues
The system SHALL show, for the forecast, two distinct lists: occurrences that
would ship in the next run, and occurrences that would be newly queued by
that run (and therefore ship in some future run, not this one).

#### Scenario: Previewing a run that mints new word cards
- **WHEN** the forecast includes newly-eligible word-type notes
- **THEN** their `A` occurrences appear in the "would ship" list and their
  `E` occurrences appear in the "newly queued" list, not both in the same
  list
