# ota-pull-tracking Specification

## Purpose
TBD - created by archiving change ota-pull-tracking. Update Purpose after archive.
## Requirements
### Requirement: Bundle downloads are observed at the gateway without device participation
The system SHALL record each download of a published bundle from the gateway,
without requiring the device to report anything and without changing any byte
of the device-facing response.

An earlier approach that required the device to report its own state was built,
shipped and removed because the device never reported; no requirement here may
depend on the device reporting.

#### Scenario: A bundle is downloaded
- **WHEN** a client downloads a published bundle through the gateway
- **THEN** the download is recorded with its time, the build it was for, the
  outcome and the source address

#### Scenario: The device-facing response
- **WHEN** a bundle download is recorded
- **THEN** the response's status, headers and body are identical to what they
  were before recording existed

#### Scenario: A download that did not succeed
- **WHEN** a request for a bundle returns a non-success status
- **THEN** it is recorded with that status, and is not counted as a successful
  pull

### Requirement: Device liveness is tracked separately from bundle adoption
The system SHALL record launch-time checks for the current-build pointer as a
distinct kind of event from bundle downloads, and SHALL NOT present one as the
other.

#### Scenario: A launch-time check
- **WHEN** a client requests the current-build pointer
- **THEN** the check is recorded as a liveness event, distinct in kind from a
  bundle download

#### Scenario: Liveness carries no build decision
- **WHEN** a liveness event is displayed
- **THEN** it is not attributed to any build, because the recorded request
  carries no such information

#### Scenario: The noisy kind does not drown the meaningful one
- **WHEN** liveness events greatly outnumber bundle downloads in a period
- **THEN** bundle downloads remain individually visible, and consecutive
  successful liveness events may be grouped

#### Scenario: Grouping never hides a fault
- **WHEN** a liveness event has a non-success status
- **THEN** it is not grouped away, and remains individually visible

### Requirement: The record is durable and survives log rotation
The system SHALL store observed events durably, independently of the transport
the gateway writes them to, and ingestion SHALL be idempotent so that
re-reading the same transport inserts no duplicate.

#### Scenario: Re-reading the transport
- **WHEN** the same log content is ingested more than once
- **THEN** no event is recorded twice

#### Scenario: The transport is rotated away
- **WHEN** the gateway rotates or truncates its log
- **THEN** previously ingested events remain in the durable record

#### Scenario: The ingesting service restarts
- **WHEN** the ingesting service restarts
- **THEN** it resumes without duplicating or losing already-written events

### Requirement: Pull activity is visible in the console
The system SHALL present the recorded events on an operator page, filterable by
kind, by build and by time window, showing totals, the most recent download,
and current liveness.

#### Scenario: Viewing pull activity
- **WHEN** the operator opens the pulls page
- **THEN** total bundle downloads, the number of distinct builds downloaded,
  the most recent download and the most recent liveness event are shown, with
  the full chronological record below

#### Scenario: Filtering
- **WHEN** the operator filters by kind, build or time window
- **THEN** only matching events are listed and the listing remains paginable

#### Scenario: A period of silence
- **WHEN** no event occurred for an extended period
- **THEN** that silence is apparent from the page rather than having to be
  inferred from absent rows

### Requirement: Published builds show whether they were ever taken
The system SHALL show, for each published build, how many times it was
downloaded and when it was last downloaded, and SHALL distinguish a build that
is current and has never been downloaded from one that was superseded before it
could be.

These two states mean opposite things: the first is a fault, the second is
expected.

#### Scenario: A current build that was never downloaded
- **WHEN** the current published build has never been downloaded
- **THEN** it is flagged as needing attention

#### Scenario: A build superseded before it was downloaded
- **WHEN** a build was replaced by a later publication before any download
- **THEN** its absence of downloads is presented as expected, not as a fault

#### Scenario: Build inputs are not shown as pullable
- **WHEN** a record represents a build input the device never fetches
- **THEN** no download count is shown against it

### Requirement: The display states what the record cannot know
The system SHALL NOT present a download as evidence that a build is running on
a device, and SHALL NOT attribute an event to a device, account or handset
identity.

#### Scenario: Viewing a download
- **WHEN** the operator views a recorded download
- **THEN** it is presented as bytes having been served, not as a build being
  active on a device

#### Scenario: Source attribution
- **WHEN** an event's origin is displayed
- **THEN** it is presented as a network address, with no claim of device or
  account identity

