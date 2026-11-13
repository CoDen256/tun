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

- [ ] 2.1 Resolve the FK ordering problem in `design.md`:
      `occurrence_shipments.build_id` references `publications.build_id`, so
      shipments cannot be written before `writePublication`, yet the flush
      that consumes them must happen before the bundle is built. Decide
      between deferring the deletes, a single transaction covering
      publication + shipments + deletes, or an intermediate claimed state.
- [ ] 2.2 Decide how the chosen shape interacts with `pipeline.js`'s
      current `pool`-per-query style — a transaction needs a single checked-out
      client threaded through `flushDeck`, `flushShippable`,
      `drainPendingOccurrences` and `recordShipments`.
- [ ] 2.3 Confirm the guarantee holds for `SIGKILL`, not just thrown errors.
      If the chosen design only cleans up in a `catch`, say so explicitly and
      justify it — a compensating-cleanup design does not satisfy the
      requirement as written.

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
- [ ] 4.2 Consider a consistency check the operator console can run on
      demand: cards with a shipped occurrence but no queued/staged/shipped
      `E`, which is exactly the signature of this loss.
