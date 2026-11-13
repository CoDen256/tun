#!/usr/bin/env node
// mjolnir-sync entrypoint. Device plane — see ../src/server.js.
//
// Serve-before-migrate, like every service now (libs/jsservice/bootstrap.js),
// but with one difference that matters here: this service NEVER migrates. The
// workbench owns the `mjolnir` schema; sync only waits for it to be ready.
// Two processes racing one migration table is a real failure mode and is
// prevented by assignment, not by locking.
import { getPool } from "../../hub/src/db.js";
import { loadConfig } from "../../hub/src/config.js";
import { createServer } from "../src/server.js";
import { createBootstrap } from "../../../libs/jsservice/bootstrap.js";

const config = loadConfig();
const pool = getPool();
const port = Number(process.env.PORT || 8002);

const boot = createBootstrap({
  name: "mjolnir-sync",
  // Readiness here is "the schema the workbench owns exists", not "I applied
  // it". `userdata` is the only table this service touches.
  prepare: async () => {
    const { rows } = await pool.query(
      "SELECT to_regclass('public.userdata') IS NOT NULL AS ok"
    );
    if (!rows[0]?.ok) throw new Error("userdata table does not exist yet (workbench owns migrations)");
    return "userdata table present";
  },
});
boot.start();

createServer(config, boot).listen(port, () => {
  console.log(`mjolnir-sync listening on :${port} (device plane)`);
});
