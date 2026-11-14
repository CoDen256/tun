## Context

`progress-sync-pull-companion.js` (D-M1, `progress-sync-manual-pull`)
already reaches the redux store directly via `__r(MOD_STORE).default`,
bypassing React props entirely — the same architecture fits this change,
reading current state instead of dispatching into it.

The real session-completion call site (`index.android.bundle.exploded/
2140.js:151`):
```js
yield w.default.updateSessionUserData(M, N, A + 1, e);
// M = totalCards, N = lastDeckPulled, A = completedSessions (this call
// increments it by 1), e = decksStatus
```
`updateSessionUserData` (mod 2080) PATCHes: `totalCards, lastDeckPulled,
completedSessions, decksStatus, archivedCards, inProgressCards,
firstSessionsCompleted, consistencyRate, lastCompletedSession` — the last
three are computed/stamped inside the method itself (`lastCompletedSession:
new Date()` unconditionally, per the real session-completion call's own
semantics — it IS a "a session just completed" stamp, not a neutral
timestamp).

## Goals / Non-Goals

**Goals:**
- Push whatever the real session-completion path pushes, computed from
  the device's *current* state rather than a just-finished session's.
- Same store-access architecture as the pull companion (no new pattern).
- No confirmation dialog, no persistent on-screen state (per operator's
  explicit answer).

**Non-Goals:**
- Not reconciling server-vs-local conflicts — same as pull, this is a
  one-directional overwrite (server gets whatever the device currently
  has), no merge logic.

## Decisions

### D-PP1 — Extend the existing pull companion, don't create a near-duplicate file

`progress-sync-pull-companion.js` already has `MOD_STORE`/
`MOD_FIREBASE_AUTH`/the SYNC_BASE_URL/SYNC_TOKEN placeholders defined. Add
`globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS` as a second exported function in
the same file (rename the file if a name describing "pull and push" reads
better — e.g. `progress-sync-manual-companion.js` — decide at
implementation time), rather than duplicating all that setup in a second
file.

### D-PP2 — Call `updateSessionUserData` with current-state values, per the operator's explicit choice

Per the operator's answer ("exactly what is being pushed currently on the
session end... the full set"), the push button calls
`updateSessionUserData(totalCards, lastDeckPulled, completedSessions,
decksStatus)` — the device's CURRENT values for all four, not incremented
or altered. `archivedCards`/`inProgressCards` get recomputed inside the
method from `totalCards` the same way the real call already does
(Park-filtered counts) — no new logic needed for those two.

**Flagging, not deciding**: `updateSessionUserData` stamps
`lastCompletedSession: new Date()` unconditionally — this is specifically
a "a session just completed, right now" signal in the real call site. A
manual push triggered with no session having actually completed would
cause the server to believe a session just finished at that exact moment,
which could affect anything reading `lastCompletedSession`/
`consistencyRate` for streak-style logic. This is the one real semantic
risk in this change — confirm at implementation time (by reading exactly
how `consistencyRate`/`firstSessionsCompleted` get computed inside
`updateSessionUserData`, not assumed from this design doc) whether that's
an acceptable side effect of a "push now" button, or whether it needs a
different method (`updateUserData` does NOT touch any of these three
fields, but needs more current-state inputs — `gameDecks`/`restDays`/
`dailyCards`/`reminderSetting`/`selectedApproach`/`hasSeenMjolnirWay`/
`acquisitionSource`/`marketingSurveySeen` — and has its own zero-sessions
gate). Record whichever way this resolves as an ADR amendment.

### D-PP3 — No confirmation dialog, plain alert feedback

Matches the operator's explicit answer — push never changes local state,
so there's nothing to protect against; same success/failure Alert
pattern as pull, no persistent "last pushed" indicator on-screen.

## Risks / Trade-offs

- **The `lastCompletedSession` stamping question (D-PP2)** is the main
  open risk in this change — explicitly called out rather than silently
  resolved, since it affects server-side data semantics, not just this
  device's own display.
