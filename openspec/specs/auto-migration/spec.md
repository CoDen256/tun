## Purpose

Ensure every service in the unified stack applies its own database
migrations automatically on container start, with no operator-run command
required, while never auto-seeding sample or test content.

## Requirements

### Requirement: Every service migrates its own schema on container start
The system SHALL apply each database's outstanding migrations automatically
when its owning service starts, with no operator-run command, and SHALL NOT
let that work block the service from accepting connections.

**This reverses the original shape of this requirement.** It first read "the
service is serving requests" only once the schema existed, i.e. migrate then
serve - which meant a database outage was not a degraded console but no
console at all, because the process exited before it ever listened. Serving
first, migrating behind a readiness flag, is what `zone-isolation` requires.

#### Scenario: A fresh database on first boot
- **WHEN** a service's container starts against a brand-new, empty database
- **THEN** its full schema exists with no manual migration command ever run,
  and the service reports ready once it does

#### Scenario: Migrations cannot run
- **WHEN** the database is unreachable at start
- **THEN** the service still accepts connections and retries in the
  background, rather than failing to start

#### Scenario: Pulling newer code with a new migration
- **WHEN** the stack is restarted after pulling code containing a new
  migration
- **THEN** only the new step is applied; already-applied steps are not re-run
  and do not error

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

### Requirement: One migration mechanism per language

The system SHALL use a single migration-and-startup mechanism for all services
written in the same language, rather than one per service.

Moved here from `monorepo-merge`, which asserted it without implementing it:
the three Python services still use two mechanisms (two start a bootstrap
module as their command, one runs an entrypoint script). This change builds the
shared `libs/` that makes one mechanism possible, so the obligation belongs
with it.

#### Scenario: Two services of the same language
- **WHEN** two services written in the same language start
- **THEN** both apply their migrations through the same shared implementation,
  not through per-service copies
