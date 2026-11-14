## MODIFIED Requirements

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
