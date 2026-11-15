## ADDED Requirements

### Requirement: Each account's synced document is archived as one mutable file under version control
The system SHALL write each account's current `userdata` document to a single
file named for that account's uid, overwriting it in place on every backup run,
and SHALL rely on the backup repository's version-control history — not on
accumulated rows or dated files — to retain every past version of that
document.

#### Scenario: Two consecutive runs with a changed document
- **WHEN** the backup service runs, the account's document changes, and the
  backup service runs again
- **THEN** the backup repository contains exactly one file for that account,
  holding the newer document, and the older document is recoverable from the
  repository's version history

#### Scenario: Two consecutive runs with an unchanged document
- **WHEN** the backup service runs twice with no sync in between
- **THEN** the file's bytes are identical both times, so nothing is staged for
  that file and the run commits nothing on its account

#### Scenario: A second account appears
- **WHEN** a uid that has never been seen before is present in `userdata` at
  run time
- **THEN** a new file named for that uid appears in the backup repository,
  alongside the existing ones, with no configuration change

### Requirement: The archived document is written key-sorted and pretty-printed
The system SHALL serialize each archived document with its object keys in
sorted order and with indentation, so that a change to a small part of the
document produces a small diff rather than one rewritten line.

#### Scenario: One card's progress changes
- **WHEN** a sync advances the SRS state of a single card and the backup runs
- **THEN** the diff for that account's file touches only the lines describing
  that card, not the whole file

#### Scenario: The same document is serialized twice
- **WHEN** the same unchanged document is serialized on two different runs
- **THEN** the two serializations are byte-identical, with no key-order
  variation between them

### Requirement: The archive export shares the backup run's all-or-nothing guarantee
The system SHALL treat a failure to export any account's document as a failure
of the whole backup run: no file in the backup repository is modified and no
commit is made, exactly as for a failed database dump.

#### Scenario: The export query fails
- **WHEN** the query that reads `userdata` fails part-way through a run
- **THEN** every previously committed file in the backup repository is left
  byte-for-byte untouched, no commit is made, and the run reports failure

#### Scenario: The export produces an empty or unparseable document
- **WHEN** an account's export produces an empty file or output that is not
  valid JSON
- **THEN** the run aborts rather than committing it over the previously
  archived document

### Requirement: An account removed from the database is removed from the archive deliberately, not silently abandoned
The system SHALL remove an archived file whose uid no longer exists in
`userdata`, and SHALL log that it did so, rather than leaving a file behind
that reads as a current archive of an account nothing exports any more.

#### Scenario: An account is deleted
- **WHEN** a uid present in a previous run's archive is absent from `userdata`
  on this run
- **THEN** that uid's file is removed from the backup repository, the removal
  is logged by uid, and the file's final content remains recoverable from
  version history

### Requirement: The live history table is bounded, and the archive is the permanent record
The system SHALL retain `userdata_history` rows for a bounded recent window
only, and SHALL NOT present that table — or any view built on it — as the
permanent archive of an account's past documents.

#### Scenario: A row ages out
- **WHEN** a `userdata_history` row is older than the retention window and the
  sweep runs
- **THEN** that row is deleted from the database, and the document it held is
  still recoverable from the backup repository's version history

#### Scenario: Reading the operator console's history view
- **WHEN** the operator opens the Sync page's history view
- **THEN** the page states that it shows a bounded recent window and names
  where the permanent archive lives, and does not describe itself as a backup

#### Scenario: The sweep runs when nothing has aged out
- **WHEN** the retention sweep runs and every row is inside the window
- **THEN** no row is deleted and the sweep succeeds
