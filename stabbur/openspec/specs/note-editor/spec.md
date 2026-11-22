# note-editor

## Purpose

TBD — defines the operator-facing note editing surface: in-editor audio
playback/trim/replace, a raw-JSON view of the stored record alongside the
structured form, and PoS-driven inflection field prefill when creating a
word note.

## Requirements

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

### Requirement: Creating a word note prefills inflection fields by part of speech
The system SHALL present the correct set of inflection fields for the
selected part of speech immediately upon selection, rather than a blank or
generic field for the operator to shape by hand.

#### Scenario: Selecting "verb" while creating a word note
- **WHEN** the operator selects `pos=verb` on the new-note form
- **THEN** the infinitiv/presens/preteritum/perfektum fields appear, empty
  and ready to fill, with no other PoS's fields shown

### Requirement: Transcription, translations, and audio fields offer provider-sourced suggestions
The system SHALL provide a combined suggest control next to the
transcription field, the translations list, and the audio panel — a toggle
that opens an accordion directly beneath/alongside the field it feeds, fused
with a live, editable query field showing the value about to be used,
defaulting to the note's `lemma` and falling back to `text` when no lemma is
set. The accordion lists one row per currently configured provider for that
kind, and letting the operator copy a chosen candidate into the note with
one action. For a TTS provider that has no automatable lookup and instead
returns a link to its own site for a human to check by hand, the audio panel
SHALL show that link and accept a pasted-back result (a direct audio URL, or
a YouTube URL with a timecode) instead of reporting it as a plain lookup
failure. The audio query SHALL additionally strip a leading bare indefinite
article or infinitive marker (`en`/`et`/`ei`/`å`) before querying, the same
transform the examples query already applies — one shared derivation, not
two independently-maintained ones.

A transcription provider's answer SHALL be read according to the `mode`
discriminator on its response, which has two arms: a whole-phrase answer
carrying a flat candidate list, and a per-word answer carrying one entry
per token. A response that carries no `mode` SHALL be read as a
whole-phrase answer, so an older enrichment service remains readable.

#### Scenario: Suggesting a transcription
- **WHEN** the operator opens the transcription field's suggest control
- **THEN** a panel opens beneath it showing one row per configured IPA
  provider, each with its candidate(s) and a "Use" button that writes the
  chosen candidate into the transcription field

#### Scenario: A whole-phrase transcription answer
- **WHEN** a provider answers a transcription lookup with a whole-phrase
  result
- **THEN** its candidates are listed exactly as a single-word result's are,
  each with its variety where the provider reports one, and using one writes
  that transcription into the field

#### Scenario: A per-word transcription answer
- **WHEN** a provider has no whole-phrase entry for a multi-word query and
  answers per word instead
- **THEN** the row shows one group per token, in the order the tokens were
  looked up, each listing that token's own candidates with their own "Use"
  action

#### Scenario: A token the provider has no entry for
- **WHEN** a per-word answer includes a token with no candidates
- **THEN** that token is still shown, in its input position, marked as
  having no entry — it is not omitted from the breakdown and does not cause
  the row to report overall failure

