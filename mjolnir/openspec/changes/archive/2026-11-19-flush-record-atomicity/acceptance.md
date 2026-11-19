# Acceptance criteria — flush-record-atomicity

Review contract for the build phase (D161). Every criterion is an observable
end state, testable against dev compose (claude-in-chrome against the
console; `psql` only to *induce* states, never to verify a criterion that has
a UI surface). Baseline counts are read off the Forecast & publish page's
global totals and per-deck readouts before each scenario.

## A. Failed run consumes nothing

1. Induce a publish failure between flush and record (unreachable stabbur
   blob fetch or stubbed `ensureBlobsPresent`) on a deck with ≥5 staged
   occurrences, at least one belonging to a card that already has a shipped
   occurrence. After the failed run: the Run log shows the job as failed,
   AND the Forecast & publish page shows the deck's staged and pending
   counts **identical to the pre-run baseline** — no occurrence vanished,
   including for the card with prior shipments (the non-self-healing case).
2. The next successful publish ships exactly those occurrences once: the
   new publication's occurrence list (Past batches) contains each
   `(card, letter)` exactly once, the deck's staged count returns to the
   sub-5 remainder, and shipped total increases by exactly the flushed
   count.

## B. Crash between COMMIT and publish is benign

3. Induce a kill after the consumption transaction commits but before
   `publish()` (test hook or kill at the logged boundary). Afterward:
   `current.json` still names the previous buildId (the device is merely one
   build behind), and the next successful publish uses a **fresh** buildId —
   `ls data/ota/bundle/` never shows a buildId whose bytes changed between
   two runs — and its bundle contains every occurrence the committed
   shipment rows recorded (verify via the new build's Past batches entry and
   the deck strip showing those cells as shipped).

## C. Recovery drain (D-FA3)

4. Reproduce the b000040 fingerprint in dev: a deck with queued `E` rows
   (remaining ≈ 11) plus ≥12 cards forced through the D86 recovery path in
   one run. Afterward: the integrity banner does NOT appear, no
   `(card, letter)` appears twice anywhere on the page (Past batches +
   strip), no `E` was re-queued after draining (pending count never exceeds
   its baseline), and for every recovered card with both letters the strip
   shows its `A` cell at a lower position than its `E` cell.
5. The migration run on a database seeded with deliberate duplicates
   completes, and a subsequent SQL attempt to insert a duplicate
   `(card_id, letter)` into `staged_occurrences` or `occurrence_shipments`
   is rejected by the database.

## D. Integrity check (D-FA4)

6. With a healthy database, no integrity banner is rendered anywhere on the
   builder page(s).
7. After inserting one duplicate staged row via SQL, reloading the builder
   page shows the integrity banner naming exactly that card id; deleting the
   row and reloading makes the banner disappear.

## E. Regression tests exist and run

8. `builder/test/pipeline.test.js` (with `DATABASE_URL` set — the suite
   skips silently without it, tasks.md 1.4) contains and passes: the
   fail-between-flush-and-record case asserting the strong invariant for a
   card with a prior shipment, the companion D86 self-heal boundary case,
   and the mass-recovery fingerprint case (tasks.md 5.3).
