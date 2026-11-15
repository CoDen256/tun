## MODIFIED Requirements

### Requirement: The device-facing contract does not change

The system SHALL serve every device-facing endpoint with the same paths,
methods, credentials, headers, status codes and cache directives as before any
restructuring of the server side.

Observing device-plane traffic — recording that a request happened, and what
it was for — is explicitly permitted and is not a change to this contract,
PROVIDED the observation is passive: it SHALL NOT add a process, a database or
a network call to the request path, SHALL NOT alter any byte the device
receives, and SHALL NOT be able to fail the request it observes.

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

#### Scenario: Observing a device-plane request
- **WHEN** a device-plane request is recorded for later inspection
- **THEN** the bytes the device receives, the status code, every header and
  every cache directive are identical to what they would have been without the
  recording, and no service is introduced into the request path

#### Scenario: The observation sink is unavailable
- **WHEN** the destination the observation is written to is full, unwritable or
  missing
- **THEN** the device-plane request is still served normally, and the failure
  is visible to the operator rather than to the device
