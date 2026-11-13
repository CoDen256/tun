#!/usr/bin/env node
// practice-deck-remint: operator CLI for `cardReassignment.js` — general
// enough to reuse for any future "note reclassified after its card was
// minted" correction, not hardcoded to one run.
//
// Run inside the hub container (same convention as bin/migrate.js/seed.js —
// bind-mounted source, no local/bare-OS node needed):
//
//   docker compose exec mjolnir-hub node bin/reassign-cards.js C20 C30011 C30012
//
// Defaults to a dry preview (re-runs the live safety precondition check and
// reports the predicted new ids, writes nothing). Pass --apply to actually
// perform the move:
//
//   docker compose exec mjolnir-hub node bin/reassign-cards.js --apply C20 C30011 C30012
//
// This change's one-time correction is exactly that invocation — C30011 and
// C30012 (pronunciation notes minted as Lexic cards before deck-
// consolidation existed) moving to C20/Practice as C20005/C20006 (proposal.md).
import { getPool, closePool } from "../src/db.js";
import { previewReassignment, reassignCards, ReassignmentBlockedError } from "../src/cardReassignment.js";

function usage() {
  console.error(
    "usage: node bin/reassign-cards.js [--apply] <destinationDeckCode> <cardId> [cardId...]\n" +
      "  (no --apply: dry preview only, re-checks safety, writes nothing)"
  );
  process.exitCode = 2;
}

async function main() {
  const argv = process.argv.slice(2);
  const apply = argv.includes("--apply");
  const positional = argv.filter((a) => a !== "--apply");
  const [destinationDeckCode, ...cardIds] = positional;

  if (!destinationDeckCode || cardIds.length === 0) {
    usage();
    return;
  }

  const pool = getPool();
  try {
    if (!apply) {
      const preview = await previewReassignment(pool, { cardIds, destinationDeckCode });
      if (!preview.ok) {
        console.error(`BLOCKED — ${preview.sourceDeckCode} has pull evidence:`);
        for (const e of preview.evidence) console.error(`  ${e.deviceId}: ${e.reason} — ${e.detail}`);
        console.error("No bypass exists for this check (practice-deck-remint spec). Nothing was changed.");
        process.exitCode = 1;
        return;
      }
      console.log(`Preview only — nothing written. Re-run with --apply to perform this move.`);
      console.log(`Source deck ${preview.sourceDeckCode} has zero pull evidence — safe to proceed.`);
      for (const { oldId, newId } of preview.predicted) console.log(`  ${oldId} -> ${newId} (${destinationDeckCode})`);
      return;
    }

    const result = await reassignCards(pool, { cardIds, destinationDeckCode });
    console.log(`Reassigned ${result.moved.length} card(s) from ${result.sourceDeckCode} to ${result.destinationDeckCode}:`);
    for (const { oldId, newId } of result.moved) console.log(`  ${oldId} -> ${newId}`);
    console.log("");
    console.log("Next steps (tasks 3.3-3.4): run a normal publish, then spot-check the");
    console.log("reassigned cards' content (N/E/X/A) on hub's Cards page.");
  } catch (err) {
    if (err instanceof ReassignmentBlockedError) {
      console.error(`BLOCKED — ${err.message}`);
      console.error("No bypass exists for this check (practice-deck-remint spec). Nothing was changed.");
      process.exitCode = 1;
      return;
    }
    throw err;
  } finally {
    await closePool();
  }
}

main().catch((err) => {
  console.error(err);
  process.exitCode = 1;
});
