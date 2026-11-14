import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { getPool } from "./db.js";

const MIGRATIONS_DIR = path.join(path.dirname(fileURLToPath(import.meta.url)), "../migrations");

// One arbitrary but FIXED 64-bit key, shared by every process that migrates
// the `mjolnir` database. `pg_advisory_lock` keys live in a single cluster-wide
// space, so it must not collide with another service's; it is derived from the
// ASCII of "mjolnir" and written here literally so it can never drift.
const MIGRATION_LOCK_KEY = 0x6d6a6f6c6e697221n; // "mjolnir!"

// Deliberately not an ORM/migration framework (solo-dev simplicity,
// 02-services.md) — numbered SQL files, applied once each, tracked in one
// table. `builder` has no schema of its own, so only `hub` ever runs this.
//
// "EXACTLY ONE OWNER" WAS AN ASSIGNMENT, NOT A LOCK (2026-11-14, P58).
//
// zone-isolation 1.4 gives each database exactly one migrating service, and
// `mjolnir/sync/bin/server.js` says in its own comment that the race is
// "prevented by assignment, not by locking". Assignment does not survive a
// second INSTANCE of the same service: `--scale mjolnir-hub=2`, or any
// rolling deploy where the new container starts before the old one stops.
// Measured, two workbench instances against an empty database:
//
//     hub_probe1: migration 001_init.sql failed: duplicate key ...
//                 "pg_type_typname_nsp_index"
//     hub_probe1: schema ready after 2 attempt(s): 0 migration(s)
//     hub_probe2: schema ready after 1 attempt(s): 18 migration(s)
//     final: 15 tables, schema_migrations = 18   (self-healed)
//
// The per-file BEGIN/COMMIT/ROLLBACK below meant the loser rolled back
// cleanly and the ledger stayed honest — that is why it self-healed — but a
// migration that reports FAILED and is retried blindly is not a design, it is
// luck that the retry happened to work.
//
// Fixed with a session-level advisory lock held across the WHOLE run, taken
// on one dedicated connection. The second instance blocks in
// `pg_advisory_lock` until the first finishes, then reads the ledger it
// just wrote and applies nothing. No error line, no retry, no race.
//
// The ledger is deliberately re-read INSIDE the lock. Reading it outside
// would reintroduce exactly the race the lock exists to remove: the waiter's
// snapshot would be the empty pre-migration one.
export async function migrate() {
  const pool = getPool();

  // A dedicated client, because an advisory lock taken with
  // `pg_advisory_lock` is tied to the SESSION. Taken via `pool.query` it
  // would be released onto the pool and a later unlock could land on a
  // different connection entirely.
  const lockClient = await pool.connect();
  try {
    await lockClient.query("SELECT pg_advisory_lock($1)", [MIGRATION_LOCK_KEY.toString()]);
    try {
      return await runMigrations(pool);
    } finally {
      await lockClient.query("SELECT pg_advisory_unlock($1)", [MIGRATION_LOCK_KEY.toString()]);
    }
  } finally {
    // Releasing the client also drops the lock if the unlock above could not
    // run (the connection died) — advisory locks do not outlive a session.
    lockClient.release();
  }
}

async function runMigrations(pool) {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS schema_migrations (
      filename TEXT PRIMARY KEY,
      applied_at TIMESTAMPTZ NOT NULL DEFAULT now()
    )
  `);

  const applied = new Set((await pool.query("SELECT filename FROM schema_migrations")).rows.map((r) => r.filename));
  const files = fs.readdirSync(MIGRATIONS_DIR).filter((f) => f.endsWith(".sql")).sort();

  const ran = [];
  for (const file of files) {
    if (applied.has(file)) continue;
    const sql = fs.readFileSync(path.join(MIGRATIONS_DIR, file), "utf8");
    const client = await pool.connect();
    try {
      await client.query("BEGIN");
      await client.query(sql);
      await client.query("INSERT INTO schema_migrations (filename) VALUES ($1)", [file]);
      await client.query("COMMIT");
      ran.push(file);
    } catch (err) {
      await client.query("ROLLBACK");
      throw new Error(`migration ${file} failed: ${err.message}`);
    } finally {
      client.release();
    }
  }
  return ran;
}
