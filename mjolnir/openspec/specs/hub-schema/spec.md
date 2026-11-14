# hub-schema

## Purpose

Defines hub's data model for tracking permanently-assigned card ids,
builder's own minted-note ledger independent of stabbur, and the
multi-field publication version history exposed to the operator.

## Requirements

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
`patch_rev` are read from the `logic_bundles` row active at the moment of
publish, and `data_rev` is always incremented by exactly 1 relative to the
previous publication.

#### Scenario: A content-only publish
- **WHEN** `builder` publishes new or changed card content with no change to
  which `logic_bundles` row is active
- **THEN** the new row's `base_version`/`patch_rev` match the active logic
  bundle's own values, unchanged from the previous publication, and
  `data_rev` is the previous value plus 1

#### Scenario: A publish after activating a different logic bundle
- **WHEN** the operator activates a different `logic_bundles` row before the
  next publish runs
- **THEN** the new `publications` row's `base_version`/`patch_rev` match that
  newly-active row's values, not the previous publication's

### Requirement: Each publication records which logic bundle it was built from
The system SHALL store a reference from each `publications` row to the
`logic_bundles` row that was active when it was published.

#### Scenario: Tracing a publication back to its logic bundle
- **WHEN** an operator inspects a past publication
- **THEN** they can identify exactly which `logic_bundles` entry (and
  therefore which base+patch bytes) it was built from

### Requirement: Publish history is visible in an operator UI
The system SHALL expose a read-only view of the `publications` table,
including `build_id` and all three version fields, to the operator.

#### Scenario: Viewing publish history
- **WHEN** the operator opens hub's operator UI
- **THEN** every past publication is listed with its `build_id`,
  `base_version`, `patch_rev`, `data_rev`, and timestamp

### Requirement: `decks` carries an operator-editable description
The system SHALL store a `description` field on each `decks` row, editable
by the operator independently of `title`, and SHALL make it available to
`builder` as the source of truth for the on-device deck `Description`
field it bakes into every published bundle.

#### Scenario: An existing deck's description is edited
- **WHEN** the operator edits a deck's description in hub's console
- **THEN** the change is stored against that deck's row, and the next
  publish that touches that deck bakes the new description into the
  bundle's deck `Description` field

#### Scenario: A brand-new deck is created with no description set
- **WHEN** a new deck is seeded with no explicit description
- **THEN** `description` is an empty string, not null, and the bundle's
  deck `Description` field is likewise an empty string
