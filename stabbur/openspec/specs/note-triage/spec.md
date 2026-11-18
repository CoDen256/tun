# note-triage Specification

## Purpose
TBD - created by archiving change origin-scoped-triage-belt. Update Purpose after archive.
## Requirements
### Requirement: Drafted notes can be reviewed one at a time as a queue
The system SHALL provide a triage surface presenting drafted notes one at a
time, advancing to the next without requiring the operator to navigate back
to a listing between notes, and showing how many notes remain in the
current queue.

This surface SHALL be offered alongside the notes browser and the note
editor, not in place of either. The note editor SHALL remain available and
unchanged as the way to open any individual note.

The surface SHALL review **notes**. It SHALL NOT introduce any note status
beyond `draft` and `ready`.

#### Scenario: Reviewing successive notes
- **WHEN** the operator records a verdict on the note in front of them
- **THEN** the next drafted note in the queue is presented immediately,
  with no intervening listing or navigation step

#### Scenario: The editor is unaffected
- **WHEN** the operator opens a single note from the notes browser
- **THEN** the existing note editor opens with all of its capabilities, no
  queue position, and no verdict controls

#### Scenario: An empty queue
- **WHEN** no drafted notes remain for the selected queue
- **THEN** the surface reports that the queue is clear rather than
  presenting an empty form

### Requirement: The triage queue covers exactly one origin at a time
The system SHALL scope the triage queue to a single note origin chosen by
the operator, so that imported, captured, and hand-authored notes are
reviewed as separate queues, each with its own remaining count.

The system SHALL NOT offer a queue spanning more than one origin.
Imported notes arrive in bulk with empty fields and are reviewed quickly,
while hand-authored notes are already considered; interleaving them forces
the operator to switch between two different kinds of attention
unpredictably.

#### Scenario: Triaging an import
- **WHEN** the operator selects the imported-notes queue
- **THEN** only drafted notes with that origin are presented, and the
  remaining count reflects only those

#### Scenario: Switching queues
- **WHEN** the operator switches to the hand-authored queue
- **THEN** only drafted hand-authored notes are presented, and the
  imported queue's remaining count is unaffected by that switch

#### Scenario: Origin remains read-only
- **WHEN** a note is presented for triage
- **THEN** its origin is shown but offered no editing control, consistent
  with origin being unchangeable after creation

### Requirement: Each note is resolved by one of four verdicts
The system SHALL offer, in a fixed position that does not move as the
note's content changes, exactly four actions on the note under review:

- **Accept** — set the note's status to `ready`, saving any edits, and
  advance.
- **Send to back** — return the note to the queue so it is presented again
  only after every other note currently awaiting review.
- **Delete** — delete the note, following the system's existing deletion
  rules, and advance.
- **Skip** — advance, changing neither status nor the note's edited fields.

Whether "Send to back" and "Skip" save the current edits before acting is
governed by the operator's triage-navigation-save preference (see
`operator-settings`): when set to autosave, both save first, exactly as
"Send to back" always has; when set to manual, neither does, matching
"Skip"'s original behavior. The preference applies uniformly to both
actions — there is no way to configure one without the other — because
there is no operator-visible reason the two should ever diverge.

Accepting SHALL be the only action that sets a note to `ready`. Prefilling
or editing a field SHALL NOT advance a note's status on its own. Regardless
of the navigation-save preference, the system SHALL always offer a
separate, explicit Save action (see the new requirement below) that
persists the note under review's current edits without advancing or
changing its status, so the operator can save at will independent of any
verdict.

#### Scenario: Accepting a note
- **WHEN** the operator accepts the note under review
- **THEN** its edits are saved, its status becomes `ready`, and the next
  note is presented

#### Scenario: Sending a note to the back, autosave preference
- **WHEN** the operator sends the note under review to the back, and the
  navigation-save preference is set to autosave
- **THEN** its edits are saved, it is not marked ready, and it is
  presented again only after the rest of the queue

#### Scenario: Sending a note to the back, manual preference
- **WHEN** the operator sends the note under review to the back, and the
  navigation-save preference is set to manual
- **THEN** it is not marked ready and is presented again only after the
  rest of the queue, but any edit since the last explicit save is not
  persisted

#### Scenario: A deferred note's edits survive under autosave
- **WHEN** the navigation-save preference is set to autosave, and the
  operator edits several fields and then sends the note to the back
- **THEN** those edits are present when the note comes round again

#### Scenario: Skipping a note, autosave preference
- **WHEN** the operator skips the note under review, and the
  navigation-save preference is set to autosave
- **THEN** its edits are saved, its status is unchanged, and the next note
  is presented

#### Scenario: Skipping a note, manual preference
- **WHEN** the operator skips the note under review, and the
  navigation-save preference is set to manual
- **THEN** nothing is saved, its status is unchanged, and the next note is
  presented

#### Scenario: Deleting a note
- **WHEN** the operator deletes the note under review
- **THEN** it is deleted under the existing deletion rules and the next
  note is presented

#### Scenario: Verdict controls do not move
- **WHEN** notes of differing length and field count are presented in
  succession
- **THEN** the verdict controls remain in the same position throughout

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

