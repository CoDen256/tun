## MODIFIED Requirements

### Requirement: The forecast reflects the same logic as a real run, without minting
The system SHALL expose a dry-run view that executes the same pull,
eligibility, and deck-assignment logic as a real publish, reporting per-deck
newly-eligible counts and each deck's current pending-occurrence queue depth
for **every deck with a nonzero queue depth, not only decks with newly-
eligible notes this run** (no floor to report crossing/not-crossing — D91),
and SHALL additionally report which already-minted cards would have their
content changed by the next publish, while performing no writes to
`card_slots`, `decks`, `Cards[]`, `pending_occurrences`, or any card content.

#### Scenario: Forecast after a real publish
- **WHEN** the operator views the forecast immediately after a run that
  published everything currently eligible
- **THEN** every deck shows 0 newly-eligible notes, matching the real run's
  outcome

#### Scenario: Forecast does not mutate state
- **WHEN** the operator views the forecast any number of times
- **THEN** no `card_slots` row, `publications` row, or bundle file is created
  as a result

#### Scenario: A deck's pending queue depth is shown even with zero newly-eligible notes today
- **WHEN** a deck has one or more rows in `pending_occurrences` but zero
  newly-eligible notes in the current forecast
- **THEN** that deck still appears in the forecast's per-deck report, with its
  real, current pending-occurrence queue depth — not omitted

#### Scenario: The forecast predicts which existing cards' content would change
- **WHEN** an already-minted note's content (or the projection logic itself)
  has changed since that card's content was last stored
- **THEN** the forecast reports that card's id among the cards whose content
  would be updated by the next publish, distinct from newly-minted cards

#### Scenario: The forecast reports no content changes when nothing changed
- **WHEN** no already-minted note's content differs from what's currently
  projected for it
- **THEN** the forecast's would-update list is empty

### Requirement: Every publish regenerates all existing minted cards' content
The system SHALL regenerate the `N`/`E`/`X`/`A` content of every
previously-minted card from stabbur's current note state on every publish
that runs, not only for newly-minted cards, while never altering an existing
card's id, deck assignment, or `Cards[]` position, and SHALL record which of
those existing cards' content actually changed as a result.

#### Scenario: A note is edited after being minted
- **WHEN** a note whose card was minted in an earlier publish is edited on
  stabbur before the next publish
- **THEN** the next publish's bundle reflects the edited content for that
  card's existing id, with its `Cards[]` position and `card_slots` row
  unchanged

#### Scenario: A publish records which existing cards' content changed
- **WHEN** a publish regenerates content for previously-minted cards and one
  or more of them differ from their previously-stored content
- **THEN** that run's log records which card ids actually changed, distinct
  from cards whose regenerated content was identical to what was already
  stored
