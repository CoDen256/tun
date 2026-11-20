# operator-auth Specification (delta)

## ADDED Requirements

### Requirement: The backup console is an operator zone like every other
The gateway SHALL gate `/backup/` with the same single operator credential and
the same shared gate used by every other operator zone, and the backup console
SHALL accept the gateway-verified operator marker or the internal token, using
the one shared check from `libs/`.

No new credential, token or authentication mechanism is introduced.

#### Scenario: An unauthenticated request
- **WHEN** a request to `/backup/` arrives without the operator credential
- **THEN** the gateway rejects it, and the request never reaches the console

#### Scenario: An authenticated request
- **WHEN** a request to `/backup/` carries the operator credential
- **THEN** the gateway admits it and the console serves the page

#### Scenario: A forged operator marker
- **WHEN** a request to `/backup/` carries an inbound operator marker header
- **THEN** the gateway strips it before any route is reached, exactly as for
  every other zone

#### Scenario: The zone is registered everywhere it must be
- **WHEN** the zone list is rendered in the shared layout and on the status
  page
- **THEN** `backup` appears in both
