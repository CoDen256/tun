## Why

`progress-sync-manual-pull` added a button that pulls server progress down
on demand. The reverse is also wanted: a way to push the device's *current*
progress up to the server on demand, without waiting for a full study
session to complete (session completion is the only thing that currently
triggers a full-state push, via mod 2080's `updateSessionUserData`).

## What Changes

- A new "Push cloud progress" button on the account screen (module 2176),
  next to the existing "Pull cloud progress" button.
- A new companion function (mirroring the pull companion's architecture —
  reaching the redux store directly via `__r`, not via React props),
  reading the device's current state and calling the exact same shim
  method (`updateSessionUserData`) real session-completion already calls,
  with the same field set, computed from current state rather than a
  just-finished session's state.
- No confirmation dialog — pushing only writes to the server, it never
  changes anything on the device, so there's nothing local to protect
  against (unlike pull, which overwrites local state and does confirm).
- Plain success/failure feedback (an alert), same as pull — no persistent
  on-screen indicator (e.g. no "last pushed: N min ago").

## Capabilities

### New Capabilities
- `manual-progress-push`: a user-triggered, repeatable action that pushes
  the device's current progress to the server, mirroring
  `manual-progress-restore`'s pull direction.

### Modified Capabilities
(none)

## Impact

- A new companion (or an addition to the existing
  `progress-sync-pull-companion.js`, exposing a second global function —
  exact shape decided in design.md) exposing
  `globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS`.
- `patches/js/2176-my-account-build-id.edited.js`: one more button, same
  `h.default` component pattern as "Pull cloud progress"/"Delete account".
- No changes to `hub/`, no changes to the sync endpoint contract — this
  calls the exact same PATCH path pulling/pushing already both use.
