## ADDED Requirements

### Requirement: Progress restore is user-triggered, not automatic
The system SHALL NOT pull or overwrite local progress from the server
automatically on app launch. Restoring server-side progress onto a device
SHALL only happen when the user explicitly triggers it.

#### Scenario: Launching the app
- **WHEN** the app launches, regardless of sign-in state or how much time
  has passed since install
- **THEN** no network request is made to fetch the account's userdata
  document, and no local state is overwritten, purely as a result of
  launching

### Requirement: A button on the account screen pulls and overwrites local progress
The system SHALL provide a button on the account screen that, when pressed
while signed in, fetches the signed-in account's userdata document and
overwrites local progress with it — using the same restore logic (the same
endpoint, the same "real document vs. auto-created" check, the same
action-creator dispatch) the previous automatic mechanism used.

#### Scenario: Pressing the button while signed in with real cloud progress
- **WHEN** the user presses the button while signed in, and the account has
  an existing (non-auto-created) userdata document on the server
- **THEN** local progress is overwritten from that document, via the same
  redux action creators the app's own sign-in restore uses

#### Scenario: Pressing the button while signed in with no cloud progress yet
- **WHEN** the user presses the button while signed in, and the server's
  response for this account is only this call's own auto-creation (no real
  prior sync)
- **THEN** local progress is left unchanged, and the user is told there is
  no cloud progress to restore — not told it succeeded

#### Scenario: Pressing the button while not signed in
- **WHEN** the user presses the button while not signed in
- **THEN** no request is made, and the user is told they need to be signed
  in, rather than the button silently doing nothing

### Requirement: The restore action is repeatable with no one-shot restriction
The system SHALL allow the restore action to be triggered any number of
times, with no persisted marker preventing a later attempt.

#### Scenario: Pressing the button multiple times across separate app sessions
- **WHEN** the user presses the button, closes the app, reopens it, and
  presses the button again
- **THEN** the second press performs the restore exactly as the first did,
  with nothing recorded by the first press preventing it

### Requirement: Concurrent presses are guarded against, not queued or duplicated
The system SHALL prevent a second restore attempt from starting while one
triggered by the same button is still in flight.

#### Scenario: Rapidly pressing the button twice
- **WHEN** the user presses the button, then presses it again before the
  first request has completed
- **THEN** only one restore request is made; the second press has no effect
  while the first is still in flight

### Requirement: The outcome of a restore attempt is always visible to the user
The system SHALL show the user a clear result of every restore attempt —
success, "nothing to restore," or failure (with the real error) — never
silently doing nothing or silently failing.

#### Scenario: A restore attempt fails (e.g. network error)
- **WHEN** the fetch or dispatch underlying a restore attempt fails
- **THEN** the user sees that it failed, with the real error message — not
  a silent no-op
