## ADDED Requirements

### Requirement: A read-only operator page for progress
The system SHALL provide an operator-facing `hub` page showing an account's
progress, with no write actions — the page only ever reads `userdata`,
`userdata_history`, and `card_content`.

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

### Requirement: The per-card progress table shows each card's N content, never E
The system SHALL display, for each entry in the account's per-card progress
list, the card's `N` field (joined from `card_content`) as its content
preview, regardless of which occurrence side that row represents, and SHALL
NOT display the card's `E` field in this column.

#### Scenario: Viewing a row for an E-side occurrence
- **WHEN** the operator views a per-card progress row whose Side is `E`
- **THEN** the Content column still shows that card's `N` text, not its `E`
  text

#### Scenario: Viewing per-card progress generally
- **WHEN** the operator views the per-card progress table
- **THEN** each row shows readable `N` content (e.g. a word, phrase, or
  question) alongside its id, so the operator can tell what the card is
  about without navigating elsewhere

### Requirement: The occurrence direction field is labeled correctly
The system SHALL label the per-card table's occurrence-direction column by
what it represents (e.g. "Side"), and SHALL NOT label it "language" or
otherwise imply it names a spoken language.

#### Scenario: Reading the per-card table
- **WHEN** the operator reads the per-card progress table's column headers
- **THEN** the direction column is labeled in a way that does not suggest
  it holds a language

### Requirement: Sync history is shown as deltas, not raw documents
The system SHALL render `userdata_history` entries as a summary of what
changed relative to the previous entry (e.g. session count, card count),
with the full stored document available on demand rather than shown by
default.

#### Scenario: Viewing sync history
- **WHEN** the operator views the sync history panel
- **THEN** each entry shows a short summary of what changed, and the full
  underlying document is reachable only by explicitly expanding that entry
