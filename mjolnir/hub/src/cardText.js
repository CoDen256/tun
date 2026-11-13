import path from "node:path";
import { readCurrent } from "./publications.js";
import { loadDeckCardModel } from "../../src/deckData.js";

// D-UP2: stock card text lives nowhere hub's database can reach — only in
// the currently published bundle's own card-content module. Cached in
// memory keyed on `build_id` so a given publish is parsed at most once,
// not once per request; invalidated the moment `current.json` points
// somewhere else.
let cached = null; // { buildId, cardById, deckByCode, deckTitleByUpper, reason }

function bundlePathFor(dataDir, buildId) {
  return path.join(dataDir, "ota", "bundle", `${buildId}.js`);
}

// Never module 2113 (or any other number) — `loadDeckCardModel` locates
// the deck-catalogue/card-content module pair by shape, exactly like the
// workbench and the Catalogue already do, since the id has been observed
// to drift between builds.
export function cardIndex(dataDir) {
  const current = readCurrent(dataDir);
  const buildId = current?.buildId || null;

  if (cached && cached.buildId === buildId) return cached;

  if (!buildId) {
    cached = {
      buildId,
      cardById: new Map(),
      deckByCode: new Map(),
      deckTitleByUpper: new Map(),
      reason: "no published build is current",
    };
    return cached;
  }

  try {
    const { decks, cards } = loadDeckCardModel(bundlePathFor(dataDir, buildId));
    cached = {
      buildId,
      cardById: new Map(cards.map((c) => [c.ID, c])),
      // D-IN4: the bundle is the one place `MaxInterval`/`AutoTickStreak`/
      // `AutoHammerCount`/`Cards[]` live for *every* deck, stock or
      // hub-managed — `decks` never stores these.
      deckByCode: new Map(decks.map((d) => [d.Name, d])),
      // D-UP3: `D` on a progress record is upper-cased on device; the
      // catalogue's own `Title` is sentence case and is the canonical
      // display form where the two match case-insensitively.
      deckTitleByUpper: new Map(decks.map((d) => [(d.Title || "").toUpperCase(), d.Title])),
      reason: null,
    };
  } catch (err) {
    // A broken/missing bundle degrades the Content column only — never
    // throws out to the route.
    cached = {
      buildId,
      cardById: new Map(),
      deckByCode: new Map(),
      deckTitleByUpper: new Map(),
      reason: `the published bundle could not be read (${err.message})`,
    };
  }
  return cached;
}

// The module-level cache would otherwise leak between fixtures within the
// same test run.
export function resetCardIndexCache() {
  cached = null;
}
