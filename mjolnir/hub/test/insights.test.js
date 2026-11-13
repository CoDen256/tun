import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { merge } from "../src/userdata.js";
import { seedDecks } from "../src/decks.js";
import { resetCardIndexCache } from "../src/cardText.js";
import { buildInsights } from "../src/insights.js";
import { renderInsightsPage } from "../src/insightsPage.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

const DAY = 86400e3;
const NOW = Date.parse("2026-11-07T19:00:00Z");

// A small, hand-built fixture bundle: one real stock deck (Z01, outside any
// hub deck family's reserved code range) and one STALE deck (C21 — inside
// `practice`'s C20-C29 range per `builder/src/deckFamilies.js`, but never
// seeded into the `decks` table) — D-IN4's stale-bundle trap.
function fixtureBundleSource() {
  return buildFixtureBundleSource({
    decks: [
      { ID: 50, Name: "Z01", Title: "Stock one", MaxInterval: 10, AutoTickStreak: 1, AutoHammerCount: 2, Cards: [{ Card: "Z01001N", P: "N" }] },
      { ID: 51, Name: "C21", Title: "Stale practice overflow", MaxInterval: 10, AutoTickStreak: 1, AutoHammerCount: 2, Cards: [{ Card: "C21001N", P: "N" }] },
    ],
    cards: [
      { DECK_ID: "Z01", ID: "Z01001", N: "<div>stock card</div>", E: "<div>answer</div>", D: "Stock one", X: "", A: "N" },
      { DECK_ID: "C21", ID: "C21001", N: "<div>stale card</div>", E: "<div>answer</div>", D: "Stale practice overflow", X: "", A: "N" },
    ],
  });
}

function makeDataDir() {
  const dataDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-insights-"));
  fs.mkdirSync(path.join(dataDir, "ota", "bundle"), { recursive: true });
  fs.writeFileSync(path.join(dataDir, "ota", "current.json"), JSON.stringify({ buildId: "b-fixture" }));
  fs.writeFileSync(path.join(dataDir, "ota", "bundle", "b-fixture.js"), fixtureBundleSource());
  return dataDir;
}

