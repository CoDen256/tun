## ADDED Requirements

### Requirement: Every run's narration is captured against its build job
The system SHALL persist the run's key checkpoints (pull, assign, mint,
drain, regenerate, snapshot, publish) against that run's `build_job_id`,
viewable after the run completes.

#### Scenario: Viewing a completed run's log
- **WHEN** the operator opens a build job's detail
- **THEN** the sequence of checkpoints recorded during that run is shown, in
  the order they occurred

#### Scenario: A failed run still has a log
- **WHEN** a run fails partway through
- **THEN** every checkpoint reached before the failure is still recorded and
  visible, not discarded along with the failure
