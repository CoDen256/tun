# userdata-console

## Purpose

A read-only operator console for inspecting account progress and sync
history, backed directly by `userdata`, `userdata_history`, `card_content`,
and the currently published bundle. Account-only: no device concept (see
D126).

## Requirements

### Requirement: A read-only operator page for progress
The system SHALL provide an operator-facing `hub` page showing an account's
progress, with no write actions — the page only ever reads `userdata`,
`userdata_history`, `card_content`, and the currently published bundle.

Note (D126): this requirement originally also covered a device's OTA/audio
state, read from a `device_state` table keyed by a separate, locally-
generated device id. That table and its data never actually populated in
production (the device side never sent the fields it needed) and was
removed entirely rather than finished — see `tun/docs/07-decisions.md`
D126. The page today is account-only: one selector (`uid`), no device
concept.

#### Scenario: Viewing the page
- **WHEN** the operator opens the page
- **THEN** they see the currently-selected account's progress, with no
  controls that modify it

#### Scenario: Reading the published bundle
- **WHEN** the page resolves card content from the published bundle
- **THEN** it only reads that bundle, never writes to it or triggers a publish

### Requirement: The per-card progress table is paged
The system SHALL render the per-card progress table one page at a time, with
an operator-selectable page size, and SHALL NOT emit every occurrence of an
account in a single response.

#### Scenario: Viewing an account with thousands of occurrences
- **WHEN** the operator opens the page for an account holding 4,510
  occurrences
- **THEN** only the current page of rows is present in the response, together
  with the total match count and controls to reach any other page

#### Scenario: Opening the page with no parameters
- **WHEN** the operator opens the page with no paging or filter parameters
- **THEN** the first page is shown in the device's own `totalCards` array
  order, which is its presentation order

### Requirement: The per-card progress table is sortable and filterable
The system SHALL let the operator sort the table by any displayed scalar
column and filter it by deck, occurrence side, state, and a text query over
card id and card content, with the total count reflecting the active filters.

#### Scenario: Filtering to one deck
- **WHEN** the operator filters to a single deck
- **THEN** only that deck's occurrences are listed, and the reported total is
  the number of occurrences in that deck, not in the account

#### Scenario: Sorting by a column with repeated values
- **WHEN** the operator sorts by a column in which many rows share a value
- **THEN** the order is stable across pages, so no occurrence is shown twice
  or skipped while paging

#### Scenario: An unrecognised filter value arrives in the query string
- **WHEN** the page is requested with a filter value outside the supported set
- **THEN** that filter is ignored and the page renders, rather than erroring

### Requirement: The per-card progress table shows each card's N content, never E
The system SHALL display, for each entry in the account's per-card progress
list, the card's `N` field as its content preview, regardless of which
occurrence side that row represents, and SHALL NOT display the card's `E`
field in this column.

The content source is `card_content` for hub-minted cards and the currently
published bundle's card-content data otherwise (see "Card content is resolved
for stock cards"). Previously this requirement named `card_content` as the
only source, which left every stock card's content blank in practice.

#### Scenario: Viewing a row for an E-side occurrence
- **WHEN** the operator views a per-card progress row whose Side is `E`
- **THEN** the Content column still shows that card's `N` text, not its `E`
  text

#### Scenario: Viewing per-card progress generally
- **WHEN** the operator views the per-card progress table
- **THEN** each row shows readable `N` content (e.g. a word, phrase, or
  question) alongside its id, so the operator can tell what the card is
  about without navigating elsewhere

### Requirement: Card content is resolved for stock cards
The system SHALL resolve each occurrence's card content from the currently
published bundle's own card-content data when the card is not present in
`card_content`, so that occurrences of stock cards display readable content
rather than blank.

#### Scenario: Viewing occurrences of stock cards
- **WHEN** the operator views occurrences whose card ids exist only in the
  published bundle and not in `card_slots`
- **THEN** each row shows that card's content text

#### Scenario: The published bundle cannot be read
- **WHEN** the published bundle is missing or cannot be parsed
- **THEN** the page still renders with its other columns intact, the content
  column is blank, and the page states why

#### Scenario: A card exists in both the database and the bundle
- **WHEN** an occurrence's card is present in `card_content`
- **THEN** the database value is displayed, since it may be newer than the
  last publish

### Requirement: The occurrence direction field is labeled correctly
The system SHALL label the per-card table's occurrence-direction column by
what it represents (e.g. "Side"), and SHALL NOT label it "language" or
otherwise imply it names a spoken language.

#### Scenario: Reading the per-card table
- **WHEN** the operator reads the per-card progress table's column headers
- **THEN** the direction column is labeled in a way that does not suggest
  it holds a language

### Requirement: Each occurrence's interval, next-due date and flags are shown
The system SHALL display, for each occurrence, its current review interval in
days, its next-due date, its reschedule count, and whether the app has flagged
it as difficult or recorded a panic grade against it.

#### Scenario: Viewing an occurrence that is in rotation
- **WHEN** the operator views an occurrence the app will still show
- **THEN** its interval in days and its next-due date are both displayed

#### Scenario: Viewing an occurrence the app has flagged
- **WHEN** an occurrence carries the app's difficulty flag or a panic record
- **THEN** that is visible on the row

### Requirement: An occurrence's state is labeled by what the app does with it
The system SHALL label each occurrence by whether the app will show it again
and, when it will not, by whether it was retired on reaching its deck's
interval ceiling or parked before ever reaching one. The system SHALL NOT
describe a parked-before-ceiling occurrence as manually archived, since the
stored record does not distinguish an operator action from an automatic one.

#### Scenario: Viewing a retired occurrence
- **WHEN** the operator views an occurrence retired at its deck's ceiling
- **THEN** it is labeled as retired at the ceiling, distinctly from one parked
  before reaching a ceiling

#### Scenario: Viewing an occurrence parked before any ceiling
- **WHEN** the operator views an occurrence parked without ever reaching its
  deck's ceiling
- **THEN** it is labeled descriptively, without asserting who or what parked it

### Requirement: Sync history is shown as deltas, not raw documents
The system SHALL render `userdata_history` entries as a summary of what
changed relative to the previous entry (e.g. session count, card count),
with the full stored document available on demand rather than shown by
default.

#### Scenario: Viewing sync history
- **WHEN** the operator views the sync history panel
- **THEN** each entry shows a short summary of what changed, and the full
  underlying document is reachable only by explicitly expanding that entry

### Requirement: Stored documents are fetched on demand, not inlined
The system SHALL NOT embed the full stored `userdata` document, or the full
document of any `userdata_history` entry, in the page's own response, and
SHALL instead make each available through a separate read-only request.

#### Scenario: Viewing the page for an account with a large document
- **WHEN** the operator opens the page for an account whose document is
  megabytes in size
- **THEN** the response contains no copy of that document, and the page's size
  is independent of the number of history entries shown

#### Scenario: Expanding a history entry's raw document
- **WHEN** the operator expands a history entry's raw document
- **THEN** that entry's stored document is fetched and displayed
