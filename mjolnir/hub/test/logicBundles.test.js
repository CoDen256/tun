import test from "node:test";
import assert from "node:assert/strict";
import { migrate } from "../src/migrate.js";
import { getPool, closePool } from "../src/db.js";
import { create, list, get, getActive, activate, nextPatchRev } from "../src/logicBundles.js";

// Needs a real postgres — see hub/test/hub.test.js for why this is skipped,
// not failed, when none is configured.
const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

describe("logicBundles: activation invariant and patch_rev counter (D-L1/D-L2)", async (t) => {
  const pool = getPool();
  await migrate();
  await pool.query("TRUNCATE logic_bundles RESTART IDENTITY CASCADE");

  t.after(async () => {
    await closePool();
  });

  await t.test("activating a row clears every other row's active flag in one transaction", async () => {
    const a = await create({ baseVersion: "1.5.12", patchRev: 1, filePath: "data/logic/1.js", bundleSha: "sha-a" });
    const b = await create({ baseVersion: "1.5.12", patchRev: 2, filePath: "data/logic/2.js", bundleSha: "sha-b" });

    await activate(a.id);
    assert.equal((await getActive()).id, a.id);

    await activate(b.id);
    const rows = await list();
    const active = rows.filter((r) => r.active);
    assert.equal(active.length, 1, "exactly one row must be active after a second activation");
    assert.equal(active[0].id, b.id);

    assert.equal((await get(a.id)).active, false);
  });

  await t.test("activate rejects an unknown id and changes nothing", async () => {
    const before = await getActive();
    await assert.rejects(() => activate(999999), /no such logic bundle/);
    assert.deepEqual(await getActive(), before);
  });

  await t.test("nextPatchRev continues across a base_version change rather than resetting (D-L2)", async () => {
    await pool.query("TRUNCATE logic_bundles RESTART IDENTITY CASCADE");
    assert.equal(await nextPatchRev(), 1);

    await create({ baseVersion: "1.5.12", patchRev: 1, filePath: "a", bundleSha: "sa" });
    await create({ baseVersion: "1.5.12", patchRev: 2, filePath: "b", bundleSha: "sb" });
    assert.equal(await nextPatchRev(), 3);

    // A base bump is an independent axis — patch_rev keeps climbing, it does
    // not reset to 0/1 just because base_version changed.
    await create({ baseVersion: "1.6.0", patchRev: await nextPatchRev(), filePath: "c", bundleSha: "sc" });
    assert.equal(await nextPatchRev(), 4);
  });
});
