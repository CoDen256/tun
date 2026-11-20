# userdata-archive Specification

## ADDED Requirements

### Requirement: Each account's synced document is archived as one mutable file
The system SHALL maintain, in the backup repository, exactly one file per
account holding that account's current synced document, overwritten in place on
each backup run, so that the repository's own version history is the history of
that document.

The system SHALL NOT accumulate one stored copy per sync in any location that
is committed to the backup repository.

#### Scenario: A backup run with a changed document
- **WHEN** a backup run finds an account's document has changed since the last
  run
- **THEN** that account's file is overwritten with the current document and the
  change is committed, producing one new version of one file

#### Scenario: A backup run with an unchanged document
- **WHEN** an account's document has not changed since the last run
- **THEN** the file is unchanged and the run commits nothing for it

#### Scenario: Several accounts
- **WHEN** more than one account exists
- **THEN** each has its own file, and a change to one does not rewrite another

#### Scenario: A new account
- **WHEN** an account appears that has no file yet
- **THEN** a file is created for it on the next run

### Requirement: The archive is human-readable and diffs line by line
The system SHALL serialize each archived document with stable key ordering and
one scalar per line, so that a change to one value produces a change to a
correspondingly small number of lines in a textual diff.

Stable ordering is a requirement; alphabetical ordering is not. Any
deterministic order satisfies this, and the order SHALL NOT change between runs.

#### Scenario: A single value changes
- **WHEN** one field of one element of the document's card array changes
- **THEN** the textual diff between the two committed versions shows a change
  confined to that field's own line, and does not rewrite unrelated lines

#### Scenario: Re-running with identical data
- **WHEN** a run exports a document whose data has not changed
- **THEN** the produced file is byte-identical to the committed one

#### Scenario: Reading a change
- **WHEN** the operator inspects the difference between two committed versions
- **THEN** the changed fields are legible as text, without decoding an escaped
  or single-line representation

### Requirement: The archive is written outside the device-facing request path
The system SHALL produce the archive from a process that is not in the path of
any device request, and SHALL NOT add any write to the device-facing sync
endpoint's handling of a request.

#### Scenario: A device sync
- **WHEN** a device sends a sync request
- **THEN** the request's handling performs no archive write, and the response
  is unchanged in status, headers and body

### Requirement: Account state is restorable from the archive
The system SHALL provide a restore procedure that reconstructs an account's
stored document from its archived file, and the procedure SHALL be demonstrated
to reproduce the document before the document's data is removed from the
database dump.

#### Scenario: Restoring an account
- **WHEN** the archived file is imported into a database whose account table is
  empty
- **THEN** the account's stored document matches the archived document, and the
  device's next sync returns that document rather than factory defaults

#### Scenario: Ordering
- **WHEN** the change is rolled out
- **THEN** the archive exists, is committed, and has been shown to restore,
  before the document's data is excluded from the dump and before any
  fine-grained history is deleted

### Requirement: Fine-grained sync history is retained only briefly
The system SHALL retain the per-sync history rows for a short bounded window and
SHALL remove rows older than that window, so that the table does not grow
without bound.

#### Scenario: Rows inside the window
- **WHEN** a sync occurred within the retention window
- **THEN** its history row is present and carries the full document

#### Scenario: Rows outside the window
- **WHEN** a history row is older than the retention window
- **THEN** it is removed, and the account's state for that period is
  represented only by the archive

#### Scenario: The sweep cannot outrun the archive
- **WHEN** the sweep runs
- **THEN** it removes only rows whose period is already represented in the
  committed archive

### Requirement: An excluded table with no repository source is declared
The system SHALL record, in the automated backup-source check, that the
account tables are excluded from the dump and are covered by the backup
repository's own export, so that an excluded-and-unsourced table cannot appear
without being asserted.

#### Scenario: The standards check runs
- **WHEN** the backup-source check runs
- **THEN** the account tables' exclusion is recognised as covered by the
  export, and a newly excluded table with no declared source is reported as a
  problem
