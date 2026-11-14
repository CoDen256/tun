# shared-database

## Purpose

One Postgres cluster holds one database per service. This capability covers
what stays isolated (a bad migration, a runaway query, a dropped table, the
per-service dump) and what becomes shared (the process, a major-version
upgrade) - and the property that matters most: the device update path depends
on the database not at all, so the one zone that must never go down does not
depend on this decision.

Separate logical databases per service and no cross-service foreign keys
(D42) are unchanged. Only the number of running copies of the program changed.

## Requirements

### Requirement: One database cluster holds one database per service

The system SHALL run a single Postgres cluster containing one database per
service that needs one, rather than one cluster per service.

#### Scenario: Fresh host
- **WHEN** the stack starts on a host with no existing data
- **THEN** one database per service exists, each with its own role, and each
  service's schema is applied to its own database with no manual step

#### Scenario: A service's own data
- **WHEN** a service reads or writes
- **THEN** it reaches only its own database

### Requirement: Services cannot reach each other's data

The system SHALL grant each service a role with access to its own database
only, and SHALL limit each role's concurrent connections.

#### Scenario: Cross-service access attempt
- **WHEN** a service attempts to connect to another service's database with its
  own credentials
- **THEN** the connection is refused

#### Scenario: One service exhausts its connections
- **WHEN** one service opens its maximum number of connections
- **THEN** other services can still connect

### Requirement: Each service's data is dumped and restored separately

The system SHALL produce one dump artefact per service database, restorable
independently of the others.

#### Scenario: Restoring one service
- **WHEN** one service's data must be restored
- **THEN** its dump can be restored without affecting any other service's data

### Requirement: The device path does not depend on the database

The system SHALL serve the device-facing update and media paths without any
dependency on the database cluster.

#### Scenario: Database unavailable
- **WHEN** the database cluster is stopped
- **THEN** the device can still fetch the current update descriptor, bundles,
  media blobs and audio manifests, unchanged

### Requirement: Developing one service does not start the stack

The system SHALL allow a single service and the shared cluster to be brought up
without starting any other service.

#### Scenario: Working on one service
- **WHEN** the operator brings up one service by name
- **THEN** that service and the database cluster start, and no other service
  starts
