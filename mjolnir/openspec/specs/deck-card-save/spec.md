# deck-card-save

## Purpose

Defines how deck/card edits are persisted: new card id and deck-reference generation, automatic backups, and byte-exact preservation of untouched modules when saving. TBD: expand with further save-path details as the editor evolves.

## Requirements

### Requirement: New card id generation
The system SHALL generate a new card's id as its owning deck's name followed by the next unused zero-padded 3-digit sequence number among that deck's existing card ids.

#### Scenario: Generating an id for a new card in a deck with existing cards
- **WHEN** a new card is created for a deck whose highest existing card sequence number is N
- **THEN** the new card's id is the deck's name followed by N+1, zero-padded to 3 digits

### Requirement: New card deck reference
The system SHALL append a single `{ Card: "<id>N", P: "N" }` reference to the owning deck's `Cards[]` when a new card is created, regardless of whether that deck's existing cards use a single- or dual-direction reference pattern.

#### Scenario: Adding a card to a single-direction deck
- **WHEN** a new card is created in a deck whose existing cards each have one `Cards[]` reference
- **THEN** the system appends exactly one `N`-direction reference for the new card

#### Scenario: Adding a card to a dual-direction deck
- **WHEN** a new card is created in a deck whose existing cards each have two `Cards[]` references (`N` and `Y`)
- **THEN** the system still appends exactly one `N`-direction reference for the new card, without adding a `Y`-direction reference

### Requirement: Automatic backup before save
The system SHALL copy the current on-disk bundle to a backup path before overwriting it with a saved edit.

#### Scenario: Saving for the first time in a session
- **WHEN** a user saves an edit for the first time against a given bundle
- **THEN** the system copies the bundle's current contents to a backup path before writing the edited bundle

#### Scenario: Saving again in the same session
- **WHEN** a user saves a second edit against the same bundle
- **THEN** the system overwrites the existing backup with the bundle's contents as they were immediately before this save

### Requirement: Byte-exact save of untouched modules
The system SHALL write a saved bundle by regenerating the deck-catalog and card-content modules' contents and reassembling the bundle so every other module's bytes are identical to the pre-save bundle.

#### Scenario: Saving an edit
- **WHEN** a user saves an edit to a deck or card
- **THEN** every module other than the deck-catalog and card-content modules is byte-identical between the pre-save and post-save bundle
