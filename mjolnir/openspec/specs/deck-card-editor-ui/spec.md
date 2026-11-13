## Purpose

Provide the browser-based deck/card editor as one view within the shared bundle-workbench app server, available for any open bundle session whose bundle contains a deck-catalog/card-content module pair, rather than as its own standalone server bound to a single bundle passed as a command argument.

## Requirements

### Requirement: Local editor server
The system SHALL serve a browser-based editor for a given bundle's decks and
cards as one view within the shared bundle-workbench app server, available
for any open bundle session whose bundle contains a deck/card-shaped module
pair, rather than as its own standalone server bound to a single bundle
passed as a command argument.

#### Scenario: Opening the deck/card editor for an open bundle session
- **WHEN** a user has an open bundle session whose bundle contains a
  deck-catalog/card-content module pair
- **THEN** the deck/card editor view is available for that session within the
  shared app server

#### Scenario: A bundle without a deck/card module pair
- **WHEN** a user has an open bundle session whose bundle does not contain a
  deck-catalog/card-content module pair
- **THEN** the deck/card editor view is not shown for that session

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
