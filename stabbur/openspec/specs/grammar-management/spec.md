# grammar-management

## Purpose

TBD — defines the operator-facing surface for creating, editing, and
retiring grammar rules, including their reverse usage lookup against notes
and the browsable list of rules.

## Requirements

### Requirement: Grammar rules support full CRUD, including single-rule read/update/delete
The system SHALL provide `GET`, `PATCH`, and `DELETE` for an individual
grammar rule, matching the resource-per-route pattern notes already use —
not only the existing create and list.

#### Scenario: Editing a grammar rule's explanation
- **WHEN** the operator edits a grammar rule's title or HTML explanation
- **THEN** the change is saved and reflected for every note referencing it

### Requirement: A grammar rule shows every note that references it
The system SHALL expose, for a given grammar rule, the full list of notes
whose `grammar_rule_id` points to it.

#### Scenario: Viewing usage
- **WHEN** the operator opens a grammar rule with 5 referencing notes
- **THEN** all 5 notes are listed, each linking to its own editor

### Requirement: A grammar rule in use cannot be deleted
The system SHALL refuse to delete a grammar rule while any note still
references it, reporting how many notes block the deletion.

#### Scenario: Attempting to delete an in-use rule
- **WHEN** the operator attempts to delete a grammar rule referenced by 3
  notes
- **THEN** the deletion is refused and the operator is told 3 notes still
  reference it

#### Scenario: Deleting an unused rule
- **WHEN** the operator deletes a grammar rule referenced by zero notes
- **THEN** the deletion succeeds

### Requirement: Grammar rules are browsable, sortable, and filterable
The system SHALL provide a list of grammar rules, sortable (including by
how many notes reference each) and searchable by title.

#### Scenario: Sorting by usage
- **WHEN** the operator sorts the grammar rules list by usage count
- **THEN** the most-referenced rules appear first

### Requirement: A rule's explanation is shown rendered
The grammar rule page SHALL show the rule's HTML explanation **rendered**:
paragraphs, emphasis, lists and tables. An "Edit HTML" control SHALL swap in
the raw HTML source for editing, and "Show rendered" swaps back.

Scripts and event-handler attributes in the HTML SHALL NOT execute.

The same rendered explanation SHALL appear under the grammar rule control in
the note editor when a rule is linked.

The rule page SHALL show the title (wrapping when long), the explanation and
"Used by N notes" with links. It SHALL have no examples section.

#### Scenario: Rendered by default
- **GIVEN** a rule whose HTML contains a `<table>` and a `<ul>`
- **WHEN** the operator opens the rule
- **THEN** a table and a bulleted list are visible, and no HTML tags are shown as text

#### Scenario: Editing the source
- **WHEN** the operator clicks "Edit HTML", changes the source, saves, and clicks "Show rendered"
- **THEN** the rendered view reflects the change

#### Scenario: Script is inert
- **GIVEN** a rule whose HTML contains `<script>` or an `onclick` attribute
- **WHEN** the rule is shown rendered
- **THEN** nothing executes
