import pg from "pg";

const { Pool } = pg;

let pool = null;

// Observers notified when the pool emits an idle-client `'error'`. Registered
// by an entrypoint (`bin/server.js`) so a lost connection degrades readiness
// immediately instead of waiting for the bootstrap's 15s poll.
const poolErrorListeners = new Set();

export function onPoolError(fn) {
  poolErrorListeners.add(fn);
  return () => poolErrorListeners.delete(fn);
}

// THE POOL'S `'error'` EVENT IS NOT OPTIONAL (2026-11-14, P56).
//
// node-pg emits `'error'` on the Pool when a client that is sitting IDLE in
// the pool dies — the commonest cause being the server going away
// (`57P01 terminating connection due to administrator command`, i.e. exactly
// what `docker compose stop postgres` produces). `Pool` is an EventEmitter,
// and an EventEmitter with no `'error'` listener THROWS: the error is
// re-raised as an uncaught exception and the process exits.
//
// Measured before this handler existed, with postgres stopped:
//
//     node:events:497  throw er; // Unhandled 'error' event
//     error: terminating connection due to administrator command
//       at Client.idleListener (/app/hub/node_modules/pg-pool/index.js:62:10)
//     severity: 'FATAL', code: '57P01'
//
//   mjolnir-hub RestartCount 1→2, mjolnir-builder 3→4 on a single stop; the
//   Python services were unaffected.
//
// This is BELOW the serve-before-migrate bootstrap and defeats it entirely:
// the bootstrap can only degrade a process that is still alive. The crash is
// not a migration failure, it is an idle socket, and it happens whether or
// not a request is in flight.
//
// It matters most for `mjolnir-sync`, which imports this module and IS the
// device plane (D158): during a restart window the handset gets a bare
// gateway **502** instead of the service's own **503 with an empty body** —
// a different contract on a frozen path, and P46's rule is about exactly
// which bytes that path may ever return.
//
// So: swallow, log, and tell anyone who registered. Never rethrow.
function attachErrorHandler(p) {
  p.on("error", (err) => {
    console.error(`[db] idle client error (pool kept alive): ${err.code || ""} ${err.message}`);
    for (const fn of poolErrorListeners) {
      try { fn(err); } catch { /* an observer must never take the process down either */ }
    }
  });
}

// Lazily created so importing this module (e.g. for its SQL helpers in a
// test) never requires a live database until a query is actually run.
export function getPool() {
  if (!pool) {
    const connectionString = process.env.DATABASE_URL;
    if (!connectionString) {
      throw new Error("DATABASE_URL is required (hub's own postgres database — 02-services.md: separate logical DB per service)");
    }
    pool = new Pool({ connectionString });
    attachErrorHandler(pool);
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