describe("insights: buildInsights aggregate engine (device-insights-page)", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE userdata, userdata_history CASCADE");
  await seedDecks(); // C20 Practice, C30 Lexic

  const dataDir = makeDataDir();
  resetCardIndexCache();

  t.after(async () => {
    fs.rmSync(dataDir, { recursive: true, force: true });
    await closePool();
  });

  // Ten occurrences, deliberately covering every rule this change depends on:
  //  - 2 in rotation, well below ceiling (normal load)
  //  - 2 in rotation, exactly on ceiling, AutoParkHit = 1 (R4's first half)
  //  - 2 retired at the ceiling, AutoParkHit = 2, CF = MaxInterval (R4's second half)
  //  - 1 parked early (Stage 150), dated in the PAST
  //  - 1 parked early (Stage 100), dated in the FUTURE — both must contribute
  //    nothing to the forecast (task 5.1's regression)
  //  - 1 tagged difficult, AutoTagHit >= 2 (R5)
  //  - 1 with AutoTagHit 1 but Tag false (R5's negative case)
  function buildTotalCards() {
    const mk = (over) => ({
      ID: "Z01001",
      language: "N",
      DECK_ID: "Z01",
      D: "STOCK ONE",
      Stage: 3,
      CF: 4,
      Time: NOW + 4 * DAY,
      numberOfReschedulings: 1,
      AutoParkHit: 0,
      AutoTagHit: 0,
      Tag: false,
      ...over,
    });
    return [
      mk({ Time: NOW - 2 * DAY, CF: 2 }), // in rotation, below ceiling, past-due
      mk({ Time: NOW + 5 * DAY, CF: 8 }), // in rotation, below ceiling, future (lr = now-3d, in the past)
      mk({ Time: NOW + 10 * DAY, CF: 10, AutoParkHit: 1 }), // on ceiling, in rotation (R4 half 1)
      mk({ Time: NOW + 10 * DAY, CF: 10, AutoParkHit: 1 }), // on ceiling, in rotation (R4 half 1)
      mk({ Stage: 200, CF: 10, AutoParkHit: 2, Time: NOW - 40 * DAY }), // retired at ceiling, dated PAST
      mk({ Stage: 200, CF: 10, AutoParkHit: 2, Time: NOW + 5 * DAY }), // retired at ceiling, dated FUTURE
      mk({ Stage: 150, CF: 3, Time: NOW - 100 * DAY }), // parked early, dated PAST
      mk({ Stage: 150, CF: 29, Time: NOW + 5 * DAY }), // parked early, dated FUTURE (CF large enough that last-review still lands in the past)
      mk({ Stage: 200, CF: 10, Time: NOW - 5 * DAY, AutoTagHit: 2, Tag: true }), // flagged difficult (R5 positive), archived so it doesn't affect rotation counts
      mk({ Stage: 200, CF: 10, Time: NOW - 5 * DAY, AutoTagHit: 1, Tag: false }), // R5 negative case
    ];
  }

  await t.test("deckCatalogue excludes a stale bundle deck absent from `decks` (D-IN4)", async () => {
    const uid = "uid-insights-stale";
    await merge(uid, { totalCards: [], decksStatus: [] });
    const out = await buildInsights(uid, { dataDir, now: NOW });
    assert.ok(!out.deckSum.some((d) => d.code === "C21"), "a stale bundle-only deck must never be reported");
    assert.ok(out.deckSum.some((d) => d.code === "Z01"), "a real stock deck must still be reported");
    assert.ok(out.deckSum.some((d) => d.code === "C20" && d.managed));
    assert.ok(out.deckSum.some((d) => d.code === "C30" && d.managed));
  });

  await t.test("forecast excludes archived occurrences, past- or future-dated (task 5.1's regression)", async () => {
    const uid = "uid-insights-forecast";
    await merge(uid, { totalCards: buildTotalCards(), decksStatus: [] });
    const out = await buildInsights(uid, { dataDir, now: NOW });

    // Only the two below-ceiling in-rotation rows and the two on-ceiling
    // in-rotation rows are "in rotation"; dueToday/overdue/atCap must never
    // be inflated by the archived rows, regardless of their stored Time.
    assert.equal(out.meta.activeN, 4);
    assert.equal(out.meta.overdue, 1); // the one in-rotation row dated 2 days in the past
    assert.equal(out.meta.atCap, 2);

    // The scheduled (future) series must sum to exactly the in-rotation
    // rows with a future due date (3 of the 4 active rows) — none of the
    // archived rows, however they are dated.
    const futSum = out.series.futTot.filter((v) => v !== null).reduce((a, v) => a + v, 0);
    assert.equal(futSum, 3);
    const parkSum = out.series.parkTot.filter((v) => v !== null).reduce((a, v) => a + v, 0);
    assert.equal(parkSum, 2); // the two future-dated archived rows, in their own separate series
  });

  await t.test("series invariants: equal length, x ascending, finite-or-null, past observed sums to the account's occurrence count", async () => {
    const uid = "uid-insights-series";
    await merge(uid, { totalCards: buildTotalCards(), decksStatus: [] });
    const out = await buildInsights(uid, { dataDir, now: NOW });
    const { series } = out;
    const n = series.t.length;
    assert.ok(n > 0);
    for (const arr of [series.pastTot, series.futTot, series.parkTot, ...series.pastFam, ...series.futFam]) {
      assert.equal(arr.length, n);
    }
    for (let i = 1; i < n; i++) assert.ok(series.t[i] > series.t[i - 1], "x must be strictly ascending");
    for (const arr of [series.pastTot, series.futTot, series.parkTot]) {
      for (const v of arr) assert.ok(v === null || Number.isFinite(v));
    }
    const pastSum = series.pastTot.filter((v) => v !== null).reduce((a, v) => a + v, 0);
    assert.equal(pastSum, out.rows.length, "every occurrence's reconstructed last-review day is counted exactly once");
  });

  await t.test("per-deck summaries sum to the account totals: in rotation, held, on-ceiling", async () => {
    const uid = "uid-insights-decksum";
    await merge(uid, { totalCards: buildTotalCards(), decksStatus: [] });
    const out = await buildInsights(uid, { dataDir, now: NOW });
    const heldSum = out.deckSum.reduce((a, d) => a + d.held, 0);
    const activeSum = out.deckSum.reduce((a, d) => a + d.active, 0);
    const atCapSum = out.deckSum.reduce((a, d) => a + d.atCap, 0);
    assert.equal(heldSum, out.rows.length);
    assert.equal(activeSum, out.meta.activeN);
    assert.equal(atCapSum, out.meta.atCap);
  });

  await t.test("R4/R5 identities hold on the fixture — a counterexample must fail loudly", async () => {
    const uid = "uid-insights-identities";
    await merge(uid, { totalCards: buildTotalCards(), decksStatus: [] });
    const out = await buildInsights(uid, { dataDir, now: NOW });

    // R4: {in rotation, AutoParkHit = 1} === {in rotation, CF = ceiling}.
    const inRotation = out.rows.filter((r) => r.st === 3);
    const autoParkHit1 = new Set(inRotation.filter((r) => r.aph === 1).map((r) => r.i));
    const onCeiling = new Set(inRotation.filter((r) => r.cf === r.mi).map((r) => r.i));
    assert.deepEqual(autoParkHit1, onCeiling);

    // R5: {AutoTagHit >= 2} === {Tag}.
    const autoTagHit2 = new Set(out.rows.filter((r) => r.atg >= 2).map((r) => r.i));
    const tagged = new Set(out.rows.filter((r) => r.tag).map((r) => r.i));
    assert.deepEqual(autoTagHit2, tagged);
  });

  await t.test("reconstructed last-review dates are never in the future", async () => {
    const uid = "uid-insights-lastreview";
    await merge(uid, { totalCards: buildTotalCards(), decksStatus: [] });
    const out = await buildInsights(uid, { dataDir, now: NOW });
    for (const r of out.rows) assert.ok(r.lrT <= NOW, `row ${r.id} has a reconstructed last-review in the future`);
  });

  await t.test("the rendered page contains no reference to an external host", async () => {
    const html = renderInsightsPage({ accounts: ["uid-insights-page"], selectedUid: "uid-insights-page" });
    // Allow the uPlot license comment (a string, never fetched) and the SVG
    // XML namespace URI (an identifier, not a network request) — neither is
    // an outbound request at render time.
    const urls = [...new Set(html.match(/https?:\/\/[^"'\s)]+/g) || [])];
    const allowed = new Set(["https://github.com/leeoniya/uPlot", "http://www.w3.org/2000/svg"]);
    const unexpected = urls.filter((u) => !allowed.has(u));
    assert.deepEqual(unexpected, []);
  });

  await t.test("HTTP: GET /mjolnir/device/insights.json is restricted to a known uid, and the page route renders", async () => {
    const { createServer } = await import("../src/server.js");
    const uid = "uid-insights-http";
    await merge(uid, { totalCards: buildTotalCards(), decksStatus: [] });
    const server = createServer(pool, { dataDir, publicBase: "http://localhost:8080", workbenchPatchesDir: "." });
    await new Promise((resolve) => server.listen(0, resolve));
    const port = server.address().port;
    try {
      const jsonRes = await fetch(`http://localhost:${port}/mjolnir/device/insights.json?uid=${encodeURIComponent(uid)}`);
      assert.equal(jsonRes.status, 200);
      const body = await jsonRes.json();
      assert.equal(body.meta.uid, uid);

      const bogusRes = await fetch(`http://localhost:${port}/mjolnir/device/insights.json?uid=uid-that-never-synced`);
      assert.equal(bogusRes.status, 404);

      const pageRes = await fetch(`http://localhost:${port}/mjolnir/device/insights?uid=${encodeURIComponent(uid)}`);
      assert.equal(pageRes.status, 200);
      const html = await pageRes.text();
      assert.ok(html.includes("Insights"));
    } finally {
      await new Promise((resolve) => server.close(resolve));
    }
  });
});
