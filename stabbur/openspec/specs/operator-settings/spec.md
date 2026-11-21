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
The system SHALL store, per enrichment kind, an operator-defined ordering
of that kind's providers together with which of them are enabled. The
first enabled provider in that ordering is that kind's **primary**
provider.

The system SHALL derive the primary from the ordering rather than storing
it separately, so the two cannot disagree.

The system SHALL store only ordering and enablement. It SHALL NOT store
provider definitions, addresses, or credentials, which remain the
enrichment service's own.

#### Scenario: Identifying the primary provider
- **WHEN** a kind's ordering is read and its first provider is enabled
- **THEN** that provider is the kind's primary

#### Scenario: The first provider is disabled
- **WHEN** a kind's ordering is read and its first provider is disabled
- **THEN** the first *enabled* provider is the primary

#### Scenario: Reordering changes the primary
- **WHEN** the operator moves a different provider to the top of a kind's
  ordering and it is enabled
- **THEN** that provider becomes the kind's primary, with no separate
  primary setting to update

### Requirement: Stored provider preferences are reconciled against the live provider catalogue
The system SHALL reconcile a stored provider ordering against the
enrichment service's current catalogue every time the ordering is used,
because the catalogue is owned by that service and can change without
stabbur's involvement.

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

### Requirement: Preferences are editable from a settings page
The system SHALL provide a settings page in the authoring UI's navigation
where every stored preference can be inspected and changed, grouped by what
the preference affects.

The page SHALL present each kind's provider ordering as a reorderable list
showing which provider is currently primary, and SHALL indicate a provider
that cannot answer automatically — such as one that only returns a link to
its own site for a human to check — so the operator can see why it is a
poor choice of primary.

#### Scenario: Changing a provider order
- **WHEN** the operator reorders a kind's providers on the settings page
- **THEN** the new ordering is stored and takes effect on subsequent
  lookups

#### Scenario: Seeing which provider is primary
- **WHEN** the operator views a kind's provider ordering
- **THEN** the provider currently acting as that kind's primary is
  identified

#### Scenario: A manual-link provider is marked as such
- **WHEN** a kind's ordering includes a provider that answers only with a
  link for a human to follow
- **THEN** the page marks it as not automatable

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
