# backup-console Specification

## ADDED Requirements

### Requirement: The backup service is observable without a shell on the host
The system SHALL serve an operator-plane page at `/backup/` that reports, for
the backup service, whether a run has ever completed, when the last successful
run finished, how long ago that was, when the next run is due, and whether any
locally-committed backup has failed to reach the remote.

Every one of these facts is already produced by the backup service or its
health check; none of them are currently displayed anywhere.

#### Scenario: A service that has never completed a run
- **WHEN** no successful run has ever completed (no success stamp exists)
- **THEN** the page states that no backup has ever completed, and does not
  render an unknown or zero age as though a backup had succeeded

#### Scenario: Locally committed but not pushed
- **WHEN** the backup repository clone holds commits that are not on the
  remote
- **THEN** the page reports the remote as stale, and says how many commits
  are unpushed

#### Scenario: The last run failed
- **WHEN** the most recent run failed
- **THEN** the page presents the failure as the page's primary state, together
  with when the retry is due, rather than reporting the last older success as
  the current state

### Requirement: Run history is durable and independent of Postgres
The system SHALL record every backup run durably, outside any Postgres
database, retaining for each run its start time, duration, outcome, what
changed, and the run's full captured log text.

Storage outside Postgres is a requirement and not an implementation
preference: the backup service's function is dumping Postgres, so a run that
fails because Postgres is unreachable must still be recorded.

#### Scenario: A run fails because the database is unreachable
- **WHEN** a run fails because Postgres cannot be reached
- **THEN** that run is recorded with its failure and its log, and is visible
  on the page

#### Scenario: Reading a past run's log
- **WHEN** the operator opens a past run
- **THEN** that run's full captured log text is shown, including the failure
  message for a failed run

#### Scenario: Outcomes are distinguished, not flattened
- **WHEN** a run completes with byte-identical dumps and commits nothing
- **THEN** it is recorded as a successful run that made no changes, and is
  distinguishable from both a failed run and a run that committed

#### Scenario: A push-recovery run
- **WHEN** a run pushes commits that a previous run had committed but failed
  to push
- **THEN** that run is recorded as having recovered the stale remote, and is
  not reported as a run that made no changes

#### Scenario: Retention
- **WHEN** stored run records exceed the configured retention
- **THEN** the oldest records and their logs are removed, and the retention
  in force is visible to the operator

### Requirement: A manual run uses the scheduled run's own code path
The system SHALL let the operator trigger one full backup run from the page,
and that run SHALL execute the same end-to-end path a scheduled run executes,
with no step added, skipped or altered.

#### Scenario: Triggering a run
- **WHEN** the operator triggers a run
- **THEN** a full run is performed — dumps, exports, mirrors, commit and push
  — identical to a scheduled run, and is recorded in run history like any
  other run

#### Scenario: The request is queued, not yet running
- **WHEN** a run has been requested but has not yet begun
- **THEN** the page reports it as queued, and does not report a run as in
  progress or complete before it has started

#### Scenario: A run already in progress
- **WHEN** a run is already in progress
- **THEN** the page does not start a second concurrent run

### Requirement: The git working tree has exactly one writer
The system SHALL ensure that only the backup service's own scheduler performs
dumps, exports, mirroring, commits and pushes. The console SHALL NOT write to
the backup repository clone.

#### Scenario: A console-triggered run
- **WHEN** the operator triggers a run from the console
- **THEN** the backup service performs it, and the console process makes no
  commit, push or write to the repository clone

### Requirement: Schedule and retention are editable at runtime, in one place
The system SHALL let the operator change the schedule interval, the
retry-after-failure interval, and the run-log retention from the page, and
SHALL hold each of those values in exactly one authoritative location.

The corresponding environment variables SHALL act only as seed values used
when no value has been stored, so that no setting exists as a live value in
two places.

#### Scenario: Changing the schedule
- **WHEN** the operator saves a new schedule interval
- **THEN** the next run is scheduled according to the new value, without
  restarting the service or editing any file by hand

#### Scenario: The health check follows the stored interval
- **WHEN** the stored schedule interval differs from the environment variable
- **THEN** the health check judges staleness against the stored interval, so
  that shortening the interval tightens the check

#### Scenario: Settings survive a restart
- **WHEN** the service restarts after a setting was changed
- **THEN** the stored value is still in force and the environment variable
  does not override it

#### Scenario: Credentials and the remote are not editable
- **WHEN** the operator views settings
- **THEN** the repository URL, SSH key path and database password are not
  editable from the page

### Requirement: Which sources are backed up is not editable from the page
The system SHALL present the backup sources as read-only, and SHALL NOT offer
any control that removes a source from the backup set.

A source switched off is indistinguishable, afterwards, from a source that
silently stopped being backed up.

#### Scenario: Viewing sources
- **WHEN** the operator views the sources panel
- **THEN** each source's current size or file count and its change since the
  previous run are shown, with no control to exclude any of them

#### Scenario: A source that went empty
- **WHEN** a source is empty while its mirror in the backup repository is not
- **THEN** the page presents this as a fault requiring attention, matching the
  backup service's own refusal to commit in that case

#### Scenario: A database deliberately outside the set
- **WHEN** a database is deliberately excluded from the backup set
- **THEN** the page states that it is excluded, rather than omitting it

### Requirement: The backup repository's own history is visible
The system SHALL display the backup repository's commit history, with each
commit's time, message and the files it changed.

#### Scenario: Viewing commit history
- **WHEN** the operator views commit history
- **THEN** commits are listed newest first, each expandable to the files it
  changed

### Requirement: The restore path is documented on the page
The system SHALL present, on the page, the restore procedure for each backed-up
source, as commands the operator can copy.

#### Scenario: Viewing restore instructions
- **WHEN** the operator views the restore section
- **THEN** the procedure for each source is shown as copyable commands

### Requirement: The console degrades rather than failing to start
The system SHALL serve the page when the state volume is empty, when no run has
ever completed, and when the backup repository has not been cloned, reporting
each condition rather than failing to boot.

#### Scenario: First boot, nothing has happened yet
- **WHEN** the console starts before any run has ever completed and before the
  repository has been cloned
- **THEN** the page is served and reports both conditions

### Requirement: A backup run is verifiable without an external remote
The system SHALL support a development configuration in which the backup
remote is a local bare git repository, so that cloning, committing, pushing and
reading commit history can be exercised with no network access and no SSH
credential.

#### Scenario: A full run in development
- **WHEN** the stack is brought up in development with the local remote
  configured
- **THEN** a full backup run clones, dumps, commits and pushes successfully,
  and its commit is visible both in run history and in commit history
