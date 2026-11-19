# account-build-info

## REMOVED Requirements

### Requirement: The account screen shows the installed build's label and data version
**Reason**: the device no longer shows label and data version as their own
rows. Both collapse into the single App version row added below, which also
carries build time. The label itself is not retired — it stays the bundle's
name in hub's OTA console; only the device's display of it goes.

### Requirement: Label and data version are baked at assemble time, not read from a server at runtime
**Reason**: superseded by the publish-time stamping below. Baking these at
assemble is exactly the defect being fixed — a logic bundle published more
than once shipped a data version frozen at its assemble. The
no-network/synchronous guarantee is preserved verbatim in its replacement.

## ADDED Requirements

### Requirement: The account screen shows the installed build's version facts as one row
The system SHALL display, as a single row on the account screen, the
installed build's identity together with its base version, patch revision,
data revision and build time. The previous separate label and data-version
rows SHALL be removed from the device display.

#### Scenario: Viewing the account screen on an OTA build
- **WHEN** the operator views the account screen on a device running an
  assembled OTA bundle
- **THEN** one row reports the build identity, base version, patch revision,
  data revision and build time, and no separate label or data-version row
  appears

#### Scenario: Viewing the account screen on the embedded (tier-4) asset
- **WHEN** the account screen is viewed on a build with no companion at all
- **THEN** the row shows the "embedded" fallback in place of the version
  facts, rather than a blank value or a string containing "undefined"

### Requirement: Version facts are plain constants read with no network request
The system SHALL expose every displayed version fact, including the build
time, as plain constants baked into the bundle and readable synchronously
with no fetch and no loading state.

Facts determined at publish rather than at assemble — the build identity, the
data revision and the build time — SHALL be stamped at publish, superseding
the previous expectation that these values are baked at assemble time. The
base version and patch revision remain assemble-time values.

#### Scenario: Reading the baked values
- **WHEN** the account screen reads the version globals
- **THEN** the values are available synchronously, with no fetch or loading
  state

#### Scenario: A build published from an already-published logic bundle
- **WHEN** the installed bundle was published from a logic bundle that had
  been published before
- **THEN** the displayed data revision and build time describe this publish,
  not the assemble that produced the logic bundle

### Requirement: The build time is stored canonically and displayed locally
The system SHALL bake the build time as a single canonical UTC instant and
display it in the device's own local time.

#### Scenario: Viewing build time on a device
- **WHEN** the account screen displays the build time
- **THEN** it is rendered in the device's local time, derived from the single
  canonical UTC constant in the bundle
