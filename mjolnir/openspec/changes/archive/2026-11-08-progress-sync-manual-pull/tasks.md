## 0. Before you write any code

Read `design.md` in full, especially D-M1 (restore logic lives in a
companion that defines a global function, never self-invokes) and D-M5
(a manual action needs visible feedback — the old companion's silent
`.catch(() => {})` pattern does NOT carry over). Read the real source of
`patches/js/2176-my-account-build-id.edited.js` and its `.baseline.js`
counterpart before patching — confirm the "Delete account" button's exact
props/component (`h.default`) and the settings-row layout against the real
file, not just this design doc's quoted excerpts. Read
`patches/js/progress-sync-restore-companion.js` (its last shipped version,
in git history — the file is being replaced, not amended) for the exact
restore logic to reuse: `restoreFromDoc`, the module ids it uses
(`MOD_STORE`, `MOD_DECK_ACTIONS`, `MOD_SETTINGS_ACTIONS`, `MOD_DECKS_LOGIC`,
`MOD_FIREBASE_AUTH`), and the `_justCreated` check.

## 1. Extract restore logic into a callable companion

- [x] 1.1 Author a new companion (e.g.
      `patches/js/progress-sync-pull-companion.js`) that defines
      `globalThis.MJOLNIR_PULL_CLOUD_PROGRESS = function() {...}` at load
      time — reusing `progress-sync-restore-companion.js`'s exact
      `restoreFromDoc`/fetch/dispatch logic, with NO self-invocation, no
      AsyncStorage marker, no launch-time call of any kind.
- [x] 1.2 The returned function SHALL: check sign-in state first (reject
      with a recognizable "not signed in" reason if absent, per spec); GET
      the uid's userdata document; if `_justCreated`, resolve with a
      "nothing to restore" result distinct from success; otherwise dispatch
      the restore actions and resolve with a success result.
- [x] 1.3 Delete `patches/js/progress-sync-restore-companion.js` entirely.
- [x] 1.4 Tests: the new companion's global function, called directly
      (mocking `__r`/`fetch` the same way the old companion's tests did),
      covers: not-signed-in rejection, `_justCreated` → "nothing to
      restore", a real doc → correct action-creator dispatch sequence
      (reuse the existing dispatch-order assertions from the deleted
      companion's own test file), and a fetch failure → rejection with the
      real error, not a swallowed one.

## 2. The account-screen button

- [x] 2.1 Patch-back pair update:
      `patches/js/2176-my-account-build-id.edited.js` gains a new
      `h.default` button (same component/props shape as the existing
      "Delete account" button), placed in the settings-row area, calling
      `globalThis.MJOLNIR_PULL_CLOUD_PROGRESS()` on press.
- [x] 2.2 Guard against double-taps: local component state (e.g. a
      `pulling` boolean) disables the button and swaps its label while a
      call is in flight (D-M4) — confirm this module's component is
      function-based with hooks available (or whatever state mechanism the
      real file actually uses) before assuming `useState` works here.
- [x] 2.3 Resolve the Open Question from design.md: decide whether a
      confirmation step precedes the pull (given it overwrites local
      progress) — if yes, implement it; either way, record the decision
      taken as an ADR in `tun/docs/07-decisions.md` per this project's
      practice, since design.md left it explicitly open.
- [x] 2.4 Wire up visible feedback for all three outcomes (success /
      nothing-to-restore / failure), using whatever this module already
      uses for user-facing messages — confirm `react-native`'s `Alert` (or
      an existing in-app toast/dialog mechanism already used elsewhere in
      this module) is actually reachable from this patch before assuming
      `Alert.alert` works here; use the real mechanism found.
- [x] 2.5 Tests: pressing the button with each of the three outcomes shows
      the right feedback; pressing twice rapidly only triggers one call;
      not-signed-in press shows the right message and makes no request.

## 3. Sign-off

- [x] 3.1 Confirm the deleted companion's own prior test file's assertions
      (dispatch order, `_justCreated` handling, not-signed-in handling) all
      have an equivalent, still-passing test in the new companion's test
      file — nothing from the old behavior's test coverage should be
      silently dropped.
- [x] 3.2 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
- [x] 3.3 **(Operator, outside this change)** Assemble/install a bundle
      with the new companion and patched module 2176; confirm on-device:
      the button is visible on the account screen; pressing it while
      signed in with real cloud progress overwrites local state correctly;
      pressing it while signed in with no cloud progress yet shows the
      right message without altering local state; the app never pulls
      progress automatically on launch anymore.
