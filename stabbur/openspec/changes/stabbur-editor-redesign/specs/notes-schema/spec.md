# Spec Delta — notes-schema

## MODIFIED Requirements

### Requirement: Translations support any number of languages
The system SHALL store `translations` as an array of `{lang, text}` pairs,
with no fixed set of allowed languages and no requirement that any specific
language be present.

Each pair holds exactly one translation. Several translations in one
language are several pairs. The system SHALL NOT write one pair that joins
several translations with a separator.

#### Scenario: A note with three translations
- **WHEN** a note is created with translations in `en`, `de`, and `fr`
- **THEN** all three are stored and returned, with no language silently dropped

#### Scenario: Two English translations
- **WHEN** a note has the English translations "car" and "automobile"
- **THEN** they are stored as two pairs, not as one pair "car / automobile"

## ADDED Requirements

### Requirement: Examples are a list of separate sentences
The system SHALL store a note's example sentences as `examples`:
- an ordered array of non-empty strings, one sentence each
- empty by default

There SHALL be no `context_text` column on notes.

#### Scenario: Stored as separate values
- **WHEN** a note is saved with the examples "Hvor er doen?" and "Doet er opptatt."
- **THEN** `examples` is exactly `["Hvor er doen?", "Doet er opptatt."]`

### Requirement: Existing data is migrated to separate values exactly once
A one-time migration SHALL:
- fill `examples` from each note's former `context_text`, split on newlines,
  trimmed, with empty lines dropped and the order kept
- replace every translation pair whose text contains " / " with one pair per
  trimmed, non-empty segment, in the same language, at the same position and
  in order
- drop `context_text` and the translation merge-mode preference

#### Scenario: Context text becomes examples
- **GIVEN** a note whose context text was "Vi må komme i vei.\n\nEndelig kom det i vei."
- **WHEN** the migration has run
- **THEN** its examples are ["Vi må komme i vei.", "Endelig kom det i vei."]

#### Scenario: A slash-joined translation is split
- **GIVEN** a note with translations [{en, "toilet / loo"}, {de, "Klo"}]
- **WHEN** the migration has run
- **THEN** its translations are [{en, "toilet"}, {en, "loo"}, {de, "Klo"}]

#### Scenario: Nothing joined remains
- **WHEN** the migration has run
- **THEN** no note has a translation text containing " / ", and no notes column named `context_text` exists
