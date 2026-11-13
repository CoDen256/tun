## Why

`builder/src/pipeline.js`'s `pruneRetiredDecks` runs on every publish and
deletes any `"C"`-prefixed deck with zero `card_slots` rows in hub's
database, on the assumption that zero rows means "fully migrated away by
`deck-consolidation`." That assumption is false for the stock decks baked
into the original APK (`C01`, `C03`, `C10`-`C17`): hub never minted
`card_slots` rows for them in the first place, so they read as zero from
day one — not because they were retired. Every build has therefore been
silently deleting these stock decks and their cards from the published
bundle, replacing the whole `"C"` category with only hub-authored content.
This needs fixing now because it is actively destroying real, shipped
content on every publish.

## What Changes

- `pruneRetiredDecks` no longer infers "retired" from "`card_slots` count
  is zero" alone. It only prunes a deck code that hub can positively prove
  it owns/manages (e.g. a `managed`/origin marker set when hub mints into a
  deck, or an explicit retired-codes record written by the
  `deck-consolidation` migration) — never a deck hub has no record of
  ever having touched.
- Stock decks (`C01`, `C03`, `C10`-`C17`) are permanently excluded from
  pruning, since hub has never minted into them and never will.
- The `deck-removal` capability's requirement text is corrected to state
  the real safety condition precisely (hub-managed AND zero remaining
  references), not "zero references" alone.

## Capabilities

### New Capabilities
(none)

### Modified Capabilities
- `deck-removal`: "A deck with zero remaining card references can be
  removed" is replaced with a requirement that also requires the deck to
  be one hub has a positive record of managing — zero `card_slots` rows is
  no longer sufficient by itself.

## Impact

- `builder/src/pipeline.js` (`pruneRetiredDecks`, lines ~181-209)
- `hub` schema: likely a new column/table to record which deck codes hub
  has ever minted into or explicitly retired (exact shape is a design
  decision)
- `openspec/specs/deck-removal` (currently only a pending delta under
  `deck-consolidation`, not yet synced to main specs) — this change's
  delta corrects that requirement before/alongside that sync
- No device/bundle format change — this only changes which decks the
  builder is willing to delete from the model it publishes
