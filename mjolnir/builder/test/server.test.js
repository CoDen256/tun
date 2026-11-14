import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../../hub/src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { DECK_ALLOCATION } from "../../hub/src/decks.js";
import { createServer } from "../src/server.js";
import { startFakeStabbur } from "./helpers/fakeStabbur.js";
import { seedActiveLogicBundle } from "./helpers/logicBundleFixture.js";

// unified-auth 4.1: every route in this service now requires the
// gateway-verified `X-Tun-Operator` marker or INTERNAL_TOKEN — the old
// "gate disabled when no token is configured" escape hatch is gone, because
// it made a missing value an open console. These tests drive the service
// DIRECTLY, which production does not allow (4.7: nothing publishes outside
// the loopback interface), so they present the marker the gateway would have
// set. `rawFetch` is kept for the tests that assert the rejection itself.
const rawFetch = globalThis.fetch;
globalThis.fetch = (input, init = {}) =>
  rawFetch(input, { ...init, headers: { "X-Tun-Operator": "1", ...(init.headers || {}) } });


const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

describe("builder's HTTP server: forecast, schedule, and run-log pages all render", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query(
    "TRUNCATE card_slots, publications, build_jobs, minted_notes, decks, pending_occurrences, occurrence_shipments, job_logs, builder_config, logic_bundles, card_content CASCADE"
  );
  for (const { code, title } of DECK_ALLOCATION) {
    await pool.query("INSERT INTO decks (code, title, category) VALUES ($1, $2, $3)", [code, title, code[0]]);
  }

  process.env.ALLOW_NO_COMPANION = "1";
  process.env.ALLOW_HTTP = "1";
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-builder-server-"));
  const dataDir = path.join(tmpDir, "data");

  const fake = startFakeStabbur({ notes: [] });
  const stabburBaseUrl = await fake.listen();
  const config = {
    stabburBaseUrl,
    internalToken: fake.authToken,
    sourceLang: "no",
    dataDir,
    publicBase: "http://localhost:8080",
  };

  const server = createServer(pool, config);
  await new Promise((resolve) => server.listen(0, resolve));
  const port = server.address().port;

  await t.test("GET /builder renders the forecast page with stat-row and empty-state tables", async () => {
    const res = await fetch(`http://localhost:${port}/builder`);
    assert.equal(res.status, 200);
    const html = await res.text();
    assert.match(html, /Forecast/);
    assert.match(html, /Publish now/);
    assert.match(html, /Past batches/);
  });

  await t.test("GET /builder warns when no logic bundle is active yet", async () => {
    const html = await (await fetch(`http://localhost:${port}/builder`)).text();
    assert.match(html, /No active logic bundle/);
  });

  await t.test("GET /builder shows the active logic bundle's base_version/patch_rev once one is activated", async () => {
    const logicBundlePath = path.join(tmpDir, "logic-bundle.js");
    fs.writeFileSync(logicBundlePath, "var __BUNDLE_START_TIME__=1;\nfixture");
    await seedActiveLogicBundle(pool, logicBundlePath, { baseVersion: "1.5.12", patchRev: 3 });

    const html = await (await fetch(`http://localhost:${port}/builder`)).text();
    assert.doesNotMatch(html, /No active logic bundle/);
    assert.match(html, /base 1\.5\.12/);
    assert.match(html, /logic 3/);
  });

  await t.test("GET /builder/schedule renders with the default daily 02:00 selected", async () => {
    const res = await fetch(`http://localhost:${port}/builder/schedule`);
    assert.equal(res.status, 200);
    const html = await res.text();
    assert.match(html, /Every night at/);
    assert.match(html, /value="02:00"/);
  });

  await t.test("POST /builder/api/schedule saves, and the schedule page reflects it immediately", async () => {
    const res = await fetch(`http://localhost:${port}/builder/api/schedule`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ kind: "manual" }),
    });
    assert.equal(res.status, 200);
    const page = await (await fetch(`http://localhost:${port}/builder/schedule`)).text();
    assert.match(page, /Manual only.*checked|checked[^>]*>\s*Manual only/s);
  });

  await t.test("GET /builder/logs renders with no runs yet", async () => {
    const res = await fetch(`http://localhost:${port}/builder/logs`);
    assert.equal(res.status, 200);
    assert.match(await res.text(), /Run log/);
  });

  await t.test("unified-auth: every route needs the gateway marker or INTERNAL_TOKEN, and there is no login page", async () => {
    const authedServer = createServer(pool, { ...config, internalToken: "secret123" });
    await new Promise((resolve) => authedServer.listen(0, resolve));
    const authedPort = authedServer.address().port;
    try {
      const noAuth = await rawFetch(`http://localhost:${authedPort}/builder`, { redirect: "manual" });
      assert.equal(noAuth.status, 401);

      const apiNoAuth = await rawFetch(`http://localhost:${authedPort}/builder/api/forecast`);
      assert.equal(apiNoAuth.status, 401);

      const apiWithHeader = await rawFetch(`http://localhost:${authedPort}/builder/api/forecast`, {
        headers: { Authorization: "Bearer secret123" },
      });
      assert.equal(apiWithHeader.status, 200);

      const pageWithMarker = await rawFetch(`http://localhost:${authedPort}/builder`, {
        headers: { "X-Tun-Operator": "1" },
      });
      assert.equal(pageWithMarker.status, 200);

      // /builder/login and its cookie are DELETED (unified-auth 4.2).
      const loginPage = await rawFetch(`http://localhost:${authedPort}/builder/login`);
      assert.equal(loginPage.status, 401);
      const cookieAttempt = await rawFetch(`http://localhost:${authedPort}/builder`, {
        headers: { Cookie: "operator_token=secret123" },
        redirect: "manual",
      });
      assert.equal(cookieAttempt.status, 401);
    } finally {
      await new Promise((resolve) => authedServer.close(resolve));
    }
  });

  t.after(async () => {
    await new Promise((resolve) => server.close(resolve));
    await fake.close();
    fs.rmSync(tmpDir, { recursive: true, force: true });
    await closePool();
  });
});
