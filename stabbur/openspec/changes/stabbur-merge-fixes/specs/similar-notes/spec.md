## MODIFIED Requirements

### Requirement: Individual fields can be taken from a related note
A related note's fields SHALL be offerable individually, each next to a
preview of the value that would be taken. Staging a take SHALL NOT change
anything on its own; only committing the merge applies it.

Takeable fields SHALL include `text`, `lemma`, `translations`,
`transcription`, `inflections`, `context_text` and the audio reference.
`status`, `origin` and `import_ref` SHALL remain untakeable.

Each take SHALL be **additive** or **replacive**, fixed per field:

- `translations` and `context_text` are **additive** — the survivor's own
  value is never discarded.
- `inflections`, `transcription`, `text`, `lemma` and the audio reference
  are **replacive**.

Taking `inflections` SHALL also take the source's part of speech, always —
not only when the survivor has none. A paradigm whose part of speech does
not reach the survivor renders into fields that do not exist on it.

Each take control SHALL state its operation where the operator reads it,
both on the control itself and in the summary shown before committing.

#### Scenario: Taking context keeps the survivor's own
- **GIVEN** the survivor has a context sentence and the related note has a different one
- **WHEN** "take context" is staged and the merge is committed
- **THEN** the survivor's context contains both sentences, the taken one appended on a new line below the survivor's own

#### Scenario: Identical context is not duplicated
- **GIVEN** the survivor's context and the related note's context are the same text
- **WHEN** "take context" is staged and the merge is committed
- **THEN** the survivor's context is unchanged and the sentence appears once

#### Scenario: Taking inflections replaces the paradigm and the part of speech
- **GIVEN** the survivor has a filled paradigm and a part of speech
- **WHEN** "take inflections" is staged from a related note with a different paradigm and part of speech, and the merge is committed
- **THEN** the survivor's paradigm is the related note's, with no slot surviving from its own
- **AND** the survivor's part of speech is the related note's

#### Scenario: Each control says what it will do
- **WHEN** the take controls are shown
- **THEN** the controls for translations and context are labelled as adding
- **AND** the controls for inflections, IPA, audio, text and lemma are labelled as replacing

### Requirement: Merging is many-to-one and never automatic
A merge SHALL be an explicit operator action in which one survivor absorbs
one or more related notes. It SHALL never be triggered by viewing,
staging, or editing.

Committing a merge SHALL first persist the survivor's **currently edited
values** — the state of the open form, not the stored row — and SHALL then
apply the staged takes on top of them, within one transaction. An edit the
operator had not separately saved SHALL NOT be lost to a merge.

The confirmation shown before committing SHALL state both that the
absorbed notes will be permanently deleted and that the operator's
unsaved edits will be saved.

#### Scenario: Unsaved edits survive a merge
- **GIVEN** the operator has typed a new IPA value into the open note and not saved it
- **WHEN** a related draft is absorbed without taking IPA
- **THEN** the surviving note carries the typed IPA value

#### Scenario: A take wins over an unsaved edit of the same field
- **GIVEN** the operator has typed a value into a field and not saved it
- **WHEN** that same field is staged to be taken from a related note and the merge is committed
- **THEN** the surviving note carries the taken value for a replacive field
- **AND** for an additive field, carries the typed value with the taken value added to it

## ADDED Requirements

### Requirement: Every related note can be opened directly
Each related-note suggestion SHALL offer a link that opens that note's own
editor. The link SHALL open in a new browser tab, leaving the operator's
current note, queue position and unsaved edits untouched.

The link SHALL be present on every suggestion, including one whose status
prevents it from being absorbed or having its fields taken.

#### Scenario: A ready match can still be opened
- **GIVEN** a related note whose status is `ready`, so its absorb control and take controls are disabled
- **WHEN** the operator uses its link
- **THEN** that note's editor opens in a new tab
- **AND** the originally open note is still shown, unchanged, in the original tab
