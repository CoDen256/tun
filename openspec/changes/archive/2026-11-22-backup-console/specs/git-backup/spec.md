# git-backup Specification (delta)

## ADDED Requirements

### Requirement: The backup project owns its own compose file
The backup service SHALL be declared in the backup project's own compose file,
which the root compose file includes, so that the project can be brought up
standalone like every other project in the repository.

Before this change `backup` was the only project declared directly in the root
compose file, and the only one that could not be run on its own.

#### Scenario: Standalone bring-up
- **WHEN** the operator runs compose from within the backup project directory
- **THEN** the backup service and its console start

#### Scenario: The existing clone is preserved
- **WHEN** the volume declaration moves between compose files
- **THEN** the existing repository clone volume is still used, because the
  volume carries an explicit fixed name

## MODIFIED Requirements

### Requirement: Disposable run-history tables are excluded from the mjolnir dump
The system SHALL exclude `job_logs` and `build_jobs` from `mjolnir`'s
Postgres dump, and SHALL NOT exclude any table referenced by them or by
any permanent ledger table (`card_slots`, `pending_occurrences`,
`card_content`, `minted_notes`, `occurrence_shipments`, `publications`,
`logic_bundles`).

`userdata` and `userdata_history` are removed from the list of tables this
requirement protects. They are not protected here any more because
`userdata-git-history` gives them a different, explicitly specified archive —
a committed per-account JSON export — rather than inclusion in this dump. That
change is the authority on their handling; this requirement simply stops
asserting a rule it no longer governs.

#### Scenario: Dumping mjolnir's database
- **WHEN** the backup mechanism dumps `mjolnir`'s database
- **THEN** the resulting dump contains no `job_logs` or `build_jobs` data

#### Scenario: Restoring the dump
- **WHEN** the dump is restored into a fresh database, after the
  application's own migrations have created the full schema
- **THEN** every permanent ledger table this requirement names is complete
