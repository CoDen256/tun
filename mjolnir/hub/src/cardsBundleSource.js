// card-preview-popup task group 5, task 5.2 — the Cards page's "Bundle
// bNN" source. Reads EXACTLY one file, `data/ota/bundle/<buildId>.js`,
// through `loadDeckCardModel` (src/deckData.js) — the same shape-based
// module locator the bundle workbench and hub/src/cardText.js already use,
// never a hard-coded module id. This is a READ ONLY path into the device
// plane's own served directory (CLAUDE.md "Do not change anything here"):
// nothing in this file ever opens that path for writing, and
// `loadDeckCardModel` itself never does either.
//
// Cached per build id in memory (task 5.2's "cached per build" note) —
// published bundles are immutable once written (D04-adjacent: a build id
// names one fixed set of bytes), so the cache never needs to be
// invalidated, only ever added to as the operator browses more builds. A
// bundle that fails to parse caches its OWN failure too, so a broken file
// is reported once and then answered from cache on every subsequent visit
// rather than re-parsed (and re-failed) on every request.
import path from "node:path";
import { loadDeckCardModel, cardDirectionsInDeck } from "../../src/deckData.js";
import { stripHtml } from "./cards.js";

const cache = new Map(); // buildId -> { rows, error }

export function bundlePathFor(dataDir, buildId) {
  return path.join(dataDir, "ota", "bundle", `${buildId}.js`);
}

// Every letter (N/E/A) any deck's `Cards[]` references for a card, across
// every deck in the bundle — a card only ever belongs to one deck in
// practice, but nothing here assumes that.
function occurrencesByCard(decks) {
  const byCard = new Map();
  for (const deck of decks || []) {
    const directions = cardDirectionsInDeck(deck);
    for (const [cardId, letters] of directions) {
      if (!byCard.has(cardId)) byCard.set(cardId, new Set());
      for (const letter of letters) byCard.get(cardId).add(letter);
    }
  }
  return byCard;
}

// Builds the common row shape (task 5's data assembly) for exactly the
// cards this bundle's own card-content module carries — "the bundle's
// distinct card ids" acceptance C34 checks the count against. Occurrence
// cells are binary present/absent here (design.md §5: "In Bundle mode
// every present cell is 'shipped'"), carrying no build id of their own
// since the whole row IS that one build.
function buildRows(buildId, decks, cards) {
  const deckByCode = new Map((decks || []).map((d) => [d.Name, d]));
  const occByCard = occurrencesByCard(decks);
  return (cards || []).map((c) => {
    const deck = deckByCode.get(c.DECK_ID);
    const letters = occByCard.get(c.ID) || new Set();
    const occurrences = ["N", "E", "A"]
      .filter((l) => letters.has(l))
      .map((letter) => ({ letter, status: "shipped", buildId, tip: `${letter} · shipped in ${buildId}` }));
    return {
      id: c.ID,
      deckCode: c.DECK_ID,
      deckTitle: (deck && deck.Title) || c.D || c.DECK_ID,
      N: c.N || "",
      E: c.E || "",
      X: c.X || "",
      A: c.A || "",
      pN: stripHtml(c.N),
      pE: stripHtml(c.E),
      pX: stripHtml(c.X),
      rawHtml: `${c.N || ""} ${c.E || ""} ${c.X || ""}`,
      occurrences,
      noteId: null,
      grammarRuleId: null,
      audioUrl: null,
      audioAvailable: false,
      hasAudio: false,
      audioMissing: false,
      mintedAt: null,
      lastShippedAt: null,
      pendingMin: null,
      isHubMinted: false, // corrected by the caller against card_slots
    };
  });
}

// Returns `{ rows, error, buildId }`. `error` is a plain string (never an
// Error, never thrown) so the route that calls this can render it inline
// per acceptance C34/C39 — "a bundle file that cannot be read degrades the
// list with an explanation; it never throws out of the route."
export function loadBundleRows(dataDir, buildId) {
  if (cache.has(buildId)) return { buildId, ...cache.get(buildId) };
  let result;
  try {
    const { decks, cards } = loadDeckCardModel(bundlePathFor(dataDir, buildId));
    result = { rows: buildRows(buildId, decks, cards), error: null };
  } catch (err) {
    result = { rows: [], error: err.message };
  }
  cache.set(buildId, result);
  return { buildId, ...result };
}

// Test-only: the module-level cache would otherwise leak between fixtures.
export function resetBundleSourceCache() {
  cache.clear();
}
