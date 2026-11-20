# git-backup Specification (delta)

## ADDED Requirements

### Requirement: The backup run exports account documents before it commits
The backup run SHALL export each account's document to the backup repository as
part of the same run that commits it, so that the exported files and the commit
cannot disagree about what was archived.

#### Scenario: A run's ordering
- **WHEN** a backup run executes
- **THEN** the export is produced before the commit, and the commit includes it

#### Scenario: The export fails
- **WHEN** the export step fails
- **THEN** the run is reported as failed, no commit is made, and every
  previously committed file is left untouched — the same all-or-nothing rule
  the dumps already follow

### Requirement: Account table data is excluded from the mjolnir dump
The backup run SHALL exclude the account document table and the per-sync
history table's data from `mjolnir`'s dump, while keeping their schema, so that
a restore yields a complete working database whose account tables start empty
and are refilled from the archive.

#### Scenario: Dumping mjolnir's database
- **WHEN** the backup mechanism dumps `mjolnir`'s database
- **THEN** the dump contains the account tables' schema and none of their data

#### Scenario: Restoring the dump
- **WHEN** the dump is restored into a fresh database
- **THEN** the account tables exist and are empty, and the database is
  otherwise complete and working