#### Scenario: Suggesting audio
- **WHEN** the operator opens the audio panel's suggest control
- **THEN** a panel opens showing one row per configured TTS provider with its
  candidate(s), and using one attaches the resulting stabbur-stored audio to
  the note (per the `smia-enrichment` capability's TTS handling)

#### Scenario: Query defaults to lemma, falls back to text
- **WHEN** a `type=word` note has both `lemma` and `text` set, and the
  operator opens any suggest control
- **THEN** the query field shows and uses `lemma`, not `text`; for a note
  with no `lemma` set (or a non-`word` type, which never has one), the query
  field shows and uses `text`

#### Scenario: Editing the shared query before or after opening
- **WHEN** the operator edits a suggest control's query field and presses
  Enter
- **THEN** every provider in that panel is queried (or re-queried) with the
  edited value, whether the panel was already open or still closed

#### Scenario: Previewing a TTS candidate before using it
- **WHEN** the operator is shown a TTS candidate in the audio suggest panel
- **THEN** they can play that candidate's audio before deciding whether to
  use it, on both the new-note and existing-note forms, without that
  playback requiring the candidate to already be stored as the note's
  attached audio

#### Scenario: A manual-link provider's row
- **WHEN** a TTS provider's row (e.g. `forvo` or `filmot`) returns a link to
  its own site rather than a playable candidate
- **THEN** the row shows an "Open ↗" link to that site and an input for the
  operator to paste back what they found there, instead of a "no entry
  found" message

#### Scenario: Pasting back a Forvo link
- **WHEN** the operator pastes a direct audio URL into the `forvo` row and
  submits it
- **THEN** the resulting stabbur-stored audio is attached to the note, and
  the existing trim control is available on it exactly as for any other
  attached audio

#### Scenario: Pasting back a filmot/YouTube link
- **WHEN** the operator pastes a YouTube URL with a timecode into the
  `filmot` row and submits it
- **THEN** the resulting short audio clip is attached to the note, and the
  existing trim control is available on it for the operator to narrow down
  further — **known-blocked as of 2026-11-02**: this path is implemented but
  still failing against real YouTube after several rounds of live
  debugging (see `openspec/changes/archive/2026-11-02-manual-link-audio-capture/tasks.md`
  task 6.3 for the full history); only the Forvo scenario above is currently
  confirmed working

#### Scenario: A note's derived query still carries its leading article when suggesting audio
- **WHEN** the operator opens the audio suggest control on a note whose
  derived query (its `lemma`, or `text` with no lemma set) begins with a
  bare `en`, `et`, `ei`, or `å` token
- **THEN** that leading token is stripped before any TTS provider is queried

### Requirement: An assembled phrase transcription is offered only when the provider supplies one, and is never fabricated
The system SHALL offer an assembled whole-phrase transcription only when
the enrichment service itself supplies one, and SHALL NOT concatenate a
per-word answer's tokens to manufacture one when it does not. When no
assembled string is supplied, the only transcription actions offered SHALL
be per-token ones.

The enrichment service supplies that assembled string **only** when every
token resolved to exactly one candidate; its absence is that service's
explicit signal that assembling the phrase would require a choice it
declines to make on the caller's behalf.

The system SHALL additionally distinguish an assembled string from a
whole-phrase lookup in the way it is presented, rather than showing the two
identically, because an assembled string is a sequence of citation forms
rather than a recorded pronunciation of the phrase.

#### Scenario: Every token resolved to exactly one candidate
- **WHEN** a per-word answer supplies an assembled whole-phrase string
- **THEN** the panel offers it as a single action that fills the
  transcription field, labelled as assembled from the individual words
  rather than as the phrase's recorded pronunciation

#### Scenario: A token resolved ambiguously or not at all
- **WHEN** a per-word answer supplies no assembled string, because some
  token has no candidates or more than one
- **THEN** the panel offers no whole-phrase fill at all, and the operator
  fills the field from individual tokens or by typing it

#### Scenario: The system does not assemble on its own
- **WHEN** a per-word answer supplies no assembled string
- **THEN** the system does not join the tokens' transcriptions to
  manufacture one, even where exactly one candidate happens to be
  selectable per token

### Requirement: Suggestions fire only on explicit operator action
The system SHALL NOT fire any provider lookup automatically as the operator
types; every lookup SHALL be the direct result of the operator opening a
suggestion panel or pressing a per-provider retry control.

#### Scenario: Typing into the text field
- **WHEN** the operator edits the note's `text` or `lemma` field
- **THEN** no provider lookup is triggered until the operator explicitly
  clicks a "Suggest" control

### Requirement: Each provider row's query is independently editable and retriable
The system SHALL default every provider's query within a panel to that
panel's shared query field, but SHALL let the operator reveal and edit a
per-provider override to re-fire just that row — so a provider with no
entry for the shared query can be retried against a different input without
affecting other providers' rows. The per-provider override input SHALL be
hidden by default, revealed only via an explicit per-row action, so the
common case (every provider sharing one query) has no extra visible
controls.

When revealed, the override SHALL be prefilled with the panel's shared
query by default, so that adjusting the shared query for one provider does
not require retyping it. The system SHALL allow this to be configured to
open empty instead.

#### Scenario: Retrying a provider with a different input
- **WHEN** a provider's row shows no result for the shared query, the
  operator reveals that row's override, edits it, and retries
- **THEN** only that provider is re-queried with the edited input; other
  providers' rows and results are unaffected

#### Scenario: Override opens prefilled by default
- **WHEN** the operator reveals a provider row's override with the default
  configuration
- **THEN** it contains the panel's current shared query, ready to be
  adjusted

#### Scenario: Override configured to open empty
- **WHEN** the operator has configured overrides to open empty and reveals
  a provider row's override
- **THEN** it is empty with a placeholder, reading as a different input
  rather than a copy

#### Scenario: Collapsing an override falls back to the shared query
- **WHEN** a provider row's override is revealed, then the operator
  collapses it again without having retried
- **THEN** that row's next retry uses the panel's shared query value, not a
  stale override — regardless of what the override had been prefilled with

### Requirement: Noun inflection fields are grouped by article, singular, and plural
The system SHALL render a `substantiv` note's inflection fields as three
grouped rows — `article` alone on its own row, `sg_indef`/`sg_def` together
on a second row, and `pl_indef`/`pl_def` together on a third row — rather
than one field per row. This grouping SHALL apply identically wherever the
noun's inflection fields are shown: the note form itself, and any
suggestion-panel paradigm table for a `substantiv` candidate.

#### Scenario: Viewing a noun's inflection fields on the note form
- **WHEN** the operator is editing or creating a `pos=substantiv` note
- **THEN** `article` appears alone on its own row, `sg_indef`/`sg_def` appear
  together on a second row, and `pl_indef`/`pl_def` appear together on a
  third row

#### Scenario: Viewing a noun paradigm candidate in the suggestion panel
- **WHEN** a provider's inflection paradigm for a `substantiv` candidate is
  shown in the suggestion panel
- **THEN** its paradigm cells are grouped into the same three rows as the
  note form's own noun fields

### Requirement: Inflection paradigms are looked up read-only, for manual copy
The system SHALL provide a combined suggest control — the same toggle +
live, editable shared query + progressive-disclosure per-provider overrides
used for transcription/translations/audio — for inflections, positioned
below the note's own inflection fields rather than above them, opening a
panel showing each configured provider's full paradigm as its own table,
with each form individually copyable, and SHALL additionally let the
operator fill a form directly into its matching inflection field on the
note with one click, when that field exists for the note's current part of
speech. The system SHALL additionally offer a single action per candidate
that applies the whole paradigm — setting the note's part of speech when the
note has none, then filling every form that has a matching field — so that a
paradigm is usable on a note whose part of speech is not yet set. That
action SHALL NOT change a part of speech the note already carries. A
paradigm's forms SHALL be ordered the same way the note's own inflection
fields are ordered, regardless of what order a provider's response happens
to list them in. The system SHALL NOT auto-fill the note's inflection fields
from a lookup on its own — every fill remains an explicit operator action.

#### Scenario: Looking up inflections
- **WHEN** the operator opens the inflections suggest control
- **THEN** a panel opens, positioned below the note's inflection fields,
  showing every configured inflections provider's paradigm as a separate
  table, matching the note's current part-of-speech shape where the
  provider's data supports it

#### Scenario: Copying a form
- **WHEN** the operator clicks a form's copy action in a provider's paradigm
  table
- **THEN** that form is copied for pasting anywhere; the note's inflection
  fields are not modified automatically

#### Scenario: Filling a form directly into its field
- **WHEN** the operator clicks a form's "Fill" action in a provider's
  paradigm table, and the note's current part-of-speech has a matching
  inflection field for that paradigm key
- **THEN** that field on the note form is set to the provider's value
  immediately, without affecting any other inflection field

#### Scenario: Applying a whole paradigm to a note with no part of speech
- **WHEN** the operator applies a provider's whole candidate on a note that
  has no part of speech, and the provider reported one
- **THEN** the note's part of speech is set to the reported value, its
  inflection fields for that part of speech become available, and every
  reported form with a matching field is filled

#### Scenario: Applying a whole paradigm never overrides an existing part of speech
- **WHEN** the operator applies a provider's whole candidate on a note that
  already has a part of speech
- **THEN** the note's part of speech is left exactly as it was, and only the
  forms with matching fields are filled

#### Scenario: A provider reporting no part of speech
- **WHEN** the operator applies a whole candidate whose provider reported no
  part of speech, on a note that has none
- **THEN** no part of speech is invented, and no inflection field is filled,
  because none exists to fill

#### Scenario: Fill is unavailable for a non-matching field
- **WHEN** a provider's paradigm includes a key that has no corresponding
  field for the note's current part of speech
- **THEN** only the copy action is offered for that cell, not a fill action

#### Scenario: Providers disagree
- **WHEN** two providers report different forms for the same paradigm slot
- **THEN** the panel surfaces the disagreement rather than silently picking
  one provider's answer, and filling from one provider does not prevent
  filling a different field from a different provider afterward

#### Scenario: A paradigm's forms follow the note's own field order
- **WHEN** a provider's response lists a verb paradigm's forms in some order
  other than infinitiv/presens/preteritum/perfektum (the note form's own
  order)
- **THEN** the panel still displays them in infinitiv/presens/preteritum/
  perfektum order, not whatever order the provider's response used

### Requirement: Suggestion panels work on both new and existing notes
The system SHALL make every suggestion panel — including the audio (TTS)
panel — available on the new-note form and the existing-note editor alike,
driven only by the form's current in-progress values — never requiring the
note to already be saved. On the new-note form, using a TTS candidate SHALL
attach the resulting audio to the note at creation time, as part of the same
save action, rather than requiring the note to be created first and audio
attached in a separate step. The new-note form's manual audio-upload control
SHALL present and behave the same way as every provider's "Use" action —
uploading immediately on click rather than deferring until the note is
saved — so the operator gets the same immediate preview regardless of
whether the audio came from a suggestion or a manual upload.

#### Scenario: Suggesting on an unsaved note
- **WHEN** the operator is filling in the new-note form and has not yet saved
- **THEN** every suggestion panel is available and uses the form's current
  field values as its default query, exactly as it would on an existing note

#### Scenario: Using a TTS candidate while creating a new note
- **WHEN** the operator clicks "Use" on a TTS candidate while filling in the
  new-note form, then saves the note
- **THEN** the created note already has that candidate's audio as its
  `audio_blob`, with no additional attach step required after save

#### Scenario: Using the manual-upload control while creating a new note
- **WHEN** the operator picks a file in the new-note form's manual-upload
  control and clicks its "Use" action
- **THEN** the file is uploaded immediately and previewable before saving,
  the same as any other provider's "Use" action

#### Scenario: Choosing both a suggested candidate and a manually uploaded file
- **WHEN** the operator both uses a TTS suggestion and separately uses the
  manual-upload control before saving a new note
- **THEN** whichever action happened most recently is what the created note's
  `audio_blob` reflects

### Requirement: A note with stored audio offers a text suggestion transcribed from it
The system SHALL show a "Propose from audio" control on the existing-note
editor whenever the note has `audio_blob` set, opening an accordion with one
row per configured `stt` provider, each showing that provider's transcribed
text and a "Use" button that writes it into the `text` field. This control
SHALL NOT appear on the new-note form or on a note with no stored audio.

#### Scenario: Note has audio
- **WHEN** the operator opens a note that has `audio_blob` set
- **THEN** a "Propose from audio" control is available, and opening it fires
  a transcription request per configured `stt` provider against that note's
  stored audio

#### Scenario: Note has no audio
- **WHEN** the operator opens a note with no `audio_blob`
- **THEN** no "Propose from audio" control is shown

#### Scenario: Using a transcription on an empty text field
- **WHEN** the operator clicks "Use" on a provider's transcription and the
  note's `text` field is currently empty
- **THEN** the transcription is written into `text` immediately, with no
  confirmation prompt

#### Scenario: Using a transcription over existing text
- **WHEN** the operator clicks "Use" on a provider's transcription and the
  note's `text` field already has a non-empty value
- **THEN** the operator is asked to confirm before the existing value is
  overwritten

### Requirement: Each suggestion kind draws its query from one named field
The system SHALL source each suggestion kind's default query from exactly
one of the note's fields, with no fallback between fields: inflection
lookups SHALL use `lemma`, and transcription, translation, and audio
lookups SHALL use `text`.

The system SHALL NOT apply any further transformation to the chosen field's
value before sending it — in particular it SHALL NOT strip a leading
Norwegian article or infinitive marker, which is the enrichment service's
concern where it applies at all.

#### Scenario: Inflections use the lemma
- **WHEN** a `type=word` note has `text = "legge til"` and `lemma = "legge"`,
  and the operator opens the inflections suggest control
- **THEN** the query shown and used is `"legge"`

#### Scenario: Transcription, translations, and audio use the text
- **WHEN** that same note's transcription, translations, or audio suggest
  control is opened
- **THEN** the query shown and used is `"legge til"`, not the lemma

#### Scenario: An empty field is not substituted
- **WHEN** a kind's source field is empty
- **THEN** the query is empty, and the system does not silently fall back to
  a different field

### Requirement: A word note's lemma follows its text until the operator edits it
The system SHALL keep a word note's `lemma` synchronised with its `text` as
the operator types, without requiring any explicit action. The derivation
strips a leading article or infinitive marker (`en`, `ei`, `et`, `å`) and a
trailing particle (`til`, `ut`, `opp`, `i`, …) and keeps what is between:
`"å legge til"` gives `"legge"`, and `"skynde seg"` gives `"skynde seg"`,
because `seg` is not a particle.

CORRECTION, 2026-11-22: this requirement used to say "the first
whitespace-separated token", which was never what the code did — the
stopword derivation shipped with `lemma-first-suggestions` and the sentence
was not updated with it. Found by the tester for this change, on a note
whose text is `"skynde seg"`. The behaviour is right; only the sentence was
wrong, so the sentence changed. Once the operator edits `lemma` directly,
the system SHALL stop synchronising it for that note and SHALL preserve the
operator's value. Loading a different note SHALL clear that state, so the
next note begins synchronised again.

The same derivation SHALL run when a note is **opened**, in every editor
context — the triage belt, a note opened from the Notes list, and New note —
whenever the stored lemma is empty or still equal to the raw text. A derived
lemma SHALL count as an unsaved edit, so that saving the note persists it.

Prefill SHALL derive the lemma itself, as its first step, when the lemma is
still empty — so that pressing Prefill is never refused for want of a lemma.

#### Scenario: Typing a multi-word text
- **WHEN** the operator types `"legge til"` into `text` on a word note whose
  lemma they have not edited
- **THEN** `lemma` reads `"legge"`

#### Scenario: A multi-word text with nothing to strip
- **WHEN** the operator types `"skynde seg"` into `text` on a word note whose
  lemma they have not edited
- **THEN** `lemma` reads `"skynde seg"` — the whole phrase, not its first word

#### Scenario: The operator overrides the lemma
- **WHEN** the operator edits `lemma` by hand and then continues editing
  `text`
- **THEN** `lemma` keeps the operator's value and is no longer changed by
  `text`

#### Scenario: A new note starts synchronised again
- **WHEN** the operator has overridden `lemma` on one note and then loads or
  begins a different note
- **THEN** that note's `lemma` synchronises from its own `text` as normal

#### Scenario: Opening a stored note without a lemma
- **GIVEN** a stored note with `text = "legge til"` and `lemma` empty
- **WHEN** the operator opens it from the Notes list
- **THEN** `lemma` reads `"legge"` immediately, and Save is offered as an unsaved change

#### Scenario: An operator-set lemma survives opening
- **GIVEN** a stored note with `text = "legge til"` and `lemma = "å legge"`
- **WHEN** the operator opens it from the Notes list
- **THEN** `lemma` still reads `"å legge"` and nothing is marked unsaved

#### Scenario: Prefill with an empty lemma
- **GIVEN** a note whose lemma field has been cleared by the operator
- **WHEN** they press Prefill
- **THEN** the lemma is derived from the text first, and the inflection and part-of-speech lookups run with it

### Requirement: The new-note form is cleared between notes
The system SHALL clear the new-note form completely once a note has been
created from it, and whenever the operator returns to it — every field, every
suggest control's query and edited-state, any audio chosen from a suggestion
but not yet saved, and any selected upload file.

#### Scenario: Creating a second note after a first
- **WHEN** the operator saves a new note and then returns to the new-note
  form
- **THEN** every field is empty, with none of the previous note's values
  present

#### Scenario: Pending suggested audio does not carry over
- **WHEN** the operator used a TTS suggestion on the new-note form, saved
  the note, and returned to the form
- **THEN** no audio is pending attachment to the next note

### Requirement: Suggestion panels do not outlive the note they were opened for
The system SHALL collapse every suggestion panel and discard its rendered
contents whenever a different note is loaded into a form, so that no panel
ever displays candidates looked up for a different note.

#### Scenario: Opening a second note after suggesting on a first
- **WHEN** the operator opens suggestion panels on one note and then
  navigates to another
- **THEN** every panel on the newly loaded note is collapsed, and reopening
  one performs a fresh lookup rather than showing the previous note's
  candidates

#### Scenario: Panels start closed on the new-note form
- **WHEN** the operator begins a new note
- **THEN** every suggestion panel is closed and empty

### Requirement: Every provider in a panel can be re-run from a visible control
The system SHALL provide a visible control on each suggest control that
re-queries every provider in that panel with the control's current query,
without the operator having to collapse and reopen the panel. The panel
SHALL remain open across the re-run.

#### Scenario: Re-running after editing the shared query
- **WHEN** the operator edits a suggest control's query and activates its
  re-run control
- **THEN** every provider in that panel is queried again with the edited
  value and the panel stays open throughout

### Requirement: An explicitly re-run lookup bypasses the cached answer
The system SHALL request a fresh provider lookup, bypassing the enrichment
service's cached result, when the operator explicitly re-runs a panel or
retries a single provider row. Opening a panel for the first time SHALL NOT
bypass the cache.

Without this, re-running an unchanged query would return the cached answer
and appear to the operator to have done nothing.

#### Scenario: Re-running an unchanged query
- **WHEN** the operator activates a panel's re-run control without changing
  the query
- **THEN** the providers are consulted again rather than the previous
  answers being redisplayed from cache

#### Scenario: Opening a panel normally
- **WHEN** the operator opens a suggestion panel for the first time on a
  note
- **THEN** a cached answer is acceptable and no cache bypass is requested

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

### Requirement: An example candidate shows the provenance its provider reports
The system SHALL display, for each example candidate, the sense it
illustrates and the sub-source it came from, where the provider reports
them, so the operator can distinguish a lexicographer's example filed under
a definition from a naturally-occurring sentence found in a corpus.

Both are optional, and a provider omits either where it has nothing
meaningful to report. The system SHALL show each only when present, and
SHALL NOT substitute a placeholder for an absent one — an example with no
sense is a complete answer, not missing data.

#### Scenario: A dictionary provider's candidate
- **WHEN** a provider returns an example filed under a particular
  definition and reports that sense
- **THEN** the candidate is shown with the sense it illustrates

#### Scenario: A corpus provider's candidate
- **WHEN** a provider returns a sentence drawn from one of its datasets and
  reports which
- **THEN** the candidate is shown with that sub-source named

#### Scenario: A provider reports neither
- **WHEN** a provider returns a candidate with no sense and no sub-source
- **THEN** only the sentence is shown, with no placeholder or empty label
  in place of the missing fields

### Requirement: The number of example candidates requested is an operator control
Two operator controls SHALL govern example prefilling:

- **Providers to ask** (N): how many of the enabled examples providers, in
  the operator's order, are asked.
- **Sentences per provider** (M): how many sentences are requested from, and
  taken from, each of them.

Prefilling examples SHALL ask the first N enabled providers and take up to M
sentences from each, in provider order, de-duplicated across providers. A
provider that returns fewer than M sentences SHALL contribute what it has,
and the shortfall SHALL NOT be backfilled from any other provider. The result
is therefore at most N × M sentences.

M SHALL be the per-provider limit sent with the lookup. Because the requested
count forms part of the lookup's cache identity, changing it SHALL be treated
as a new lookup rather than an expansion of the previous one.

#### Scenario: A full grid
- **GIVEN** Providers to ask is 2, Sentences per provider is 3, and both of the first two enabled providers return at least three sentences
- **WHEN** the operator prefills a note with no examples
- **THEN** the note has six example rows: three from the first provider, then three from the second, in that order

#### Scenario: A short provider is not backfilled
- **GIVEN** the same settings, and the first provider returns one sentence while the second returns five
- **WHEN** the operator prefills
- **THEN** the note has four example rows: the one from the first provider and three from the second

#### Scenario: Providers beyond N are not asked
- **GIVEN** Providers to ask is 1 and three providers are enabled
- **WHEN** the operator prefills examples
- **THEN** only the first enabled provider's sentences are used

#### Scenario: Asking for more
- **WHEN** the operator raises Sentences per provider and re-runs
- **THEN** each provider is queried again for that many candidates, as a fresh lookup

### Requirement: The part-of-speech field offers provider-sourced suggestions
The system SHALL provide a suggest control next to the note's part-of-speech
field, following the same combined toggle + live editable shared query
pattern used by the transcription, translations, audio and inflections
controls, defaulting its query to the note's `lemma` and falling back to
`text`. Applying a suggested part of speech SHALL replace whatever value the
field currently holds.

#### Scenario: Suggesting a part of speech for a note that has none
- **WHEN** the operator opens the part-of-speech suggest control on a note
  with no part of speech, and the provider reports one
- **THEN** the reported value is offered, and applying it sets the note's
  part of speech

#### Scenario: Explicitly replacing an existing part of speech
- **WHEN** the note already has a part of speech, and the operator opens the
  part-of-speech suggest control and applies a different reported value
- **THEN** the note's part of speech is replaced with the applied value

#### Scenario: The provider's answer disagrees with the note
- **WHEN** the provider reports a part of speech different from the one the
  note already carries
- **THEN** both are shown, so the operator sees the disagreement before
  choosing

#### Scenario: No lookup without an explicit action
- **WHEN** the operator edits the note's `text` or `lemma`
- **THEN** no part-of-speech lookup is fired until the operator opens the
  control or presses a retry

### Requirement: A reported word class outside the supported set is shown but not offered
The system SHALL display a provider's reported word class even when it has
no equivalent among the parts of speech the system supports, and SHALL NOT
offer to apply a value outside that set.

#### Scenario: A pronoun or determiner
- **WHEN** the provider reports a word class that the system has no
  equivalent for
- **THEN** the reported class is shown as the provider's own answer, with no
  action offered to apply it

#### Scenario: A word class with a direct equivalent
- **WHEN** the provider reports a word class that maps onto one of the
  supported parts of speech
- **THEN** the mapped value is offered for applying

### Requirement: Translation candidates are tagged by language and always add a row
The system SHALL query each of the operator's configured target languages
using **that language's own provider order**. The translations sheet SHALL be
grouped by language: one group per target language, inside it one box per
provider in that language's order, listing only that language's candidates.
Every candidate SHALL carry a tag naming its language. Target languages come
only from Settings. The sheet SHALL NOT offer its own control for adding a
language.

A provider value containing `/` SHALL be offered as separate alternative
candidates, one per part, whether or not the slash has spaces around it. Each
part SHALL be trimmed; a part that is empty after trimming SHALL be dropped,
and a value that yields no part SHALL be offered unchanged. Duplicate parts
within one provider's answer SHALL collapse to one candidate.

Using a translation candidate SHALL always add a new translation row with
that candidate's language and text. It SHALL NEVER extend an existing row's
text. No merge-mode preference exists.

#### Scenario: Candidates carry their language
- **GIVEN** Settings lists target languages en and de
- **WHEN** the operator opens the translations sheet
- **THEN** the sheet has an en group and a de group, each listing its providers' candidates tagged with its language

#### Scenario: Each language uses its own provider order
- **GIVEN** en lists `dictcc` before `google`, and de lists `google` before `dictcc`
- **WHEN** the operator opens the translations sheet
- **THEN** the en group's first box is `dictcc` and the de group's first box is `google`

#### Scenario: A slash without spaces is two candidates
- **WHEN** a provider answers `"hurry/rush"` for English
- **THEN** the sheet offers `"hurry"` and `"rush"` as two separate English candidates, and offers no candidate reading `"hurry/rush"`

#### Scenario: A slash with spaces is two candidates
- **WHEN** a provider answers `"hurry / rush"` for English
- **THEN** the sheet offers `"hurry"` and `"rush"` as two separate English candidates

#### Scenario: Using a second translation for the same language
- **WHEN** the note already has the English translation "get going" and the operator uses the English candidate "get under way"
- **THEN** a second English row "get under way" is added and the first row still reads exactly "get going"

#### Scenario: No slash-joined text is ever produced
- **WHEN** the operator uses any number of translation candidates
- **THEN** no translation row's text contains a slash that the operator did not type

### Requirement: forvo and filmot are external links, not inputs
The audio sheet SHALL list forvo and filmot only as small "Open elsewhere"
links at its bottom:
- in their Settings order
- each opening the provider's search for the current query in a new tab

Neither SHALL show an input field.

#### Scenario: External links at the bottom
- **WHEN** the audio sheet opens
- **THEN** the pygmalion and dict_cc boxes come first, and forvo and filmot appear below them as links with no input fields
