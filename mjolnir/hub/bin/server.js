#!/usr/bin/env node
import { getPool } from "../src/db.js";
import { loadConfig } from "../src/config.js";
import { createServer } from "../src/server.js";
import { migrate } from "../src/migrate.js";
import { seedDecks } from "../src/decks.js";

const config = loadConfig();
const pool = getPool();
const port = Number(process.env.PORT || 8000);

// 13-operator-console-ux.md: migrations run automatically, always, on every
// boot (idempotent — a fresh database becomes ready with zero manual
// steps); fixed catalog data (the 10 decks) auto-seeds the same way. Sample/
// test content (stabbur's seed_p4_notes.py) stays a manual, deliberate
// script — never run automatically against a real database.
const ran = await migrate();
if (ran.length > 0) console.log(`applied migrations: ${ran.join(", ")}`);
const deckCount = await seedDecks();
console.log(`decks seeded (idempotent): ${deckCount}`);

createServer(pool, config).listen(port, () => {
  console.log(`mjolnir-hub listening on :${port}`);
});
