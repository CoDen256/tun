## 0. Before you write any code

Read `design.md` in full, especially D-PP1 (extend the existing pull
companion, don't duplicate) and D-PP2's flagged risk (`lastCompletedSession`
stamping) — this is NOT pre-decided, resolve it by reading exactly how
`updateSessionUserData`'s `consistencyRate`/`firstSessionsCompleted`
computation works in the real `patches/js/2080-progress-sync-shim.edited.js`
source before deciding whether to call it as-is or use a different method.
Read `progress-sync-pull-companion.js`'s exact current source (it's being
extended, not replaced) before editing it.

## 1. Push companion function

- [x] 1.1 Resolve D-PP2's flagged risk: read `updateSessionUserData`'s real
      implementation, confirm whether calling it from a manual push is
      semantically acceptable (stamping `lastCompletedSession`/affecting
      `consistencyRate` as a side effect) or whether `updateUserData` (or
      another approach) is more correct. Record the decision as an ADR in
      `tun/docs/07-decisions.md` either way — this is exactly the kind of
      "found implementing, refines design.md" case this project's own
      practice expects to be recorded.
- [x] 1.2 Add `globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS` to the existing pull
      companion file (rename the file if appropriate per D-PP1), reading
      current state directly from the redux store (same `__r(MOD_STORE)`
      pattern the pull companion already uses) and calling the method
      decided in 1.1 with that current state.
- [x] 1.3 Tests: not-signed-in rejection; a successful push with real
      current state produces the correct call (method, args) to the
      shim; a failure (network/HTTP error) rejects with the real error,
      not swallowed.

## 2. Account screen button

- [x] 2.1 `2176-my-account-build-id.edited.js`: add a "Push cloud
      progress" button next to "Pull cloud progress", same `h.default`
      component pattern, no confirmation dialog (unlike pull's), guarded
      against double-taps the same way pull's button is (local
      `pushing` state, label swap, disabled while in flight).
- [x] 2.2 Wire up plain success/failure Alert feedback — no persistent
      on-screen "last pushed" indicator (per spec).
- [x] 2.3 Tests: pressing the button while signed in with the mocked
      companion shows success feedback; not-signed-in shows the right
      message; rapid double-press only triggers one call.

## 3. Sign-off

- [x] 3.1 If anything here contradicts or refines `design.md` during
      implementation (especially 1.1's resolution), record it as an ADR
      amendment in `tun/docs/07-decisions.md`.
- [x] 3.2 **(Operator, outside this change)** Assemble/install a bundle
      with the new push button; confirm on-device: pressing it while
      signed in actually updates the server's stored document to match
      current local state (check `userdata`/`userdata_history` directly);
      pressing it while not signed in shows the right message.
