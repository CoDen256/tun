## MODIFIED Requirements

### Requirement: A button on the account screen pulls and overwrites local progress
The system SHALL provide a button on the account screen that, when pressed
while signed in, fetches the signed-in account's userdata document and
overwrites local progress with it — using the same restore logic (the same
endpoint, the same "real document vs. auto-created" check, the same
action-creator dispatch) the previous automatic mechanism used. This
overwrite SHALL include per-deck pull-progress state (`decks_info` /
`PullCounter`), not just card-level state (`total_cards`) — a deck whose
pull-progress entry is absent from the server's document SHALL have its
local pull-progress reset to that deck's default (not left at its
pre-pull value).

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

#### Scenario: Server document has no pull-progress entry for a deck the device has progress on
- **WHEN** the user presses the button, and the server's document's
  per-deck pull-progress list does not include an entry for a deck that
  the local device currently has a nonzero pull-progress counter for
- **THEN** that deck's local pull-progress counter is reset to its
  default value as part of the overwrite, not left at its pre-pull value
