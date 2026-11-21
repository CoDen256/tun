# notes-browser

## Purpose

TBD — defines the operator-facing, full-status notes list (draft and ready
alike), distinct from `notes-read-api`'s public ready-only endpoint, with
each row linking directly into the note editor.

## Requirements

### Requirement: Notes of every status are browsable, filterable, sortable, and searchable
The operator-only notes browser SHALL list notes of every status, with
filters, a sort, and a text search over text, lemma and translations.

The listing SHALL be **paged by the server**: the request SHALL carry a
page size and an offset, and the response SHALL carry both the page's rows
and the **total** number of rows matching the filters. The browser SHALL
show which slice of that total is displayed, and SHALL offer page
navigation and a page-size choice.

The listing SHALL NOT return every matching row in one response.

Status and the presence of audio SHALL be shown as compact indicators with
accessible descriptions rather than as full-width text columns, so the
note's text keeps the available width and the table does not overflow its
container.

This requirement governs the operator-only authoring listing only. The
one-directional read API that external consumers pull from (`notes-read-api`)
is a separate route and SHALL NOT be paged, filtered or reshaped by this
requirement.

#### Scenario: A page and its total
- **GIVEN** 312 notes match the current filters and the page size is 20
- **WHEN** the third page is requested
- **THEN** 20 rows are returned
- **AND** the browser shows that these are rows 41 to 60 of 312

#### Scenario: The last page is partial
- **GIVEN** 312 matching notes and a page size of 50
- **WHEN** the last page is requested
- **THEN** 12 rows are returned and the browser shows 301 to 312 of 312

#### Scenario: Filtering resets to the first page
- **GIVEN** the browser is on page three
- **WHEN** a filter is changed
- **THEN** the first page of the new result set is shown, with its own total

#### Scenario: Status and audio are compact
- **WHEN** the listing is shown
- **THEN** each row's status and audio presence are single indicators carrying an accessible description
- **AND** the table does not scroll horizontally at a typical desktop width

#### Scenario: The read API is unaffected
- **WHEN** the read API is called with its existing parameters
- **THEN** it returns every matching note as before, with no paging and no change of shape

### Requirement: Each row links directly to the note's editor
The system SHALL make every note in the list directly openable for editing,
with no requirement that the operator know or look up the note's id.

#### Scenario: Opening a note from the list
- **WHEN** the operator clicks a row in the notes list
- **THEN** that note's editor opens, with no id entry required

### Requirement: The notes browser can be filtered by origin
The system SHALL provide an origin filter in the notes browser alongside its
existing status and type filters, offering every permitted origin value plus
an unfiltered default, so the operator can separate hand-authored work from
imported and captured notes.

#### Scenario: Finding one's own authored notes among imported ones
- **WHEN** the operator filters the notes browser to `origin=manual` while
  the database also contains thousands of imported notes
- **THEN** only hand-authored notes are listed

#### Scenario: Reviewing an import
- **WHEN** the operator filters to `origin=import` and `status=draft`
- **THEN** only imported notes still awaiting review are listed

#### Scenario: Default view
- **WHEN** the notes browser is opened with no origin filter chosen
- **THEN** notes of every origin are listed

### Requirement: A note's origin is shown but never offered for editing
The system SHALL display a note's origin in the editor as read-only
information, and SHALL NOT present it as an editable form control, since
origin cannot be changed after creation.

#### Scenario: Viewing an imported note
- **WHEN** the operator opens a note with `origin=import` in the editor
- **THEN** its origin is shown, identifying the source it was imported
  from, with no control that would suggest it can be changed

#### Scenario: Viewing a hand-authored note
- **WHEN** the operator opens a note with `origin=manual` in the editor
- **THEN** its origin is shown as manual, with no editable control

### Requirement: The notes list has rich filters and sorts
The notes browser SHALL filter, server-side and combinable, by:
- status (any, draft, ready)
- type (any subset)
- part of speech (any subset of the supported classes)
- origin (any subset of manual, capture, import)
- audio (any, has audio, no audio)
- missing fields (any subset of: no IPA, no translation, no examples, no
  lemma)
- updated within (any time, today, this week, this month)

It SHALL sort by:
- recently updated
- recently created
- text A–Z
- least complete first, where completeness counts the same applicable
  fields as the editor's done-markers

The text search, paging and total from the existing browsing requirement
apply on top of these filters.

Every active filter SHALL be shown as a removable chip, plus "Clear all".
The result count SHALL update with every change.

The layout differs by width:
- **Phone:** one "Filters" button with an active-count badge opens a filter
  sheet whose primary button reads "Show N notes". Rows are stacked: the
  headword, audio and status glyphs on the right, and one dim line of type ·
  part of speech · first translation · updated.
- **Desktop:** a bar of filter buttons with custom menus and a sort menu,
  above a table with columns Text, Type, Part of speech, Translation, Origin,
  Status, Audio, Complete, Updated.

"Triage these" SHALL open the belt over exactly the current filtered set.

#### Scenario: Adjectives without audio
- **WHEN** the operator filters part of speech = adjektiv and audio = no audio
- **THEN** only adjectives without audio are listed, two removable chips show the filters, and the count matches the rows' total

#### Scenario: Least complete first
- **WHEN** the operator sorts by least complete
- **THEN** a note missing IPA, translations and examples is listed before a fully filled note

#### Scenario: Phone filter sheet
- **WHEN** at 390 px the operator opens Filters, picks verb, and presses "Show N notes"
- **THEN** the sheet closes, a "verb" chip is shown above the list, and N rows' worth of results are in the paged total
