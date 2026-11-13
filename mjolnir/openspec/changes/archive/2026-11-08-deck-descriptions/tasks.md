## 0. Before you write any code

Read `design.md` in full, especially D-DD1 (a dedicated
`syncDeckDescription`, never an `ensureDeck` behavior change — every other
override field must stay creation-only). Read `src/injectDeck.js`'s
`ensureDeck`/`NEW_DECK_DEFAULTS` and `builder/src/mint.js`'s `deckTitle`
before touching either.

## 1. Schema and seed data

- [x] 1.1 New hub migration: `ALTER TABLE decks ADD COLUMN description TEXT
      NOT NULL DEFAULT ''`.
- [x] 1.2 `hub/src/decks.js`'s `DECK_ALLOCATION`: add a short, real
      `description` per existing deck (C20-C29); `seedDecks` writes it on
      `ON CONFLICT DO NOTHING` (new decks only — don't clobber an
      operator-edited description on a deck that already exists).
- [x] 1.3 A way for the operator to edit an existing deck's description
      (hub console — same pattern as editing a publication's label).
- [x] 1.4 Tests: seeding writes the default description for a new deck;
      re-seeding an already-existing deck does not overwrite an
      operator-edited description.

## 2. Builder wiring

- [x] 2.1 `builder/src/mint.js`: add `deckDescription(pool, deckCode)`,
      mirroring `deckTitle`'s exact shape.
- [x] 2.2 `src/injectDeck.js`: add `syncDeckDescription(decks, name,
      description)` per D-DD1 — updates only `Description` on an
      already-existing deck entry, touches nothing else.
- [x] 2.3 `builder/src/pipeline.js`: every `ensureDeck` call site also
      calls `syncDeckDescription` right after, using a
      `deckDescriptionCache` (same caching pattern as `deckTitleCache`).
- [x] 2.4 Tests: a brand-new deck is created with its real description (not
      blank); an already-existing deck (created before this change, with
      `Description: ""` baked in from an earlier run) gets its description
      updated on the next publish that touches it, without any other field
      (`PullCounter`, `MaxInterval`, etc.) changing.

## 3. Sign-off

- [x] 3.1 Re-run the full test suite — confirm no existing deck-related
      test assumed `Description` stays empty.
- [x] 3.2 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`.
- [x] 3.3 **(Operator, outside this change)** Assemble/install a bundle
      after setting a few real deck descriptions; confirm on-device the
      deck-list screen shows them (same panel stock decks already use).
