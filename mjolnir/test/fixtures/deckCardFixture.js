// Builds a minimal synthetic bundle with a deck-catalog module and a
// card-content module shaped like the real app's module 2111/2113 pair, for
// deck/card data-model and save tests that don't need the full real bundle.

export const DECK_MODULE_ID = 100;
export const CARD_MODULE_ID = 101;

export function fixtureDecks() {
  return [
    {
      ID: 0,
      Name: "A01",
      Title: "Deck A1",
      Cards: [
        { Card: "A01001N", P: "N" },
        { Card: "A01002N", P: "N" },
      ],
    },
    {
      ID: 1,
      Name: "B01",
      Title: "Deck B1",
      // Dual-occurrence deck: the same card presented both front (N) and
      // back (E) — real direction letters are N/E/A, not N/Y.
      Cards: [
        { Card: "B01001N", P: "N" },
        { Card: "B01001E", P: "E" },
      ],
    },
  ];
}

export function fixtureCards() {
  return [
    {
      DECK_ID: "A01",
      ID: "A01001",
      N: "<div>Q1</div>",
      E: "<div>A1</div>",
      D: "Deck A1",
      X: "<div>X1</div>",
      A: "X",
    },
    {
      DECK_ID: "A01",
      ID: "A01002",
      N: "<div>Q2</div>",
      E: "<div>A2</div>",
      D: "Deck A1",
      X: "<div>X2</div>",
      A: "X",
    },
    {
      DECK_ID: "B01",
      ID: "B01001",
      N: "<div>Q3</div>",
      E: "<div>A3</div>",
      D: "Deck B1",
      X: "<div>X3</div>",
      A: "X",
    },
  ];
}

function moduleSource(id, array) {
  return `__d(function (g, r, i, a, m, e, d) {\n  m.exports = ${JSON.stringify(array)};\n}, ${id}, []);\n`;
}

export function buildFixtureBundleSource({ decks = fixtureDecks(), cards = fixtureCards() } = {}) {
  return (
    moduleSource(DECK_MODULE_ID, decks) +
    moduleSource(CARD_MODULE_ID, cards) +
    `__r(${DECK_MODULE_ID});\n`
  );
}
