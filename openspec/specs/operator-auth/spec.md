# operator-auth

## Purpose

One credential admits the operator to every zone on the origin, verified
inside the gateway so authentication adds no runtime dependency of its own -
the property that ruled out a `forward_auth` service, which would have made
one container's failure a 401 across all eight zones.

Services trust a gateway-verified marker or the internal service-to-service
credential; no service implements its own scheme, and no credential hash is
stored in configuration.
## Requirements
### Requirement: One credential admits the operator to every zone

The system SHALL authenticate the operator once, with a single credential, for
every operator-facing zone on the origin.

#### Scenario: Moving between zones
- **WHEN** the operator authenticates and then opens a different zone
- **THEN** they are not asked to authenticate again

#### Scenario: No credential
- **WHEN** an operator-facing zone is requested without a valid credential
- **THEN** the request is rejected and the zone's content is not served

#### Scenario: The database tool
- **WHEN** the database-exploration tool is requested
- **THEN** it requires the operator credential, as every other operator zone
  does

### Requirement: Authentication introduces no additional failure point

The system SHALL verify operator credentials within the gateway, without
depending on any additional running service.

#### Scenario: All application services stopped
- **WHEN** every application service is stopped
- **THEN** authentication still functions and unauthenticated requests are
  still rejected

### Requirement: Services accept gateway-verified requests or the internal credential

The system SHALL have each service accept a request only when the gateway has
marked it as operator-verified, or when it carries the internal
service-to-service credential.

#### Scenario: Direct request bypassing the gateway
- **WHEN** a request reaches a service without the gateway's marker and without
  the internal credential
- **THEN** it is rejected

#### Scenario: Forged marker
- **WHEN** a request arrives at the gateway already carrying the marker header
- **THEN** the gateway removes it before forwarding, and the service does not
  see it

#### Scenario: Service-to-service call
- **WHEN** one service calls another directly with the internal credential
- **THEN** the call is accepted without operator authentication

### Requirement: No service implements its own authentication

The system SHALL NOT have any service define its own authentication scheme,
credential or unauthenticated exemption.

#### Scenario: A service's own pages
- **WHEN** a service's user interface is requested
- **THEN** it is subject to the same gate as every other operator zone, with no
  exemption for static assets, media or previews

### Requirement: No credential hash is stored in configuration

The system SHALL derive any credential hash it needs at start time from the
configured credential.

#### Scenario: Rotating the operator credential
- **WHEN** the operator credential is changed and the stack restarted
- **THEN** access uses the new credential immediately, with no second value to
  regenerate or keep in step

### Requirement: Each service's interface is served at its own prefix root

The system SHALL serve each service's user interface at the root of that
service's URL prefix.

#### Scenario: Opening a service
- **WHEN** the operator opens a service's prefix in a browser
- **THEN** that service's interface is served, with no additional path segment

### Requirement: Cross-origin preflight is answered before authentication

The system SHALL answer cross-origin preflight requests at the gateway without
requiring a credential.

#### Scenario: Extension calling a service
- **WHEN** a browser extension issues a cross-origin preflight for a service
  endpoint
- **THEN** the preflight is answered successfully, and the subsequent
  credentialed request is authenticated normally

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

