#!/usr/bin/env node
// backup-console's entrypoint. See ../src/server.js for what this process may
// and may not do — the short version is that it reads the backup service's
// state volume and its git clone, and writes exactly two things: the three
// settings, and a run REQUEST the scheduler claims.
//
// NOTHING TO MIGRATE AND NOTHING TO WAIT FOR. This service has no database
// (design §6), so there is no serve-before-migrate dance here: the port binds
// and every dependency's absence — an empty state volume, a missing clone, a
// stopped `backup` — is a condition the page reports. That is D157's spirit
// where its letter does not apply: a console that refuses to start because
// nothing has been backed up yet is useless at exactly the moment it matters.
//
// INTERNAL_TOKEN is REQUIRED, like every operator-plane Node service
// (libs/jsservice/auth.js's requireInternalToken, P55): one ecosystem-wide
// credential in one file, so a service starting without it is misconfigured
// rather than configured differently. The marker header needs no configured
// value at all, so this can never leave the service open — only keep it from
// starting.
import { requireInternalToken } from "../../../libs/jsservice/auth.js";
import { createServer } from "../src/server.js";

requireInternalToken();

const port = Number(process.env.PORT || 8003);

createServer().listen(port, () => {
  console.log(`backup-console listening on :${port} (operator plane, /backup/)`);
});
