# Spec Delta — note-editor-surface

## Purpose
The single note editor that stabbur shows in triage, note detail and new
note: its phone and desktop layouts, the context-specific pinned action bar,
the per-field suggestion sheet, the custom controls and the visual language.
The look and interaction reference is `mockups/stabbur-editor-redesign.html`
in the change that introduced this capability.

## ADDED Requirements

### Requirement: One editor serves triage, note detail and new note
The system SHALL render the same editor, with the same fields, in all three
contexts:
- the triage belt
- a note opened from the Notes list
- New note

The fields are: text (headword), type, part of speech, lemma, inflections,
audio, IPA transcription, translations, examples and grammar rule.

The contexts SHALL differ only in:
- the pinned action bar
- the queue belt (triage only)
- what saving and the verdicts do

#### Scenario: Same fields everywhere
- **WHEN** the operator opens a note in triage, then the same note from the Notes list, then starts a New note
- **THEN** all three show the identical set of fields, in the identical order and layout

### Requirement: The headword leads the editor and carries the type
The editor SHALL show the note's text as a large, editable, wrapping
headword. It SHALL NOT show an IPA subtitle under it.

The note's type SHALL be a small pill control:
- on desktop, on the headword row
- on the phone, on the meta line directly above the headword

The pill opens a menu of the five types. The meta line SHALL show status,
part of speech and, when similar notes exist, a "N similar" control.

#### Scenario: Changing type from the pill
- **WHEN** the operator opens the type pill and picks "expression"
- **THEN** the pill reads "expression" and no separate type field exists anywhere in the sections

#### Scenario: No IPA under the headword
- **WHEN** a note with a transcription is shown
- **THEN** the transcription appears only in the Sound section's IPA field, not under the headword

### Requirement: On a phone the editor is four tabs with done-markers
At phone width the editor SHALL present four segmented tabs, sticky under
the headword:
- **Word:** part of speech, lemma, inflections.
- **Sound:** audio, IPA.
- **Meaning:** translations, examples.
- **Grammar:** grammar rule. Visually de-emphasised unless the note's type is
  grammar, and marked optional.

Each tab SHALL carry a marker:
- a filled dot when every applicable field in it is filled
- otherwise `filled/applicable` (e.g. `1/2`)
- Grammar, on a non-grammar note, shows a dashed ring (optional), or a filled
  dot when a rule is linked

Inflections count as applicable only when the part of speech has a
paradigm.

#### Scenario: Marker updates live
- **GIVEN** the Meaning tab shows `1/2` because the note has translations but no examples
- **WHEN** the operator adds an example
- **THEN** the Meaning marker becomes a filled dot without leaving the tab

#### Scenario: Grammar is optional on a word
- **WHEN** a note of type word without a rule is shown on a phone
- **THEN** the Grammar tab is greyed and carries a dashed-ring marker

### Requirement: On desktop the editor shows everything at once, without tabs
At desktop width the editor SHALL NOT use tabs. It SHALL show:
- the headword band, with meta and similar notes on one line above it
- three columns (Word | Sound | Meaning), separated by hairlines, each headed
  by its name and done-marker
- Grammar as a single line below them: the rule control, "optional" unless
  the type is grammar, and the rendered rule explanation when one is linked

#### Scenario: All sections in one look
- **WHEN** a note is opened at 1440 px width
- **THEN** part of speech, lemma, inflections, audio, IPA, translations and examples are all visible without switching any tab

### Requirement: The pinned action bar depends on the context
The editor SHALL keep a bar pinned to the bottom of the viewport in every
context, its position independent of the note's length.

| context | desktop | phone |
|---|---|---|
| triage | Delete, Skip, Previous, ⋯, Prefill, "Ready & next" | Delete, Previous, ⋯, Prefill (icon only), "Ready & next"; Skip is in ⋯ |
| note | Back, Draft/Ready switch, Duplicate, ⋯, Prefill, Save | Back, Draft/Ready, ⋯, Prefill (icon), Save; Duplicate is in ⋯ |
| new note | Prefill, Save draft, Save as ready | same, Prefill icon only |

Menu contents:
- The triage ⋯ menu SHALL hold Duplicate note, Send to back and Save, plus
  Skip on the phone.
- The note ⋯ menu SHALL hold Duplicate note and Delete note.

Save behaviour:
- In the note context, Save SHALL read "Saved" while there are no unsaved
  edits.
- Save SHALL show a dirty marker while there are unsaved edits.

Delete SHALL ask for confirmation in-page, never through a browser dialog.

On desktop the triage keys SHALL keep working:
- D — delete
- S — skip
- T — previous
- R — ready & next
- E — send to back
- M — save
- L — prefill

