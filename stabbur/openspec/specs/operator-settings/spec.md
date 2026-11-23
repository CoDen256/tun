# operator-settings Specification

## Purpose
TBD - created by archiving change operator-settings. Update Purpose after archive.

## Requirements

### Requirement: Operator preferences are stored in stabbur's own database
The system SHALL store operator-level preferences in stabbur's own
database as a single record, served over the authoring API, so that
preferences survive a change of browser or machine and are inspectable
through the same means as any other stabbur record.

The system SHALL NOT keep operator preferences solely in browser-local
storage.

Because stabbur is a single-operator service behind one shared token,
preferences are singular: there is exactly one settings record, not one
per user.

#### Scenario: Preferences survive a different browser
- **WHEN** the operator sets a preference and later opens stabbur from a
  different browser or machine
- **THEN** the preference they set is in effect

#### Scenario: Reading preferences
- **WHEN** a client requests the operator's settings
- **THEN** the stored settings are returned over the authoring API

### Requirement: Unset preferences read as their defaults
The system SHALL return a fully-populated settings object whenever
settings are read, filling in a default for every preference that has not
been explicitly set, so that a caller never has to distinguish
"unconfigured" from "configured".

The system SHALL behave identically whether a preference holds its default
because it was never set or because it was set to that value.

#### Scenario: Reading before anything has been configured
- **WHEN** settings are read and no preference has ever been written
- **THEN** a complete settings object is returned, with every preference at
  its default, and no error or empty response

#### Scenario: Partially configured settings
- **WHEN** the operator has set some preferences but not others
- **THEN** the response carries their values for the ones they set and
  defaults for the rest

### Requirement: Each enrichment kind has an operator-ordered provider preference
Each kind stabbur proxies SHALL carry its own ordered list of providers,
with each provider individually enabled or disabled. The primary provider is
derived as the first enabled provider in the effective order and is never
stored separately.

The **translations** kind SHALL be ordered **per target language**, not once
globally. Its preference is stored under a key per language, and the kinds a
read resolves SHALL be computed from the operator's configured target
languages together with any per-language key already stored — so adding a
language in Settings adds its list.

A per-language translations preference with nothing stored SHALL resolve from
the plain `translations` preference rather than from the raw catalogue, so a
newly added language starts at the order the operator already configured. The
plain key SHALL remain in storage as that seed.

Every other kind SHALL keep one list.

#### Scenario: Reading a per-language order
- **GIVEN** the operator's target languages are en and de
- **WHEN** settings are read
- **THEN** the response carries a translations provider order for en and one for de, each reconciled against the translations catalogue

#### Scenario: A new language inherits the configured order
- **GIVEN** the stored plain translations order is `dictcc, google` and nothing is stored for fr
- **WHEN** the operator adds fr to their target languages and reads settings
- **THEN** fr's translations order is `dictcc, google`

#### Scenario: Orders are independent
- **GIVEN** the operator moves `google` to the top of the de list
- **WHEN** settings are read
- **THEN** de's order begins with `google` and en's order is unchanged

#### Scenario: Other kinds stay single
- **WHEN** settings are read
- **THEN** part of speech, pronunciation, inflections, examples, audio and text-from-audio each carry exactly one order, regardless of how many target languages exist

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

### Requirement: Triage navigation can autosave edits or require an explicit save
The system SHALL store an operator preference, with two values
(`autosave`, `manual`), governing whether triage's "Send to back", "Skip",
and "Go to previous" actions save the note under review's current edits
before acting. The preference SHALL apply uniformly to all three actions —
there is no way to configure one independently of the others. The default,
read when the preference has never been set, SHALL be `autosave`, matching
"Send to back"'s behavior before this preference existed, so no operator's
experience changes until they explicitly opt into `manual`.

#### Scenario: Reading the default before it has ever been set
- **WHEN** settings are read and the triage-navigation-save preference has
  never been written
- **THEN** it reads as `autosave`

#### Scenario: Switching to manual
- **WHEN** the operator sets the preference to `manual` from the settings
  page
- **THEN** subsequent Send to back, Skip, and Go to previous actions in
  triage no longer save the note under review's edits automatically

### Requirement: Theme and value colour are operator preferences
The system SHALL store, with the other operator preferences:
- a **theme**: Auto (follow the device), Light or Dark; default Auto
- a **value colour**: one of the presets blue, teal, violet and orange, or a
  custom colour the operator picks; default blue

Each preset SHALL have a light and a dark shade:

| preset | light | dark |
|---|---|---|
| blue | #0b5cff | #82adff |
| teal | #00897b | #4fd1c0 |
| violet | #7c3aed | #b79cff |
| orange | #d9480f | #ff9b5e |

A custom colour SHALL be used as chosen in both themes.

The Settings page SHALL show an Appearance section first, containing:
- a three-way theme switch
- the four preset swatches plus a custom-colour swatch
- a preview line drawn in the value colour

Both preferences SHALL apply to every stabbur page, from first paint.

#### Scenario: Choosing dark and teal
- **WHEN** the operator selects Dark and the teal swatch in Settings → Appearance
- **THEN** every stabbur page renders dark with operator-entered values in #4fd1c0, and after a reload and on another device the same holds

#### Scenario: A custom colour
- **WHEN** the operator picks #c2185b with the custom swatch
- **THEN** values render in #c2185b in both light and dark themes

#### Scenario: Auto follows the device
- **GIVEN** the theme is Auto
- **WHEN** the device switches to dark mode
- **THEN** stabbur renders dark without a reload of the settings

### Requirement: Part of speech and text-from-audio have their own provider order
Besides the existing enrichment kinds, the system SHALL store an operator
provider order for **part of speech** and for **text from audio**. Each is
editable as its own list on the Settings page, in this order: Part of speech,
Pronunciation, Translations, Inflections, Examples, Audio, Text from audio.

The candidate providers for part of speech SHALL be those smia offers for
inflections, because smia has no separate part-of-speech provider set. Its
order and on/off state SHALL be stored separately, so reordering one list
never reorders the other.

The part-of-speech sheet and prefill SHALL follow the part-of-speech list.
The text-from-audio sheet SHALL follow the text-from-audio list.

#### Scenario: Reordering part of speech leaves inflections alone
- **GIVEN** the inflections order is ordbank, dictcc_api
- **WHEN** the operator moves dictcc_api above ordbank in the Part of speech list
- **THEN** the part-of-speech sheet and prefill use dictcc_api first, and the Inflections list and sheet still start with ordbank

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
