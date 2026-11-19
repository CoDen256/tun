# publish-progress Specification

## Purpose
TBD - created by archiving change builder-ship-strips. Update Purpose after archive.
## Requirements
### Requirement: A publish in flight is visibly in progress, narrated by the run's own log
The system SHALL indicate, while a publish run is executing, that it is in
progress, and SHALL surface the running job's own narration lines as they are
written, without requiring a new persistence mechanism.

#### Scenario: The operator triggers a publish and waits
- **WHEN** the operator triggers a publish and the run begins writing its
  narration lines
- **THEN** the page shows an in-progress indication and the run's latest
  narration lines appear while it is still running

#### Scenario: The operator opens the page during a scheduled run
- **WHEN** a publish run is already executing and the operator loads the
  page without triggering anything
- **THEN** the page shows that run as in progress, with its narration

### Requirement: A publish that produces no run is reported as such, not as perpetual progress
The system SHALL report the outcome of a publish request that performs no
work — because nothing was newly eligible and therefore no run was
recorded — as a completed no-op.

#### Scenario: Publishing with nothing newly eligible
- **WHEN** the operator triggers a publish while no note is newly eligible in
  any deck
- **THEN** the page reports that nothing needed publishing and stops showing
  progress, rather than waiting indefinitely for a run that was never
  recorded

### Requirement: The last run's result is shown at the top of the page and survives a reload
The system SHALL derive the most recent run's result from stored run state
rather than from client-side memory, and SHALL present it at the top of the
page: on success the published build identity and what it shipped, on failure
the recorded error, each with a route to that run's full log.

#### Scenario: Reloading after a publish finished
- **WHEN** a publish has completed and the operator reloads the page
- **THEN** that run's result is still shown at the top of the page

#### Scenario: A scheduled publish the operator did not watch
- **WHEN** a scheduled publish completed while nobody had the page open
- **THEN** the next page load shows that run's result

#### Scenario: A publish that failed
- **WHEN** the most recent run failed
- **THEN** its recorded error is shown, with a route to that run's full log

### Requirement: A run that stops making progress is presented as stalled, never as perpetual progress
The system SHALL present a run that is recorded as running but has stopped
producing narration as stalled, so that a run whose process died is not
displayed as healthy ongoing work.

#### Scenario: The publishing process dies mid-run
- **WHEN** a run's stored state says it is running but it has produced no new
  narration for a sustained interval
- **THEN** the page presents it as stalled rather than continuing to show
  normal in-progress indication

