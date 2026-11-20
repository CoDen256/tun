# userdata-console Specification (delta)

## ADDED Requirements

### Requirement: Sync history is one timeline of two stated fidelities
The console SHALL present an account's sync history as a single chronological
timeline in which recent entries are per-sync and older entries are per-backup-
run, and SHALL mark which fidelity each entry carries and where the boundary
between them falls.

A timeline whose resolution changes partway down without saying so
misrepresents the data.

#### Scenario: Viewing an account with both tiers present
- **WHEN** the operator views an account with syncs inside the retention window
  and archived versions older than it
- **THEN** both are shown in one chronological timeline, each entry's fidelity
  is identifiable from the entry itself, and the boundary between the tiers is
  labelled

#### Scenario: The limits of the archived tier are stated where they apply
- **WHEN** the operator views the archived tier
- **THEN** it states that several syncs in one period collapse to one entry,
  that a period with no change produces no entry, and that a value changed and
  reverted within one period leaves no entry — and these statements are scoped
  to that tier rather than to the whole timeline

#### Scenario: A recent change that is also already archived
- **WHEN** a per-sync entry's change is also present in an archived version
- **THEN** the relationship is discoverable, and the change is not presented as
  two unrelated events

### Requirement: The two tiers degrade independently
The console SHALL render each tier from its own source, and the failure or
unavailability of one SHALL NOT prevent the other from rendering.

#### Scenario: The archive is unreachable
- **WHEN** the service holding the archive cannot be reached
- **THEN** the per-sync tier still renders in full, and only the archived
  region reports that it is unavailable

#### Scenario: Nothing archived yet
- **WHEN** no archived version exists for the account
- **THEN** the per-sync tier renders, and the archived region states that
  nothing has been archived yet rather than appearing broken

#### Scenario: No recent syncs
- **WHEN** no sync has occurred inside the retention window
- **THEN** the archived tier renders, and the recent region states that the
  window is empty rather than appearing broken

#### Scenario: Viewing an archived version
- **WHEN** the operator opens an archived entry
- **THEN** that version's document and its difference from the preceding
  version are available

## MODIFIED Requirements

### Requirement: The current document is read on demand
The console SHALL read an account's current stored document only on demand, and
SHALL NOT embed full documents in the page's initial payload.

This requirement is unchanged in intent and is restated because the panel that
hosted it is being rebuilt: the per-sync tier continues to fetch a row's full
document only when the operator asks for it, and the archived tier likewise
fetches a version's document and diff on demand.

#### Scenario: Loading the page
- **WHEN** the Sync page loads
- **THEN** no full account document is included in the initial payload

#### Scenario: Opening one entry
- **WHEN** the operator opens one timeline entry
- **THEN** that entry's document is fetched at that point
