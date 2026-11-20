# Spec Delta — builder-pipeline

## ADDED Requirements

### Requirement: A note's examples become the X face, one per line
For word and expression notes, the projection SHALL build the X face from
the note's `examples` list:
- the sentences in stored order
- joined by `<br>`
- inside one `<div class="left">` wrapper

An empty or absent list SHALL produce an empty X.

The projection SHALL NOT read `context_text`. Listening, pronunciation and
grammar notes are unaffected.

#### Scenario: Two examples
- **WHEN** a word note with examples ["Vi må komme i vei.", "Endelig kom det i vei."] is projected
- **THEN** X is exactly `<div class="left">Vi må komme i vei.<br>Endelig kom det i vei.</div>`

#### Scenario: No examples
- **WHEN** an expression note with examples [] is projected
- **THEN** X is the empty string

#### Scenario: Same output as before for single-newline context
- **GIVEN** a note whose pre-migration context_text was "A.\nB." and whose migrated examples are ["A.", "B."]
- **WHEN** it is projected
- **THEN** X equals what the previous projector produced from "A.\nB."

#### Scenario: The old field is ignored
- **WHEN** a payload carries a `context_text` but no `examples`
- **THEN** X is the empty string
