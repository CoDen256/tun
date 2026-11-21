#!/usr/bin/env node
// mjolnir-workbench (service key `mjolnir-hub`) — the OPERATOR PLANE.
//
// Device progress sync moved out to `mjolnir-sync` (zone-isolation): the
// console is the most frequently redeployed service in the stack and the
// device path has no rollback, so they no longer share a process.
//
// THIS service owns the `mjolnir` schema — it is the only one that migrates.
import { getPool, onPoolError } from "../src/db.js";
import { loadConfig } from "../src/config.js";
import { createServer } from "../src/server.js";
import { migrate } from "../src/migrate.js";
import { seedDecks } from "../src/decks.js";
import { createBootstrap } from "../../../libs/jsservice/bootstrap.js";
import { startIngestLoop } from "../src/otaPulls.js";

const config = loadConfig();
const pool = getPool();
const port = Number(process.env.PORT || 8000);

// SERVE BEFORE YOU MIGRATE. This used to be `await migrate()` ahead of
// `listen()`, so a database outage meant the process exited before binding a
// port and /mjolnir returned 502 — not "no catalogue", no console at all
// (reproduced during monorepo-merge: RestartCount 0→9 in 60s). Now the port
// binds immediately and schema work retries in the background behind
// `boot.dbReady()`, which every database-backed page consults.
//
// Migrations and the fixed deck catalogue still run automatically with zero
// manual steps; sample/test content (stabbur's seed_p4_notes.py) stays a
// deliberate script, never automatic (13-operator-console-ux.md).
const boot = createBootstrap({
  name: "mjolnir-workbench",
  prepare: async () => {
    const ran = await migrate();
    const deckCount = await seedDecks();
    return `${ran.length} migration(s), ${deckCount} decks seeded`;
  },
});
// An idle-client error is a lost database, not a lost process (db.js). The
// pool handler keeps the process alive; this turns the event into the state
// every page already knows how to render, without waiting for the 15s poll.
onPoolError((err) => boot.noteError(err));
boot.start();

createServer(pool, config, boot).listen(port, () => {
  console.log(`mjolnir-workbench listening on :${port} (operator plane)`);
});

// ota-pull-tracking 3.6: the background half of the ingest trigger. The two
// pages that show pull data ingest on load, which covers every moment the
// operator is actually looking; this covers the rest, so that a bundle
// fetched on Tuesday is already recorded when the page is opened on Friday
// and the activity strip has no hole that is really a hole in the ingest.
//
// AFTER `listen`, AND DELIBERATELY NOT AWAITED. It is observation of the
// device plane, which is never allowed to delay or fail anything: the first
// tick runs with no database (the migration may not have been applied yet),
// with no log directory, and with the volume missing, and in each case
// resolves to a report with an `error` field that this ignores.
//
// 60s, with the per-call cooldown bypassed here — the cooldown exists to stop
// two simultaneous page loads walking the file twice, not to throttle a timer
// that already is the throttle.
startIngestLoop({ intervalMs: 60000 });
