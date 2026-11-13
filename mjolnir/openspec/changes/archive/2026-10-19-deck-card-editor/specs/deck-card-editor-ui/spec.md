## ADDED Requirements

### Requirement: Local editor server
The system SHALL provide a command that starts an HTTP server bound to `127.0.0.1` serving a browser-based editor for a given bundle's decks and cards.

#### Scenario: Starting the editor
- **WHEN** a user runs the editor command against a bundle
- **THEN** the system starts a local server bound to `127.0.0.1` and serves the deck/card editor UI over it

### Requirement: Browsing decks by category
The system SHALL display decks grouped by their derived category, and SHALL display a selected deck's cards.

#### Scenario: Viewing decks by category
- **WHEN** a user opens the editor
- **THEN** decks are presented grouped under their category, and selecting a deck shows that deck's cards

### Requirement: Live HTML preview of card fields
The system SHALL render a live preview of each HTML-bearing card field (`N`, `E`, `X`) alongside its editable text, updating the preview as the field's text changes.

#### Scenario: Editing a card field
- **WHEN** a user edits the text of an `N`, `E`, or `X` field in the card editor
- **THEN** the rendered preview for that field updates to reflect the current text

### Requirement: Prefilled template for new cards
The system SHALL prefill a new card's HTML-bearing fields with a structural HTML skeleton rather than leaving them empty.

#### Scenario: Creating a new card
- **WHEN** a user creates a new card
- **THEN** its `N`, `E`, and `X` fields start populated with a non-empty structural HTML skeleton
