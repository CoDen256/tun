## 1. Reproduce the loss as a failing test

- [ ] 1.1 Add a `builder/test/pipeline.test.js` case that fails a run
      *between* `flushDeck` and `recordShipments` — inject the failure via
      an unreachable `stabburBaseUrl` for the blob fetch, or a stubbed
      `ensureBlobsPresent`, rather than by a contrived throw, so the test
      exercises the real error path through `runPublish`'s `catch`.
- [ ] 1.2 Assert the strong invariant (occurrence still queued/staged
      afterwards), not just that the run failed. Confirmed behaviour today
      for a card with an already-shipped occurrence: `pending 0, staged 0,
      shipped 0` — the occurrence is simply gone.
- [ ] 1.3 Add the companion case for a card with *no* prior shipment, which
      self-heals via D86, so the test documents exactly where the boundary
      between "recovers" and "lost" falls.
- [ ] 1.4 **Note for whoever picks this up:** these tests only run with
      `DATABASE_URL` set (`const describe = DATABASE_URL ? test : test.skip`).
      `npm test` without it silently skips the entire pipeline suite — which
      is part of why this gap stayed invisible. Run them explicitly.

## 2. Settle the design

- [x] 2.1 Resolve the FK ordering problem in `design.md` — settled as
      deferred deletes: selection at flush time, consumption applied in one
      transaction with `writePublication` + `recordShipments` (D-FA1), which
      COMMITs before `publish()` touches the OTA dir (D-FA2).
- [x] 2.2 Decide how the chosen shape interacts with `pipeline.js`'s
      current `pool`-per-query style — settled: only the final
      consume-and-record span needs a single checked-out client; flush/drain
      become read-only plan computation and stay pool-per-query (D-FA1).
- [x] 2.3 Confirm the guarantee holds for `SIGKILL`, not just thrown errors —
      it does: consumption is a single COMMIT, so a kill at any point either
      consumed nothing or recorded everything (D-FA2's window analysis).

## 3. Implement

- [ ] 3.1 Thread a transaction (or the agreed alternative) through the
      consume-and-record span.
- [ ] 3.2 Keep D-F1's "one bad note must not fail the whole publish"
      behaviour intact — the fix must not convert tolerated per-note
      failures into whole-run rollbacks.
- [ ] 3.3 Verify the D86 self-heal path still works afterwards; it stays
      useful for genuinely-missing cards even once this gap is closed.

## 4. Operational follow-up

- [ ] 4.1 Record the incident and the fix in `tun/docs/07-decisions.md` —
      the 2026-11-09 18:59:50 run, the 13 lost `E` occurrences
      (C30049–C30061), and the backup-derived repair.
- [ ] 4.2 Implement the integrity check (D-FA4, settled yes): every owed
      occurrence in exactly one of shipped/staged/pending, no duplicate
      `(card, letter)`, no shipped `E` with an unshipped own `A`. Surface it
      as a banner on the builder page(s) that renders only when anomalies
      exist, listing offending card ids.

## 5. The D86 recovery-drain defect (D-FA3)

- [ ] 5.1 Accumulate D86-recovered cards per deck and call `drainThenQueue`
      once per deck after that deck's recovery staging completes — never per
      card. Verify a card's `E` can no longer stage ahead of its own `A`.
- [ ] 5.2 Migration: de-duplicate defensively, then add unique indexes on
      `(card_id, letter)` for `staged_occurrences`, `pending_occurrences`
      and `occurrence_shipments`.
- [ ] 5.3 Regression test reproducing the b000040 fingerprint (many cards
      recovered into a deck with a non-empty queue): assert no duplicate
      shipments, no re-queued already-shipped `E`, and shipment order `A`
      before `E` for every recovered card.
