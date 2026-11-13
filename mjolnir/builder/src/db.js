import pg from "pg";

const { Pool } = pg;
let pool = null;

// `hub` owns this schema; `builder` is the only other process that writes
// into it (hub/README.md) — same database, no shared code between the two
// services beyond that convention.
export function getPool() {
  if (!pool) {
    const connectionString = process.env.DATABASE_URL;
    if (!connectionString) {
      throw new Error("DATABASE_URL is required (hub's postgres database)");
    }
    pool = new Pool({ connectionString });
  }
  return pool;
}

export async function closePool() {
  if (pool) {
    await pool.end();
    pool = null;
  }
}
