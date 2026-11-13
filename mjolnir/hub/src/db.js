import pg from "pg";

const { Pool } = pg;

let pool = null;

// Lazily created so importing this module (e.g. for its SQL helpers in a
// test) never requires a live database until a query is actually run.
export function getPool() {
  if (!pool) {
    const connectionString = process.env.DATABASE_URL;
    if (!connectionString) {
      throw new Error("DATABASE_URL is required (hub's own postgres database — 02-services.md: separate logical DB per service)");
    }
    pool = new Pool({ connectionString });
  }
  return pool;
}

export async function query(text, params) {
  return getPool().query(text, params);
}

export async function closePool() {
  if (pool) {
    await pool.end();
    pool = null;
  }
}
