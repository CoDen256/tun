## ADDED Requirements

### Requirement: A single mechanism backs up every included database
The system SHALL run one backup mechanism, living in `tun` (the one place
that already reaches every included service's database), that dumps both
`mjolnir`'s and `stabbur`'s Postgres databases on a recurring schedule,
with no backup-specific code added to either service's own repository.

#### Scenario: A scheduled run
- **WHEN** the backup mechanism's schedule fires
- **THEN** both `mjolnir-postgres` and `stabbur-postgres` are dumped, with
  no code change required in `mjolnir` or `stabbur` to make this happen

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