Their hints SHALL show on desktop only.

#### Scenario: Prefill is one tap away on a phone
- **WHEN** triage is open at 390 px width
- **THEN** the bar shows an icon-only Prefill button next to "Ready & next", and Skip is reachable only from ⋯

#### Scenario: Ready & next is never clipped
- **WHEN** triage is open at 390 px width
- **THEN** the "Ready & next" label is fully visible inside its button

### Requirement: Each field opens one suggestion sheet
Every field with providers SHALL show exactly one suggest button. When
candidates exist, the button SHALL carry a badge with the candidate count.
The fields are part of speech, inflections, audio, IPA, translations,
examples, and text-from-audio beside the headword.

The button SHALL open that field's sheet:
- on a phone, a bottom sheet
- on desktop, a right-side drawer

The sheet SHALL show:
- an editable shared query and a rerun-all control
- one box per enabled provider, in the operator's Settings order

Each provider box SHALL show:
- its position number and name
- a "query" control that reveals a provider-only query, with Reset and a
  rerun for that provider only
- its result count
- its candidates, or "Nothing for '<query>'"

The footer SHALL say that the order follows Settings and how many providers
are switched off.

The old inline toggle, query input and rerun strip under each field SHALL
NOT exist.

#### Scenario: Provider order follows Settings even without prefill
- **GIVEN** the translation provider order in Settings is glosbe, dict_cc, deepl, and prefill is set to on demand
- **WHEN** the operator opens the translations sheet without prefilling
- **THEN** the boxes appear as 1 glosbe, 2 dict_cc, 3 deepl

#### Scenario: A provider-only query
- **WHEN** the operator opens dict_cc's query control, types "komme", and reruns dict_cc
- **THEN** dict_cc's header shows the custom query, only dict_cc reruns, and the other providers keep the shared query

#### Scenario: The sheet does not reopen on interaction
- **GIVEN** a sheet is open and scrolled halfway
- **WHEN** the operator clicks Use, a take toggle, or a provider query control inside it
- **THEN** the sheet does not replay its opening animation and keeps its scroll position

### Requirement: Candidates show a part-of-speech tag rather than groups
Translation and audio candidates matching the note's part of speech SHALL be
listed first within their provider box, each carrying a small tag with the
part of speech's short name. There SHALL be no "matching" or "other" group
headers.

Audio candidates SHALL show:
- a play button
- the provider's context string and the duration
- never a voice or speaker name

#### Scenario: Tagged, not grouped
- **GIVEN** a note with part of speech adjektiv and dict_cc audio candidates tagged [adj] and [verb]
- **WHEN** the audio sheet opens
- **THEN** the [adj] row is first and carries an "adj" tag, the [verb] row follows untagged, and no group heading is shown

### Requirement: Inflection and example candidates are readable
An inflection candidate SHALL render as a two-column table of form name →
value, with the provider's context line below it.

An example candidate SHALL show the sentence with the provider's context
line below it, as translation candidates do.

#### Scenario: Paradigm as a table
- **WHEN** the inflections sheet shows an ordbokene candidate for "bil"
- **THEN** it reads as rows "ubestemt entall → en bil", "bestemt entall → bilen" and so on, not as one dot-joined string

### Requirement: All choice controls are custom, not native selects
Part of speech, translation language, grammar rule, the triage queue, the
type pill, and the Notes filters and sort SHALL open custom menus in the
editor's visual language. No native `<select>` element SHALL be used in
stabbur's UI.

The part-of-speech menu SHALL list "—", the six supported classes, and
"custom…". Choosing "custom…" turns the field into a free-text input.

#### Scenario: Custom part of speech
- **WHEN** the operator opens the part-of-speech control and chooses "custom…"
- **THEN** a text input appears in its place, and whatever is typed is stored as the part of speech

### Requirement: Labels, values and headings are visually distinct
Visual treatment:
- Field labels SHALL be small, uppercase, letter-spaced and grey.
- Section headings SHALL use the headword face.
- Every operator-entered value SHALL be drawn in the configured value
  colour. This covers inputs, the chosen menu values and translation
  language chips.

The editor SHALL follow the visual language in the reference mockup:
- cool neutral grounds with a dark pair
- one cobalt accent for actions
- hairline separators instead of boxed panels
- underlined inputs

#### Scenario: Value colour applies everywhere a value is shown
- **GIVEN** the value colour is set to teal
- **WHEN** any editor page is shown
- **THEN** the lemma, IPA, inflection, translation and example values and the chosen part of speech are teal, while labels stay grey
