## ADDED Requirements

### Requirement: The forecast reports each deck's absolute lifetime totals alongside this-run deltas
The system SHALL report, for every deck in the forecast's per-deck list,
absolute lifetime totals — cards minted, occurrences eventual, occurrences
shipped, occurrences currently staged, occurrences currently pending — in
addition to (not instead of) the existing this-run-scoped fields
(`newlyEligibleCount`, `wouldFlushCount`, `wouldHoldCount`,
`pendingQueueDepth`). "Occurrences eventual" SHALL be derived from each
deck's content-type occurrence shape (one occurrence per card for
single-occurrence types; two per card for two-occurrence types), not stored
separately.

#### Scenario: A deck with prior history and no activity this run
- **WHEN** the operator views the forecast for a deck that minted no new
  cards this run but has previously shipped and staged occurrences
- **THEN** that deck's absolute totals (cards minted, shipped, staged,
  pending) are still reported, not omitted because this run's deltas are
  all zero

#### Scenario: A brand-new deck with its first run
- **WHEN** a deck mints its very first card during the current run
- **THEN** its absolute totals reflect that first card (1 minted, 1 or 2
  occurrences eventual depending on type) rather than reading as empty

### Requirement: Pending occurrences are reported grouped by drain tier, not only as a flat count
The system SHALL report, for every deck with pending occurrences, the
breakdown of those occurrences by their current `remaining` value (how many
more new cards must land, deck-wide, before that group drains), including
each group's card list — not only the flat depth and single
oldest-`remaining` value the forecast currently exposes.

#### Scenario: Multiple pending occurrences share the same remaining count
- **WHEN** a deck has several pending occurrences that all currently have
  `remaining = 7`
- **THEN** they are reported as one group of 7-away occurrences (with their
  card ids), not as individual unrelated entries

#### Scenario: Pending occurrences span several distinct remaining counts
- **WHEN** a deck's pending occurrences have `remaining` values of 1, 2, and
  11
- **THEN** three separate groups are reported, ordered by ascending
  `remaining`, each listing only the occurrences at that exact value
