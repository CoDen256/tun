#!/usr/bin/env node
import { migrate } from "../src/migrate.js";
import { closePool } from "../src/db.js";

migrate()
  .then((ran) => {
    if (ran.length === 0) console.log("no pending migrations");
    else console.log(`applied: ${ran.join(", ")}`);
    return closePool();
  })
  .catch((err) => {
    console.error(err);
    process.exitCode = 1;
  });
