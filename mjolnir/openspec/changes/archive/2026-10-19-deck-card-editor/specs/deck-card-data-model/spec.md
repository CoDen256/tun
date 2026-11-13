## ADDED Requirements

### Requirement: Locate the deck-catalog and card-content modules by structural shape
The system SHALL identify the deck-catalog module among a bundle's `data`-classified modules as the one whose array elements each have a `Cards` property, and the card-content module as the one whose array elements each have a `DECK_ID` property, without relying on a hardcoded module id.

#### Scenario: Locating the pair in a bundle
- **WHEN** the system scans a bundle's `data`-classified modules
- **THEN** it identifies the deck-catalog module and the card-content module by their elements' shape, regardless of their numeric module ids

### Requirement: Category derivation
The system SHALL derive a deck's category as the first character of its `Name` field.

#### Scenario: Deriving a deck's category
- **WHEN** a deck's `Name` field is read
- **THEN** the system reports that deck's category as the first character of that field

### Requirement: Referential-integrity validation
The system SHALL validate, before accepting any edit for saving, that every deck's `Cards[].Card` reference (its id with any trailing direction letter removed) matches some card's `ID`, and that every card's `DECK_ID` matches some deck's `Name`, and SHALL reject the edit with a clear error if either check fails.

#### Scenario: A deck references a nonexistent card
- **WHEN** an edit would leave a deck's `Cards[]` referencing a card id with no matching card-content entry
- **THEN** the system rejects the edit and reports which reference is unresolved

#### Scenario: A card references a nonexistent deck
- **WHEN** an edit would leave a card's `DECK_ID` with no matching deck `Name`
- **THEN** the system rejects the edit and reports which card's `DECK_ID` is unresolved

#### Scenario: A consistent edit is accepted
- **WHEN** an edit leaves every deck-to-card and card-to-deck reference resolvable
- **THEN** the system accepts the edit for saving
