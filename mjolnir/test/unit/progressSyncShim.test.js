import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import { runPatchback } from "../../src/commands/patchback.js";
import { parseBundle, readModuleSource } from "../../src/parseBundle.js";
import { extractFactoryBody } from "../../src/factory.js";

const generate = generatorPkg.default ?? generatorPkg;

const BASE_BUNDLE = path.resolve("base/smali.mjolnir.merged/assets/index.android.bundle");
const PAIR_BASELINE = path.resolve("patches/js/2080-progress-sync-shim.baseline.js");
const PAIR_EDITED = path.resolve("patches/js/2080-progress-sync-shim.edited.js");

// A standard babel `_asyncToGenerator` — the patched module's methods are
// all `(0, n.default)(function* () {...})`-wrapped generators; this is
// what actually drives a `yield this.userDataCollection.doc(...).get()`
// call through a real (mocked) Promise chain.
function asyncToGenerator(fn) {
  function step(gen, resolve, reject, key, arg) {
    let info;
    try {
      info = gen[key](arg);
    } catch (error) {
      reject(error);
      return;
    }
    if (info.done) {
      resolve(info.value);
    } else {
      Promise.resolve(info.value).then(
        (value) => step(gen, resolve, reject, "next", value),
        (err) => step(gen, resolve, reject, "throw", err)
      );
    }
  }
  return function (...args) {
    const gen = fn.apply(this, args);
    return new Promise((resolve, reject) => {
      step(gen, resolve, reject, "next", undefined);
    });
  };
}

function omitKeys(obj, keys) {
  const out = {};
  for (const k in obj) if (!keys.includes(k)) out[k] = obj[k];
  return out;
}

// Loads module 2080's exports with every dependency it actually touches
// stubbed just enough to run (D-S1's `currentUser`/uid, the async-generator
// helper, the N/E/X-omitting helper, firebase's `functions().httpsCallable`)
// — `global.fetch` is swapped out per test so each one controls exactly
// what hub's REST backend would have answered.
function loadPatchedModule2080(patchedSource, { uid = "test-uid" } = {}) {
  const ast = parse(patchedSource, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const fnSrc = generate(factory, { comments: false }).code;
  // Indirect eval (not direct `eval(...)`) — this test file is an ES
  // module, always strict; mod 2080's own body is sloppy-mode (no "use
  // strict", confirmed reading the real source) and relies on it —
  // `addSurveyAnswers` assigns an implicit global (`for (ans of e)`).
  // Indirect eval runs against the global scope, not this module's,
  // sidestepping the inherited strictness.
  const indirectEval = eval;
  const fn = indirectEval(`(${fnSrc})`);

  const httpsCallableCalls = [];
  const interopDefault = (obj) => (obj && obj.__esModule ? obj : { default: obj });
  const deps = [
    interopDefault, // d[0]: module 1
    // d[1]: module 99 — babel's `_defineProperty` helper, used by
    // `updateSetting` as `(0, t.default)({}, e, r)` to build `{[key]: value}`.
    { __esModule: true, default: (obj, key, value) => { obj[key] = value; return obj; } },
    { __esModule: true, default: omitKeys }, // d[2]: module 232 — strips N/E/X off a card
    { __esModule: true, default: asyncToGenerator }, // d[3]: module 68
    {}, // d[4]: module 2081, dead after patching (only referenced by the removed Firestore line)
    {
      __esModule: true,
      default: () => ({ currentUser: { uid, getIdToken: () => Promise.resolve("tok") } }),
      firebase: {
        functions: () => ({
          httpsCallable: (name) => (args) => {
            httpsCallableCalls.push({ name, args });
            return Promise.resolve();
          },
        }),
      },
    }, // d[5]: module 1220 — firebase auth
    {}, // d[6]: module 2105, side-effect only
    {}, // d[7]: module 2109, side-effect only
    { __esModule: true, default: { decompressFromBase64: () => { throw new Error("should not be called — totalCards is never a string in these tests"); } } }, // d[8]: module 1409, lz-string
  ];
  const requireStub = (idx) => deps[idx];

  const mod = { exports: {} };
  fn({}, requireStub, (x) => x, (x) => x, mod, mod.exports, [0, 1, 2, 3, 4, 5, 6, 7, 8]);

  return { exports: mod.exports.default, httpsCallableCalls };
}

async function patchedModule2080Source() {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-progress-sync-"));
  const outputPath = path.join(dir, "out.bundle");
  try {
    await runPatchback(BASE_BUNDLE, [`2080=${PAIR_BASELINE}:${PAIR_EDITED}`], outputPath);
    const patchedParsed = parseBundle(outputPath);
    return readModuleSource(outputPath, patchedParsed.modules.get(2080));
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

// `global.fetch` mock: `responses` is a queue consumed one-per-call (GET
// first, then whatever the write resolves to); every call is recorded for
// assertion.
function installFetchMock(responses) {
  const calls = [];
  const queue = [...responses];
  global.fetch = async (url, opts) => {
    calls.push({ url, method: opts.method, body: opts.body ? JSON.parse(opts.body) : undefined, headers: opts.headers });
    const next = queue.length ? queue.shift() : {};
    return { json: async () => next };
  };
  return calls;
}

test("progress-sync-shim (mod 2080): initUserData — GET only, no write, since GET never reports a document missing (D-S2)", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);
  const calls = installFetchMock([{ completedSessions: 0, firstSessionsCompleted: [] }]);

  await exports.initUserData();

  assert.equal(calls.length, 1);
  assert.equal(calls[0].method, "GET");
  assert.match(calls[0].url, /\/test-uid$/);
});

test("progress-sync-shim (mod 2080): update() sends the plain patch body, with no device-id field attached (device_state was removed — D125)", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);
  const calls = installFetchMock([{ completedSessions: 3 }]);

  await exports.updateSetting("dailyCards", 20);

  assert.equal(calls.length, 2);
  assert.equal(calls[1].method, "PATCH");
  assert.deepEqual(calls[1].body, { dailyCards: 20 });
});

