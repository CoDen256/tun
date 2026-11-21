# similar-notes Specification

## Purpose
TBD - created by archiving change similar-notes-merge. Update Purpose after archive.

## Requirements

### Requirement: Related notes are surfaced without being requested
The system SHALL show the notes related to the one the operator is working
on, wherever notes are edited or triaged, without requiring a separate
search action.

#### Scenario: Opening a note for editing
- **WHEN** the operator opens a note
- **THEN** notes related to it are listed alongside it

#### Scenario: Triaging a draft
- **WHEN** the operator reviews a draft in the triage belt
- **THEN** notes related to it are listed alongside it

#### Scenario: A note with nothing related
- **WHEN** no note is related to the one being edited
- **THEN** the absence is shown plainly, rather than an empty control that
  looks broken

#### Scenario: Several related notes
- **WHEN** more than one note is related to the one being edited
- **THEN** all of them are listed, not only the closest match

### Requirement: Each suggestion states why it was surfaced
The system SHALL label every related note with which signal matched it, and
SHALL NOT present a single blended similarity score in place of those
labels.

#### Scenario: A derivationally related word
- **WHEN** a note's text is spelled similarly to another's
- **THEN** that note is listed and labelled as spelled alike

#### Scenario: Two notes sharing an inflected form
- **WHEN** two notes' inflection tables contain the same surface form
- **THEN** they are listed for each other and labelled as the same word
  family

#### Scenario: Two notes sharing a translation
- **WHEN** two notes have a translation in common
- **THEN** they are listed for each other and labelled as related rather
  than duplicate

#### Scenario: A note matched by more than one signal
- **WHEN** a related note matches on both spelling and word family
- **THEN** it appears once, carrying both reasons

### Requirement: Grammatical-article values do not make nouns related
The system SHALL exclude a note's grammatical article from the inflected
forms it compares, so that sharing an article does not make two notes
related.

#### Scenario: Two unrelated nouns of the same gender
- **WHEN** two notes both record the article `en` and share no other
  inflected form
- **THEN** they are not reported as the same word family

### Requirement: Semantically related notes are shown separately and collapsed
The system SHALL present translation-matched notes in a section that is
collapsed by default and distinguished from the signals that indicate a
likely duplicate.

#### Scenario: Synonyms sharing an English gloss
- **WHEN** several notes share a translation but differ in spelling and
  word family
- **THEN** they appear in the collapsed section, presented as related
  information rather than as merge candidates

#### Scenario: Expanding the collapsed section
- **WHEN** the operator expands that section
- **THEN** the translation-matched notes are listed with their reason

### Requirement: Sentence-length notes are excluded from similarity
The system SHALL NOT report similarity for notes whose content is a
sentence rather than a lexical item, because character-level similarity over
sentences is not meaningful.

#### Scenario: A listening note
- **WHEN** a note of type `listening` is edited
- **THEN** no spelling-based similarity is reported for it

### Requirement: Individual fields can be taken from a related note
A related note's fields SHALL be offerable individually. Each field SHALL be
a row showing a preview of the value that would be taken, and a toggle.
Staging a take SHALL NOT change anything on its own. Only committing the
merge applies it.

Takeable fields SHALL be listed in exactly this order, with no section
headers: text, lemma, part of speech, inflections, audio, IPA
(transcription), translations, examples. The audio row SHALL carry a play
button that plays the audio that would be taken. A field that is empty on
the source SHALL be shown disabled. `status`, `origin` and `import_ref` SHALL
remain untakeable.

Each take SHALL be **additive** or **replacive**, fixed per field:
- `translations` and `examples` are **additive**. The survivor's own values
  are kept, and values it already has are not duplicated.
- text, lemma, part of speech, inflections, transcription and the audio
  reference are **replacive**.

Taking inflections SHALL also take the source's part of speech, always.

The merge sheet SHALL state in its own text which takes replace and which
add.

#### Scenario: Taking context keeps the survivor's own
- **GIVEN** the survivor has the example "Hvor er doen?" and the related note has "Doet er opptatt."
- **WHEN** "examples" is taken and the merge is committed
- **THEN** the survivor's examples are ["Hvor er doen?", "Doet er opptatt."]

