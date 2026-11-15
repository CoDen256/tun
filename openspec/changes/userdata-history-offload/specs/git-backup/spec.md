## MODIFIED Requirements

### Requirement: Disposable run-history tables are excluded from the mjolnir dump
The system SHALL exclude `job_logs`, `build_jobs` and `userdata_history` from
`mjolnir`'s Postgres dump, and SHALL NOT exclude any table referenced by them
or by any permanent ledger table (`card_slots`, `pending_occurrences`,
`card_content`, `minted_notes`, `occurrence_shipments`, `publications`,
`logic_bundles`, `userdata`).

`userdata_history` is excluded by **data only** (`--exclude-table-data`), so a
restore still yields a complete, working schema that simply starts empty. It is
excluded for a different reason than the other two: it is not disposable
machine output, it is the version history of the account documents — but it is
a *redundant* copy of that history, because this change archives the same
documents as one mutable file per account whose version history git itself
keeps. Measured before the change: `userdata_history` was 30.9 MB of a 32 MB
`mjolnir.sql`, 96% of the dump, growing by ~424 KB per sync forever.

`userdata` itself is NOT excluded — the current document stays in the dump, so
a restore of the SQL alone yields a working, current system with no history.

#### Scenario: Dumping mjolnir's database
- **WHEN** the backup mechanism dumps `mjolnir`'s database
- **THEN** the resulting dump contains no `job_logs`, `build_jobs` or
  `userdata_history` row data, and contains every row of every other table
  including `userdata`

#### Scenario: Restoring the dump
- **WHEN** the dump is restored into a fresh database (after the application's
  own migrations have created the full schema, including
  `job_logs`/`build_jobs` empty)
- **THEN** every foreign key in the restored data is satisfied, with no manual
  intervention required, and `userdata_history` exists as an empty table

#### Scenario: Recovering a past document after the exclusion
- **WHEN** the operator needs a version of an account's document older than the
  live retention window
- **THEN** it is recoverable from the backup repository's version history for
  that account's archived file, not from the SQL dump

## ADDED Requirements

### Requirement: An excluded table whose data is preserved elsewhere must name where
The system SHALL require every table excluded from a dump to have a recorded
recovery source, and the standards check SHALL fail when an excluded table has
no such source — including when the source is an export this backup service
itself produces, rather than a file tracked in the monorepo.

#### Scenario: Checking the backup's exclusions
- **WHEN** `bin/check-standards.sh` runs
- **THEN** it passes for `userdata_history` on the grounds that the backup
  repository's per-account archive is its recovery source, and still fails for
  any newly excluded table with no recorded source at all

#### Scenario: The archive export is removed but the exclusion is left behind
- **WHEN** the per-account archive export is removed while
  `userdata_history` remains excluded from the dump
- **THEN** the standards check fails, rather than leaving a dump that silently
  covers neither
