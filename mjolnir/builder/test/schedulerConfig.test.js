import test from "node:test";
import assert from "node:assert/strict";
import { shouldRunNow, getSchedule, setSchedule } from "../src/schedulerConfig.js";
import { getPool, closePool } from "../src/db.js";

test("shouldRunNow: manual never triggers, regardless of elapsed time", () => {
  assert.equal(shouldRunNow({ kind: "manual" }, null, new Date()), false);
  const longAgo = new Date(Date.now() - 365 * 24 * 3600 * 1000);
  assert.equal(shouldRunNow({ kind: "manual" }, longAgo, new Date()), false);
});

test("shouldRunNow: interval triggers once the configured hours have elapsed, not before", () => {
  const schedule = { kind: "interval", hours: 6 };
  const now = new Date("2026-10-25T12:00:00Z");
  assert.equal(shouldRunNow(schedule, null, now), true, "no prior run — always due");
  assert.equal(shouldRunNow(schedule, new Date("2026-10-25T07:00:00Z"), now), false, "only 5h elapsed");
  assert.equal(shouldRunNow(schedule, new Date("2026-10-25T06:00:00Z"), now), true, "exactly 6h elapsed");
});

test("shouldRunNow: daily triggers once past the configured time, once per day", () => {
  const schedule = { kind: "daily", at: "02:00" };
  const beforeTime = new Date("2026-10-25T01:00:00");
  assert.equal(shouldRunNow(schedule, null, beforeTime), false, "hasn't hit 02:00 yet today");

  const afterTime = new Date("2026-10-25T03:00:00");
  assert.equal(shouldRunNow(schedule, null, afterTime), true, "past 02:00, no prior run");

  const ranAfterTodaysTime = new Date("2026-10-25T02:30:00");
  assert.equal(shouldRunNow(schedule, ranAfterTodaysTime, afterTime), false, "already ran since today's 02:00");

  const ranYesterday = new Date("2026-10-24T02:30:00");
  assert.equal(shouldRunNow(schedule, ranYesterday, afterTime), true, "last run was before today's 02:00");
});

const DATABASE_URL = process.env.DATABASE_URL;
const describe = DATABASE_URL ? test : test.skip;

describe("builder_config: changing the schedule takes effect on the next read, no restart", async (t) => {
  const pool = getPool();
  await pool.query(
    "CREATE TABLE IF NOT EXISTS builder_config (key TEXT PRIMARY KEY, value JSONB NOT NULL)"
  );
  await pool.query("DELETE FROM builder_config WHERE key = 'schedule'");

  await t.test("defaults to daily 02:00 when unset", async () => {
    const schedule = await getSchedule(pool);
    assert.deepEqual(schedule, { kind: "daily", at: "02:00" });
  });

  await t.test("setSchedule + getSchedule round-trips immediately, as if read by a fresh tick", async () => {
    await setSchedule(pool, { kind: "interval", hours: 3 });
    assert.deepEqual(await getSchedule(pool), { kind: "interval", hours: 3 });

    await setSchedule(pool, { kind: "manual" });
    assert.deepEqual(await getSchedule(pool), { kind: "manual" });
  });

  t.after(async () => {
    await closePool();
  });
});
