#!/usr/bin/env node
// mjolnir-workbench (service key `mjolnir-hub`) — the OPERATOR PLANE.
//
// Device progress sync moved out to `mjolnir-sync` (zone-isolation): the
// console is the most frequently redeployed service in the stack and the
// device path has no rollback, so they no longer share a process.
//
// THIS service owns the `mjolnir` schema — it is the only one that migrates.
import { getPool } from "../src/db.js";
import { loadConfig } from "../src/config.js";
import { createServer } from "../src/server.js";
import { migrate } from "../src/migrate.js";
import { seedDecks } from "../src/decks.js";
import { createBootstrap } from "../../../libs/jsservice/bootstrap.js";

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
boot.start();

createServer(pool, config, boot).listen(port, () => {
  console.log(`mjolnir-workbench listening on :${port} (operator plane)`);
});
