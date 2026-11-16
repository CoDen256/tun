## MODIFIED Requirements

### Requirement: The triage queue covers exactly one origin at a time
**Superseded in substance by the saved-queue requirement below**, and kept
only as the description of the three built-in queues.

The triage queue SHALL cover exactly the notes a selected queue describes.
Three built-in queues — one per origin, over `draft` notes, oldest-updated
first — SHALL always exist, SHALL NOT be deletable or editable, and SHALL
reproduce exactly the behaviour this requirement described before: a queue
mixing origins is never produced by them.

#### Scenario: The built-in queues behave as the origin queues did
- **WHEN** the `import` built-in queue is selected
- **THEN** the belt holds exactly the `draft` notes whose origin is `import`, oldest updated first

## ADDED Requirements

### Requirement: The triage queue is defined by a named, saved filter set
The triage queue SHALL be selected from a list of **queues**, each a named
filter set with its own sort order. Queues SHALL be stored with the
operator's settings, not in the browser, so the same queues are available
from any device.

A queue's filters SHALL be able to carry: status, type, origin, part of
speech, source language, an updated-since window, a text search over text /
lemma / translations, and **field presence** for each of audio,
transcription, inflections, context, translations and lemma.

Field presence SHALL be three-state — `any`, `missing`, or `has`. `missing`
SHALL match a column that is SQL `NULL` **or** empty for its type (an empty
string, an empty list, an empty object). A note whose `inflections` is `{}`
SHALL be matched by `inflections: missing`.

A queue's sort SHALL be stored with the queue, not globally.

The operator SHALL be able to create, rename, edit and delete their own
queues. The three built-in queues SHALL be neither editable nor deletable.

#### Scenario: A field-presence queue
- **GIVEN** a saved queue whose only filter is `audio: missing`
- **WHEN** that queue is selected
- **THEN** every note in the belt has no audio reference
- **AND** no note with an audio reference appears in it

#### Scenario: An empty object counts as missing
- **GIVEN** a note whose `inflections` is `{}` and another whose `inflections` is `null`
- **WHEN** a queue filtering `inflections: missing` is selected
- **THEN** both notes are in the belt

#### Scenario: A queue carries its own order
- **GIVEN** two saved queues with different sorts
- **WHEN** each is selected in turn
- **THEN** the belt presents each queue's notes in that queue's own order
- **AND** selecting one does not change the other's order

#### Scenario: Built-in queues cannot be destroyed
- **WHEN** the queue list is shown
- **THEN** the three origin queues are present and offer no delete control

### Requirement: A filtered result set can be triaged directly
The notes browser SHALL offer an action that opens the triage belt over
exactly the notes its current filters describe, without requiring the
operator to save a queue first. The operator SHALL be able to name and save
that filter set as a queue from the belt.

#### Scenario: Triaging the current results
- **GIVEN** the notes browser filtered to `draft` notes of type `word`
- **WHEN** the triage action is used
- **THEN** the belt holds exactly those notes, in the browser's current order

## MODIFIED Requirements

### Requirement: Empty fields are prefilled from the operator's primary providers
An empty field SHALL be filled from the first configured, enabled provider
that answers, walking the operator's order. A field that already holds a
value SHALL NOT be overwritten.

Where the note has a part of speech, candidates SHALL be **ordered** so
that those matching it come first, and the value taken SHALL be the first
candidate after that ordering. Candidates SHALL NOT be filtered or
withheld on the basis of part of speech. Where the note has no part of
speech, or no candidate matches it, the provider's own order SHALL be used
unchanged.

For a multiword transcription, when the enrichment service supplies no
assembled whole-phrase value, stabbur SHALL assemble one from each token's
first candidate, joined with a single space, in the service's token order.
A token with no candidate SHALL leave a visible gap in the assembled value
rather than being silently omitted. The field's provenance SHALL record
that the value was assembled rather than looked up.

This supersedes `smia-ipa-multiword-response` decision D2, which forbade
any stabbur-side join. Decision D3 of that change — that an assembled
string is never presented as a real phrase lookup — remains in force and
extends to a prefilled value.

#### Scenario: The right sense is prefilled
- **GIVEN** a note whose part of speech is `substantiv`
- **AND** a translation provider returning a verb candidate first and a noun candidate second
- **WHEN** prefill runs
- **THEN** the noun candidate's text is what lands in the translation field
- **AND** the verb candidate is still present in the suggestion panel

#### Scenario: A multiword transcription is assembled
- **GIVEN** a two-token expression where one token has two IPA candidates, so the service supplies no assembled value
- **WHEN** prefill runs
- **THEN** the transcription field holds both tokens' first candidates joined by a single space
- **AND** the field's provenance indicates the value was assembled, not looked up

#### Scenario: A gap is visible
- **GIVEN** a two-token expression where one token has no candidate at all
- **WHEN** prefill runs
- **THEN** the assembled value shows a gap marker in that token's position
