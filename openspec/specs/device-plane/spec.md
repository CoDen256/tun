# device-plane

## Purpose

The device-facing contract, stated as a requirement so a later change cannot
erode it by accident. An APK is in the field and cannot be rolled back, so
every path, method, credential, header, status code and cache directive here
is frozen - `docs/11-ota-contract.md` is the authority and this spec exists to
make a regression against it visible.

Includes the separation that was missing: device progress sync is gated
independently of operator access, so changing operator auth cannot reach the
phone.
## Requirements
### Requirement: The device-facing contract does not change

The system SHALL serve every device-facing endpoint with the same paths,
methods, credentials, headers, status codes and cache directives as before any
restructuring of the server side.

#### Scenario: Update descriptor
- **WHEN** a device requests the current update descriptor with its credential
- **THEN** the response content, status and cache directives are unchanged, and
  the descriptor is never cached

#### Scenario: Bundle and media
- **WHEN** a device requests a bundle, a media blob or an audio manifest
- **THEN** the response is unchanged and marked immutable

#### Scenario: Compression
- **WHEN** a bundle is served compressed
- **THEN** the hash and size the device verifies still describe the
  uncompressed bundle

#### Scenario: Write attempt
- **WHEN** a non-read method is used against a device-facing update path
- **THEN** it is rejected

#### Scenario: Missing or wrong credential
- **WHEN** a device-facing update request carries no credential or a wrong one
- **THEN** it is rejected without distinguishing the two cases

### Requirement: Device progress sync is gated independently of operator access

The system SHALL verify the device's progress-sync credential separately from
operator access, so that changing operator authentication cannot affect the
device.

#### Scenario: Operator authentication changes
- **WHEN** the operator authentication mechanism or credential changes
- **THEN** a device's progress sync continues to succeed with no change on the
  device

#### Scenario: Sync request shape
- **WHEN** a device issues a progress-sync request
- **THEN** the path, method, header name, header format, request body, response
  body and status code are as they were before the gate was introduced

### Requirement: The device credential can be changed without rebuilding the app

The system SHALL allow the device's server address and credential to be
replaced through the existing on-device configuration mechanism.

#### Scenario: Rotating the credential
- **WHEN** the device credential must change
- **THEN** it can be delivered to installed devices through configuration,
  without a new application build

### Requirement: Observing the device plane is permitted, altering it is not
The system SHALL permit recording, logging and displaying facts about device-plane traffic only where doing so changes nothing the device receives and adds no dependency to the device-plane request path.

This requirement exists so that a change of this shape is measured against a
written rule instead of being argued case by case. The device plane is frozen
because there is an APK in the field that cannot be rolled back; that freeze is
about **what the device receives**, not about what the operator may know.

#### Scenario: Adding observation to a device-plane route
- **WHEN** logging or recording is added for a device-plane route
- **THEN** the route's status codes, headers, body bytes, cache directives and
  authentication behaviour are unchanged, verified by comparing a real response
  before and after

#### Scenario: Observation must not become a dependency
- **WHEN** the mechanism that records device-plane traffic is unavailable,
  failing or full
- **THEN** device-plane requests continue to be served exactly as before

#### Scenario: Altering the device-facing contract
- **WHEN** a change would alter any byte, header, status code or cache
  directive the device receives
- **THEN** it is outside what this requirement permits, regardless of how
  beneficial it appears