test("progress-sync-shim (mod 2080): req()'s log breadcrumb summarizes array fields to their length, not a full dump (D63)", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);
  installFetchMock([{ completedSessions: 3 }]);

  const totalCards = Array.from({ length: 50 }, (_, i) => ({ ID: `C200${i}`, N: "n", E: "e", X: "x", Park: 0 }));
  const logs = [];
  const realLog = console.log;
  console.log = (...args) => logs.push(args);
  try {
    await exports.updateUserData(totalCards, ["C20"], 0, [], 15, [], 4, [], [], {}, null, false);
  } finally {
    console.log = realLog;
  }

  const patchLog = logs.find((args) => args[1] === "PATCH");
  assert.ok(patchLog, "expected a logged breadcrumb for the PATCH call");
  const summary = JSON.parse(patchLog[3]);
  assert.equal(summary.totalCards, "[50 items]", "a 50-card array must summarize to its length, not 50 full objects");
  assert.equal(summary.completedSessions, 4, "non-array fields still log as-is");
  // The whole point: a 50-card payload's breadcrumb must stay short, not
  // balloon into an unreadable multi-row logcat line.
  assert.ok(patchLog[3].length < 500, `summarized log line should be compact, got ${patchLog[3].length} chars`);
});

test("progress-sync-shim (mod 2080): updateUserData — GET then PATCH with the full field set", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);
  const calls = installFetchMock([{ completedSessions: 3 }]);

  const totalCards = [{ ID: "C20001", N: "<div>hus</div>", E: "<div>house</div>", X: null, Park: 1 }];
  await exports.updateUserData(
    totalCards,
    ["C20"],
    0,
    [],
    15,
    [{ days: ["Mo"], hour: "08", minute: "00" }],
    4,
    [],
    [],
    { firstPage: true, lastPage: false },
    "organic",
    true
  );

  assert.equal(calls.length, 2);
  assert.equal(calls[0].method, "GET");
  assert.equal(calls[1].method, "PATCH");
  const body = calls[1].body;
  assert.deepEqual(body.totalCards, [{ ID: "C20001", Park: 1 }]); // N/E/X stripped, Park kept
  assert.equal(body.completedSessions, 4);
  assert.equal(body.archivedCards, 1);
  assert.equal(body.inProgressCards, 0);
  assert.equal(body.acquisitionSource, "organic");
  assert.equal(body.marketingSurveySeen, true);
});

