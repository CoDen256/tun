## ADDED Requirements

### Requirement: Bundle downloads are observed at the gateway, without the device participating
The system SHALL record every request for a published bundle at the gateway
that serves it, deriving the build's identity from the request path, and SHALL
NOT require the device to report anything for this record to exist.

#### Scenario: A device downloads a bundle
- **WHEN** a bundle is requested from the gateway with a valid credential
- **THEN** a record exists naming that build's id, the time, the client
  address, the response status and the number of bytes served

#### Scenario: No device-side change is needed
- **WHEN** the recording is in place
- **THEN** no bundle rebuild, no app patch and no publish is required for the
  first record to appear

#### Scenario: Only bundle downloads are recorded
- **WHEN** the update descriptor, a media blob or an audio manifest is
  requested
- **THEN** no bundle-download record is created for it

#### Scenario: A failed or rejected download
- **WHEN** a bundle request is answered with a non-success status, or the
  response is cut short
- **THEN** the record exists and carries that status and the byte count
  actually served, rather than being dropped

### Requirement: Recording a download does not change what the device receives
The system SHALL NOT alter any byte, header, status code or cache directive of
a bundle response in order to record it, and SHALL NOT place any process,
database or network call in that response's path.

#### Scenario: Comparing responses before and after
- **WHEN** the same bundle is requested before and after the recording is
  introduced
- **THEN** the status code, every response header and every response byte are
  identical

#### Scenario: The recording destination fails
- **WHEN** the destination the record is written to is unwritable or full
- **THEN** the bundle is still served correctly, and the operator can see that
  recording failed

### Requirement: Recording a subset of traffic does not disable the gateway's own logging
The system SHALL keep the gateway's general request log intact when a subset of
requests is routed to its own destination; a request outside that subset SHALL
continue to appear in the general log.

#### Scenario: A request outside the recorded subset
- **WHEN** any request other than a bundle download is served
- **THEN** it appears in the gateway's general log and does not appear in the
  bundle-download record

#### Scenario: A bundle download
- **WHEN** a bundle download is served
- **THEN** it appears in the bundle-download record

### Requirement: The download record is permanent and survives log rotation
The system SHALL hold bundle-download records in durable storage independent of
the gateway's log files, so that a record remains available after the log file
that carried it has been rotated away or deleted.

#### Scenario: The log file is rotated
- **WHEN** the gateway's log file rolls over and the previous file is removed
- **THEN** every record already ingested from it is still available

#### Scenario: The same log content is ingested twice
- **WHEN** ingestion runs twice over log content it has already read
- **THEN** no duplicate record is created, and the stored counts are unchanged

#### Scenario: Ingestion encounters an unparseable line
- **WHEN** a line in the log cannot be parsed
- **THEN** that line is skipped and counted, the remaining lines are still
  ingested, and the skip is visible to the operator

### Requirement: Pulls are displayed per published build, with never-pulled builds visible
The system SHALL present, for each published build, when it was first and last
downloaded and how many downloads it has had, and SHALL make a published build
that has never been downloaded visually distinct rather than absent or
indistinguishable from one with zero recent activity.

#### Scenario: A build that has been pulled
- **WHEN** the operator views the pulls display for a build with downloads on
  record
- **THEN** its first-download time, last-download time and download count are
  shown

#### Scenario: A build published but never pulled
- **WHEN** a build has been published and never downloaded
- **THEN** it appears in the display, explicitly marked as never pulled

#### Scenario: A build identified
- **WHEN** a build is shown
- **THEN** its build id is the primary identifier shown, and any
  human-readable version label is secondary to it

### Requirement: The display never claims knowledge it does not have
The system SHALL NOT present a download as evidence that a build is active,
running or booted on the device, and SHALL NOT present the observed client
address as a device or account identity.

#### Scenario: Reading the pulls display
- **WHEN** the operator views the pulls display
- **THEN** it states that a download is not an activation, and that the
  observed address is an address rather than a device or account

#### Scenario: Data that predates the recording
- **WHEN** builds exist that were published before recording began
- **THEN** the display distinguishes "never pulled" from "pulled before
  recording began" or states plainly that no record exists for that period,
  rather than showing them as never pulled
