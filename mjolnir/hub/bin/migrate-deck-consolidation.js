#!/usr/bin/env node
// deck-consolidation: a one-time, operator-triggered migration — NOT part
// of `bin/migrate.js`'s auto-run migrations (irreversible, transforms real
// data). Defaults to a dry run; pass --apply to actually run it.
//
// Follow design.md's Migration Plan exactly: dry-run against the real
// database first, review the mapping by hand, take a `pg_dump` backup,
// THEN run with --apply.
import { getPool, closePool } from "../src/db.js";
import { dryRun, applyMigration } from "../src/deckConsolidationMigration.js";

function printReport(report) {
  console.log(`${report.mapping.length} card(s) would move:`);
  for (const m of report.mapping) {
    console.log(`  ${m.oldId} -> ${m.newId}  (${m.oldDeckCode} -> ${m.newDeckCode}, family: ${m.family})`);
  }
  console.log("\nPer-table row counts affected:");
  for (const [table, count] of Object.entries(report.tableCounts)) {
    console.log(`  ${table}: ${count}`);
  }
  console.log("\nRollover:");
  for (const [family, triggered] of Object.entries(report.rolloverTriggered)) {
    console.log(`  ${family}: ${triggered ? "YES — more than one code used" : "no"}`);
  }
  console.log(`\nDeck codes that would be retired (zero remaining cards): ${report.retiredDeckCodes.join(", ") || "(none)"}`);
}

async function main() {
  const apply = process.argv.includes("--apply");
  const pool = getPool();

  if (!apply) {
    console.log("DRY RUN — nothing will be written. Pass --apply to run for real.\n");
    const report = await dryRun(pool);
    printReport(report);
    return;
  }

  console.log("Applying the deck-consolidation migration for real...\n");
  const result = await applyMigration(pool);
  console.log(`Migrated ${result.mapping.length} card(s).`);
  console.log(`Deleted ${result.deletedDeckCodes.length} retired deck row(s): ${result.deletedDeckCodes.join(", ") || "(none)"}`);
  for (const { code, title } of result.retitledDeckCodes) {
    console.log(`Retitled reused deck ${code} -> "${title}"`);
  }
  console.log("\nNext step: trigger a real publish and confirm the resulting bundle matches (design.md's Migration Plan, step 6).");
}

main()
  .then(() => closePool())
  .catch(async (err) => {
    console.error(err);
    await closePool();
    process.exitCode = 1;
  });
