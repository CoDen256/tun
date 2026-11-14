## MODIFIED Requirements

### Requirement: Every service's database is backed up
The system SHALL dump every service database to its own file on each backup
run, including the linguistics service, whose data was previously not backed up
at all.

#### Scenario: A backup run
- **WHEN** a backup cycle runs
- **THEN** one dump file per service database is produced and committed

#### Scenario: One dump fails
- **WHEN** any single dump fails
- **THEN** no dump file is replaced and no commit is made, leaving the previous
  complete backup intact

#### Scenario: A failed dump leaves no partial file
- **WHEN** a dump fails partway through
- **THEN** no previously committed dump file is truncated or overwritten
