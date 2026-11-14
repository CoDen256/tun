## ADDED Requirements

### Requirement: Occurrences eligible to ship are staged, not shipped immediately
The system SHALL hold any occurrence that becomes eligible to ship (a
fresh immediate occurrence from a newly-minted card, or a queued
occurrence whose cross-batch countdown just reached zero) in a persistent
per-deck staging buffer, rather than appending it to the deck's `Cards[]`
immediately.

#### Scenario: A freshly minted card's immediate occurrence
- **WHEN** a card is minted and its immediate occurrence (e.g. `A`) is
  ready
- **THEN** it is added to that deck's staging buffer, not appended to
  `Cards[]` in the same step

#### Scenario: A queued occurrence's countdown reaches zero
- **WHEN** a pending occurrence (D91's existing queue) drains
- **THEN** it is added to the staging buffer, not appended to `Cards[]`
  directly

### Requirement: A deck only ever ships the largest multiple of 5 it has staged
The system SHALL, once per deck per publish run, flush exactly
`floor(staged_count / 5) * 5` occurrences from that deck's staging buffer
(oldest-staged first) by appending them to `Cards[]`, leaving the
remainder (`staged_count mod 5`) staged.

#### Scenario: 11 occurrences staged
- **WHEN** a deck has 11 occurrences staged (including any carried over
  from previous runs) at flush time
- **THEN** exactly 10 are flushed (the 10 oldest), and 1 remains staged

#### Scenario: 9 occurrences staged
- **WHEN** a deck has 9 occurrences staged at flush time
- **THEN** exactly 5 are flushed, and 4 remain staged

#### Scenario: Fewer than 5 occurrences staged
- **WHEN** a deck has 4 occurrences staged at flush time
- **THEN** none are flushed — all 4 remain staged, and the run logs that
  this deck had staged occurrences but not enough to ship

### Requirement: Staged occurrences persist across runs indefinitely
The system SHALL carry a deck's unflushed staged occurrences forward to
every subsequent run until enough accumulate to clear another multiple of
5 — SHALL NOT discard, expire, or force-flush a remainder.

#### Scenario: A deck that never again receives new content
- **WHEN** a deck has 1-4 occurrences staged and no further notes are ever
  minted for it
- **THEN** those occurrences remain staged indefinitely — never shipped,
  never discarded (accepted trade-off: a deck's true tail may never ship
  if its content source permanently stops short of the next multiple of
  5)

### Requirement: Minting is unaffected by staging
The system SHALL mint cards (reserve ids, generate content, capture audio)
exactly when a note becomes eligible, regardless of how many occurrences
are currently staged or how close a deck is to its next flush — staging
only defers shipping, never minting.

#### Scenario: A deck with a large staged backlog
- **WHEN** a deck already has occurrences staged and new notes become
  eligible for minting
- **THEN** the new notes are minted normally this run, and their
  occurrences join the staging buffer alongside the existing backlog
