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
