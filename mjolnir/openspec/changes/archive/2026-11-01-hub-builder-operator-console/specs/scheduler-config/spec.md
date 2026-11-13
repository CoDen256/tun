## ADDED Requirements

### Requirement: The publish schedule is stored, not hardcoded
The system SHALL persist the active schedule (daily-at-a-time, every-N-hours,
or manual-only) and SHALL read it fresh on each scheduling check rather than
compiling it into the running process.

#### Scenario: Changing the schedule takes effect without a restart
- **WHEN** the operator changes the schedule via the UI
- **THEN** the next scheduling check uses the new value, with no process
  restart required

### Requirement: Manual-only disables automatic publishing entirely
The system SHALL NOT trigger any automatic run when the schedule is set to
manual-only, regardless of how much time has elapsed since the last publish.

#### Scenario: Manual-only with eligible notes waiting
- **WHEN** the schedule is manual-only and eligible notes exist
- **THEN** no automatic run occurs; only an explicit "publish now" request
  triggers a run
