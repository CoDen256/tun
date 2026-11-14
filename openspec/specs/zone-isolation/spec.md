# zone-isolation

## Purpose

Eight zones that fail independently. This capability covers what may and may
not propagate: the device update path depends on no service, device progress
sync runs in its own process so the operator console cannot interrupt it,
services degrade to a lost feature rather than a lost page, and a service
serves before its schema is ready while reporting readiness separately from
liveness.

The distinction that made the scope small: blast radius is a container
boundary, degradation is code, and deploy granularity is compose. Most of what
was asked for was already one of the latter two.

## Requirements

### Requirement: The device update path depends on no service

The system SHALL serve device update descriptors, bundles, media blobs and
audio manifests without depending on any application service or database.

#### Scenario: Every service stopped
- **WHEN** every application service and the database cluster are stopped
- **THEN** the device can still fetch the current update descriptor, bundles,
  blobs and audio manifests, with unchanged content and status codes

#### Scenario: Build pipeline unavailable
- **WHEN** the build service is stopped or failing
- **THEN** the most recently published bundle is still served to devices

### Requirement: Device progress sync is independent of the operator console

The system SHALL serve the device's progress-sync endpoint from a separate
process from the operator console, so that neither can interrupt the other.

#### Scenario: Console stopped
- **WHEN** the operator console is stopped, redeployed or failing
- **THEN** a device's progress sync continues to succeed, unchanged

#### Scenario: Sync stopped
- **WHEN** the progress-sync service is stopped
- **THEN** the operator console remains fully usable

#### Scenario: The device contract is unchanged by the split
- **WHEN** a device issues the same request before and after the split
- **THEN** the path, method, headers, request body, response body and status
  code are identical

### Requirement: Services degrade to lost features, never to lost pages

The system SHALL keep a service's own pages available when a service it depends
on is unavailable, and SHALL present the dependent feature as unavailable rather
than failing the page.

#### Scenario: Linguistics service unavailable
- **WHEN** the linguistics service is unreachable
- **THEN** the note editor loads and remains usable, and only its suggestion
  feature reports unavailable

#### Scenario: Shadowing with the phonetics service unavailable
- **WHEN** the phonetics service is unreachable
- **THEN** shadowing still lists and plays existing segments, and reports that
  ingesting new media is unavailable

#### Scenario: Notes service unavailable
- **WHEN** the notes service is unreachable
- **THEN** the linguistics service, the capture client's translation, device
  sync and the update path are all unaffected

### Requirement: A service serves before its schema is ready

The system SHALL accept connections as soon as a service starts, and SHALL
apply schema migrations in the background, reporting readiness separately from
liveness.

#### Scenario: Database unavailable at start
- **WHEN** a service starts while the database is unreachable
- **THEN** the service accepts connections, renders its pages, and presents
  every database-backed view as unavailable

#### Scenario: Database returns
- **WHEN** the database becomes reachable after a service has started without it
- **THEN** migrations are applied and database-backed views become available
  without restarting the service

#### Scenario: Readiness is visible
- **WHEN** a service is serving but its schema is not ready
- **THEN** its health state reports degraded rather than healthy

### Requirement: Exactly one service owns each database's migrations

The system SHALL designate one service per database as the owner of that
database's migrations.

#### Scenario: Two services share a database
- **WHEN** more than one service uses the same database
- **THEN** only the designated owner applies migrations, and the others wait for
  readiness

### Requirement: The operator console is one interface across several processes

The system SHALL present the operator console as one navigable interface,
regardless of how many processes serve it.

#### Scenario: Navigating between zones
- **WHEN** the operator opens the console
- **THEN** every zone is reachable from the same navigation, including zones
  served by other processes

#### Scenario: A zone is unreachable
- **WHEN** the operator opens a zone whose service is not responding
- **THEN** a status page identifies which zone is unavailable and links to the
  zones that are, rather than returning a bare gateway error

#### Scenario: The status page itself
- **WHEN** every application service is stopped
- **THEN** the status page is still served

### Requirement: Shared infrastructure is limited to the gateway and the database

The system SHALL NOT introduce any runtime dependency shared across zones
beyond the gateway and the database cluster, and SHALL keep the device update
path dependent on neither.

#### Scenario: Authentication is not a shared service
- **WHEN** operator authentication is enforced
- **THEN** it is enforced within the gateway, adding no service whose failure
  would affect more than one zone

#### Scenario: Device path unaffected by shared infrastructure
- **WHEN** the database cluster is unavailable
- **THEN** the device update path continues to serve unchanged
