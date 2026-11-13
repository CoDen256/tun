#!/usr/bin/env node
// mjolnir-builder — OPERATOR PLANE, and the one service with NO inbound
// dependency: with the gateway down its UI is unreachable but the nightly
// clock keeps running, which is the property zone-isolation's dependency
// table claims for it.
import { getPool } from "../src/db.js";
import { loadConfig } from "../src/config.js";
import { createServer } from "../src/server.js";
import { startNightlyClock } from "../src/clock.js";
import { createBootstrap } from "../../../libs/jsservice/bootstrap.js";

const config = loadConfig();
const pool = getPool();
const port = Number(process.env.PORT || 8001);

// Serve before you migrate (D157). builder owns no schema — the workbench
// does — so readiness here means "the tables I read exist", nothing more.
// Added after review found builder was the only service still missing this:
// it bound its port before touching the database by luck rather than design,
// and had no readiness state at all, so its health probe could not report
// degraded and its pages had nothing to degrade on.
const boot = createBootstrap({
  name: "mjolnir-builder",
  prepare: async () => {
    const { rows } = await pool.query(
      "SELECT to_regclass('public.build_jobs') IS NOT NULL AS ok"
    );
    if (!rows[0]?.ok) throw new Error("build_jobs does not exist yet (the workbench owns migrations)");
    return "build_jobs present";
  },
});
boot.start();

createServer(pool, config, boot).listen(port, () => {
  console.log(`mjolnir-builder listening on :${port} (operator plane)`);
});

startNightlyClock(pool, config);
