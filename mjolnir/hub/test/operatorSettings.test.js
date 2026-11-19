import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { getSetting, getAllSettings, setSetting, isValidSettingKey } from "../src/operatorSettings.js";
import { createServer } from "../src/server.js";

// unified-auth 4.1 (same convention userdata.test.js/hub.test.js already
// use): every route requires the gateway-verified X-Tun-Operator marker or
// INTERNAL_TOKEN. These tests drive the service directly, which production
// never allows, so they present the marker the gateway would have set.
const rawFetch = globalThis.fetch;
globalThis.fetch = (input, init = {}) =>
  rawFetch(input, { ...init, headers: { "X-Tun-Operator": "1", ...(init.headers || {}) } });

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

describe("operatorSettings (card-preview-popup task 6, design.md §6, C37-C39)", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE operator_settings");

  t.after(async () => {
    await closePool();
  });

  await t.test("setSetting then getSetting round-trips a JSON value, no user column needed", async () => {
    const result = await setSetting(pool, "test.key.round-trip", { device: "375x812", theme: "dark", fontSize: 18 });
    assert.equal(result.ok, true);
    assert.equal(result.degraded, false);

    const read = await getSetting(pool, "test.key.round-trip", { should: "not appear" });
    assert.equal(read.found, true);
    assert.equal(read.degraded, false);
    assert.deepEqual(read.value, { device: "375x812", theme: "dark", fontSize: 18 });
  });

  await t.test("setSetting on an existing key overwrites the row and bumps updated_at, rather than inserting a second row", async () => {
    await setSetting(pool, "test.key.overwrite", { v: 1 });
    const { rows: before } = await pool.query("SELECT updated_at FROM operator_settings WHERE key = $1", ["test.key.overwrite"]);
    await new Promise((resolve) => setTimeout(resolve, 20));
    await setSetting(pool, "test.key.overwrite", { v: 2 });
    const { rows: after } = await pool.query("SELECT value, updated_at FROM operator_settings WHERE key = $1", ["test.key.overwrite"]);
    assert.equal(after.length, 1);
    assert.deepEqual(after[0].value, { v: 2 });
    assert.ok(new Date(after[0].updated_at).getTime() > new Date(before[0].updated_at).getTime());
  });

  await t.test("getSetting on a never-written key returns the caller's default, found:false, not an error", async () => {
    const read = await getSetting(pool, "test.key.never-written", "the-default");
    assert.equal(read.value, "the-default");
    assert.equal(read.found, false);
    assert.equal(read.degraded, false);
  });

  await t.test("getAllSettings returns every stored key in one round trip", async () => {
    await pool.query("TRUNCATE operator_settings");
    await setSetting(pool, "a.key", 1);
    await setSetting(pool, "b.key", { nested: true });
    const { values, degraded } = await getAllSettings(pool);
    assert.equal(degraded, false);
    assert.deepEqual(values, { "a.key": 1, "b.key": { nested: true } });
  });

  await t.test("D157: getSetting/getAllSettings/setSetting degrade to the caller's default instead of throwing when the database is unreachable (C39)", async () => {
    // A pool pointed at a port nothing listens on reproduces "database
    // unreachable" without actually stopping the shared postgres container
    // other tests in this suite (and other test files run in the same
    // process) still need.
    const pg = await import("pg");
    const deadPool = new pg.default.Pool({ connectionString: "postgresql://nobody:nobody@127.0.0.1:1/nonexistent", connectionTimeoutMillis: 300 });
    deadPool.on("error", () => {}); // same P56 reasoning as src/db.js's own handler

    const read = await getSetting(deadPool, "anything", "fallback-value");
    assert.equal(read.value, "fallback-value");
    assert.equal(read.found, false);
    assert.equal(read.degraded, true);

    const all = await getAllSettings(deadPool);
    assert.deepEqual(all.values, {});
    assert.equal(all.degraded, true);

    const write = await setSetting(deadPool, "anything", "x");
    assert.equal(write.ok, false);
    assert.equal(write.degraded, true);

    await deadPool.end();
  });

  await t.test("isValidSettingKey rejects empty/overlong/SQL-hostile keys, accepts the dotted convention this change uses", () => {
    assert.equal(isValidSettingKey("cardPreviewPopup.prefs"), true);
    assert.equal(isValidSettingKey("cardsPage.view"), true);
    assert.equal(isValidSettingKey(""), false);
    assert.equal(isValidSettingKey(undefined), false);
    assert.equal(isValidSettingKey(null), false);
    assert.equal(isValidSettingKey("a".repeat(201)), false);
    assert.equal(isValidSettingKey("key; DROP TABLE operator_settings;"), false);
  });

  await t.test("HTTP: GET /mjolnir/api/settings returns every stored key; POST upserts one (operator-plane, behind the same requireAuth every other hub route uses)", async () => {
    await pool.query("TRUNCATE operator_settings");
    const server = createServer(pool, { dataDir: ".", publicBase: "http://localhost:8080", workbenchPatchesDir: "." });
    await new Promise((resolve) => server.listen(0, resolve));
    const port = server.address().port;
    try {
      const empty = await fetch(`http://localhost:${port}/mjolnir/api/settings`);
      assert.equal(empty.status, 200);
      assert.deepEqual(await empty.json(), { settings: {}, degraded: false });

      const postRes = await fetch(`http://localhost:${port}/mjolnir/api/settings`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ key: "cardPreviewPopup.prefs", value: { device: "412x915", theme: "light", fontSize: 20 } }),
      });
      assert.equal(postRes.status, 200);
      assert.deepEqual(await postRes.json(), { ok: true, degraded: false });

      const getRes = await fetch(`http://localhost:${port}/mjolnir/api/settings`);
      const body = await getRes.json();
      assert.deepEqual(body.settings["cardPreviewPopup.prefs"], { device: "412x915", theme: "light", fontSize: 20 });

      const badKey = await fetch(`http://localhost:${port}/mjolnir/api/settings`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ key: "", value: 1 }),
      });
      assert.equal(badKey.status, 400);
    } finally {
      server.close();
    }
  });

  await t.test("HTTP: GET /mjolnir/api/settings is rejected without the operator marker — it is behind the same unconditional requireAuth as every other route, not a second auth mechanism", async () => {
    const server = createServer(pool, { dataDir: ".", publicBase: "http://localhost:8080", workbenchPatchesDir: "." });
    await new Promise((resolve) => server.listen(0, resolve));
    const port = server.address().port;
    try {
      const res = await rawFetch(`http://localhost:${port}/mjolnir/api/settings`);
      assert.equal(res.status, 401);
    } finally {
      server.close();
    }
  });
});
