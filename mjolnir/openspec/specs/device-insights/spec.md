# device-insights

## Purpose

An analytical, read-only operator view over a single account's progress
snapshot, alongside — never replacing — the mirror view that
`userdata-console` provides. It exists to answer questions that span the whole
library: what is due and when, why four fifths of the library is archived, when
the account was actually studied, and how much content is left to draw.

Account-only, one account at a time, same as `userdata-console` (D126).

## Requirements

### Requirement: A separate analytical page, not a replacement
The system SHALL provide the analytical view as its own operator page, reachable
alongside the existing progress mirror, and SHALL leave the mirror's own
panels, columns and behaviour unchanged.

#### Scenario: Reaching the analytical view
- **WHEN** the operator opens the Device section of the console
- **THEN** both the progress mirror and the analytical view are reachable, each
  as its own page

#### Scenario: Viewing the progress mirror after this change
- **WHEN** the operator opens the progress mirror
- **THEN** it shows what it showed before, with nothing removed or restyled

### Requirement: The page is read-only
The system SHALL NOT offer any control on the analytical page that modifies an
account's progress, a deck's configuration, or any published artefact, even
where the page identifies such a setting as the cause of what it displays.

#### Scenario: Viewing a panel that names a deck setting as a cause
- **WHEN** a panel explains an outcome in terms of a deck's interval ceiling or
  retirement threshold
- **THEN** it states the relationship without offering to change the setting

### Requirement: The review forecast covers only occurrences the app will show
The system SHALL build the review forecast from each occurrence's stored
next-due timestamp, and SHALL include only occurrences that are in rotation.
Archived occurrences SHALL be excluded even when they carry a future next-due
timestamp, because the app never presents them.

#### Scenario: An account whose archive carries past-due timestamps
- **WHEN** the account holds thousands of archived occurrences whose stored
  next-due timestamp is in the past
- **THEN** none of them appear in the forecast, and in particular none are
  counted as due today

#### Scenario: An archived occurrence dated in the future
- **WHEN** an archived occurrence's next-due timestamp falls within the
  forecast window
- **THEN** it is still excluded from the forecast

#### Scenario: An occurrence in rotation that is past due
- **WHEN** an occurrence in rotation is past its next-due date
- **THEN** it is shown as due now, and the forecast says how many such
  occurrences it includes

### Requirement: A reviewable history is reconstructed, and labeled as a floor
The system SHALL reconstruct each occurrence's most recent review date from its
stored next-due timestamp and its stored interval, and SHALL present the
resulting day-by-day history together with a statement that it is a lower bound
on activity rather than a count of it.

#### Scenario: Viewing the reconstructed history
- **WHEN** the operator views the study history
- **THEN** each day shows how many occurrences were *last* reviewed that day,
  and the page states that a card reviewed twice appears only on the later day

#### Scenario: A day with no occurrences attributed to it
- **WHEN** a day inside the covered span has no occurrences attributed to it
- **THEN** the page does not present that as a day without study

### Requirement: The page states the app's own retirement and flagging rules
The system SHALL explain, on the page, the rules by which the app retires an
occurrence and flags it as difficult, in terms of the stored fields that drive
them, so that every state label and flag shown elsewhere on the page is
interpretable without external documentation.

#### Scenario: Encountering a state label for the first time
- **WHEN** the operator reads a state label or flag anywhere on the page
- **THEN** the page itself defines what it means and what causes it

#### Scenario: A state whose cause the stored record does not determine
- **WHEN** a state's cause cannot be determined from the stored record
- **THEN** the page describes the state without asserting a cause, and lists it
  among what is unresolved

### Requirement: Deck metadata comes from the authoritative source for each deck
The system SHALL read stock deck metadata from the currently published bundle
and hub-managed deck metadata from the `decks` table, and SHALL NOT present a
deck that exists only in a stale local copy of a bundle as a real deck.

#### Scenario: Deck families have been consolidated
- **WHEN** deck codes that existed in an earlier bundle no longer exist in
  `decks`
- **THEN** those codes do not appear as decks

#### Scenario: A hub-managed deck has content published but never drawn
- **WHEN** a hub-managed deck has published occurrences but no entry in the
  account's pull state
- **THEN** it is shown with its published count and as not yet drawn

### Requirement: Selecting in one panel narrows the whole page
The system SHALL maintain a single selection shared by every panel, so that
selecting a deck, an interval, or an occurrence group in any panel narrows every
other panel and the occurrence table to the same selection, and SHALL show what
the active selection is and how many occurrences it matches.

#### Scenario: Selecting a deck from a chart
- **WHEN** the operator selects a deck in any panel
- **THEN** every other panel and the table reflect only that deck, and the
  active selection and its match count are displayed

#### Scenario: Clearing the selection
- **WHEN** the operator clears the selection
- **THEN** every panel returns to the full account

### Requirement: The page reports its own provenance and limits
The system SHALL state, on the page, where its figures come from, which of them
correct previously-documented field semantics, which stored fields are
unreliable for this account, and which analyses are not possible from the
available data.

#### Scenario: A stored field is invalid after a restore
- **WHEN** a document-level field holds a value produced by a restore rather
  than by study
- **THEN** the page does not present it as a fact, and says why

#### Scenario: An analysis requires history the account does not have
- **WHEN** an analysis would require more than one stored history entry
- **THEN** the page states that it is unavailable and what it would need,
  rather than omitting it silently

### Requirement: The page carries no external runtime dependency
The system SHALL serve every asset the page needs from `hub` itself, with no
request to any external host at render time.

#### Scenario: Rendering with no outbound network access
- **WHEN** the page is opened from a deployment with no outbound internet
  access
- **THEN** every chart and style renders fully
