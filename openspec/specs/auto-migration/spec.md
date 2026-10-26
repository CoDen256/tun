## Purpose

Ensure every service in the unified stack applies its own database
migrations automatically on container start, with no operator-run command
required, while never auto-seeding sample or test content.

## Requirements

### Requirement: Every service migrates its own schema on container start
The system SHALL ensure that every service with a database schema applies
any outstanding migrations automatically when its container starts, with no
operator-run command required, across the whole unified stack.

#### Scenario: A fresh database on first boot
- **WHEN** a service's container starts against a brand-new, empty database
- **THEN** that service's full schema exists and the service is serving
  requests, with no manual migration command ever run

#### Scenario: Pulling newer code with a new migration
- **WHEN** the unified stack is restarted after pulling code containing a
  new migration
- **THEN** only the new migration step is applied; already-applied steps are
  not re-run and do not error

### Requirement: Only fixed catalog data auto-seeds; sample content never does
The system SHALL automatically seed data that is a fixed, idempotent catalog
(data the system cannot function without, and which never varies), and SHALL
NOT automatically seed sample or test content under any circumstance.

#### Scenario: Catalog data on first boot
- **WHEN** a service that depends on fixed catalog rows (e.g. a deck
  catalog) starts against a fresh database
- **THEN** those catalog rows exist afterward, without any manual seed
  command

#### Scenario: Test fixtures never run automatically
- **WHEN** the stack starts, by any path, against any database
- **THEN** no sample/test fixture content is created unless an operator
  explicitly and separately invokes a fixture script by hand
