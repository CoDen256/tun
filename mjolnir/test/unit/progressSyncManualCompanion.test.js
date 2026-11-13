import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";

const COMPANION_SOURCE = fs.readFileSync(path.resolve("patches/js/progress-sync-manual-companion.js"), "utf8");

const MOD_FIREBASE_AUTH = 1220;
const MOD_STORE = 953;
const MOD_DECK_ACTIONS = 1408;
const MOD_SETTINGS_ACTIONS = 1411;
const MOD_DECKS_LOGIC = 2110;
const MOD_OMIT = 232;
const SYNC_BASE_URL = "https://mjolnir.example.net/mjolnir/userdata";

// Loads the companion's IIFE — unlike the deleted progress-sync-restore-
// companion.js, this one does NOT self-invoke or fetch anything on its
// own; it only defines globalThis.MJOLNIR_PULL_CLOUD_PROGRESS/
// MJOLNIR_PUSH_CLOUD_PROGRESS (D-M1/D-M2/D-PP3). Every test calls one of
// these globals directly, the same way the account screen's button
// handlers will.
function installMocks({ uid = "uid-1", fetchResponse, fetchImpl, deckStats } = {}) {
  const dispatched = [];
  const initDecksStatusCalls = [];
  const getDecksStatusCalls = [];
  const fetchCalls = [];

  const store = {
    getState: () => ({
      deckStats: deckStats || { decks_info: [{ ID: "C20", PullCounter: 3 }] },
    }),
    dispatch: (action) => dispatched.push(action),
  };
  const deckActions = {
    setLastDeckPulled: (v) => ({ type: "SET_LAST_DECK_PULLED", payload: v }),
    setDecks: (v) => ({ type: "SET_DECKS", payload: v }),
    setCompletedSessions: (v) => ({ type: "SET_COMPLETED_SESSIONS", payload: v }),
    setTotalCards: (v) => ({ type: "SET_TOTAL_CARDS", payload: v }),
    setDecksInfo: (v) => ({ type: "SET_DECKS_INFO", payload: v }),
  };
  const settingsActions = {
    setRestDays: (v) => ({ type: "SET_REST_DAYS", payload: v }),
    setDailyCards: (v) => ({ type: "SET_DAILY_CARDS", payload: v }),
    setReminderSetting: (v) => ({ type: "SET_REMINDER_SETTING", payload: v }),
    setMarketingSurveySeen: (v) => ({ type: "SET_MARKETING_SURVEY_SEEN", payload: v }),
    setAcquisitionSource: (v) => ({ type: "SET_ACQUISITION_SOURCE", payload: v }),
    setSelectedApproach: (v) => ({ type: "SET_SELECTED_APPROACH", payload: v }),
    setHasSeenMjolnirWay: (v) => ({ type: "SET_HAS_SEEN_MJOLNIR_WAY", payload: v }),
  };
  const decksLogic = {
    initDecksStatus: (current, incoming) => {
      initDecksStatusCalls.push({ current, incoming });
      return [...current, ...incoming];
    },
    getDecksStatus: (decksInfo) => {
      getDecksStatusCalls.push(decksInfo);
      return decksInfo.map((d) => ({ ID: d.ID, derived: true }));
    },
  };
  // Real lodash omit shape: drops the named keys, keeps everything else.
  const omit = (obj, keys) => {
    const out = {};
    for (const k of Object.keys(obj)) if (!keys.includes(k)) out[k] = obj[k];
    return out;
  };
  const registry = {
    [MOD_FIREBASE_AUTH]: { default: () => ({ currentUser: uid ? { uid } : null }) },
    [MOD_STORE]: { default: store },
    [MOD_DECK_ACTIONS]: deckActions,
    [MOD_SETTINGS_ACTIONS]: settingsActions,
    [MOD_DECKS_LOGIC]: { default: decksLogic },
    [MOD_OMIT]: { default: omit },
  };

  global.__r = (id) => {
    if (!(id in registry)) throw new Error(`unexpected __r(${id}) in test`);
    return registry[id];
  };
  global.fetch =
    fetchImpl ||
    (async (url, opts) => {
      fetchCalls.push({ url, opts });
      return { ok: true, status: 200, json: async () => fetchResponse };
    });

  const indirectEval = eval;
  indirectEval(COMPANION_SOURCE.replace(/__MJOLNIR_SYNC_BASE_URL__/g, SYNC_BASE_URL).replace(/__MJOLNIR_SYNC_TOKEN__/g, "test-token"));

  return { dispatched, initDecksStatusCalls, getDecksStatusCalls, fetchCalls };
}

