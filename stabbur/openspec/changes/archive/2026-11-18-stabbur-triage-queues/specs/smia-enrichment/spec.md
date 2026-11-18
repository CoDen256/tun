## ADDED Requirements

### Requirement: Candidates are ordered by the note's part of speech, never filtered
Where the note being edited has a part of speech, suggestion candidates
SHALL be ordered so that those sharing it come first. This SHALL apply to
translation candidates and to audio candidates alike.

Candidates SHALL NEVER be withheld on the basis of part of speech. Every
candidate the provider returned SHALL remain reachable, and no
part-of-speech parameter SHALL be sent to the enrichment service.

Where the note has no part of speech, or no candidate matches it, the
provider's own order SHALL be preserved unchanged and no preference SHALL
be invented.

A candidate's part of speech SHALL be read from the leading **bracketed**
tag of its `context` (for example `[verb] å komme i vei`). A candidate
whose context carries no bracketed tag SHALL be treated as **untagged**:
grouped together, shown after the tagged groups, and left in the
provider's order among themselves.

Candidates SHALL be displayed grouped by part of speech, with the note's
own group first and identified as the note's own.

#### Scenario: The matching sense sorts first
- **GIVEN** a note whose part of speech is `substantiv`
- **AND** a provider returning a `[verb]` candidate before a `[noun]` candidate
- **WHEN** the suggestion panel is shown
- **THEN** the `[noun]` candidate appears above the `[verb]` candidate
- **AND** the `[verb]` candidate is still shown, under its own group heading

#### Scenario: Untagged candidates are grouped, not dropped
- **GIVEN** a provider whose candidates carry a context with no bracketed tag
- **WHEN** the suggestion panel is shown
- **THEN** those candidates appear under an untagged group after the tagged groups
- **AND** none of them is hidden

#### Scenario: No part of speech means no reordering
- **GIVEN** a note with no part of speech set
- **WHEN** the suggestion panel is shown
- **THEN** candidates appear in exactly the order the provider returned them

#### Scenario: Audio is ordered the same way
- **GIVEN** a note whose part of speech is `substantiv`
- **AND** audio candidates whose contexts carry `[verb]` and `[noun]` tags
- **WHEN** the audio suggestion panel is shown
- **THEN** the `[noun]` recording appears first
- **AND** the `[verb]` recording is still offered

### Requirement: An existing note's audio can be found and attached
The audio suggestion panel SHALL offer a search over the operator's own
notes by text, lemma or translation, restricted to notes that carry a
recording. Each result SHALL be playable before it is chosen.

Choosing a result SHALL attach **the same** stored recording to the note
being edited — the same content hash, with nothing copied and no new blob
stored. Both notes SHALL afterwards reference that one recording, and
neither SHALL be altered by the other.

#### Scenario: A recording is reused
- **GIVEN** a note carrying a recording, and a second note with none
- **WHEN** the first is found through the audio search and chosen from the second note
- **THEN** both notes reference the same content hash
- **AND** the first note is otherwise unchanged

#### Scenario: Only notes with audio are offered
- **WHEN** a search matches notes both with and without recordings
- **THEN** only the ones carrying a recording are listed

## MODIFIED Requirements

### Requirement: Using a TTS candidate stores real stabbur-owned audio
Using an audio candidate SHALL store the bytes as a stabbur-owned blob and
reference it by content hash. Audio reached through the notes search above
is already stored and SHALL be referenced directly, without re-storing it.

#### Scenario: A provider candidate is stored
- **WHEN** a provider's audio candidate is used
- **THEN** the bytes are stored by stabbur and the note references their hash

## ADDED Requirements

### Requirement: Using a transcription candidate adds to the field
Using a transcription suggestion SHALL **append** it to the transcription
field, separated from the existing value by a single space, so a multiword
transcription can be assembled from its tokens. An empty field SHALL simply
be filled. Using the same candidate twice SHALL NOT duplicate it.

The assembled-from-single-words row SHALL continue to **replace** the
field: it is a transcription of the whole phrase, not one more token.

Where a suggestion panel's field accumulates values, the "used" marks on
its candidates SHALL accumulate too, so the marks describe what the field
actually holds rather than only the most recent action.

#### Scenario: Two tokens assemble
- **GIVEN** an empty transcription field
- **WHEN** one candidate is used, then a second
- **THEN** the field holds both values separated by a single space
- **AND** both candidates are marked as used

#### Scenario: The whole-phrase row replaces
- **GIVEN** a transcription field holding an assembled value
- **WHEN** the assembled-from-single-words row is used
- **THEN** the field holds exactly that row's value

### Requirement: A transcription's variety is available on hover only
A transcription candidate's variety SHALL be reachable by hovering the
transcription itself, and SHALL NOT be rendered as visible text in the
candidate row. Where several varieties were merged under one transcription,
the merged value SHALL be shown.

A candidate whose provider supplies no variety SHALL show no indicator at
all, and SHALL NOT leave an empty slot in the row.

#### Scenario: Variety on hover
- **GIVEN** a candidate carrying a variety
- **WHEN** its transcription is hovered
- **THEN** the variety is shown
- **AND** it appears nowhere in the row otherwise

#### Scenario: No variety, no empty slot
- **GIVEN** a candidate from a provider that supplies no variety
- **WHEN** the panel is shown
- **THEN** the row carries no variety indicator and no blank space where one would be
