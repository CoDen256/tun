import pg from "pg";

const { Pool } = pg;
let pool = null;

// See the long note in `hub/src/db.js` (P56) — same defect, same cure, and builder
// was the WORST of the three (RestartCount 3→4 on one `stop postgres`, and
// 3 restarts in the reviewer's original capture). A pg `Pool` is an
// EventEmitter; an idle client dying with `57P01` emits `'error'`, and an
// EventEmitter with no `'error'` listener re-raises it as an uncaught
// exception. The process dies BELOW the serve-before-migrate bootstrap,
// which can only degrade a process that is still running.
const poolErrorListeners = new Set();

export function onPoolError(fn) {
  poolErrorListeners.add(fn);
  return () => poolErrorListeners.delete(fn);
}

export function getPool() {
  if (!pool) {
    const connectionString = process.env.DATABASE_URL;
    if (!connectionString) {
      throw new Error("DATABASE_URL is required (hub's postgres database)");
    }
    pool = new Pool({ connectionString });
    pool.on("error", (err) => {
      console.error(`[db] idle client error (pool kept alive): ${err.code || ""} ${err.message}`);
      for (const fn of poolErrorListeners) {
        try { fn(err); } catch { /* never fatal */ }
      }
    });
  }
  return pool;
}

export async function closePool() {
  if (pool) {
    await pool.end();
    pool = null;
  }
}
