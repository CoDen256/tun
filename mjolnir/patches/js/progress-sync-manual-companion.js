// Mjølnir progress sync — manual pull/push companion (progress-sync-
// manual-pull, D-M1/D-M2; progress-sync-manual-push, D-PP1/D-PP2).
// Appended the same way `boot-ok-companion.js` is, via `bundle-tool
// companion` — no new append mechanism, modifies zero existing module
// bytes. One file, not two (D-PP1) — pull and push share the same
// SYNC_BASE_URL/SYNC_TOKEN placeholders and the same store/firebase
// module ids, so there's nothing to duplicate by splitting them.
//
// Replaces `progress-sync-restore-companion.js` (deleted — D127/D-S4's
// one-shot restore-on-launch mechanism was found unreliable in practice:
// Google Sign-In on a resigned APK is itself unreliable, and the stock
// app's own sign-in -> redux-persist rehydration is laggy, so a single
// fire-once attempt could easily land at the wrong moment and, once spent,
// never get a second chance).
//
// D-M1: this file does NOT self-invoke. It only defines
// `globalThis.MJOLNIR_PULL_CLOUD_PROGRESS`/`globalThis.
// MJOLNIR_PUSH_CLOUD_PROGRESS`, each a callable returning a Promise — same
// cross-boundary-global convention as `MJOLNIR_BUILD_ID`/
// `MJOLNIR_AUDIO_MANIFEST` (this companion and the patched account-screen
// module, 2176, are two separate appended/patched pieces of code with no
// shared scope otherwise). The account screen's own "Pull cloud progress"/
// "Push cloud progress" buttons are the only callers — D-M2/D-PP3: no
// marker, no automatic call, ever.
//
// The restore logic itself (`restoreFromDoc`) is carried over unchanged
// from the deleted companion: dispatches the exact same action creators
// mod 2205's own sign-in restore uses, through the real, already-
// constructed redux store (module 953's default export) — reusing the
// app's own real code paths rather than hand-constructing redux-persist's
// on-disk shape.
//
// `__MJOLNIR_SYNC_BASE_URL__`/`__MJOLNIR_SYNC_TOKEN__` are placeholders,
// substituted the same way `__MJOLNIR_BUILD_ID__` is (src/commands/
// companion.js's `appendCompanion`) — baked at `bundle-tool companion`/
// `bundle-tool assemble` time via `--sync-base-url`/`--sync-token`. Must be
// given the SAME values passed when baking `2080-progress-sync-shim.
// edited.js`'s copy of these two placeholders — both patches talk to the
// same hub.
(function () {
  var SYNC_BASE_URL = '__MJOLNIR_SYNC_BASE_URL__';
  var SYNC_TOKEN = '__MJOLNIR_SYNC_TOKEN__';

  // Module ids pinned to this specific base bundle (same convention as
  // `boot-ok-companion.js`'s hardcoded 2150) — not derived, not looked up.
  var MOD_FIREBASE_AUTH = 1220;
  var MOD_STORE = 953;
  var MOD_DECK_ACTIONS = 1408;
  var MOD_SETTINGS_ACTIONS = 1411;
  var MOD_DECKS_LOGIC = 2110;
  // D-PP2: lodash's `omit`, the exact module `2080-progress-sync-shim.
  // edited.js`'s own `updateSessionUserData`/`updateUserData` already use
  // to strip `N`/`E`/`X` off each card before it leaves the device —
  // referenced directly here (not via the shim) since push intentionally
  // bypasses the shim's own session-completion methods (see D-PP2 below).
  var MOD_OMIT = 232;
  var CARD_OMIT_KEYS = ['N', 'E', 'X'];

  // D-M5: unlike the deleted companion (silent by design — it ran
  // unattended at launch), this is a user-triggered action and its result
  // must be visible. Logging too, same logcat convention every companion
  // in this repo uses (D63):
  //     adb logcat -s ReactNativeJS:V | grep mjolnir-progress-sync
  var TAG = '[mjolnir-progress-sync]';
  function log() {
    try {
      var args = Array.prototype.slice.call(arguments);
      args.unshift(TAG);
      console.log.apply(console, args);
    } catch (e) {}
  }

  function restoreFromDoc(doc) {
    var store = __r(MOD_STORE).default;
    var deckActions = __r(MOD_DECK_ACTIONS);
    var settingsActions = __r(MOD_SETTINGS_ACTIONS);
    var decksLogic = __r(MOD_DECKS_LOGIC).default;

    // Mirrors mod 2205's own post-`getUserData()` dispatch sequence
    // exactly — same actions, same order, same `reminderSetting` split.
    store.dispatch(settingsActions.setRestDays(doc.restDays));
    store.dispatch(settingsActions.setDailyCards(doc.dailyCards));
    store.dispatch(deckActions.setLastDeckPulled(doc.lastDeckPulled));
    store.dispatch(deckActions.setDecks(doc.gameDecks));
    if (doc.reminderSetting) {
      store.dispatch(settingsActions.setReminderSetting({ reminder1: doc.reminderSetting[0] }));
      store.dispatch(settingsActions.setReminderSetting({ reminder2: doc.reminderSetting[1] }));
    }
    store.dispatch(deckActions.setCompletedSessions(doc.completedSessions));
    store.dispatch(deckActions.setTotalCards(doc.totalCards));
    store.dispatch(settingsActions.setMarketingSurveySeen(doc.marketingSurveySeen));
    store.dispatch(settingsActions.setAcquisitionSource(doc.acquisitionSource));
    store.dispatch(settingsActions.setSelectedApproach(doc.selectedApproach));
    store.dispatch(settingsActions.setHasSeenMjolnirWay(doc.hasSeenMjolnirWay));

    var currentDecksInfo = store.getState().deckStats.decks_info;
    var mergedDecksInfo = decksLogic.initDecksStatus(currentDecksInfo, doc.decksStatus || []);
    store.dispatch(deckActions.setDecksInfo(mergedDecksInfo));
  }

  // Resolves with { status: 'restored' } or { status: 'nothing-to-restore' }
  // (a real, existing server doc vs. this call's own GET auto-creating one
  // — D-S2/D-S4's `_justCreated` check, unchanged). Rejects with an Error
  // whose `.code` is `'not-signed-in'` when there's no signed-in uid to
  // pull for, or the real fetch/HTTP error otherwise — callers (the account
  // screen's button) are expected to show these to the user (D-M5), never
  // swallow them the way the deleted companion's background run() did.
  function pullCloudProgress() {
    var uid;
    try {
      var auth = __r(MOD_FIREBASE_AUTH).default();
      uid = auth && auth.currentUser && auth.currentUser.uid;
    } catch (e) {}

    if (!uid) {
      log('not signed in — nothing to pull');
      var notSignedIn = new Error('not signed in');
      notSignedIn.code = 'not-signed-in';
      return Promise.reject(notSignedIn);
    }

    log('pulling cloud progress for', uid);
    return fetch(SYNC_BASE_URL + '/' + encodeURIComponent(uid), {
      headers: { Authorization: 'Bearer ' + SYNC_TOKEN }
    })
      .then(function (res) {
        if (!res.ok) throw new Error('pull failed: HTTP ' + res.status);
        return res.json();
      })
      .then(function (doc) {
        // D-S2/D-S4: only restore a REAL existing document — not this
        // call's own auto-creation. hub's GET marks that case explicitly
        // (`_justCreated`); nothing else in the bundle reads or depends on
        // that field.
        if (!doc || doc._justCreated) {
          log('no cloud progress for this account yet');
          return { status: 'nothing-to-restore' };
        }
        restoreFromDoc(doc);
        log('restored cloud progress');
        return { status: 'restored' };
      })
      .catch(function (e) {
        log('pull failed:', e && e.message ? e.message : String(e));
        throw e;
      });
  }

  // D-PP2 (resolved — see tun/docs/07-decisions.md's amendment for
  // progress-sync-manual-push): deliberately does NOT call mod 2080's
  // `updateSessionUserData`, even though it's the method the real
  // session-completion call site uses and the one this change's proposal
  // originally named. Reading its real implementation
  // (`2080-progress-sync-shim.edited.js`) shows it unconditionally stamps
  // `lastCompletedSession: new Date()` and appends a new entry to
  // `firstSessionsCompleted` (capped at 7) on EVERY call — both are
  // "a session just completed, right now" signals that would be false
  // coming from a manual push with no session having actually completed,
  // and would corrupt streak/consistency-rate/onboarding data server-side.
  // Instead this PATCHes the same sync endpoint pull already talks to
  // (`SYNC_BASE_URL`/`SYNC_TOKEN`, identical to the shim's own REST
  // mapping) with only the deterministic, current-state fields
  // `updateSessionUserData` would also send — `totalCards` (same `N`/`E`/
  // `X`-omitted shape), `lastDeckPulled`, `completedSessions`,
  // `decksStatus`, `archivedCards`/`inProgressCards` (same Park-filtered
  // counts) — none of the three session-completion-only fields above.
  function pushCloudProgress() {
    var uid;
    try {
      var auth = __r(MOD_FIREBASE_AUTH).default();
      uid = auth && auth.currentUser && auth.currentUser.uid;
    } catch (e) {}

    if (!uid) {
      log('not signed in — nothing to push');
      var notSignedIn = new Error('not signed in');
      notSignedIn.code = 'not-signed-in';
      return Promise.reject(notSignedIn);
    }

    var state = __r(MOD_STORE).default.getState();
    var decksLogic = __r(MOD_DECKS_LOGIC).default;
    var omit = __r(MOD_OMIT).default;
    var totalCards = state.deckStats.total_cards;

    var patch = {
      totalCards: totalCards.map(function (card) {
        return omit(card, CARD_OMIT_KEYS);
      }),
      lastDeckPulled: state.deckStats.last_deck_pulled,
      completedSessions: state.deckStats.completed_sessions,
      decksStatus: decksLogic.getDecksStatus(state.deckStats.decks_info),
      archivedCards: totalCards.filter(function (c) {
        return 1 == c.Park;
      }).length,
      inProgressCards: totalCards.filter(function (c) {
        return !c.Park;
      }).length
    };

    log('pushing cloud progress for', uid);
    return fetch(SYNC_BASE_URL + '/' + encodeURIComponent(uid), {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + SYNC_TOKEN
      },
      body: JSON.stringify(patch)
    })
      .then(function (res) {
        if (!res.ok) throw new Error('push failed: HTTP ' + res.status);
        log('pushed cloud progress');
        return { status: 'pushed' };
      })
      .catch(function (e) {
        log('push failed:', e && e.message ? e.message : String(e));
        throw e;
      });
  }

  if (typeof globalThis !== 'undefined') {
    globalThis.MJOLNIR_PULL_CLOUD_PROGRESS = pullCloudProgress;
    globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS = pushCloudProgress;
  }
})();
