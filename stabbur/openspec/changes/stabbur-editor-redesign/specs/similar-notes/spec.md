# Spec Delta — similar-notes

## MODIFIED Requirements

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

## ADDED Requirements

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
