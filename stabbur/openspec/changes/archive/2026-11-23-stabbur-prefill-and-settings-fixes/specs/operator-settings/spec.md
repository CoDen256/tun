## MODIFIED Requirements

### Requirement: Stored provider preferences are reconciled against the live provider catalogue
The system SHALL reconcile a stored provider ordering against the
enrichment service's catalogue every time the ordering is used, because the
catalogue is owned by that service and can change without stabbur's
involvement. The catalogue used MAY be one stabbur fetched up to **60
seconds** earlier, so that reading or saving settings does not wait on the
enrichment service each time. A catalogue fetch that fails SHALL NOT be
held as the catalogue.

A stored provider absent from the current catalogue SHALL be skipped rather
than treated as an error, and its stored position and enablement SHALL be
retained so that it resumes its place if it returns.

A provider present in the catalogue but absent from the stored ordering
SHALL be appended to the end of the ordering and treated as enabled, so
that a newly available provider is usable without becoming a primary by
surprise.

#### Scenario: A configured provider is no longer offered
- **WHEN** a provider named in the stored ordering is missing from the
  current catalogue
- **THEN** it is skipped when resolving the order and the primary, without
  an error

#### Scenario: A missing provider returns
- **WHEN** a provider that had disappeared from the catalogue appears again
- **THEN** it resumes its stored position and its stored enabled state,
  rather than being treated as newly discovered

#### Scenario: A new provider appears
- **WHEN** the catalogue offers a provider that the stored ordering does
  not mention
- **THEN** it is appended to the end of that kind's ordering, enabled, and
  does not displace the existing primary

#### Scenario: Every stored provider has vanished
- **WHEN** no provider in a kind's stored ordering is present in the
  current catalogue
- **THEN** the effective ordering is the catalogue's own providers, and the
  kind still resolves a primary

#### Scenario: Saves do not each wait on the catalogue
- **WHEN** the operator makes five settings changes within a minute
- **THEN** at most one of the resulting settings responses waited on a catalogue fetch from the enrichment service

### Requirement: Preferences are editable from a settings page
The settings page SHALL let the operator edit every preference it stores,
and SHALL persist each change as it is made.

Every change SHALL take effect on the page **immediately**, before the save
completes (optimistic). Each section or provider list SHALL show its own
inline save state: "Saving…" while a save is in flight, then "Saved", or an
error that names the failure. A save's response SHALL NOT revert or reorder
anything on the page that the operator changed after that save was sent. If
a save fails, the page SHALL say so and show the stored value again.

Provider order SHALL be presented as one draggable list per kind, with the
**Translations** kind shown as one list per configured target language,
labelled with its language, and with no generic translations list. A
provider SHALL be movable by dragging its handle with mouse or touch, and
with Arrow Up / Arrow Down while its handle has focus.

The **Examples** section (previously "Examples prefill") SHALL carry three
controls, labelled for what they do: **Providers to ask** (how many
providers prefill asks, in order), **Sentences per provider** (how many
prefill takes from each), and **Sentences in the suggestion sheet** (how
many the Examples sheet asks each enabled provider for). It SHALL state the
resulting prefill maximum and the sheet count.

#### Scenario: A translations list per language
- **GIVEN** target languages en and de
- **WHEN** the operator opens Settings
- **THEN** Provider order shows "Translations · en" and "Translations · de" as separate draggable lists, and no unlabelled Translations list

#### Scenario: Reordering one language only
- **WHEN** the operator drags a provider to the top of the de list
- **THEN** that order is saved for de and the en list is unchanged

#### Scenario: A drop sticks immediately
- **WHEN** the operator drags a provider to a new position and releases it
- **THEN** it stays in that position and the list renumbers at once, the list shows Saving… then Saved, and after a reload the new order is still there

#### Scenario: Two quick drags
- **WHEN** the operator makes a second drag in the same list before the first save has completed
- **THEN** when both saves complete the list shows the order after the second drag, and so does a reload

#### Scenario: The examples controls say what they mean
- **WHEN** the operator opens Settings
- **THEN** the Examples section reads "Providers to ask", "Sentences per provider" and "Sentences in the suggestion sheet", and states the prefill maximum and the sheet count

## ADDED Requirements

### Requirement: The suggestion-sheet example count is an operator preference
The system SHALL store a **sheet sentence count**: how many sentences the
Examples suggestion sheet asks each enabled examples provider for. It SHALL
be between 1 and 10. When it has never been set, it SHALL read as 5, or as
the stored Sentences per provider value if that is larger.

Sentences per provider SHALL NOT exceed the sheet sentence count. A save
that would break this SHALL be rejected with a readable error, and the
Settings page SHALL disable the stepper button that would break it, with a
note saying why.

#### Scenario: Default
- **WHEN** settings are read and the sheet sentence count has never been set, and Sentences per provider is 2
- **THEN** the sheet sentence count reads 5

#### Scenario: Prefill cannot exceed the sheet
- **GIVEN** the sheet sentence count is 4 and Sentences per provider is 4
- **WHEN** the operator looks at the Sentences per provider stepper
- **THEN** its + button is disabled and the row explains that it can't exceed the sheet's 4

#### Scenario: The API refuses an inconsistent pair
- **WHEN** a settings update would set Sentences per provider above the sheet sentence count
- **THEN** it is rejected with a client error and nothing is stored
