# Spec Delta — grammar-management

## ADDED Requirements

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
