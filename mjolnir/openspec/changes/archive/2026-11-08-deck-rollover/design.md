## Context

`builder/src/deckAssignment.js`'s `assignDeck(note)` returns a fixed deck
code looked up from `WORD_POS_DECK`/`TYPE_DECK`. `builder/src/mint.js`'s
`mintCardSlots(pool, deckCode, notes)` mints directly into whatever code
it's given — no capacity check anywhere. `card_slots.id` is `deckCode +
3-digit card_no`, so any single deck code is hard-capped at 999 cards
(`tun/docs/03-data-model.md`'s id scheme). Mod 2119's deck-list screen
requires every "C"-prefixed deck to form one contiguous block in the decks
array (confirmed reading its category switch) — a rollover code is just
another "C" deck, so this constraint is satisfied automatically as long as
rollover decks get appended in the same way `ensureDeck` already appends
any new deck.

## Goals / Non-Goals

**Goals:**
- A family's content can grow past 999 cards indefinitely (bounded only by
  how many overflow codes are configured for that family, per the
  operator's own decision to keep this simple — "C20-C29 is enough for now,
  don't over-engineer a cross-block continuation").
- Fully automatic — no operator step, no manual "create the next deck"
  action, matching D91's "no floor, no minimum batch" philosophy for
  minting itself.
- A rollover deck's title/description are auto-derived, not left blank —
  consistent with `deck-descriptions`' goal of never shipping a blank
  `Description`.

**Non-Goals:**
- Not implementing cross-block continuation (e.g. what happens after a
  family's LAST configured code also fills) — per the operator's explicit
  decision, out of scope; a family simply cannot mint further once its
  last configured code is full. If this family's content ever approaches
  that limit, it's genuinely far enough away to defer a design for that
  later rather than now.
- Not migrating or touching anything already minted into a pre-rollover
  deck — rollover only affects where the NEXT card lands, same as
  `deck-consolidation`'s own scope boundary.

## Decisions

### D-DR1 — A family is a static table: name, title, starting code, sequence

```js
// builder/src/deckFamilies.js (new)
export const DECK_FAMILIES = {
  lexic: { title: "Lexic", codes: ["C30", "C31", "C32", /* ... */] },
  practice: { title: "Practice", codes: ["C20", "C21", /* ... through */ "C29"] },
};
```
Static and explicit, not computed (e.g. not "C30 + N") — matches this
project's existing convention (`WORD_POS_DECK`/`TYPE_DECK`/
`DECK_ALLOCATION` are all static literal tables, never derived arithmetic
on deck codes) and keeps the family's actual ceiling visible by inspection,
not implied by a formula someone has to run in their head.

### D-DR2 — Resolution happens at mint time, by checking the active deck's current count

```js
// builder/src/deckFamilies.js (new)
export async function resolveActiveDeckCode(pool, familyKey) {
  const family = DECK_FAMILIES[familyKey];
  for (const code of family.codes) {
    const { rows } = await pool.query(
      "SELECT COALESCE(MAX(card_no), 0) AS max_no FROM card_slots WHERE deck_code = $1",
      [code]
    );
    if (Number(rows[0].max_no) < 999) return code;
  }
  throw new Error(`deck family "${familyKey}" has exhausted every configured code`);
}
```
Checked once per family per run (cached per run, same pattern
`deckTitleCache` already uses), not per note — a family doesn't roll over
mid-run; the active code for a run is resolved once, before that run's
batch of newly-eligible notes for that family is minted. This matches
`mintCardSlots`'s own existing locking (`SELECT ... FOR UPDATE` on the
deck row) — resolve-then-lock-then-mint, same shape, now with one extra
resolution step in front.

### D-DR3 — `assignDeck` returns a family key; a new `resolveDeckCodeForNote` wraps it

`assignDeck(note)` keeps its exact existing shape and signature — it
returns `"lexic"` or `"practice"` (a family key) instead of a literal deck
code. All existing call sites that need an actual deck code to mint into
call `resolveActiveDeckCode(pool, assignDeck(note))` (or, since notes are
already grouped by family before minting in `pipeline.js`'s
`pullAndAssign`/`partitionByDeck`, resolution happens once per family group,
not once per note).

### D-DR4 — A rollover deck's hub `decks` row is auto-created, not pre-seeded

Unlike a family's STARTING code (pre-seeded via `DECK_ALLOCATION`/
`seedDecks`, per `deck-descriptions`), an overflow code (`C31`, `C32`, ...)
has no row in hub's `decks` table until the family actually rolls over to
it. `resolveActiveDeckCode` (or its caller) inserts that row on first use:
`title = "<family title> <roman numeral for its position>"` (e.g. `"Lexic
II"` for the 2nd code in the sequence, matching `03-data-model.md`'s own
`"substantiv II"` naming precedent), `description = ""` (left for the
operator to fill in later, same as any new deck per `deck-descriptions`).

## Risks / Trade-offs

- **A family exhausting every configured code throws, rather than silently
  degrading** — deliberate: silently refusing to mint (or minting into an
  over-capacity deck, defeating the whole point of this change) would be
  far worse than a loud, obvious failure the operator can see and respond
  to by extending the family's code table.
- **Checking `MAX(card_no)` per code in sequence on every mint, rather than
  caching "the current active code" durably** — one extra query per family
  per run; cheap, and avoids a second source of truth (a cached "active
  code" column could drift from the real `card_slots` state if ever edited
  out of band).
