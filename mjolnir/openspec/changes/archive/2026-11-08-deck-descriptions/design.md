## Context

`src/deckData.js`'s `NEW_DECK_DEFAULTS.Description` already exists as a
field every deck object carries; mod 2119 already renders it. Builder's
`ensureDeck` (`src/injectDeck.js`) is **idempotent and return-untouched**
for an already-existing deck — this is deliberate (D-P1: "after the first
run these decks exist forever") and must not change for every field. C20-
C29 were all created long before this change, with `Description: ""`
baked in at creation time — simply adding a `description` column to hub's
`decks` table and passing it as an `ensureDeck` override does nothing for
them, since `ensureDeck` never re-visits an existing deck's fields.

## Goals / Non-Goals

**Goals:**
- Every custom deck (new or already-existing) shows a real, operator-set
  description on-device, matching stock decks' own behavior.
- Zero risk to `ensureDeck`'s existing idempotent-creation guarantee for
  every other field (`PullCounter`, `MaxInterval`, etc. — these must never
  be touched on an existing deck, since they carry live state).

**Non-Goals:**
- Not generalizing "every publish syncs every deck field from hub" — title
  propagation to an already-existing deck has the same gap and is
  explicitly out of scope here; this fixes `Description` only, the one
  field this change's proposal is about.
- Not exposing deck descriptions anywhere in hub's own operator console
  beyond a plain editable text field — no rich text, no validation beyond
  "non-empty is fine, empty is fine too" (same scope).

## Decisions

### D-DD1 — A dedicated `syncDeckDescription`, not an `ensureDeck` behavior change

Rather than changing `ensureDeck` to merge `overrides` into an already-
existing deck (which would risk silently exposing every other override key
to the same already-existing-deck update path, including fields that must
never be touched post-creation), add a narrow, single-purpose function in
`src/injectDeck.js`:
```js
export function syncDeckDescription(decks, name, description) {
  const deck = decks.find((d) => d.Name === name);
  if (deck && description !== undefined) deck.Description = description;
}
```
Called once per touched deck per run, right after `ensureDeck`, in every
`builder/src/pipeline.js` call site that creates/touches a deck. This keeps
`ensureDeck`'s own contract exactly as it is today — only `Description`
ever gets updated post-creation, nothing else.

### D-DD2 — `deckDescription(pool, deckCode)` mirrors `deckTitle` exactly

Same signature shape, same `hub`'s `decks` table as source of truth, same
caching pattern (`deckTitleCache`-style) at call sites — no new conventions
introduced.

## Risks / Trade-offs

- **An empty/blank description is indistinguishable from "operator hasn't
  set one yet"** — acceptable; `DECK_ALLOCATION`'s seed data gives every
  existing deck a real default, so blank should never occur in practice
  post-migration.
- **`syncDeckDescription` runs on every touched deck every run** — a
  write even when the description hasn't changed; harmless (in-memory
  object field write, not a DB write) and simpler than tracking "did it
  change" — same reasoning content regen already uses for cards.
