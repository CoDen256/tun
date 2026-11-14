## Why

`progress-sync-shim`'s one-shot, automatic "restore on first launch" mechanism
(`patches/js/progress-sync-restore-companion.js`, D-S4) is unreliable in
practice: Google Sign-In on a freshly-reassembled/resigned APK is itself
unreliable (separate, pre-existing issue — certificate-fingerprint mismatch,
out of scope here), and even once signed in, the stock app's own redux-persist
rehydration is laggy enough that it can take several relaunches before synced
progress appears. A restore attempt that fires exactly once, at an
unpredictable moment, and can never retry once its marker is set, is the
wrong shape for this reality. `progress-sync-shim` itself was deleted
(`tun/docs/07-decisions.md` D127) rather than kept dangling once this was
clear.

The uid-keyed sync backend that change shipped (`hub.userdata`/
`userdata_history`, `hub/src/userdata.js`, `/mjolnir/userdata/{uid}`, and the
`2080-progress-sync-shim.edited.js` patch) is unaffected and stays exactly as
it is — this change only replaces how a local restore gets *triggered*.

## What Changes

- Remove `patches/js/progress-sync-restore-companion.js`'s automatic,
  one-shot, launch-time restore entirely — no marker, no fire-once check, no
  companion running at boot.
- Add a manual "Pull cloud progress" (name TBD in design) button to the app's
  existing account screen, calling the same restore logic (GET the signed-in
  uid's userdata document, and — if it isn't just this call's own
  auto-creation — dispatch the same redux action creators mod 2205's sign-in
  restore already uses) on demand, repeatable, with no one-shot guard.
- **BREAKING** (in the sense of removing prior behavior): progress is no
  longer pulled automatically on any launch. A user who wants their cloud
  progress restored onto a device must tap the button themselves.

## Capabilities

### New Capabilities
- `manual-progress-restore`: a user-triggered, repeatable action that pulls
  the signed-in account's server-side progress and overwrites local state,
  replacing the previous automatic one-shot restore.

### Modified Capabilities
(none — no existing main spec described the automatic restore behavior
being removed; `progress-sync-shim`'s delta specs were never synced to main
specs before that change was deleted, per D127)

## Impact

- `patches/js/progress-sync-restore-companion.js`: removed entirely (its
  restore logic is extracted and reused, not just deleted outright — see
  design.md for where it moves).
- A patch-back pair (or new companion, per design.md) against the app's
  existing account screen module, adding the button and its tap handler.
- No changes to `hub/`, no changes to `2080-progress-sync-shim.edited.js`,
  no changes to the sync endpoint contract.
