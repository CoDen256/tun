## ADDED Requirements

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
