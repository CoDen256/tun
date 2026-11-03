## MODIFIED Requirements

### Requirement: A single mechanism backs up every included database
The system SHALL run one backup mechanism, delivered as a service in
`tun`'s compose project (the one place that already reaches every included
service's database), that dumps both `mjolnir`'s and `stabbur`'s Postgres
databases on a recurring schedule, with no backup-specific code added to
either service's own repository.

#### Scenario: A scheduled run
- **WHEN** the backup mechanism's schedule fires
- **THEN** both `mjolnir-postgres` and `stabbur-postgres` are dumped, with
  no code change required in `mjolnir` or `stabbur` to make this happen

#### Scenario: Standing up the mechanism
- **WHEN** the operator runs `docker compose up` in `tun`
- **THEN** the backup mechanism is running, with no host-level step
  (no `crontab` entry, no manual clone) required beyond what `docker
  compose up` itself does

## ADDED Requirements

### Requirement: The backup service connects to each database over the network, not by entering its container
The system SHALL connect to `mjolnir-postgres` and `stabbur-postgres` as a
separate service on the same network, authenticating with each database's
existing password, rather than executing commands inside either
database's own container.

#### Scenario: Dumping a database
- **WHEN** the backup service dumps `mjolnir-postgres` or
  `stabbur-postgres`
- **THEN** it does so via a network connection authenticated with that
  database's existing password, not via `docker exec`

### Requirement: The backup service does not have access to the Docker socket
The system SHALL NOT mount the Docker socket into the backup service's
container.

#### Scenario: Inspecting the backup service's configuration
- **WHEN** the backup service's container configuration is inspected
- **THEN** no Docker socket is mounted into it

### Requirement: Stabbur's blob volume is mounted directly into the backup service
The system SHALL mount stabbur's blob volume directly into the backup
service's own container, read-only, rather than reading it via a separate
helper container at run time.

#### Scenario: Syncing blobs
- **WHEN** the backup service syncs stabbur's blob store
- **THEN** it reads the blob volume already mounted into its own
  container, without starting any additional container to do so

### Requirement: The backup repository's working clone persists in a named volume owned by the service
The system SHALL maintain the backup repository's working clone in a
named volume, and SHALL clone it automatically on first start if that
volume is empty.

#### Scenario: First-ever start
- **WHEN** the backup service starts and its repository volume is empty
- **THEN** it clones the backup repository into that volume before
  attempting any dump

#### Scenario: Restarting the service
- **WHEN** the backup service's container restarts
- **THEN** its existing repository clone (with full history) is still
  present in the named volume, not re-cloned from scratch

### Requirement: Git push authentication uses exactly one mounted private key, scoped narrowly
The system SHALL authenticate git pushes using exactly one SSH private key
file mounted into the backup service's container, and SHALL NOT mount the
operator's broader SSH credential directory.

#### Scenario: Inspecting what's mounted for git authentication
- **WHEN** the backup service's container configuration is inspected
- **THEN** exactly one private key file (plus `known_hosts`) is mounted
  for SSH authentication, not an entire `.ssh` directory
