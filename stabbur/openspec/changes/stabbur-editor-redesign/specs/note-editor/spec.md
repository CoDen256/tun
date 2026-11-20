# Spec Delta — note-editor

## MODIFIED Requirements

### Requirement: The context field offers provider-sourced example sentences
The note's examples field SHALL be a list of separate rows, one plain
Norwegian sentence each. The operator can edit, add and remove each row
individually.

The examples suggest button SHALL open the examples sheet:
- querying with the note's text
- showing one box per configured examples provider

Using a candidate SHALL add it as a new row. It SHALL NOT join it to an
existing one.

Candidates SHALL be presented as Norwegian sentences only. The system SHALL
NOT pair an example with a translation, or present one as a translation
candidate.

#### Scenario: Suggesting a context sentence
- **WHEN** the operator opens the examples suggest button
- **THEN** a sheet opens with one box per configured examples provider, each listing candidate sentences with their context line and a Use action

#### Scenario: Using an example adds a row
- **GIVEN** a note with one example
- **WHEN** the operator uses an example candidate
- **THEN** the note shows two separate example rows, and the first is unchanged

#### Scenario: The query comes from the note's text
- **WHEN** the operator opens the examples sheet on a note with `text = "legge til"`
- **THEN** the query shown and used is `"legge til"`

#### Scenario: A provider with no examples
- **WHEN** a configured provider has no example for the queried word
- **THEN** that provider's box reports "Nothing for" the query rather than an error, and the other boxes are unaffected

#### Scenario: Examples are not translated
- **WHEN** any example candidate is shown
- **THEN** no translation of it is displayed or requested

### Requirement: Audio can be listened to, trimmed, and replaced from the editor
The system SHALL provide in-editor audio playback with a waveform whose
selection the operator drags to set `audio_sel_ms`. The selection SHALL be
shown in milliseconds, with the total duration and the audio's source.

Two controls SHALL replace a note's audio:
- **Upload file** stores a chosen file through the existing blob upload.
- **Use URL from clipboard** reads the clipboard on that click and captures
  the audio at the URL found there, through the existing link capture.

When the clipboard cannot be read or holds no URL, the system SHALL say so
and change nothing. The system SHALL NOT offer a free-text audio-link input.

#### Scenario: Adjusting a trim range
- **WHEN** the operator drags a selection edge on the waveform
- **THEN** `audio_sel_ms` updates to match, the ms readout updates, and playback plays exactly the selected range

#### Scenario: Replacing audio from the clipboard
- **GIVEN** the clipboard holds a direct mp3 URL
- **WHEN** the operator clicks "Use URL from clipboard"
- **THEN** the audio at that URL is captured and becomes the note's audio, and no URL text box was shown at any point

#### Scenario: Clipboard without a URL
- **GIVEN** the clipboard holds plain text that is not a URL
- **WHEN** the operator clicks "Use URL from clipboard"
- **THEN** a message says the clipboard holds no URL, and the note's audio is unchanged

#### Scenario: Replacing audio
- **WHEN** the operator uploads a new audio file for a note
- **THEN** the new file is stored via the existing blob-upload endpoint and the note's `audio_blob` references it, and the previous blob is left untouched in storage

## ADDED Requirements

### Requirement: Translation candidates are tagged by language and always add a row
The system SHALL query every configured translation provider for each of
the operator's configured target languages. It SHALL list the candidates
inside each provider's box, every candidate carrying a tag naming its
language. Target languages come only from Settings. The sheet SHALL NOT
offer its own control for adding a language.

Using a translation candidate SHALL always add a new translation row with
that candidate's language and text. It SHALL NEVER extend an existing row's
text. No merge-mode preference exists.

#### Scenario: Candidates carry their language
- **GIVEN** Settings lists target languages en and de
- **WHEN** the operator opens the translations sheet
- **THEN** each provider box lists its en and de candidates, each row tagged with its language

#### Scenario: Using a second translation for the same language
- **WHEN** the note already has the English translation "get going" and the operator uses the English candidate "get under way"
- **THEN** a second English row "get under way" is added and the first row still reads exactly "get going"

#### Scenario: No slash-joined text is ever produced
- **WHEN** the operator uses any number of translation candidates
- **THEN** no translation row's text contains a joined " / " that the operator did not type


### Requirement: forvo and filmot are external links, not inputs
The audio sheet SHALL list forvo and filmot only as small "Open elsewhere"
links at its bottom:
- in their Settings order
- each opening the provider's search for the current query in a new tab

Neither SHALL show an input field.

#### Scenario: External links at the bottom
- **WHEN** the audio sheet opens
- **THEN** the pygmalion and dict_cc boxes come first, and forvo and filmot appear below them as links with no input fields

## REMOVED Requirements

### Requirement: Translation suggestions are grouped by target language
**Reason**: The 2026-11-20 redesign lists candidates per provider with a language tag on each row, drops the in-sheet "add target language" control, and removes the append/separate merge mode. Superseded by "Translation candidates are tagged by language and always add a row".
**Migration**: Stored slash-joined translation rows are split into separate rows by the `notes-schema` one-time migration; target languages are set in Settings.

### Requirement: The note's raw stored record is viewable alongside the structured form
**Reason**: The operator dropped the raw-JSON view in the 2026-11-20 redesign; the mockup the editor is built 1:1 from has no such view.
**Migration**: None. The authoring API still returns the full record for anyone who needs it.
