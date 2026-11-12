## MODIFIED Requirements

### Requirement: A single mechanism backs up every included database
The system SHALL run one backup mechanism, delivered as a service in `tun`'s compose project (the one place that already reaches every included service's database), that dumps `mjolnir`'s, `stabbur`'s and `phonexa`'s Postgres databases on a recurring schedule, with no backup-specific code added to any of those services' own repositories.

#### Scenario: A scheduled run
- **WHEN** the backup mechanism's schedule fires
- **THEN** `mjolnir-postgres`, `stabbur-postgres` and `phonexa-postgres` are all dumped, with no code change required in `mjolnir`, `stabbur` or `phonexa` to make this happen

#### Scenario: Standing up the mechanism
- **WHEN** the operator runs `docker compose up` in `tun`
- **THEN** the backup mechanism is running, with no host-level step (no `crontab` entry, no manual clone) required beyond what `docker compose up` itself does

#### Scenario: One dump fails
- **WHEN** any one of the three database dumps fails during a run
- **THEN** none of the previously committed dump files is modified, no commit is made, and the failure is logged

### Requirement: The backup service connects to each database over the network, not by entering its container
The system SHALL connect to `mjolnir-postgres`, `stabbur-postgres` and `phonexa-postgres` as a separate service on the same network, authenticating with each database's existing password, rather than executing commands inside any database's own container.

#### Scenario: Dumping a database
- **WHEN** the backup service dumps `mjolnir-postgres`, `stabbur-postgres` or `phonexa-postgres`
- **THEN** it does so via a network connection authenticated with that database's existing password, not via `docker exec`

## ADDED Requirements

### Requirement: phonexa's whole database is dumped, with no exclusions
The system SHALL dump the entire `phonexa` database to `phonexa.sql`, SHALL NOT exclude any table, and SHALL overwrite the same filename each run. Because every phonexa table is user data, this dump SHALL include Shadowing media, segments and progress, users, and settings.

#### Scenario: Dumping phonexa
- **WHEN** the backup service dumps `phonexa-postgres`
- **THEN** the dump contains every table's rows, including `shadowing_media` and `shadowing_segments`

#### Scenario: Restoring the dump
- **WHEN** the dump is restored into a fresh Postgres 17 database after phonexa's migrations have created the schema
- **THEN** all rows load with their foreign keys satisfied

### Requirement: phonexa's audio tree is backed up incrementally, never overwritten
The system SHALL copy every file in phonexa's audio volume that is not already present at the same relative path in the backup repository, preserving the directory structure (under `phonexa-audio/`), and SHALL NOT overwrite or delete a file already in the backup repository. A file modified in the source after its first backup is therefore backed up in its first-seen form; this staleness is an accepted limitation.

#### Scenario: A new sample audio file
- **WHEN** a run finds a file in phonexa's audio volume whose relative path is absent from `phonexa-audio/`
- **THEN** it is copied to the same relative path, creating directories as needed, including when the path contains spaces or non-ASCII characters

#### Scenario: A file already backed up, since modified
- **WHEN** a run finds a file whose relative path already exists in `phonexa-audio/` but whose content has since changed
- **THEN** the backup copy is left as it was

#### Scenario: A sample deleted from phonexa
- **WHEN** a file present in `phonexa-audio/` no longer exists in the source volume
- **THEN** the backup copy is retained

#### Scenario: Empty audio volume
- **WHEN** phonexa's audio volume has no files
- **THEN** the run logs that the source is empty and continues without failing

### Requirement: phonexa's audio volume is mounted directly and read-only into the backup service
The system SHALL mount phonexa's audio volume directly into the backup service's container, read-only, rather than reading it through a helper container.

#### Scenario: Inspecting the backup service's configuration
- **WHEN** the backup service's container configuration is inspected
- **THEN** phonexa's audio volume is mounted read-only and no additional container is started to read it
