## Context

`builder/src/pipeline.js:192-209` (`pruneRetiredDecks`) runs at the end of
every publish, after minting/flushing:

```js
for (const deck of [...model.decks]) {
  if (deck.Name[0] !== "C") continue;
  const { rows } = await pool.query(
    "SELECT count(*) AS count FROM card_slots WHERE deck_code = $1",
    [deck.Name]
  );
  if (Number(rows[0].count) > 0) continue;
  removeDeck(model.decks, deck.Name, { cardCount: 0 });
  // ...removes model.cards with that DECK_ID too
  await pool.query("DELETE FROM decks WHERE code = $1", [deck.Name]);
}
```

`model` is loaded straight from the live bundle (`loadDeckCardModel`), so it
contains every deck that has ever existed in the app — stock decks baked
into the original APK (`C01`, `C03`, `C10`-`C17`) alongside hub-minted ones
(`C20`, `C30`, and formerly `C21`-`C29`). `card_slots` is hub's own table
of cards it minted; it was never populated for the stock decks, because
hub never created them. The `count > 0` check cannot distinguish "this
code was fully migrated away" (the only case this function was written
for, per `deck-consolidation`'s D-DC5) from "hub has never had anything to
do with this code" (true for every stock deck, permanently). Both read as
zero, so every stock `"C"` deck gets deleted from `model.decks`/
`model.cards` on every single publish, and its (nonexistent) `decks` row
delete is a no-op that masks the problem instead of erroring.

## Goals / Non-Goals

**Goals:**
- `pruneRetiredDecks` only ever deletes a deck code hub can positively
  prove it minted into or explicitly retired — never one it simply has no
  record of.
- Stock decks are protected permanently and automatically, not via a
  one-off exclude list that has to be remembered when a new stock deck is
  discovered or a new family is retired.
- The fix is purely additive to hub's data model — no change to the
  bundle format, no re-run of any past migration.

**Non-Goals:**
- Not restoring any stock deck content from a bad past publish — if
  `C01`/etc. have already been wiped from the currently-live bundle,
  recovering them (from an older bundle backup or re-deriving from the
  decompiled APK) is a separate, follow-up concern, not part of this fix.
- Not re-examining `deck-consolidation`'s migration script itself — that
  script's own retirement logic (D-DC4/D-DC5) is correct for the decks it
  actually retires; only the *generic, every-build* safety net is wrong.
- Not changing how non-`"C"` decks are handled — the bug and fix are
  scoped to the existing `"C"`-prefix convention this function already
  uses.

## Decisions

### D1 — Add a `managed` marker to hub's `decks` table, set at mint time

`hub`'s `decks` table (`hub/migrations/001_init.sql` + later migrations)
gains a boolean column, e.g. `managed_by_hub boolean NOT NULL DEFAULT false`.
Every code path that creates a deck hub actually owns — `ensureDeck`'s
underlying `decks` INSERT in `deckFamilies.js`, and any future equivalent —
sets it `true`. Stock decks never get a `decks` row through that path
(they're not minted, they're pre-existing bundle content), so they default
to absent/`false` and are therefore structurally excluded.

**Why this over an explicit retired-codes list:** a retired-codes list
only solves the problem for codes `deck-consolidation` happens to retire;
`managed_by_hub` solves it for the actual invariant we care about — "did
hub ever mint into this" — which is also the correct test for any *future*
family hub creates and later fully empties, with no extra bookkeeping per
migration.

**Why this over hardcoding the stock codes:** a hardcoded exclude list
(`["C01","C03","C10",...,"C17"]`) is the fastest patch but silently stops
protecting anything if a stock deck is ever renamed/renumbered on the app
side, and it inverts the actual invariant (allowlisting "known safe to
prune" is the dangerous default; this makes "known safe to prune" the
narrow, explicit case instead).

### D2 — `pruneRetiredDecks` prunes only `managed_by_hub = true AND card_slots count = 0`

```js
const { rows } = await pool.query(
  "SELECT count(*) AS count FROM card_slots WHERE deck_code = $1",
  [deck.Name]
);
const { rows: deckRows } = await pool.query(
  "SELECT managed_by_hub FROM decks WHERE code = $1",
  [deck.Name]
);
if (!deckRows[0]?.managed_by_hub) continue;   // never prune what hub doesn't own
if (Number(rows[0].count) > 0) continue;
// ...existing removal logic, unchanged
```

A deck with no `decks` row at all (every stock deck today) is treated
identically to `managed_by_hub = false` — never pruned.

### D3 — Backfill: mark every currently-hub-authored code as managed

A one-time backfill (ordinary data migration, not an operator-triggered
script like `deck-consolidation`'s — this is squarely "fixed, safe to
re-run" since it only sets a flag on rows that already unambiguously
belong to hub) sets `managed_by_hub = true` for every `decks` row that
currently exists (today: `C20`, `C30`) — these are, by construction, the
only rows hub has ever inserted.

### D4 — `deck-removal` spec correction

The requirement "A deck with zero remaining card references can be
removed" is corrected to add the `managed_by_hub` condition explicitly, so
the spec no longer describes the behavior that caused this bug.

## Risks / Trade-offs

- **A future hub-authored deck that's later retired must have been
  minted through a path that sets `managed_by_hub`.** Mitigated: there is
  exactly one deck-creation path today (`deckFamilies.js`'s `decks` INSERT
  via `ensureDeck`); as long as that single path sets the flag, every
  future hub deck is covered automatically.
- **The backfill (D3) must run before the fixed `pruneRetiredDecks` ships**,
  or `C20`/`C30` would themselves stop being prunable later (not actively
  harmful — they'd just never get cleaned up if retired — but worth
  sequencing correctly rather than leaving a dangling case).
- **No automatic recovery for already-deleted stock decks.** Out of scope
  per Non-Goals; flagged here so it isn't forgotten — the operator should
  check whether the currently-live published bundle is missing `C01`/`C03`/
  `C10`-`C17` and, if so, decide separately how to restore them (e.g. from
  the decompiled APK's original module 2111/2113, or an older bundle
  backup) before or after this fix lands.

## Migration Plan

1. Add `managed_by_hub` column to `decks` (migration file, default
   `false`).
2. Backfill `managed_by_hub = true` for existing rows (`C20`, `C30`) in the
   same or an immediately-following migration.
3. Update `pruneRetiredDecks` per D2.
4. Update the `deck-removal` delta spec per D4.
5. Operator checks the currently-live bundle for missing stock decks and
   decides on recovery separately (not part of this change's automated
   scope).
