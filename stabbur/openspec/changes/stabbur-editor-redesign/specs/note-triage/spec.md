# Spec Delta — note-triage

## ADDED Requirements

### Requirement: Notes absorbed by a merge leave the triage queue
When a merge commits during triage, the system SHALL remove every absorbed
note from the triage queue at once. Navigating afterwards SHALL never present
a note that the merge deleted.

When the note under review was itself absorbed, the belt SHALL advance to the
next note.

#### Scenario: Merging another draft from the same queue
- **GIVEN** the queue holds drafts A, B, C in that order and A is under review
- **WHEN** the operator merges B into A
- **THEN** advancing presents C, and no request against B is ever sent

#### Scenario: Merging the current note away
- **GIVEN** draft A is under review and ready note R is similar to it
- **WHEN** the operator merges A into R
- **THEN** the belt presents the next note, and the queue count drops by one

### Requirement: A note can be duplicated from triage
The triage ⋯ menu SHALL offer "Duplicate note". It creates a draft copy of
the note under review, as the duplicate rule in `notes-authoring`
describes, and inserts it into the queue directly after the current note.
The current note stays under review.

#### Scenario: The copy comes next
- **WHEN** the operator duplicates the note under review and then presses Skip
- **THEN** the next note presented is the copy, with every field identical to the original and status draft

### Requirement: Prefill is in the pinned bar
The prefill action SHALL be a button in triage's pinned bar, next to
"Ready & next":
- labelled "Prefill" on desktop, with key L
- icon-only on a phone

It SHALL NOT be inside the ⋯ menu.

#### Scenario: Prefill from the bar
- **WHEN** the operator presses the bar's Prefill button on a note with empty fields
- **THEN** the empty fields are filled from the operator's primary providers, exactly as the existing prefill rules state
