#!/usr/bin/env node
import { getPool } from "../src/db.js";
import { loadConfig } from "../src/config.js";
import { createServer } from "../src/server.js";
import { startNightlyClock } from "../src/clock.js";

const config = loadConfig();
const pool = getPool();
const port = Number(process.env.PORT || 8001);

createServer(pool, config).listen(port, () => {
  console.log(`mjolnir-builder listening on :${port}`);
});

startNightlyClock(pool, config);
