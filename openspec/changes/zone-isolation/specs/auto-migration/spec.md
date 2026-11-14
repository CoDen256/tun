## MODIFIED Requirements

### Requirement: Migrations run automatically on every boot
The system SHALL apply each database's migrations automatically when its owning
service starts, without blocking that service from accepting connections.

#### Scenario: Fresh database
- **WHEN** a service starts against an empty database
- **THEN** its schema is applied with no operator command, and the service
  reports ready once it is

#### Scenario: Migrations cannot run
- **WHEN** the database is unreachable at start
- **THEN** the service still accepts connections and retries the migration in
  the background, rather than failing to start

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

