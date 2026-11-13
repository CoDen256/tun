## Context

`progress-sync-shim` (now deleted, `tun/docs/07-decisions.md` D127) shipped a
uid-keyed sync backend and a restore-on-launch companion
(`patches/js/progress-sync-restore-companion.js`). That companion:

- checks an AsyncStorage marker (`mjolnir-sync-restore-done`) on every launch
- the first time it's unset: if signed in, `GET /mjolnir/userdata/{uid}`, and
  if the returned doc is real (not `_justCreated`), dispatch the same redux
  action creators mod 2205's own sign-in restore uses
- sets the marker either way — **never runs again on that install**

This is fragile for two confirmed, real-world reasons (found operating this
app this session): Google Sign-In on a resigned APK is itself unreliable
(separate, pre-existing issue, out of scope here), and the stock app's own
sign-in → redux-persist rehydration is laggy — it can take several relaunches
before synced progress visibly appears. A single fire-once attempt can easily
land at the wrong moment and, once spent, never gets a second chance.

Module 2176 (`patches/js/2176-my-account-build-id.edited.js`, already
patched by an earlier change to show the build id) is the app's account
screen. It already renders a settings-style list of label/value rows
(email, completed sessions, cards archived, subscription status, …) followed
by a real button — "Delete account" — built from a reusable button
component (`h.default`, props: `title`, `color`, `styles`, `paddingHorizontal`,
`onPress`). This is the natural home for a new "Pull cloud progress" button,
using the exact same component and styling convention already in use there.

## Goals / Non-Goals

**Goals:**
- Replace the one-shot, launch-time restore with a user-triggered, repeatable
  action reachable from the account screen.
- Reuse the exact same restore logic the old companion had (same endpoint,
  same "only restore a real doc, not an auto-created one" check, same redux
  action creators) — only the trigger changes, not the restore mechanism.
- Give the user visible feedback (success / no cloud data / failure) — a
  manual action needs a result, unlike a silent background one-shot.

**Non-Goals:**
- Not fixing Google Sign-In's reliability on a resigned APK (separate,
  pre-existing certificate-fingerprint issue).
- Not changing `hub/`, the sync endpoint contract, or
  `2080-progress-sync-shim.edited.js` in any way.
- Not adding a "push local progress to server" direction — this is pull-only,
  same as before (mod 2080's own existing sync already pushes on every local
  change; this button only ever overwrites local from server).

## Decisions

### D-M1 — Restore logic lives in a companion that defines a global function, not an auto-running IIFE

`progress-sync-restore-companion.js` is replaced by a new companion (name
TBD at task-authoring time, e.g. `progress-sync-pull-companion.js`) that,
at load time, does nothing except define
`globalThis.MJOLNIR_PULL_CLOUD_PROGRESS = function() { ...returns a Promise... }`
— reusing the exact same body `restoreFromDoc`/fetch/action-creator-dispatch
logic the old companion had, just not self-invoked. The account screen's
button `onPress` calls this global, the same cross-boundary-global
convention this project already uses for `MJOLNIR_BUILD_ID`/
`MJOLNIR_AUDIO_MANIFEST`/etc. (companions and patched modules are separate
pieces of appended/patched code with no shared scope otherwise).

Alternative considered: inline the restore logic directly into module
2176's own patched factory. Rejected — would need module 2176 to gain
dependencies on `__r(MOD_STORE)`/`__r(MOD_DECK_ACTIONS)`/etc. it doesn't
otherwise need, duplicating logic that's already correctly isolated in one
file; keeping it in a companion matches this project's existing separation
of concerns (account screen renders UI, companion owns sync logic).

### D-M2 — No one-shot marker, no launch-time call, at all

The `mjolnir-sync-restore-done` AsyncStorage marker and the launch-time
`run()`/IIFE wrapper are both removed entirely, not just disabled — nothing
calls `MJOLNIR_PULL_CLOUD_PROGRESS` except the button's own tap handler.

### D-M3 — Reuse the existing "Delete account" button component and styling

New button added via `h.default` (the same component "Delete account" uses),
placed in the same settings-row area, using `_.btn` styling — no new UI
component authored, no new style sheet entries beyond what's already in
this module's own `_` stylesheet (confirm at implementation time whether a
distinct color is warranted, e.g. not `#FF5050`/destructive-red, since this
is a safe/idempotent action, not a destructive one like delete-account).

### D-M4 — Debounce via local component state, not a global lock

Since taps are now user-repeatable (not a protected one-shot), the button's
`onPress` should guard against double-taps while a pull is in flight using
the screen's own local React state (e.g. a `pulling` boolean toggled around
the async call, swapping the button's `title` to something like "Pulling…"
and disabling it) — not a new global flag, which would be unnecessary
machinery for a single-screen concern.

### D-M5 — Explicit feedback via Alert, not silence

Unlike the old companion (silent by design — it ran unattended at launch,
so there was nothing to tell a user who wasn't looking), the button's result
must be visible: on success, confirm progress was pulled; if the account has
no cloud document yet (first-ever sync), say so, don't claim success; on
any fetch/dispatch failure, show the real error rather than swallowing it.
(The old companion's `.catch(function () {})` silence pattern is
specifically NOT appropriate here — that was correct for an unattended
background process, wrong for a user-initiated action.)

## Risks / Trade-offs

- **User has to remember the button exists** → mitigation: none needed at
  this project's scale (operator is the only real user); this trade-off was
  made deliberately in preference to a flaky automatic mechanism.
- **Tapping the button while signed in on a device that already has newer
  local-only progress (not yet synced up) would overwrite it** → same risk
  the old automatic companion already carried (D-S4's own design never
  handled "local has unsynced-forward progress" either); not worsened by
  this change, just made more visible since it's now explicit and
  repeatable rather than a rare one-shot. Worth a confirmation dialog before
  overwriting, if the account screen can cheaply show the local
  `completedSessions`/`totalCards.length` for comparison — otherwise, out of
  scope for this change (flag as an Open Question below).
- **Account screen (module 2176) must actually expose `react-native`'s
  `Alert` already** → needs confirming against the real bundle at
  implementation time (patch-back diff practice this project always
  follows); not assumed here as fact.

## Open Questions

- Should the button show a confirmation ("This will overwrite progress on
  this device — continue?") before pulling, given it's a destructive
  overwrite from the user's perspective? Leaning yes, given D-M5's "manual
  actions need visible consequences" reasoning, but not decided here —
  resolve at implementation time, record as an ADR amendment if it changes
  from what's in tasks.md.
