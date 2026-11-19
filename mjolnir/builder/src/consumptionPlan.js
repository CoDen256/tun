// flush-record-atomicity (D-FA1/D-FA2): the one place a publish run is
// allowed to CONSUME an occurrence.
//
// The defect this exists to close: `flushShippable` deleted the staged rows
// it returned and `drainPendingOccurrences` deleted the queue rows that hit
// `remaining <= 0`, both from inside `flushDeck` — which runs before
// `publish()`, `writePublication` and `recordShipments`, with no transaction
// spanning them. `replay()` rebuilds every deck's `Cards[]` purely from
// `occurrence_shipments`, so an occurrence deleted but never recorded is
// unrecoverable: the only other copy lived in the in-memory model
// `runPublish`'s `finally` discards. It fired on 2026-11-09 18:59:50 and
// cost 13 `E` occurrences (C30049-C30061) that had to be restored from a
// database backup.
//
// Flush and drain are now read-only plan computation; everything they would
// have mutated accumulates here and is applied ONCE, on a single checked-out
// client, in one BEGIN→COMMIT together with the publication row and the
// shipment rows. Mint-time INSERTs (`card_slots`, `card_content`, fresh
// `pending_occurrences` rows, `stageImmediateOccurrences`) deliberately stay
// immediate and outside this transaction: they are durable forward progress
// guarded by `hasPendingOccurrence`/`hasOccurrence`/D86, not consumption.
// The invariant is "no failed run may CONSUME an occurrence", not "a failed
// run writes nothing" — D-F1's "one bad note must not fail the whole
// publish" survives unchanged.

import { writePublication } from "./publications.js";
import { recordShipments } from "./occurrenceShipments.js";

export function createConsumptionPlan() {
  return {
    // staged_occurrences rows that flushed into Cards[] this run.
    stagedIdsToDelete: [],
    // pending_occurrences rows that drained (reached remaining <= 0).
    pendingIdsToDelete: [],
    // `[{ ids, amount }]` — one entry per deck that drained this run.
    pendingDecrements: [],
    // Drained occurrences that did NOT flush this run: their queue row goes
    // away, so they have to become real staged rows in the same transaction
    // or they would be consumed without being recorded anywhere.
    stagedInserts: [],
  };
}

// D-FA2: this COMMITs before `publish()` ever touches the OTA dir. Disk and
// database cannot be atomic with each other, so one of them wins, and the
// losing window has to be the harmless one:
//
//   - crash before COMMIT — nothing consumed, no publication row, no files
//     touched. The next run recomputes the same buildId and re-flushes the
//     same occurrences. Clean retry.
//   - crash after COMMIT, before `publish()` — the database says bNNNNNN
//     shipped while `current.json` still points at the previous build.
//     Nothing is lost: `replay()` rebuilds from `occurrence_shipments`, so
//     the next run's bundle contains every recorded occurrence and publishes
//     as bNNNNNN+1. The device simply never sees bNNNNNN (identity compare,
//     D26 — skipping an id is free). A phantom `publications` row is the
//     residual; same class as D133, opposite direction. Accepted.
//   - the rejected order (publish first, commit second) leaves `current.json`
//     serving a buildId with NO publications row, so the next run reuses that
//     id with DIFFERENT bytes — a D62 violation against a device that may
//     already have fetched it. Cosmetic row beats device-plane corruption.
//
// This inverts D-H1's letter ("shipments only after publish succeeds") while
// keeping its intent: there are still never shipment rows for occurrences
// that cannot reach the device, because replay guarantees anything recorded
// is in every subsequent bundle.
//
// Ordering INSIDE the transaction is forced by the FK
// (`occurrence_shipments.build_id` → `publications.build_id`): publication
// row first, then shipments, then the deletes and decrements.
export async function commitRun(pool, { plan, publication, shipments }) {
  const client = await pool.connect();
  let released = false;
  try {
    await client.query("BEGIN");
    await writePublication(client, publication);
    await recordShipments(client, shipments, publication.buildId);

    for (const { ids, amount } of plan.pendingDecrements) {
      if (ids.length === 0 || amount <= 0) continue;
      await client.query("UPDATE pending_occurrences SET remaining = remaining - $2 WHERE id = ANY($1)", [ids, amount]);
    }
    if (plan.pendingIdsToDelete.length > 0) {
      await client.query("DELETE FROM pending_occurrences WHERE id = ANY($1)", [plan.pendingIdsToDelete]);
    }
    if (plan.stagedIdsToDelete.length > 0) {
      await client.query("DELETE FROM staged_occurrences WHERE id = ANY($1)", [plan.stagedIdsToDelete]);
    }
    for (const { deckCode, cardId, letter } of plan.stagedInserts) {
      await client.query("INSERT INTO staged_occurrences (deck_code, card_id, letter) VALUES ($1, $2, $3)", [
        deckCode,
        cardId,
        letter,
      ]);
    }

    await client.query("COMMIT");
  } catch (err) {
    // ROLLBACK itself can throw — a connection that dropped mid-transaction
    // is precisely when it does. Letting that throw propagate would REPLACE
    // the real cause, so `runPublish`'s catch would write the wrong message
    // into `build_jobs.error` and the run log would point at the cleanup
    // instead of at what actually broke. Postgres discards an uncommitted
    // transaction on a lost connection anyway, so a failed ROLLBACK costs
    // nothing but the diagnostic. Attach it, never substitute it.
    let rollbackFailed = false;
    try {
      await client.query("ROLLBACK");
    } catch (rollbackErr) {
      rollbackFailed = true;
      err.rollbackError = rollbackErr;
    }
    // A client whose ROLLBACK failed must not go back into the pool in an
    // unknown transaction state; destroying it costs one reconnect.
    client.release(rollbackFailed);
    released = true;
    throw err;
  } finally {
    if (!released) client.release();
  }
}