### Requirement: Prefill runs automatically or on demand, as the operator configures
The system SHALL let the operator choose whether prefill runs as soon as a
note is presented for review, or only when they activate a fill control,
and SHALL provide that fill control in either mode so a note can be
refilled after its query has been changed.

#### Scenario: Automatic prefill
- **WHEN** the operator has chosen automatic prefill and a note is
  presented
- **THEN** its empty fields are filled without further action

#### Scenario: On-demand prefill
- **WHEN** the operator has chosen on-demand prefill and a note is
  presented
- **THEN** no provider is consulted until the operator activates the fill
  control

#### Scenario: Refilling after changing a query
- **WHEN** the operator edits a note's text and activates the fill control
- **THEN** the empty fields are filled again using the new value

### Requirement: A prefilled field shows which provider supplied its value
The system SHALL display, for each field filled by prefill, which provider
the value came from, so that no value appears in a reviewed note without
the operator being able to see its source.

This is required rather than cosmetic: consulting providers in a
configured order is permitted only where the answering provider is
identified.

#### Scenario: Reviewing a prefilled note
- **WHEN** a note's fields have been filled from providers
- **THEN** each filled field indicates the provider that supplied its value

#### Scenario: A field the operator typed
- **WHEN** the operator types into a field themselves
- **THEN** it is not attributed to any provider

### Requirement: Suggestion panels start closed during triage
The system SHALL present each note for review with every suggestion panel
closed, showing prefilled values in the fields themselves, so that
reviewing a note does not require scrolling past provider rows.

The operator SHALL be able to open any panel to compare candidates or
re-run a lookup, exactly as in the note editor.

#### Scenario: A note is presented
- **WHEN** a note is presented for review
- **THEN** every suggestion panel is closed

#### Scenario: Opening a panel during review
- **WHEN** the operator opens a suggestion panel on the note under review
- **THEN** it behaves as it does in the editor, including per-provider
  retry and re-running every provider

#### Scenario: Panels do not carry across notes
- **WHEN** the operator opens a panel and then records a verdict
- **THEN** the next note is presented with every panel closed and empty

### Requirement: An explicit Save action persists edits independent of any verdict
The system SHALL offer a Save action, bound to the key `m`, that persists
the note under review's current edits via the same path a verdict's own
save uses, without changing its `status` or advancing the queue — so the
operator can save in-progress work and keep reviewing the same note, or
come back to it later with nothing lost.

#### Scenario: Saving without resolving
- **WHEN** the operator edits several fields and then presses Save (or its
  key binding)
- **THEN** those edits are persisted, the note under review does not
  change, its status is unchanged, and the queue does not advance

#### Scenario: Saving is available regardless of the navigation-save preference
- **WHEN** the operator's navigation-save preference is set to manual
- **THEN** the Save action still persists edits on demand — the preference
  only governs whether Send to back, Skip, and Go to previous do so
  automatically

### Requirement: Returning to the previous note respects the navigation-save preference
The system SHALL, when the operator returns to the previously-reviewed note
and the navigation-save preference is set to autosave, save the note being
left before navigating back — the same preference and the same save path
"Send to back" and "Skip" use. Under the manual preference, returning to
the previous note SHALL NOT save the note being left.

#### Scenario: Going back under autosave
- **WHEN** the operator has edited the current note under review, the
  navigation-save preference is set to autosave, and the operator returns
  to the previous note
- **THEN** the current note's edits are persisted before navigating back

#### Scenario: Going back under manual
- **WHEN** the operator has edited the current note under review, the
  navigation-save preference is set to manual, and the operator returns to
  the previous note
- **THEN** the current note's edits since the last explicit save are not
  persisted

### Requirement: The audio suggest panel can attach a chosen candidate directly
The system SHALL let the operator attach a TTS suggest candidate to the
note under review the same way the note editor does, regardless of which
form (triage or editor) presented the candidate.

#### Scenario: Using a TTS candidate during triage
- **WHEN** the operator opens the audio suggest panel on the note under
  review and clicks "Use" on a candidate
- **THEN** the resulting stabbur-stored audio is attached to the note under
  review, exactly as it would be from the note editor

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

`inflections` and `translations` are `NOT NULL` columns, so for them the
empty value is the only reachable missing state; `audio_blob`,
`transcription`, `context_text` and `lemma` are nullable, so for those both
`NULL` and the empty string SHALL be matched. The filter SHALL NOT rely on
a column being nullable.

A queue's sort SHALL be stored with the queue, not globally.

The operator SHALL be able to create, rename, edit and delete their own
queues. The three built-in queues SHALL be neither editable nor deletable.

#### Scenario: A field-presence queue
- **GIVEN** a saved queue whose only filter is `audio: missing`
- **WHEN** that queue is selected
- **THEN** every note in the belt has no audio reference
- **AND** no note with an audio reference appears in it

#### Scenario: An empty object counts as missing
- **GIVEN** a note whose `inflections` is `{}` and another with a populated paradigm
- **WHEN** a queue filtering `inflections: missing` is selected
- **THEN** the note with `{}` is in the belt and the populated one is not

#### Scenario: A null and an empty string both count as missing
- **GIVEN** a note whose `transcription` is `NULL` and another whose `transcription` is `''`
- **WHEN** a queue filtering `transcription: missing` is selected
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