function cleanup() {
  delete global.__r;
  delete global.fetch;
  delete globalThis.MJOLNIR_PULL_CLOUD_PROGRESS;
  delete globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS;
}

test("progress-sync-manual-pull: defines the global but makes no network call on its own (D-M2 — no auto-invocation)", () => {
  const { fetchCalls } = installMocks({ fetchResponse: {} });
  assert.equal(typeof globalThis.MJOLNIR_PULL_CLOUD_PROGRESS, "function");
  assert.equal(fetchCalls.length, 0);
  cleanup();
});

test("progress-sync-manual-pull: not signed in — rejects with code 'not-signed-in', no fetch made", async () => {
  const { fetchCalls } = installMocks({ uid: null, fetchResponse: {} });

  await assert.rejects(() => globalThis.MJOLNIR_PULL_CLOUD_PROGRESS(), (err) => err.code === "not-signed-in");
  assert.equal(fetchCalls.length, 0);
  cleanup();
});

test("progress-sync-manual-pull: a real server document — restores via the same action creators mod 2205 uses, resolves 'restored'", async () => {
  const doc = {
    restDays: ["Sa"],
    dailyCards: 20,
    lastDeckPulled: 2,
    gameDecks: ["C20", "C21"],
    reminderSetting: [{ hour: "08" }, { hour: "16" }],
    completedSessions: 7,
    totalCards: [{ ID: "C20001" }],
    marketingSurveySeen: true,
    acquisitionSource: "organic",
    selectedApproach: ["casual"],
    hasSeenMjolnirWay: { firstPage: true, lastPage: true },
    decksStatus: [{ ID: "C21", PullCounter: 1 }],
  };
  const { dispatched, initDecksStatusCalls, fetchCalls } = installMocks({ fetchResponse: doc });

  const result = await globalThis.MJOLNIR_PULL_CLOUD_PROGRESS();
  assert.deepEqual(result, { status: "restored" });

  assert.equal(fetchCalls.length, 1);
  assert.match(fetchCalls[0].url, /\/uid-1$/);

  const types = dispatched.map((a) => a.type);
  assert.deepEqual(types, [
    "SET_REST_DAYS",
    "SET_DAILY_CARDS",
    "SET_LAST_DECK_PULLED",
    "SET_DECKS",
    "SET_REMINDER_SETTING",
    "SET_REMINDER_SETTING",
    "SET_COMPLETED_SESSIONS",
    "SET_TOTAL_CARDS",
    "SET_MARKETING_SURVEY_SEEN",
    "SET_ACQUISITION_SOURCE",
    "SET_SELECTED_APPROACH",
    "SET_HAS_SEEN_MJOLNIR_WAY",
    "SET_DECKS_INFO",
  ]);
  assert.equal(dispatched.find((a) => a.type === "SET_COMPLETED_SESSIONS").payload, 7);
  assert.deepEqual(dispatched.find((a) => a.type === "SET_TOTAL_CARDS").payload, [{ ID: "C20001" }]);

  assert.equal(initDecksStatusCalls.length, 1);
  assert.deepEqual(initDecksStatusCalls[0].current, [{ ID: "C20", PullCounter: 3 }]);
  assert.deepEqual(initDecksStatusCalls[0].incoming, doc.decksStatus);
  cleanup();
});

test("progress-sync-manual-pull: a doc that is only this call's own auto-creation resolves 'nothing-to-restore', dispatches nothing (D-S2/D-S4)", async () => {
  const { dispatched, fetchCalls } = installMocks({
    fetchResponse: { completedSessions: 0, totalCards: [], _justCreated: true },
  });

  const result = await globalThis.MJOLNIR_PULL_CLOUD_PROGRESS();
  assert.deepEqual(result, { status: "nothing-to-restore" });
  assert.equal(fetchCalls.length, 1);
  assert.equal(dispatched.length, 0);
  cleanup();
});

