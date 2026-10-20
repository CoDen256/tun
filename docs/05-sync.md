# Progress sync: replacing Firestore

## What the stock app actually does (verified)

Sync lives entirely in **mod 2080** — `initUserData`, `updateUserData`,
`updateSessionUserData`, `updateSetting`, `addSurveyAnswers`, `getUserData`,
`deleteUserData`. Backend is Firestore, `userData/{uid}`, one doc per Firebase
Auth user.

**Local is the working copy; Firestore is pure backup.** Confirmed two ways:

- The Redux store is `createStore(persistReducer({key:"primary", storage: AsyncStorage,
  stateReconciler}, …))` (mod 953) — so state persists locally under the
  AsyncStorage key **`persist:primary`**.
- `getUserData()` is called from **exactly two places**: the Google and Apple
  sign-in success handlers (mods 2205, 2114). Nowhere else. With no sign-in,
  nothing in 2080 runs at startup at all.

Consequence: swapping the transport **turns backup on for the first time**
rather than replacing a working path. There is no risk of a server response
clobbering local state, because nothing reads the server during normal use.

### Semantics that must be preserved

```js
// every op: .get() then .update()  →  READ-THEN-FIELD-MERGE (PATCH, not replace)
updateUserData:    if (doc.exists) { if (0 == doc.data().completedSessions && 0 == incoming) return; … }
updateSetting:     if (currentUser) … if (doc.exists) … if (0 == doc.data().completedSessions) return;
getUserData:       if (!doc.exists) return factoryDefaults();
initUserData:      if (!exists) ref.set(factoryDefaults())
```

- `if (exists)` means **a missing server document silently disables every write.**
- `completedSessions == 0` means settings do not sync until one session is done.
- `accountCreationDate.toDate()` — Firestore `Timestamp` objects, not Dates.
- `totalCards` is stripped of `N`/`E`/`X` before upload and refilled locally via
  `getCard(ID)`; a legacy read path lz-string-decompresses it if it is a string.

## Design: a Firestore-shaped shim

**Do not rewrite mod 2080.** Replace the Firestore *handle* with a work-alike.

> **shim** = a stand-in object that exposes the same method names as the thing it
> replaces, so the calling code does not notice the swap. Same bolt pattern,
> different engine.

```js
collection("userData").doc(deviceId).get()
   → { exists, data(), ref: { set(doc), update(patch), delete() } }
```

Backed by:
- an **optimistic local document** in AsyncStorage (so writes never block on the
  network and nothing is lost offline), plus
- a **flush queue** to `PATCH /mjolnir/userdata/{deviceId}`.

Everything awkward — offline queuing, retries, `Timestamp.toDate()` revival,
create-on-first-use so the `exists` guard never silently disables writes — lives
in the shim. Mod 2080's body barely changes, which matters because it is one of
the modules most likely to shift when rebasing onto a newer APK.

The `uid` becomes a **device id** (a random id generated once and stored
locally). No identity, no accounts.

## Server side

```
GET   /mjolnir/userdata/{deviceId}      → the same document shape as userData/{uid}
PATCH /mjolnir/userdata/{deviceId}      → field-merge
POST  /mjolnir/userdata/{deviceId}      → create with defaults

hub.userdata(device_id pk, doc JSONB, updated_at)
hub.userdata_history(id, device_id, doc JSONB, at)   -- append-only, every sync
hub.device_state(device_id, active_build_id, pending_build_id,
                 audio_cached, audio_total, last_error, seen_at)
```

JSONB means you can query `totalCards` with plain SQL for the progress UI.
The history table is what makes "I can check and verify it" actually true —
last-write-wins storage is not a backup.

### Device status: piggyback

> **piggyback** = attach extra data to a request that is already happening
> instead of making a separate one.

The device already PATCHes progress regularly, so `activeBuildId`,
`audioCached`, `audioTotal`, `lastFetchError` ride along in that payload. One
fewer endpoint, one fewer failure mode, one fewer thing to schedule.

Trade-off: it mixes two concerns inside the shim. Acceptable for a single
device; split into `POST /device/heartbeat` if it gets muddy.

## Restore

There is no restore path in the app (reads happen only on sign-in, which you
will never do). Restore is therefore a bundle-side operation:

```
startup hook (new JS module):
    if no local restore-marker and the server has a document for this device:
        write it into AsyncStorage under "persist:primary"
        (before redux-persist rehydrates)
```

Rare event, no UI needed, fully hot-fixable because it lives in the bundle.

## Per-card progress record

```js
{ ID,            // bare 6-char card id
  language,      // *** NOT a language — the DIRECTION letter "N"|"E"|"A" ***
  DECK_ID,
  Stage, Park, Postponed, Graduated, Type, Time, CF,
  AutoParkHit, AutoTagHit, numberOfReschedulings }
```

Identity is the triple `{ID, language, DECK_ID}` (mods 2110, 2124, 2131), so
**each occurrence is scheduled independently** — a type (a) card holds three
separate SRS states. See the **mjolnir** repo's `docs/findings.md` for the corrected field
documentation and the Stage/CF interval tables.
