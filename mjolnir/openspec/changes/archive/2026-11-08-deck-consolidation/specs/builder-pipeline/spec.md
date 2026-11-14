## MODIFIED Requirements

### Requirement: Deck assignment by family, not by individual type/PoS
The system SHALL assign every eligible note to one of 2 deck families —
**superseded by deck-consolidation** (operator decision, 2026-11-04): the
original 10-way type/PoS split (`Deck assignment by type, then by PoS,
with a catch-all`) concentrated too little volume into several decks for
`builder-sliding-window-shipping`'s multiple-of-5 flush threshold to be
reached in practice. `type=word` notes (any PoS) and `type=expression`
notes SHALL resolve to the `lexic` family; `type=grammar`,
`type=listening`, and `type=pronunciation` notes SHALL resolve to the
`practice` family. Each family resolves to an actual deck code via
`deck-rollover`'s capacity-aware resolution, not a single fixed code.

#### Scenario: Any word-PoS note resolves to the lexic family
- **WHEN** an eligible `type=word` note is assigned a deck, regardless of
  its `pos`
- **THEN** it resolves to the `lexic` family (no PoS produces a different
  family — the former per-PoS deck split no longer applies)

#### Scenario: Expression resolves to the lexic family, not its own deck
- **WHEN** an eligible `type=expression` note is assigned a deck
- **THEN** it resolves to the `lexic` family, the same family every
  word-PoS note resolves to

#### Scenario: Single-occurrence types resolve to the practice family
- **WHEN** an eligible note has `type` grammar, listening, or pronunciation
- **THEN** it resolves to the `practice` family

### Requirement: Existing cards are migrated to their new family's deck codes exactly once
The system SHALL provide a one-time, operator-triggered migration that
moves every previously-minted card to a new id consistent with its new
family's active deck code (per deck-rollover's resolution), updating every
table that references that card by id, and SHALL NOT run this migration
automatically as part of routine hub startup.

#### Scenario: A card minted under the old per-PoS scheme is migrated
- **WHEN** the migration runs and a card's old deck code's notes now belong
  to the `lexic` family
- **THEN** the card receives a new id under the `lexic` family's currently
  active code, and every row in `card_content`, `pending_occurrences`,
  `staged_occurrences`, `occurrence_shipments`, and `minted_notes` that
  referenced the old id now references the new one

#### Scenario: The migration is all-or-nothing
- **WHEN** the migration encounters any error partway through
- **THEN** the entire migration rolls back — no card ends up partially
  migrated (new id created but old references not yet repointed, or vice
  versa)

#### Scenario: Study progress is not preserved across the merge
- **WHEN** a card moves to its new family's deck as part of this migration
- **THEN** its position in the new deck's `Cards[]` reflects migration
  order only — no attempt is made to preserve which occurrences the
  device had already drawn under the old deck's `PullCounter`
