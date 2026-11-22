# notes-schema

## Purpose

TBD — defines the data model for notes: permanent ids with tombstoning,
language-agnostic fields, flexible translations, the draft/ready status
model, and the structures for inflections and shared grammar rules.

## Requirements

### Requirement: Notes carry a permanent id, even when removed
The system SHALL assign each note a permanent id at creation that is never
reused, and SHALL preserve that id as a tombstone if the note is ever removed
after having been queryable via the read API, rather than deleting the row
outright.

#### Scenario: Removing a draft note
- **WHEN** a note with `status=draft` that has never been returned by the
  read API is deleted
- **THEN** its row is removed entirely

#### Scenario: Removing a note that may have already been pulled
- **WHEN** a note that has `status=ready` (and is therefore eligible to have
  been returned by the read API) is deleted
- **THEN** its id remains resolvable as a tombstone rather than being freed
  for reuse

### Requirement: Notes are language-agnostic
The system SHALL store `source_lang` as a plain field on every note and
SHALL NOT hardcode any assumption that `source_lang` is always Norwegian,
even though every note today has `source_lang="no"`.

#### Scenario: Querying notes by source language
- **WHEN** the read API is queried with `source_lang=no`
- **THEN** only notes whose `source_lang` field equals `"no"` are returned,
  using the same filtering logic that would apply to any other value

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

### Requirement: Status is draft or ready only, with no published state
The system SHALL restrict `status` to exactly `draft` and `ready`, and SHALL
NOT store any representation of whether a downstream consumer has acted on
the note.

#### Scenario: Attempting to set an unsupported status value
- **WHEN** a request attempts to set `status` to any value other than
  `draft` or `ready`
- **THEN** the request is rejected

### Requirement: Audio is not required for `status=ready`
The system SHALL allow a note to reach `status=ready` with `audio_blob` null,
since "ready" means reviewed and correct, not "has everything a downstream
consumer needs."

#### Scenario: Marking a note ready with no audio yet
- **WHEN** a note with `audio_blob=null` is set to `status=ready`
- **THEN** the update succeeds

### Requirement: Inflections are a flat, Norwegian-shaped structure
The system SHALL store `inflections` as a single flat JSONB object shaped
for Norwegian (per `03-data-model.md`'s per-PoS shapes), without a
per-language wrapper, until a second `source_lang` value actually exists in
the system.

#### Scenario: Storing inflections for a substantiv note
- **WHEN** a `type=word`, `pos=substantiv` note is created with
  `{article, sg_indef, sg_def, pl_indef, pl_def}`
- **THEN** that object is stored exactly as given, with no added
  language-keying wrapper

### Requirement: Grammar notes reference a shared grammar_rule
The system SHALL require `type=grammar` notes to reference a `grammar_rule`
row via `grammar_rule_id`, allowing multiple notes to share the same
explanation.

#### Scenario: Two notes sharing a grammar rule
- **WHEN** two separate `type=grammar` notes are created with the same
  `grammar_rule_id`
- **THEN** both resolve to the same `grammar_rule` content, with no
  duplication of the explanation text

### Requirement: Every note asserts its origin positively
The system SHALL store an `origin` on every note, restricted to exactly
`manual`, `capture`, and `import`, and SHALL NOT permit a note to exist
without one. The system SHALL NOT express any origin as the absence of other
data.

#### Scenario: A hand-authored note
- **WHEN** a note is created by the operator in the authoring UI with no
  capture and no import reference
- **THEN** its `origin` is `manual`, stored as that value explicitly rather
  than inferred from null provenance columns

#### Scenario: Attempting an unsupported origin value
- **WHEN** a request attempts to set `origin` to any value other than
  `manual`, `capture`, or `import`
- **THEN** the request is rejected

#### Scenario: The three origins partition every note
- **WHEN** the complete set of notes is grouped by `origin`
- **THEN** every note falls into exactly one of `manual`, `capture`, or
  `import`, with no note uncategorised

### Requirement: An origin claim is backed by its provenance evidence
The system SHALL require `capture_id` to be present when `origin=capture`,
SHALL require `import_ref` to be present when `origin=import`, and SHALL
require both to be absent when `origin=manual`, enforced at the storage
layer rather than by convention. The system SHALL additionally enforce that
a present `capture_id` references an existing capture, so a captured origin
is referentially backed and not merely non-null.

#### Scenario: Claiming an imported origin without a reference
- **WHEN** a note is written with `origin=import` and no `import_ref`
- **THEN** the write is rejected

#### Scenario: Claiming a captured origin without a capture
- **WHEN** a note is written with `origin=capture` and no `capture_id`
- **THEN** the write is rejected

#### Scenario: Claiming a manual origin while carrying provenance
- **WHEN** a note is written with `origin=manual` and either a `capture_id`
  or an `import_ref`
- **THEN** the write is rejected

#### Scenario: Referencing a capture that does not exist
- **WHEN** a note is written with `origin=capture` and a `capture_id` that
  matches no stored capture
- **THEN** the write is rejected by the storage layer

#### Scenario: Removing a capture a note still references
- **WHEN** a capture is deleted while a note still references it
- **THEN** the deletion is rejected, so a live note's provenance cannot be
  destroyed from underneath it

### Requirement: Imported notes record which external source they came from
The system SHALL store `import_ref` as a structured value identifying the
external source a note was imported from, including which source, which
note within that source, and which import run produced it.

#### Scenario: An imported note's provenance is auditable
- **WHEN** a note with `origin=import` is read via the authoring API
- **THEN** its `import_ref` identifies the source, the source's own note
  identifier, and the import run

#### Scenario: The reference does not create a dependency
- **WHEN** whatever external store the `import_ref` points at is
  unavailable, moved, or deleted
- **THEN** the note remains fully readable and valid, and `import_ref`
  remains a meaningful record on its own

### Requirement: A note's origin is immutable once created
The system SHALL reject any attempt to change a note's `origin` or
`import_ref` after creation, while continuing to allow every content field
to be edited freely.

#### Scenario: Attempting to rewrite provenance
- **WHEN** a request attempts to change an existing note's `origin` from
  `import` to `manual`
- **THEN** the request is rejected and the stored `origin` is unchanged

#### Scenario: Heavily editing an imported note
- **WHEN** the operator rewrites the text, translations, and inflections of
  a note with `origin=import`
- **THEN** every edit is applied and the note's `origin` remains `import`

#### Scenario: Round-tripping an unchanged origin
- **WHEN** a request includes the note's existing `origin` value unchanged
  alongside content edits
- **THEN** the request is accepted
</content>
</invoke>

### Requirement: Examples are a list of separate sentences
The system SHALL store a note's example sentences as `examples`:
- an ordered array of non-empty strings, one sentence each
- empty by default

There SHALL be no `context_text` column on notes.

#### Scenario: Stored as separate values
- **WHEN** a note is saved with the examples "Hvor er doen?" and "Doet er opptatt."
- **THEN** `examples` is exactly `["Hvor er doen?", "Doet er opptatt."]`

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
