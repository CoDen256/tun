## ADDED Requirements

### Requirement: `hub` owns the permanent card-id ledger
The system SHALL store every minted card's `(deck_code, card_no, note_id)` in
`card_slots`, assigned once and never reassigned, and SHALL NOT expose any
mechanism to reuse or renumber an existing slot.

#### Scenario: A note is minted
- **WHEN** `builder` mints a new card for a note
- **THEN** a `card_slots` row is created with a permanent 6-character id and
  the owning note's id, and that id is never issued to a different note

### Requirement: `hub` tracks which notes it has already minted, independently of stabbur
The system SHALL maintain its own ledger of minted note ids, consulted before
every publish, and SHALL NOT report minted status back to stabbur in any
form.

#### Scenario: A note already minted is pulled again
- **WHEN** `builder` pulls notes from stabbur and a returned note id is
  already in hub's minted ledger
- **THEN** that note is treated as already-minted (eligible only for content
  regeneration, not a new card_slots row), using hub's own ledger as the sole
  source of truth

### Requirement: `publications` tracks three independently-owned version fields
The system SHALL store `base_version`, `patch_rev`, and `data_rev` as
separate fields on each `publications` row, where `base_version` and
`patch_rev` default to the previous publication's value unless explicitly
overridden, and `data_rev` is always incremented by exactly 1 relative to the
previous publication.

#### Scenario: A content-only publish
- **WHEN** `builder` publishes new or changed card content with no operator
  override of `base_version`/`patch_rev`
- **THEN** the new row copies forward the previous `base_version` and
  `patch_rev` unchanged, and `data_rev` is the previous value plus 1

#### Scenario: An operator-flagged base or patch change
- **WHEN** the operator supplies a new `base_version` or `patch_rev` value for
  a publish
- **THEN** the new row uses the supplied value, and that value is what future
  publishes copy forward until changed again

### Requirement: Publish history is visible in an operator UI
The system SHALL expose a read-only view of the `publications` table,
including `build_id` and all three version fields, to the operator.

#### Scenario: Viewing publish history
- **WHEN** the operator opens hub's operator UI
- **THEN** every past publication is listed with its `build_id`,
  `base_version`, `patch_rev`, `data_rev`, and timestamp
