#!/usr/bin/env node
import { getPool, closePool } from "../src/db.js";
import { loadConfig } from "../src/config.js";
import { runPublish } from "../src/pipeline.js";

const config = loadConfig();
const pool = getPool();

runPublish(pool, config)
  .then((result) => {
    console.log(JSON.stringify(result, null, 2));
    return closePool();
  })
  .catch(async (err) => {
    console.error(err);
    await closePool();
    process.exitCode = 1;
  });
