# Spec Delta — note-editor-surface

## MODIFIED Requirements

### Requirement: All choice controls are custom, not native selects
Every choice control in the editor and its surfaces SHALL be a custom
dropdown, never a native `<select>`: the part of speech (with a "custom…"
entry that reveals a free-text field), the type pill, a translation row's
language, the grammar rule link, the triage queue selector, and the notes
browser's filters and sort.

An open dropdown SHALL close when the page is scrolled, when the operator
chooses a value, when they click outside it, and on Escape. A re-render
SHALL NOT close it: re-rendering restores the page to the scroll position it
already had, which is not a scroll by the operator. A dropdown SHALL
therefore open and stay open wherever the page is scrolled to.

#### Scenario: No native selects
- **WHEN** any choice control in the editor is inspected
- **THEN** it is a button that opens a custom listbox, and no `<select>` element exists

#### Scenario: Part of speech outside the six
- **WHEN** the operator picks "custom…" in the part-of-speech dropdown
- **THEN** a free-text field appears, focused, and what is typed becomes the part of speech

#### Scenario: Opening a dropdown on a scrolled page
- **GIVEN** the editor is scrolled down far enough that a control sits below the fold
- **WHEN** the operator opens that control's dropdown
- **THEN** the dropdown is visible and stays open until they choose, click away, scroll, or press Escape

#### Scenario: Changing a manually added translation's language
- **GIVEN** the operator has just pressed "+ Add translation" on a note whose editor is scrolled down
- **WHEN** they open the new row's language dropdown and choose a different language
- **THEN** the dropdown opened, and that row's language is the chosen one

### Requirement: Each field opens one suggestion sheet
Each field's ✨ control SHALL open a bottom sheet for that field's kind, and
the editor SHALL carry no inline suggest toggle, no inline query input and no
inline per-provider rerun control.

The ✨ control SHALL carry a count badge of the candidates currently held for
that field. The system SHALL NOT look candidates up in order to show a badge:
a badge appears only once an explicit operator action — a Prefill, a Force
prefill, or opening that field's sheet — has fetched candidates for the note
on screen. A field whose sheet has never been opened on this note and which
no prefill has reached SHALL show no badge.

A sheet SHALL animate only when it opens. Re-rendering it — on a scroll,
a click inside it, or an answer arriving — SHALL NOT replay the animation or
reset its scroll position.

#### Scenario: A sheet per field
- **WHEN** the operator presses the ✨ control beside any suggestible field
- **THEN** a bottom sheet for that kind opens, and no inline suggest controls exist in the field itself

#### Scenario: No badge before an explicit action
- **GIVEN** a note opened from the Notes list, with no prefill run and no sheet opened
- **WHEN** the operator looks at the ✨ controls
- **THEN** none of them shows a count badge, and no lookup has been requested

#### Scenario: A badge after prefill
- **GIVEN** the same note
- **WHEN** the operator presses Prefill and it completes
- **THEN** the ✨ controls of the fields whose providers answered show their candidate counts

#### Scenario: A badge after opening a sheet
- **GIVEN** the same note with no prefill run
- **WHEN** the operator opens one field's sheet and its providers answer, then closes it
- **THEN** that field's ✨ control shows a count and the other fields' controls still show none

#### Scenario: A sheet does not replay its animation
- **WHEN** the operator scrolls a sheet and clicks a control inside it
- **THEN** the sheet stays where it was scrolled to and does not re-animate

### Requirement: The pinned action bar depends on the context
The editor SHALL carry one pinned bar whose contents depend on its context.

- **Triage:** Delete, Skip, Previous, ⋯, Prefill, "Ready & next". On a phone
  Skip moves into the ⋯ tray and Prefill is icon-only. The ⋯ tray carries
  Duplicate note, Send to back, Save and Force prefill.
- **Note detail:** back to Notes, a Draft/Ready segmented control, Duplicate
  (desktop), ⋯, Prefill, Save. The ⋯ tray carries Duplicate note (phone),
  Force prefill and Delete note.
- **New note:** Prefill, "Save draft", "Save as ready". It has no ⋯ tray.

Prefill SHALL fill only fields that are empty. Force prefill SHALL overwrite
fields that already hold a value, and SHALL be labelled so that consequence
is readable before it is pressed.

#### Scenario: Triage bar
- **WHEN** the operator opens the triage belt
- **THEN** the pinned bar is Delete, Previous, ⋯, Prefill and "Ready & next", with Skip, Duplicate note, Send to back, Save and Force prefill reachable

#### Scenario: Force prefill overwrites
- **GIVEN** a note whose IPA and translations already hold values
- **WHEN** the operator chooses Force prefill from the ⋯ tray and it completes
- **THEN** those fields hold the providers' values, replacing what was there

#### Scenario: Prefill still fills only gaps
- **GIVEN** the same note
- **WHEN** the operator presses Prefill instead
- **THEN** the fields that already held values are unchanged

### Requirement: One editor serves triage, note detail and new note
One editor component SHALL serve the triage belt, a note opened from the
Notes list, and New note. The field set SHALL be identical in all three.
Only the pinned action bar and the belt header differ by context.

On opening a note in any of the three contexts, the system SHALL derive the
lemma from the note's text when the lemma is empty or still equal to the raw
text, exactly as the triage belt does — so that lemma-queried lookups
(inflections, part of speech) have a query without the operator having to
retype the text first.

#### Scenario: The same fields everywhere
- **WHEN** the operator opens the same note from the triage belt and from the Notes list
- **THEN** both show the same fields with the same values, differing only in the pinned bar

#### Scenario: Lemma on opening from the Notes list
- **GIVEN** a note with `text = "legge til"` and no lemma
- **WHEN** the operator opens it from the Notes list
- **THEN** the lemma field reads `"legge"` before anything is typed, and Prefill runs without the operator editing the text

## ADDED Requirements

### Requirement: An audio file can be dropped onto the editor
The editor SHALL accept an audio file dragged onto it, in all three
contexts, and attach it to the note exactly as the Upload file control does.

While a drag carrying files is over the editor, the system SHALL show what
dropping will do. A dropped file that is not audio SHALL be refused with a
readable message and SHALL NOT change the note's audio. A dropped audio file
SHALL replace the note's current recording and clear its trim selection, as
an upload does.

#### Scenario: Dropping an audio file
- **WHEN** the operator drags an mp3 from their file manager onto the editor and drops it
- **THEN** the file uploads and the note's audio is that recording, playable from the waveform

#### Scenario: The drop target is visible
- **WHEN** a dragged file is over the editor
- **THEN** the editor shows a drop indicator naming what will happen

#### Scenario: A non-audio file is refused
- **WHEN** the operator drops a PDF onto the editor
- **THEN** a message says the file is not audio and the note's audio is unchanged

### Requirement: Similar notes are highlighted, not whispered
When a note on screen has similar notes, the editor SHALL present the count
as a filled, accent-coloured badge rather than a quiet outline — on the
phone's meta line and at the head of the desktop's similar line — so that it
reads as something to act on.

The badge SHALL be rendered only when there is at least one match.

#### Scenario: A note with matches
- **WHEN** the operator opens a note that has two similar notes
- **THEN** a filled accent badge reading "2 similar" is visible without scrolling, and opens the similar sheet

#### Scenario: A note with no matches
- **WHEN** the operator opens a note with no similar notes
- **THEN** no badge is rendered
