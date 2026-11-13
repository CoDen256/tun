## ADDED Requirements

### Requirement: Only audio-bearing ready notes are eligible
The system SHALL exclude any note lacking an `audio_blob` from eligibility,
regardless of its `type`, with no exception for any note type.

#### Scenario: A ready note with no audio
- **WHEN** builder pulls notes from stabbur and a returned note has
  `status=ready` but no `audio_blob`
- **THEN** that note is excluded from the current run and reconsidered on the
  next run

### Requirement: Deck assignment by type, then by PoS, with a catch-all
The system SHALL assign each eligible `type=word` note to a deck based on its
`pos` using the fixed substantiv/adjektiv/verb/adverb/preposisjon/
konjunksjon-subjunksjon mapping, SHALL assign every other type to its fixed
deck, and SHALL assign any note whose `pos` does not match the word-deck
mapping to the `expression` deck (C26), regardless of its `type`.

#### Scenario: A word note with an unmapped PoS
- **WHEN** an eligible `type=word` note's `pos` is not substantiv, adjektiv,
  verb, adverb, preposisjon, or konjunksjon/subjunksjon
- **THEN** it is assigned to the expression deck (C26) rather than left
  unassigned

### Requirement: Every deck with at least one newly-eligible note mints and publishes that run
The system SHALL NOT withhold minting or publishing a newly-eligible note
based on how many other notes are newly-eligible in the same deck —
**superseded by D91** (operator decision, 2026-10-25): the original 6-note
floor is removed entirely. A card's first occurrence (`A`, or a
single-occurrence type's own letter) ships the run it is minted; any
remaining occurrence for a multi-occurrence type is queued in a persisted,
cross-batch table and drained once 11 other occurrences have landed in that
deck, across however many subsequent publishes that takes (see
`tun/docs/03-data-model.md`'s "Appending new cards to an existing deck").

#### Scenario: A deck with 1 newly-eligible note
- **WHEN** a run finds exactly 1 unminted, eligible note assigned to a deck
- **THEN** it is minted and its first occurrence is published this run, with
  no minimum batch size required

#### Scenario: A multi-occurrence card's second occurrence is queued, not dropped
- **WHEN** a word/expression note is minted and its card's occurrence set is
  `{A, E}`
- **THEN** `A` is appended to the deck's `Cards[]` this run, and `E` is
  queued at `remaining = 11` rather than appended immediately

#### Scenario: A queued occurrence drains once enough new occurrences land
- **WHEN** a deck's cumulative count of newly-appended occurrences since a
  pending row was queued reaches 11
- **THEN** that row's occurrence is appended to the deck's `Cards[]` and the
  row is removed

#### Scenario: A deck with no new cards in a run leaves its queue untouched
- **WHEN** a run mints no new cards for a given deck
- **THEN** that deck's pending occurrence rows are not decremented this run

### Requirement: Every publish regenerates all existing minted cards' content
The system SHALL regenerate the `N`/`E`/`X`/`A` content of every
previously-minted card from stabbur's current note state on every publish
that runs, not only for newly-minted cards, while never altering an existing
card's id, deck assignment, or `Cards[]` position.

#### Scenario: A note is edited after being minted
- **WHEN** a note whose card was minted in an earlier publish is edited on
  stabbur before the next publish
- **THEN** the next publish's bundle reflects the edited content for that
  card's existing id, with its `Cards[]` position and `card_slots` row
  unchanged

### Requirement: Projection from note type to card shape is pure and stateless
The system SHALL derive a card's `{N, E, X, A}` fields and its occurrence set
solely from the note's `type` (and its content), computing this fresh on
every run rather than reading a stored projection.

#### Scenario: Re-running projection on unchanged input
- **WHEN** the same note is projected twice with no change to its content or
  type
- **THEN** both projections produce identical `{N, E, X, A}` output

### Requirement: Publishing triggers on a schedule and on demand
The system SHALL run the full pipeline automatically on a recurring schedule,
and SHALL additionally run it immediately on an explicit operator request,
with both paths subject to the same eligibility rules (no floor — D91).

#### Scenario: Scheduled run with no eligible notes anywhere
- **WHEN** the scheduled run executes and no deck has any newly-eligible note
- **THEN** no build_jobs row is created and no publish occurs

#### Scenario: Operator requests an immediate publish
- **WHEN** the operator triggers a publish from the UI
- **THEN** the pipeline runs immediately, independent of the schedule

### Requirement: The forecast reflects the same logic as a real run, without minting
The system SHALL expose a dry-run view that executes the same pull,
eligibility, and deck-assignment logic as a real publish, reporting per-deck
newly-eligible counts and each deck's current pending-occurrence queue depth
(no floor to report crossing/not-crossing — D91), while performing no writes
to `card_slots`, `decks`, `Cards[]`, `pending_occurrences`, or any card
content.

#### Scenario: Forecast after a real publish
- **WHEN** the operator views the forecast immediately after a run that
  published everything currently eligible
- **THEN** every deck shows 0 newly-eligible notes, matching the real run's
  outcome

#### Scenario: Forecast does not mutate state
- **WHEN** the operator views the forecast any number of times
- **THEN** no `card_slots` row, `publications` row, or bundle file is created
  as a result
