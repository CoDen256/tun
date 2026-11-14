#!/usr/bin/env node
import { closePool } from "../src/db.js";
import { seedDecks } from "../src/decks.js";

seedDecks()
  .then((count) => {
    console.log(`seeded ${count} decks (C20-C29)`);
    return closePool();
  })
  .catch((err) => {
    console.error(err);
    process.exitCode = 1;
  });
