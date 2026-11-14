# manual-progress-push

## Purpose

Defines a user-triggered, repeatable action — mirroring
`manual-progress-restore`'s pull direction — that pushes the device's
*current* progress to the server on demand, without waiting for a full
study session to complete.

## Requirements

### Requirement: A button on the account screen pushes current progress to the server
The system SHALL provide a button on the account screen that, when
pressed while signed in, pushes the device's current progress to the
server — the same full-state field set the real session-completion path
already sends, computed from current state rather than a just-finished
session.

#### Scenario: Pressing the button while signed in
- **WHEN** the user presses the button while signed in
- **THEN** the device's current total cards, last deck pulled, completed
  sessions, and decks status are sent to the server, overwriting what was
  previously stored there for this account

#### Scenario: Pressing the button while not signed in
- **WHEN** the user presses the button while not signed in
- **THEN** no request is made, and the user is told they need to be signed
  in

### Requirement: Pushing never requires confirmation
The system SHALL NOT show a confirmation dialog before pushing — pushing
does not alter any local state on the device.

#### Scenario: Pressing the push button
- **WHEN** the user presses the push button
- **THEN** the push happens immediately, with no "are you sure" step

### Requirement: Pushing is repeatable with no persistent on-screen state
The system SHALL allow the push action to be triggered any number of
times, and SHALL NOT display any persistent "last pushed" indicator —
only a one-off result (success or failure) per press.

#### Scenario: Pressing the button multiple times
- **WHEN** the user presses the button, then presses it again later
- **THEN** each press pushes current state independently, with nothing
  persisted from the previous press affecting the next

### Requirement: Concurrent pushes are guarded against
The system SHALL prevent a second push attempt from starting while one
triggered by the same button is still in flight.

#### Scenario: Rapidly pressing the button twice
- **WHEN** the user presses the button, then presses it again before the
  first request has completed
- **THEN** only one push request is made
