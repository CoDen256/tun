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
import { sweepHistory } from "../src/userdata.js";
import { archiveCoverage } from "../src/archive.js";

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

// userdata-git-history 5.4 — THE SWEEP'S TRIGGER POINT (a tier-2 decision).
//
// A BACKGROUND TIMER HERE, AND DELIBERATELY NOT ON PAGE LOAD. The OTA ingest
// above runs on page load as well, because reading an access log is a read
// and opening the page is exactly when it should be current. This is not that:
// the sweep DELETES, and the Sync page says of itself "this view is read-only"
// — a destructive side effect behind a read-only page is a surprise, and the
// one surprise this ecosystem cannot afford is the one that removes data.
//
// Hourly. The window is 48h, so the resolution of the sweep itself is
// irrelevant to what survives; what matters is that it runs unattended, which
// a page-load trigger cannot promise on a console nobody opens for a week.
//
// NOT AWAITED, AND ITS OWN FAILURES ARE ITS OWN. With no database, with
// backup-console stopped, or with nothing archived, `sweepHistory` holds off
// and deletes nothing — the archive coverage callback returns null for every
// uncertain answer, and that is the whole guard (task 5.2).
const SWEEP_INTERVAL_MS = 3600 * 1000;

async function runSweep() {
  if (!boot.dbReady()) return;
  try {
    const result = await sweepHistory({
      // The coverage callback is the ONLY thing standing between the sweep
      // and the archive, so it is kept trivial and fail-closed: any failure
      // inside archiveCoverage already comes back as a null epoch.
      coverage: async (uid) => (await archiveCoverage(config, uid)).coveredThroughEpoch,
    });
    if (!result.ran) {
      console.log(`[mjolnir-workbench] history sweep did not run: ${result.reason}`);
      return;
    }
    const held = result.accounts.filter((a) => a.held).length;
    if (result.deleted > 0 || held > 0) {
      console.log(
        `[mjolnir-workbench] history sweep: ${result.deleted} row(s) deleted outside the ${result.retentionHours}h window`
        + (held ? `, ${held} account(s) held back because the archive does not cover them` : "")
      );
    }
  } catch (err) {
    // A failed sweep is a table that stays large, which is survivable. It
    // must never be a reason this process stops serving.
    console.error(`[mjolnir-workbench] history sweep failed: ${err.message}`);
  }
}

// A first pass shortly after boot, then hourly. The delay lets the migration
// and the first archive read settle rather than racing them.
setTimeout(runSweep, 60 * 1000).unref?.();
setInterval(runSweep, SWEEP_INTERVAL_MS).unref?.();
