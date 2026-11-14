#!/usr/bin/env node
// mjolnir-sync entrypoint. Device plane — see ../src/server.js.
//
// Serve-before-migrate, like every service now (libs/jsservice/bootstrap.js),
// but with one difference that matters here: this service NEVER migrates. The
// workbench owns the `mjolnir` schema; sync only waits for it to be ready.
// Two processes racing one migration table is a real failure mode. This
// comment used to end "prevented by assignment, not by locking" — and
// assignment does not survive a SECOND INSTANCE of the workbench
// (`--scale mjolnir-hub=2`, a rolling deploy), which was then measured racing
// itself. It is prevented by a `pg_advisory_lock` in `hub/src/migrate.js`
// now (P58); this service still never migrates.
import { getPool, onPoolError } from "../../hub/src/db.js";
import { loadConfig } from "../../hub/src/config.js";
import { createServer } from "../src/server.js";
import { createBootstrap } from "../../../libs/jsservice/bootstrap.js";

// DEVICE PLANE: INTERNAL_TOKEN is deliberately NOT required here (P55).
// hub and builder refuse to start without it; this process must not, because
// it serves a frozen contract to an APK that cannot be rolled back and the
// token plays no part in that path — the gateway gates /mjolnir/userdata/*
// and sets the marker. See the note in hub/src/config.js.
// ...and TUN_PUBLIC_BASE is not required either, for the same reason: it is
// hub's publish-module variable and this process has no publish module. The
// first version of this carve-out named only INTERNAL_TOKEN, so the device
// service still refused to boot on an operator-plane variable it never reads.
const config = loadConfig({ requireInternal: false, requirePublicBase: false });
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
// An idle-client error is a lost database, not a lost process (db.js). The
// pool handler keeps the process alive; this turns the event into the state
// every page already knows how to render, without waiting for the 15s poll.
onPoolError((err) => boot.noteError(err));
boot.start();

createServer(config, boot).listen(port, () => {
  console.log(`mjolnir-sync listening on :${port} (device plane)`);
});
