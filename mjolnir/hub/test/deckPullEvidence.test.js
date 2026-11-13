import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { migrate } from "../src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { seedActiveLogicBundle } from "../../builder/test/helpers/logicBundleFixture.js";
import { buildFixtureBundleSource } from "../../test/fixtures/deckCardFixture.js";
import { resolveDeckNumericId, findPullEvidence } from "../src/deckPullEvidence.js";

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

// C30's baked-in numeric ID is 7 in this fixture — arbitrary but fixed, so
// assertions can check against a known value instead of "whatever it
// happened to resolve to".
const C30_NUMERIC_ID = 7;

describe("deckPullEvidence: live precondition check against synced userdata", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE userdata, userdata_history, logic_bundles CASCADE");

  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-pull-evidence-"));
  const bundlePath = path.join(tmpDir, "logic-bundle.js");
  fs.writeFileSync(
    bundlePath,
    "var __BUNDLE_START_TIME__=1;\n" +
      buildFixtureBundleSource({
        decks: [
          { ID: C30_NUMERIC_ID, Name: "C30", Title: "Lexic", Cards: [] },
          { ID: 12, Name: "C20", Title: "Practice", Cards: [] },
        ],
      })
  );
  await seedActiveLogicBundle(pool, bundlePath, { baseVersion: "1.0.0", patchRev: 1 });

  t.after(async () => {
    fs.rmSync(tmpDir, { recursive: true, force: true });
    await closePool();
  });

  await t.test("resolveDeckNumericId reads the baked-in ID from the active bundle's deck catalog", async () => {
    assert.equal(await resolveDeckNumericId(pool, "C30"), C30_NUMERIC_ID);
    assert.equal(await resolveDeckNumericId(pool, "C20"), 12);
    assert.equal(await resolveDeckNumericId(pool, "C99"), null, "a deck never baked into any bundle resolves to null");
  });

  await t.test("zero evidence across every device — proceeds", async () => {
    await pool.query("TRUNCATE userdata CASCADE");
    await pool.query("INSERT INTO userdata (device_id, doc) VALUES ($1, $2)", [
      "device-1",
      { decksStatus: [{ ID: C30_NUMERIC_ID, PullCounter: 0 }], totalCards: [{ ID: "C20001" }] },
    ]);

    const evidence = await findPullEvidence(pool, "C30");
    assert.deepEqual(evidence, []);
  });

  await t.test("a decksStatus entry with PullCounter > 0 blocks", async () => {
    await pool.query("TRUNCATE userdata CASCADE");
    await pool.query("INSERT INTO userdata (device_id, doc) VALUES ($1, $2)", [
      "device-2",
      { decksStatus: [{ ID: C30_NUMERIC_ID, PullCounter: 3 }], totalCards: [] },
    ]);

    const evidence = await findPullEvidence(pool, "C30");
    assert.equal(evidence.length, 1);
    assert.equal(evidence[0].deviceId, "device-2");
    assert.equal(evidence[0].reason, "decksStatus");
  });

  await t.test("a totalCards id match blocks even when PullCounter is still 0 — either signal alone is sufficient", async () => {
    await pool.query("TRUNCATE userdata CASCADE");
    await pool.query("INSERT INTO userdata (device_id, doc) VALUES ($1, $2)", [
      "device-3",
      { decksStatus: [{ ID: C30_NUMERIC_ID, PullCounter: 0 }], totalCards: [{ ID: "C30007" }] },
    ]);

    const evidence = await findPullEvidence(pool, "C30");
    assert.equal(evidence.length, 1);
    assert.equal(evidence[0].deviceId, "device-3");
    assert.equal(evidence[0].reason, "totalCards");
    assert.equal(evidence[0].detail, "C30007");
  });

  await t.test("evidence is reported per device — multiple devices can each contribute one entry", async () => {
    await pool.query("TRUNCATE userdata CASCADE");
    await pool.query("INSERT INTO userdata (device_id, doc) VALUES ($1, $2), ($3, $4)", [
      "device-a",
      { decksStatus: [{ ID: C30_NUMERIC_ID, PullCounter: 1 }], totalCards: [] },
      "device-b",
      { decksStatus: [], totalCards: [{ ID: "C30099" }] },
    ]);

    const evidence = await findPullEvidence(pool, "C30");
    assert.equal(evidence.length, 2);
    assert.deepEqual(
      evidence.map((e) => e.deviceId).sort(),
      ["device-a", "device-b"]
    );
  });
});