test("progress-sync-manual-pull: an HTTP failure rejects with the real error, not a swallowed one (D-M5)", async () => {
  installMocks({
    fetchImpl: async () => ({ ok: false, status: 500, json: async () => ({}) }),
  });

  await assert.rejects(() => globalThis.MJOLNIR_PULL_CLOUD_PROGRESS(), /HTTP 500/);
  cleanup();
});

test("progress-sync-manual-pull: repeatable — calling it twice in separate 'sessions' makes two independent fetches, no one-shot marker (D-M2)", async () => {
  const { fetchCalls } = installMocks({ fetchResponse: { completedSessions: 1, totalCards: [] } });

  await globalThis.MJOLNIR_PULL_CLOUD_PROGRESS();
  await globalThis.MJOLNIR_PULL_CLOUD_PROGRESS();

  assert.equal(fetchCalls.length, 2);
  cleanup();
});

test("progress-sync-manual-push: not signed in — rejects with code 'not-signed-in', no fetch made", async () => {
  const { fetchCalls } = installMocks({ uid: null });

  await assert.rejects(() => globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS(), (err) => err.code === "not-signed-in");
  assert.equal(fetchCalls.length, 0);
  cleanup();
});

test("progress-sync-manual-push: a successful push PATCHes current state — N/E/X omitted, Park-filtered counts, no session-completion fields (D-PP2)", async () => {
  const deckStats = {
    total_cards: [
      { ID: "c1", Park: 1, N: 1, E: 2, X: 3 },
      { ID: "c2", Park: 0, N: 1, E: 2, X: 3 },
      { ID: "c3", N: 1, E: 2, X: 3 },
    ],
    last_deck_pulled: 4,
    completed_sessions: 9,
    decks_info: [{ ID: "C20", PullCounter: 3 }],
  };
  const { fetchCalls, getDecksStatusCalls } = installMocks({ deckStats });

  const result = await globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS();
  assert.deepEqual(result, { status: "pushed" });

  assert.equal(fetchCalls.length, 1);
  const { url, opts } = fetchCalls[0];
  assert.match(url, /\/uid-1$/);
  assert.equal(opts.method, "PATCH");

  const body = JSON.parse(opts.body);
  assert.deepEqual(body.totalCards, [
    { ID: "c1", Park: 1 },
    { ID: "c2", Park: 0 },
    { ID: "c3" },
  ]);
  assert.equal(body.lastDeckPulled, 4);
  assert.equal(body.completedSessions, 9);
  assert.equal(body.archivedCards, 1);
  assert.equal(body.inProgressCards, 2);
  assert.deepEqual(body.decksStatus, [{ ID: "C20", derived: true }]);
  assert.equal(getDecksStatusCalls.length, 1);
  assert.deepEqual(getDecksStatusCalls[0], deckStats.decks_info);

  // D-PP2: must never send the session-completion-only fields
  // `updateSessionUserData` would stamp — a manual push is not a real
  // session completing.
  assert.ok(!("lastCompletedSession" in body));
  assert.ok(!("firstSessionsCompleted" in body));
  assert.ok(!("consistencyRate" in body));
  cleanup();
});

test("progress-sync-manual-push: an HTTP failure rejects with the real error, not a swallowed one", async () => {
  installMocks({
    deckStats: { total_cards: [], last_deck_pulled: 0, completed_sessions: 0, decks_info: [] },
    fetchImpl: async () => ({ ok: false, status: 500, json: async () => ({}) }),
  });

  await assert.rejects(() => globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS(), /HTTP 500/);
  cleanup();
});

test("progress-sync-manual-push: repeatable — calling it twice makes two independent PATCHes", async () => {
  const { fetchCalls } = installMocks({
    deckStats: { total_cards: [], last_deck_pulled: 0, completed_sessions: 0, decks_info: [] },
  });

  await globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS();
  await globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS();

  assert.equal(fetchCalls.length, 2);
  cleanup();
});
