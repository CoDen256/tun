# git-backup Specification

## Purpose
Every Postgres database and blob store in the unified `tun` stack is backed
up to a private git repository on a recurring schedule, with no
backup-specific code in `mjolnir` or `stabbur` themselves and no
host-level setup beyond `docker compose up`.
## Requirements
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

### Requirement: Disposable run-history tables are excluded from the mjolnir dump
The system SHALL exclude `job_logs` and `build_jobs` from `mjolnir`'s
Postgres dump, and SHALL NOT exclude any table referenced by them or by
any permanent ledger table (`card_slots`, `pending_occurrences`,
`card_content`, `minted_notes`, `occurrence_shipments`, `publications`,
`logic_bundles`, `userdata`, `userdata_history`).

#### Scenario: Dumping mjolnir's database
- **WHEN** the backup mechanism dumps `mjolnir`'s database
- **THEN** the resulting dump contains no `job_logs` or `build_jobs` data,
  and contains every row of every other table

#### Scenario: Restoring the dump
- **WHEN** the dump is restored into a fresh database (after the
  application's own migrations have created the full schema, including
  `job_logs`/`build_jobs` empty)
- **THEN** every foreign key in the restored data is satisfied, with no
  manual intervention required

### Requirement: SQL dumps overwrite the same filename every run
The system SHALL write each database's dump to the same filename on every
run, relying on version control history (not separate dated files) to
retain past snapshots.

#### Scenario: Two consecutive runs
- **WHEN** the backup service runs twice in a row
- **THEN** the second run's dump file has the same name as the first,
  and the first run's content is still recoverable from version history

### Requirement: Stabbur's blob store is backed up incrementally; mjolnir's own blob cache is not
The system SHALL copy any file present in stabbur's blob volume that is not
already present in the backup repository, and SHALL NOT back up mjolnir's
own `data/blob/` directory.

#### Scenario: A new audio blob exists in stabbur
- **WHEN** a backup run finds a file in stabbur's blob volume not yet
  present in the backup repository
- **THEN** that file is added to the backup repository, unmodified

#### Scenario: An already-backed-up blob is unchanged
- **WHEN** a backup run finds a file already present in the backup
  repository with matching content
- **THEN** no write or re-commit happens for that file

#### Scenario: mjolnir's own blob cache is never backed up
- **WHEN** a backup run executes
- **THEN** no file from mjolnir's own `data/blob/` directory is read or
  written to the backup repository

### Requirement: No commit happens on a run with no changes
The system SHALL NOT create a commit when a scheduled run produces no
content changes relative to the backup repository's current state.

#### Scenario: A run with nothing new
- **WHEN** a scheduled run's dumps and blob diff produce no changes at all
- **THEN** no commit is created, and no push is attempted

### Requirement: No secret material ever enters the backup repository
The system SHALL NOT write any credential, token, or password into the
backup repository's working directory at any point, under any
circumstance.

#### Scenario: The backup script's own credentials
- **WHEN** the backup service authenticates to push to the remote
  repository
- **THEN** the credential used for that authentication is never written
  into the repository it is pushing to

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

