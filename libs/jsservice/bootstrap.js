// Serve before you migrate.
//
// The shape this replaces (mjolnir/hub/bin/server.js, pre-zone-isolation):
//
//     const ran = await migrate();      // throws if Postgres is down
//     const deckCount = await seedDecks();
//     createServer(...).listen(port);   // never reached
//
// With the database unavailable the process exited before binding a port, so
// `/mjolnir` returned 502 — not "no catalogue", no console at all. Confirmed
// during monorepo-merge's boot test: stopping postgres and restarting hub
// produced a crash loop (RestartCount 0→9 in 60s,
// `getaddrinfo ENOTFOUND mjolnir-postgres at async migrate`).
//
// Inverted here: listen immediately, run schema work in the background with
// retry, and expose readiness as a flag every page consults. The cost is that
// "a running service has a current schema" stops being an invariant — so
// `dbReady()` is a real state pages must handle, and a service that is serving
// but not ready reports DEGRADED rather than healthy, so it is visibly wrong
// instead of quietly wrong.
//
// The device plane is unaffected either way: /ota/*, /blob/* and
// /audio-manifest/* are served off disk by the gateway with no process in the
// path (D55).

const RETRY_MS = 5000;

export function createBootstrap({ name, prepare, onReady, log = console }) {
  let ready = false;
  let lastError = null;
  let attempts = 0;

  async function attempt() {
    attempts += 1;
    try {
      const result = await prepare();
      ready = true;
      lastError = null;
      log.log(`[${name}] schema ready after ${attempts} attempt(s)` + (result ? `: ${result}` : ""));
      if (onReady) await onReady();
    } catch (err) {
      ready = false;
      lastError = err;
      // Deliberately not fatal, and deliberately logged every time rather than
      // once: a service that is serving degraded for hours should say so in
      // its logs repeatedly, not scroll the reason away after the first line.
      log.error(`[${name}] schema not ready (attempt ${attempts}): ${err.message} — serving degraded, retrying in ${RETRY_MS / 1000}s`);
      setTimeout(attempt, RETRY_MS).unref?.();
    }
  }

  // Readiness is a CURRENT state, not a high-water mark.
  //
  // The first version set `ready = true` once and never cleared it, so a
  // service that started healthy and then lost the database kept answering
  // `dbReady() === true`: the 503 guard never fired and a raw driver error
  // escaped as a 500. Observed exactly that — with postgres stopped,
  // /mjolnir and /mjolnir/userdata/* returned 500 while a service RESTARTED
  // in the same outage correctly returned 503. Same outage, two different
  // answers, decided only by whether the process happened to boot before or
  // after the database went away.
  //
  // So a handler that catches a connection-level error calls `markLost()`,
  // which flips readiness back and restarts the retry loop. The next request
  // gets the honest 503 and the health check reports degraded.
  function markLost(err) {
    if (!ready) return;
    ready = false;
    lastError = err;
    log.error(`[${name}] lost the database mid-flight: ${err.message} — degrading and retrying`);
    setTimeout(attempt, RETRY_MS).unref?.();
  }

  // Connection-level failures only. A constraint violation or a syntax error
  // is the caller's problem and must NOT take the service out of readiness —
  // that would turn one bad query into a self-inflicted outage.
  const LOST_CODES = new Set([
    "ECONNREFUSED", "ENOTFOUND", "ECONNRESET", "EPIPE", "ETIMEDOUT",
    "57P01", // admin_shutdown
    "57P02", // crash_shutdown
    "57P03", // cannot_connect_now
    "08000", "08003", "08006", "08001", "08004", // connection exceptions
  ]);
  function isConnectionError(err) {
    return !!err && (LOST_CODES.has(err.code) || /ECONNREFUSED|ENOTFOUND|ECONNRESET|terminating connection|server closed the connection/i.test(err.message || ""));
  }

  return {
    start() { attempt(); },
    dbReady: () => ready,
    lastError: () => lastError,
    markLost,
    isConnectionError,
    // Wrap a handler so a lost database degrades instead of 500ing.
    noteError(err) { if (isConnectionError(err)) markLost(err); },
    // Liveness vs readiness, kept separate on purpose. A health check that
    // conflates them either restarts a perfectly good degraded service or
    // reports a broken one as fine.
    status: () => (ready ? "ready" : "degraded"),
  };
}
