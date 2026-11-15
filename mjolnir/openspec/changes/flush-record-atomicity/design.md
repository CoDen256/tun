# Design — flush-record-atomicity

Settled in the `full-sweep` batch design session (2026-11-15), resolving the
proposal's open questions. Operator chose the **deferred-deletes** shape over
a claimed-marker scheme and over a full-span transaction.

## D-FA1: Consumption is deferred into one transaction

`flushShippable` stops deleting. It becomes a read-only *selection* of
shippable staged rows (same arithmetic, same FIFO order); likewise
`drainPendingOccurrences` stops decrementing/deleting at drain time and
instead *computes* a consumption plan: which pending rows decrement by how
much, which cross `remaining <= 0` and convert to staged-equivalents in the
in-memory model.

The run accumulates one **consumption plan**: staged row ids to delete,
pending row decrements to apply, pending row ids to delete. All of it is
applied in **one Postgres transaction** together with `writePublication` and
`recordShipments` — a single checked-out client, BEGIN→COMMIT, nothing else
on it. The FK (`occurrence_shipments.build_id → publications.build_id`) is
satisfied by ordering inside the transaction: publication row first, then
shipments, then deletes/decrements.

Mint-time *inserts* (`card_slots`, `card_content`, new `pending_occurrences`
queue rows, `stageImmediateOccurrences`) stay immediate, outside the
transaction, exactly as today. They are durable forward progress guarded by
`hasPendingOccurrence`/D86, not consumption — the invariant this change
enforces is "no failed run may *consume* an occurrence", not "a failed run
writes nothing".

## D-FA2: The transaction commits BEFORE `publish()` touches the OTA dir

Disk and database cannot be atomic with each other, so one of them wins. The
order is: compute `bundleSha` from the scratch file → **COMMIT the
transaction** → `publish()` (copy bundle into the OTA dir, repoint
`current.json`) → `markSucceeded`.

Rationale, by crash window:

- **Crash before COMMIT** — nothing consumed, no publication row, no files
  touched. Next run recomputes the same buildId (no row exists), re-flushes
  the same occurrences. Clean retry.
- **Crash after COMMIT, before `publish()`** — the DB says build `bNNNNNN`
  shipped, but `current.json` still points at the previous build. Nothing is
  lost: `replay()` rebuilds the model *from `occurrence_shipments`*, so the
  next run's bundle contains every recorded occurrence and publishes as
  `bNNNNNN+1`. The device simply never sees `bNNNNNN` (identity compare,
  D26 — skipping an id is free). Residual: a `publications` row exists for a
  build that was never served; same class as D133's already-documented
  "shipment build lags mint build", in the opposite direction. Accepted.
- **The rejected alternative** (publish files first, then commit) has a
  worse residual: a crash between `publish()` and COMMIT leaves
  `current.json` serving `bNNNNNN` while no `publications` row exists, so
  the next run reuses the same buildId **with different bytes** — a D62
  violation against a device that may already have fetched it. That is a
  device-plane correctness hazard; a phantom publication row is cosmetic.

This inverts D-H1's letter ("shipments only after publish succeeds") while
keeping its intent: there are still never shipment rows for occurrences that
cannot reach the device — replay guarantees anything recorded is in every
subsequent bundle.

## D-FA3: The D86 recovery drain goes per-deck, and uniqueness becomes a constraint

The proposal's second defect (b000040: 104 double-shipped occurrences,
115 cards with `E` ahead of `A`) is fixed in this same change — it touches
the same files and is not independently shippable:

- The D86 recovery loop stops calling `drainThenQueue` per card. Recovered
  cards are accumulated per deck; after each deck's recovery staging is
  complete, `drainThenQueue` runs **once per deck** with that deck's batch
  count — the same semantics the normal mint path already has. Because the
  deck's recovered `A`s are staged before the single drain runs, a card's
  `E` can no longer be staged ahead of its own `A`, restoring D91's
  "never quizzed text-first" ordering by construction.
- **Unique indexes** on `(card_id, letter)` for `staged_occurrences`,
  `pending_occurrences`, and `occurrence_shipments`. A card owes each letter
  at most once, ever — this is a true invariant (D18/D91 occurrence sets).
  The migration de-duplicates defensively before creating each index
  (production was hand-repaired after the incident, but a dev database may
  not have been). A violated insert now fails the run loudly instead of
  silently double-shipping.

## D-FA4: An on-demand integrity check, surfaced in the console

Task 4.2's "consider" is settled as **yes**. One read-only query set, exposed
on the builder page(s): for every minted card, every owed occurrence exists
in **exactly one** of shipped/staged/pending; no duplicate `(card, letter)`;
no card with a shipped `E` whose own `A` is unshipped. Rendered as a banner
section that appears **only when anomalies exist** (zero-anomaly = no UI
noise), listing offending card ids. This is exactly the signature by which
the 2026-11-09 loss would have been visible the next morning instead of by
accident.

## Out of scope

- The new ship-strips console page (`builder-ship-console` change) — it may
  *display* the integrity banner but does not own the check.
- Any change to mint-time insert ordering or the D91 queue arithmetic.