test("progress-sync-shim (mod 2080): updateUserData — skips the write when both the stored and incoming completedSessions are 0", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);
  const calls = installFetchMock([{ completedSessions: 0 }]);

  await exports.updateUserData([], [], -1, [], 15, [], 0, [], [], {}, null, false);

  assert.equal(calls.length, 1); // GET only — PATCH guarded off
  assert.equal(calls[0].method, "GET");
});

test("progress-sync-shim (mod 2080): updateSessionUserData — accountCreationDate.toDate() works, firstSessionsCompleted/consistencyRate computed", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);
  const yesterday = new Date(Date.now() - 86400000).toISOString();
  const calls = installFetchMock([
    { accountCreationDate: yesterday, firstSessionsCompleted: [], archivedCards: 0, inProgressCards: 0 },
  ]);

  const totalCards = [{ ID: "C20001", N: "n", E: "e", X: null, Park: 0 }];
  await exports.updateSessionUserData(totalCards, 0, 2, []);

  assert.equal(calls.length, 2);
  assert.equal(calls[1].method, "PATCH");
  const body = calls[1].body;
  assert.equal(body.inProgressCards, 1);
  assert.equal(body.firstSessionsCompleted.length, 1);
  assert.equal(typeof body.consistencyRate, "number");
  assert.ok(body.lastCompletedSession); // a serialized `new Date()`
});

test("progress-sync-shim (mod 2080): updateSetting — PATCHes exactly the one key, skipped when completedSessions is 0", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);

  const callsWrite = installFetchMock([{ completedSessions: 9 }]);
  await exports.updateSetting("dailyCards", 20);
  assert.equal(callsWrite.length, 2);
  assert.deepEqual(callsWrite[1].body, { dailyCards: 20 });

  const callsSkip = installFetchMock([{ completedSessions: 0 }]);
  await exports.updateSetting("dailyCards", 20);
  assert.equal(callsSkip.length, 1); // GET only
});

test("progress-sync-shim (mod 2080): addSurveyAnswers — appends to the existing array, then PATCHes", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);
  const calls = installFetchMock([{ surveyAnswers: ["a"] }]);

  await exports.addSurveyAnswers(["b", "c"]);
  // addSurveyAnswers fires `.ref.update(...)` without yielding on it — give
  // the fetch mock's microtask a tick to run before asserting.
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(calls.length, 2);
  assert.equal(calls[1].method, "PATCH");
  assert.deepEqual(calls[1].body.surveyAnswers, ["a", "b", "c"]);
});

test("progress-sync-shim (mod 2080): getUserData — returns the GET'd doc, no write", async () => {
  const source = await patchedModule2080Source();
  const { exports } = loadPatchedModule2080(source);
  const calls = installFetchMock([{ completedSessions: 5, totalCards: [{ ID: "C20001" }] }]);

  const doc = await exports.getUserData();

  assert.equal(calls.length, 1);
  assert.equal(calls[0].method, "GET");
  assert.equal(doc.completedSessions, 5);
  assert.deepEqual(doc.totalCards, [{ ID: "C20001" }]);
});

test("progress-sync-shim (mod 2080): deleteUserData — GET then DELETE, and still calls the real deleteUser Cloud Function", async () => {
  const source = await patchedModule2080Source();
  const { exports, httpsCallableCalls } = loadPatchedModule2080(source);
  const calls = installFetchMock([{ completedSessions: 1 }]);

  await exports.deleteUserData();

  assert.equal(calls.length, 2);
  assert.equal(calls[0].method, "GET");
  assert.equal(calls[1].method, "DELETE");
  assert.equal(httpsCallableCalls.length, 1);
  assert.equal(httpsCallableCalls[0].name, "deleteUser");
  assert.equal(httpsCallableCalls[0].args.uid, "test-uid");
});
