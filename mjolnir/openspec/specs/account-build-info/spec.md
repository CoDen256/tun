## Purpose

Defines how build/version information is surfaced on the account screen:
the installed build's operator-chosen label and baked-in data version,
alongside the existing buildId/base-version display.

## Requirements

### Requirement: The account screen shows the installed build's label and data version
The system SHALL display the operator-chosen label and the data version
baked into the currently-installed bundle, alongside the existing buildId/
base-version display.

#### Scenario: Viewing the account screen on an OTA build
- **WHEN** the operator (or any user) views the account screen on a device
  running an assembled OTA bundle
- **THEN** the screen shows the label and data version that were baked in
  at assemble time, as their own rows

#### Scenario: Viewing the account screen on the embedded (tier-4) asset
- **WHEN** the account screen is viewed on a build with no companion at
  all (the embedded asset, which ships with no OTA companion per existing
  behavior)
- **THEN** the label/data-version rows show the same "embedded" fallback
  the existing buildId/base-version row already shows, not a blank or
  broken value

### Requirement: Label and data version are baked at assemble time, not read from a server at runtime
The system SHALL bake the label and data version as plain constants into
the bundle at assemble time, exposed as `globalThis` values readable with
no network request.

#### Scenario: Reading the baked values
- **WHEN** the account screen reads the label/data-version globals
- **THEN** the values are available synchronously, with no fetch or
  loading state
