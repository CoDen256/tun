## Why

`runPublish` consumes occurrences durably long before it records where they
went, with no transaction spanning the gap. `flushShippable`
(`builder/src/stagedOccurrences.js`) `DELETE`s the rows it returns, and
`drainPendingOccurrences` (`builder/src/pendingOccurrences.js`) deletes the
queue rows that reached `remaining <= 0`. Both run inside `flushDeck`, which
`runPublish` calls *before* `publish()`, `writePublication` and
`recordShipments`. A failure anywhere in that window destroys occurrences
that were never written to `occurrence_shipments` — and since `replay()`
rebuilds every deck's `Cards[]` purely from `occurrence_shipments`, there is
nothing left to reconstruct them from. The in-memory model that held them is
discarded by `runPublish`'s own `finally`.

This is not theoretical. It fired on 2026-11-09 18:59:50, where an unrelated
ffmpeg failure in `ensureBlobsPresent` (fixed separately in 8152076e /
e60bdd36) killed a run after this log line:

```
ship: C30 — 140 occurrence(s) flushed (105 -> 245)
ship: C20 — 40 occurrence(s) flushed (5 -> 45)
```

180 occurrences were deleted from `staged_occurrences`; `occurrence_shipments`
still held 110 rows afterwards, exactly its pre-run count. Most of the loss
self-healed on the next publish via the D86 path (card in hub's ledger, absent
from the bundle, so its occurrences are re-staged from scratch), which is
precisely why this gap has gone unnoticed. What does *not* self-heal is any
occurrence belonging to a card that already has a shipped occurrence: `replay`
recreates that card, so the D86 "is it missing from the model?" check sees it
as present and never re-stages it. Thirteen `E` occurrences (C30049–C30061)
were lost that way and had to be restored by hand from a database backup.
Verified both directions against a real Postgres: with the queue row deleted,
no subsequent publish ever brings the occurrence back (`pending 0, staged 0,
shipped 0` after a run with 15 fresh `A`s landing in the same deck);
re-inserting the pre-crash row returns it to the pipeline and it ships.

D-H1 already establishes the intended invariant for the *shipment log* — "a
run that fails anywhere above this line leaves zero shipment rows" — but the
converse is unprotected: a run that fails can leave *negative* shipment rows,
in the sense of occurrences consumed and never logged. D-F1's "one bad note
must not fail the whole publish" principle makes this worse, not better: the
failure modes it tolerates are exactly the ones that leave the gap half-open.

## What Changes

- Make occurrence consumption and occurrence recording atomic with respect to
  one another, so no publish can delete a staged or pending row without
  durably recording where that occurrence went.
- The preferred shape (to be settled in `design.md`) is to move the whole
  mutate-and-record span into a single Postgres transaction, rather than to
  add compensating cleanup on the error path — a transaction is the only
  version that is also correct when the process is killed outright, which is
  the case a `catch` block cannot cover. This conflicts with the current
  `pool`-per-query style throughout `pipeline.js` and with
  `occurrence_shipments.build_id`'s FK to `publications` (the shipment rows
  cannot be written before the publication row exists), so the design has to
  resolve ordering, not just wrap the existing calls.
- Add a regression test that kills a run between flush and record and asserts
  no occurrence is lost — the failing-run case the suite currently has no
  coverage for at all. `builder/test/pipeline.test.js`'s existing D86 case
  covers the *self-healing* half of this and passes today, which is what made
  the non-self-healing half invisible.
- Out of scope: the already-committed audio fixes, and the separate
  `drainThenQueue` ordering question noted below.

## Capabilities

### New Capabilities
(none)

### Modified Capabilities
- `builder-pipeline`: a publish run either completes, or leaves
  `staged_occurrences`/`pending_occurrences` exactly as it found them. No
  partial run may consume an occurrence without recording it.

## Open Questions

- **Ordering vs the FK.** `occurrence_shipments.build_id` references
  `publications.build_id`, so shipments cannot be recorded until the
  publication row exists, but the flush that consumes them currently runs
  much earlier (the bundle has to contain the occurrences before it can be
  built and published). Options: defer the deletes to after
  `writePublication`; write shipments with the publication row in one
  transaction; or stage a "claimed" marker that a later step converts.
- **Related, and confirmed to cause duplication — not just early draining.**
  The recovery run (b000040) double-shipped 104 occurrences. The D86 path
  calls `drainThenQueue` once *per card*, and each call decrements every
  pending row in the deck. With 127 `E` rows left queued at `remaining = 11`
  by the crashed run, the first 11 recovered cards drained all 127 to zero at
  once; from the 12th card on `hasPendingOccurrence` no longer saw a row (the
  drain had just deleted it) and **re-queued** the same `E` at 11, which later
  cards drained and staged a second time. `staged_occurrences` has no
  uniqueness constraint and each staged row flushes as its own shipment, so
  the same `(card_id, letter)` reached `occurrence_shipments` twice.

  Reproduced end-to-end against a real Postgres (30 cards recovered with
  pre-queued `E`s): duplicate shipments, 13 cards with an `E` both shipped and
  still queued, and a `remaining` staircase of 1..11 — the identical
  fingerprint to production's C30178–C30188. Repaired in the live database by
  collapsing duplicates and dropping queue rows for already-shipped
  occurrences; the per-card invariant (every owed occurrence in exactly one of
  shipped/staged/pending) then held exactly at 421/421.

  The same per-card drain also **inverts occurrence order**: because the mass
  drain stages a card's `E` before its own `A` is staged, 115 cards ended up
  with their `E` ahead of their `A` in `occurrence_shipments`, and `replay`
  rebuilds `Cards[]` in shipment-id order — so those cards were quizzed
  translation-first, which D91 explicitly forbids ("the word is never quizzed
  text-first"). Deduplicating does not fix this: keeping the earliest row per
  `(card, letter)` keeps the inverted one. Only re-running the mint through
  the normal per-deck path restores the order, which is how it was resolved
  (ledger reverted to pre-crash, republished as b000042: 0 cards with `E`
  before `A`, 127 `E`s back at `remaining = 11`).

  So this is two defects, not one: the atomicity gap above, and `drainThenQueue`
  being unsafe to call per-card — which costs correct ordering and the D91 gap
  as well as uniqueness. The second needs either a per-deck recovery
  flush or a uniqueness constraint on `staged_occurrences`/`occurrence_shipments`
  that makes double-staging impossible rather than merely unlikely. Decide
  whether it splits into its own change — it is independently reachable
  whenever D86 recovers many cards in a deck with a non-empty queue, with no
  crash required.
