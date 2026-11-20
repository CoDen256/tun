# Spec Delta — notes-authoring

## ADDED Requirements

### Requirement: A note can be duplicated
The system SHALL create a duplicate of an existing note on request. The new
note SHALL:
- get a new id
- have status `draft`
- copy text, type, source language, part of speech, lemma, inflections,
  transcription, translations, examples, grammar rule, `audio_blob` and
  `audio_sel_ms`

Audio bytes are shared, not copied, since blobs are content-addressed.

The duplicate SHALL have origin `manual`, with no capture link and no import
reference, because that provenance belongs only to the original.

From a note opened from the Notes list, Duplicate SHALL open the copy and
mark it as a copy of the original.

#### Scenario: Duplicating a ready note with audio
- **GIVEN** a ready note "bil" with audio, two translations and one example
- **WHEN** the operator presses Duplicate
- **THEN** a new draft opens with the same text, audio (playable, same blob), translations and example, labelled as a copy of "bil", and the original is unchanged

#### Scenario: Duplicating a captured note
- **WHEN** a note whose origin is capture is duplicated
- **THEN** the copy's origin is manual and it has no capture link