#### Scenario: Identical context is not duplicated
- **GIVEN** both notes have the example "Hvor er doen?"
- **WHEN** "examples" is taken and the merge is committed
- **THEN** the sentence appears once

#### Scenario: Taking inflections replaces the paradigm and the part of speech
- **GIVEN** the survivor has a filled paradigm and a part of speech
- **WHEN** "inflections" is taken from a related note with a different paradigm and part of speech, and the merge is committed
- **THEN** the survivor's paradigm is the related note's, with no slot surviving from its own
- **AND** the survivor's part of speech is the related note's

#### Scenario: Each control says what it will do
- **WHEN** the merge sheet is shown
- **THEN** its text states that IPA, audio, text, lemma, part of speech and inflections replace, and that translations and examples are added

#### Scenario: Taking part of speech alone
- **WHEN** only "part of speech" is taken and the merge is committed
- **THEN** the survivor's part of speech is the source's, and its inflections are unchanged

#### Scenario: Listening before taking audio
- **WHEN** the operator presses play on the audio take row
- **THEN** the source note's audio plays, and nothing is staged by doing so

#### Scenario: Take order
- **WHEN** the take rows are shown
- **THEN** they read top to bottom: text, lemma, part of speech, inflections, audio, IPA, translations, examples

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

### Requirement: Only a draft may be absorbed by a merge
The system SHALL permit a merge only where the absorbed note has status
`draft`, SHALL reject a merge that would absorb a `ready` note, and SHALL
enforce this on the server rather than relying on the interface to prevent
it.

#### Scenario: A ready note absorbing a draft
- **WHEN** a `ready` note absorbs a `draft` note
- **THEN** the merge is permitted

#### Scenario: A draft absorbing a draft
- **WHEN** a `draft` note absorbs another `draft` note
- **THEN** the merge is permitted

#### Scenario: A draft attempting to absorb a ready note
- **WHEN** a merge would absorb a note whose status is `ready`
- **THEN** the merge is rejected and nothing is deleted

#### Scenario: Two ready notes
- **WHEN** a merge between two `ready` notes is attempted
- **THEN** it is rejected and nothing is deleted

#### Scenario: A forbidden merge requested directly
- **WHEN** a forbidden merge is requested without going through the
  interface
- **THEN** it is still rejected

### Requirement: A merge never creates a tombstone
The system SHALL hard-delete the absorbed note, and SHALL NOT set a deletion
marker on it, so that no merge can leave a note resolvable as a tombstone.

#### Scenario: After absorbing a draft
- **WHEN** a draft note has been absorbed by a merge
- **THEN** its row is removed entirely, with no deletion timestamp recorded
  anywhere

#### Scenario: Published progress is unreachable from a merge
- **WHEN** any permitted merge is performed
- **THEN** no note that a downstream consumer could have retrieved is
  removed or marked deleted

### Requirement: Absorbing a draft into a ready note marks it as changed
The system SHALL update the surviving note's modification timestamp when it
absorbs another, so that a consumer filtering on "changed since" sees the
result.

#### Scenario: A ready note absorbs a draft
- **WHEN** a `ready` note absorbs a draft and takes a field from it
- **THEN** its modification timestamp is updated

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

### Requirement: A merge can run in either direction
For each related note, the merge sheet SHALL offer a direction switch:
- **"Into this note"**: the open note survives and absorbs the related one.
- **"This note into '<other>'"**: the related note survives and absorbs the
  open one.

The sheet SHALL show:
- which note survives and which is deleted
- the take toggles, with the absorbed note's values as previews

The commit button SHALL name the survivor ("Merge N fields · keep '<survivor>'").

The rule that only a draft may be absorbed stands. When the open note is
ready, the second direction SHALL be disabled, with the reason shown.

After a merge that absorbed the open note:
- in triage, the belt advances
- from the Notes list, the survivor opens

#### Scenario: Merging this note away
- **GIVEN** draft "bilen" is open from the Notes list and ready note "bil" is similar to it
- **WHEN** the operator picks "This note into 'bil'", takes translations, and commits
- **THEN** "bilen" is deleted, "bil" opens holding both notes' translations, and the toast names "bil" as kept

#### Scenario: A ready note cannot be merged away
- **GIVEN** the open note is ready
- **WHEN** the merge sheet is shown
- **THEN** "This note into '<other>'" is disabled and explains that only a draft can be merged away
