# Spec Delta — notes-schema

## MODIFIED Requirements

### Requirement: Existing data is migrated to separate values exactly once
Stored data SHALL be converted to the separate-value shape by migration, in
place, once — never by the reader, and never by guessing at display time.

- `context_text` SHALL be split on its newlines into `examples`, trimmed,
  with empty lines dropped and order kept, and then dropped as a column.
- A translation row's text SHALL be split into separate rows of the same
  language on **every `/` it contains**, with or without spaces around it.
  Each part SHALL be trimmed; a part empty after trimming SHALL be dropped;
  a row that yields no part SHALL be left as it was. Split rows SHALL be
  consecutive and SHALL keep the original row's position and language.
  A segment SHALL be dropped only when it duplicates a row that was already
  separate, or a segment an earlier split in the same note emitted — the
  rule the first migration used. Pre-existing duplicate rows SHALL be left
  alone: this undoes joins, it does not de-duplicate.
- No note SHALL be deleted, and no note SHALL lose a value it held.
- The migration's `downgrade` SHALL refuse: neither split is recoverable.

The capture's own `context_text` is provenance under the ingestion contract
and SHALL NOT be touched.

#### Scenario: Context lines become examples
- **GIVEN** a note whose `context_text` is three lines with a blank line between two of them
- **WHEN** the migration runs
- **THEN** `examples` holds the three non-empty lines in order, and the column is gone

#### Scenario: A spaced slash is split
- **GIVEN** a note with one English translation reading `"hurry / rush"`
- **WHEN** the migration runs
- **THEN** the note has two English translations, `"hurry"` then `"rush"`

#### Scenario: An unspaced slash is split
- **GIVEN** a note with one English translation reading `"hurry/rush"`
- **WHEN** the migration runs
- **THEN** the note has two English translations, `"hurry"` then `"rush"`

#### Scenario: Several slashes in one row
- **GIVEN** a note with one German translation reading `"eilen/hasten / rennen"`
- **WHEN** the migration runs
- **THEN** the note has three German translations, `"eilen"`, `"hasten"`, `"rennen"`

#### Scenario: Position and language are kept
- **GIVEN** a note whose translations are en `"go"`, de `"gehen/laufen"`, en `"walk"`
- **WHEN** the migration runs
- **THEN** the translations are en `"go"`, de `"gehen"`, de `"laufen"`, en `"walk"`, in that order

#### Scenario: A duplicate produced by splitting collapses
- **GIVEN** a note whose translations are en `"hurry/rush"` and en `"rush"`
- **WHEN** the migration runs
- **THEN** the note has exactly two English translations, `"hurry"` and `"rush"`

#### Scenario: A pre-existing duplicate is not touched
- **GIVEN** a note whose translations are en `"x"` and en `"x"`, neither containing a slash
- **WHEN** the migration runs
- **THEN** the note still has both rows

#### Scenario: A value that is only slashes is kept
- **GIVEN** a note with one translation whose text is `" / "`
- **WHEN** the migration runs
- **THEN** that row is unchanged — nothing is deleted

#### Scenario: Nothing is lost
- **WHEN** the migration runs over the whole table
- **THEN** the note count is unchanged and every note that had a translation still has at least one

#### Scenario: Downgrade refuses
- **WHEN** a downgrade is attempted
- **THEN** it fails with a message saying the split cannot be undone
