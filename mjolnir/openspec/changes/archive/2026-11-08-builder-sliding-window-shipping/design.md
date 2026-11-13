## Context

Today (`builder/src/pipeline.js`): `appendImmediateOccurrences` calls
`addOccurrence(deck, cardId, letter)` directly for every fresh immediate
occurrence; `drainThenQueue` calls it directly for every occurrence whose
D91 11-countdown (`pending_occurrences`) just reached zero. Both append
straight into `deck.Cards[]` (`src/deckData.js`'s `addOccurrence`), which
is what `occurrence_shipments` (D93) records against and what the app's
`Cards.length` ultimately is. Nothing currently guarantees that length
lands on a multiple of 5.

## Goals / Non-Goals

**Goals:**
- A deck's `Cards.length` only ever changes by moving from one multiple of
  5 to a later, larger multiple of 5 — never anything in between.
- Minting stays exactly as fast/immediate as today.
- The existing D91 11-countdown queue is untouched — this is a second,
  independent staging step that sits strictly after it.
- Visibility into "staged but not enough to ship" is a log line — no new
  operator UI required for this change (forecast/queue-depth UI, if
  wanted later, is out of scope here).

**Non-Goals:**
- Not solving "can a deck's true tail (1-4 leftover occurrences) ever
  ship" — explicitly accepted as permanently stranded if no further
  content ever arrives for that deck (operator's explicit call).
- Not touching `drawNewCards` (module 2110) or any other app-side logic —
  the guarantee is enforced entirely builder-side.

## Decisions

### D-W1 — New table, separate from the D91 queue

`pending_occurrences` (D91) tracks "how many occurrences until this E can
drain" — a countdown, deleted the moment it hits zero. The new staging
buffer tracks a fundamentally different thing — "ready to ship, waiting
for 4 more neighbors to also be ready" — with no countdown, just FIFO
order. New table, e.g. `staged_occurrences(id SERIAL PK, deck_code TEXT,
card_id TEXT, letter TEXT, staged_at TIMESTAMPTZ)` — `id` gives the same
guaranteed FIFO ordering `pending_occurrences`'s own `ORDER BY id ASC`
(D-F2) already relies on.

### D-W2 — Flush floors to the largest multiple of 5, every run, automatically

Once per deck per publish run, after minting/draining/staging for that
deck is done: count that deck's staged rows (existing + any just staged
this run), compute `shipCount = Math.floor(count / 5) * 5`. If
`shipCount > 0`: pop the `shipCount` oldest staged rows (by `id`), call
`addOccurrence(deck, cardId, letter)` for each in that order, push each
onto `shipments` (so `occurrence_shipments` records them against this
run's build, per the `occurrence-shipment-log` delta), delete those rows
from the staging table. If `shipCount === 0`: log that this deck has
`count` occurrences staged but didn't reach a shippable multiple of 5 —
no further action. This applies uniformly regardless of what triggered the
run (scheduled builder run or an operator-triggered publish) — same flush
logic either way, no separate "operator override" path.

### D-W3 — Minting path unchanged; only the `addOccurrence` call sites move

`appendImmediateOccurrences`/`drainThenQueue` are edited to call a new
`stageOccurrence(pool, {deckCode, cardId, letter})` instead of
`addOccurrence` directly. The flush step (D-W2) is the only remaining
caller of `addOccurrence` for occurrences going through this path.
Nothing about `mintCardSlots`/content generation/audio capture changes at
all.

### D-W4 — Revert `deck-completion-display-fix` entirely, record why

Once D-W1/D-W2 ship and have run for at least one real publish confirming
every deck's `Cards.length` is a multiple of 5, delete:
`patches/js/2119-deck-completion-display.{baseline,edited}.js`,
`test/unit/deckCompletionDisplay.test.js`, and the
`openspec/changes/deck-completion-display-fix/` folder outright (it was
never archived — same precedent as `audio-link-playback-minimal`/
`progress-sync-shim`, D125/D127). Record an ADR amendment explaining the
fix moved to its actual root cause (builder-side) rather than staying as
an app-side symptom patch, referencing this change.

**Sequencing note**: don't delete the app-side patch before the builder
guarantee is actually verified working on a real publish — if the revert
lands first and the builder-side fix has a bug, the softlock (and the
>100% display) comes back with no safety net at all. Tasks.md orders this
as the last step, after the builder-side tests pass and (ideally) after
at least one real publish confirms the invariant.

## Risks / Trade-offs

- **Permanently stranding a deck's true tail (1-4 occurrences)** —
  explicitly accepted (operator's call, "the stranding doesn't really
  occur in practice... that's fine").
- **A deck's `occurrence_shipments` history now shows a build other than
  the one that minted or drained a given occurrence, for anything that
  waited in the staging buffer** — this is a real, intentional change to
  `occurrence-shipment-log`'s existing semantics (see its MODIFIED delta
  spec) — anything reading that log to answer "which build shipped this"
  gets a later answer than before for staged occurrences, never an
  earlier or wrong one.
- **Removing the app-side insurance entirely** — if the builder-side flush
  logic has a bug that ever lets `Cards.length` land on a non-multiple of
  5 anyway, the softlock returns with nothing to catch it. Mitigated by
  D-W4's sequencing (verify first, revert after) and by task-level tests
  asserting the invariant directly, not just the happy path.
