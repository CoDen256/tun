import fs from "node:fs";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import * as t from "@babel/types";
import { extractFactoryBody } from "./factory.js";
import { readModuleSource } from "./parseBundle.js";
import { reassembleBundle } from "./reassemble.js";
import { loadManifest } from "./commands/deobfuscate.js";
import { runExplode } from "./commands/explode.js";

const generate = generatorPkg.default ?? generatorPkg;

// A data module's factory is `__d(function (C, a, r, N, d, P, B) { d.exports
// = [...] }, id, deps)` (or a `return [...]` shape, per classify.js). Rather
// than hand-walking the AST's literal shape, generate the factory's own
// source and call it like Metro would — the same technique the e2e test
// uses — so every value (numbers, strings, the `!0`/`!1` booleans) comes
// back as a real JS value, not an AST node.
function evalFactoryExports(source) {
  const ast = parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const fnSrc = generate(factory, { comments: false }).code;
  // eslint-disable-next-line no-eval
  const fn = eval(`(${fnSrc})`);
  const mod = { exports: {} };
  fn({}, () => {}, () => {}, () => {}, mod, mod.exports, []);
  return mod.exports;
}

// Plain-text rendering of an HTML-bearing card field (strip tags, collapse
// whitespace) — used for compact, scannable list views where showing the
// raw markup would be noise.
export function stripHtml(html) {
  if (!html) return "";
  return html
    .replace(/<[^>]*>/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

// A deck's `Cards[]` entry records one *occurrence* of a card in that
// deck's presentation sequence — which side is shown (front/back/audio)
// and, via the array's own order, when. A card can occur more than once
// (e.g. once front, once back).
export const DECK_OCCURRENCE_LETTERS = ["N", "E", "A"];

// A card's `A` field doesn't hold audio content itself — it names which of
// the card's own fields (front/back/extra) the audio asset is attached to.
export const CARD_AUDIO_TARGETS = ["N", "E", "X"];

// Prefilled structural HTML skeleton for a new card's N/E/X fields (a
// question/answer wrapper matching the shape observed across existing
// cards), rather than leaving them empty.
export const NEW_CARD_SKELETON = {
  N: '<div class="center">...</div>',
  E: '<div class="center">...</div>',
  X: '<div class="center">...</div>',
};

// Sensible defaults for a brand-new deck's non-identity fields, matching
// typical values observed across existing decks.
export const NEW_DECK_DEFAULTS = {
  PullCounter: 0,
  Code: "",
  Enabled: true,
  Description: "",
  Counter1: "",
  Counter2: "",
  MaxInterval: 10,
  AutoTickStreak: 1,
  AutoHammerCount: 2,
};

// One past the highest existing numeric deck `ID` — the next unused id for
// a newly created deck.
export function nextDeckId(decks) {
  let max = -1;
  for (const deck of decks) {
    if (typeof deck.ID === "number" && deck.ID > max) max = deck.ID;
  }
  return max + 1;
}

// Scans a bundle's `data`-classified modules (per its explode manifest) and
// identifies the deck-catalog module (array elements have a `Cards`
// property) and the card-content module (array elements have a `DECK_ID`
// property) by structural shape, not a hardcoded module id.
export function locateDeckCardModules(bundlePath, manifest) {
  const dataEntries = Object.entries(manifest).filter(
    ([, mod]) => mod.classification === "data"
  );

  let deckModuleId = null;
  let cardModuleId = null;
  let decks = null;
  let cards = null;

  for (const [idStr, mod] of dataEntries) {
    const source = readModuleSource(bundlePath, mod);
    let exported;
    try {
      exported = evalFactoryExports(source);
    } catch {
      continue;
    }
    if (!Array.isArray(exported) || exported.length === 0) continue;
    const sample = exported[0];
    if (!sample || typeof sample !== "object") continue;

    if (deckModuleId === null && Object.prototype.hasOwnProperty.call(sample, "Cards")) {
      deckModuleId = idStr;
      decks = exported;
    } else if (
      cardModuleId === null &&
      Object.prototype.hasOwnProperty.call(sample, "DECK_ID")
    ) {
      cardModuleId = idStr;
      cards = exported;
    }
  }

  if (deckModuleId === null || cardModuleId === null) {
    throw new Error(
      "Could not locate the deck-catalog/card-content module pair in this bundle"
    );
  }

  return { deckModuleId, cardModuleId, decks, cards };
}

// Loads the manifest, locates the pair, and parses both into plain JS
// arrays, ready to browse/edit/save.
export function loadDeckCardModel(bundlePath) {
  const manifest = loadManifest(bundlePath);
  const { deckModuleId, cardModuleId, decks, cards } = locateDeckCardModules(
    bundlePath,
    manifest
  );
  return { manifest, deckModuleId, cardModuleId, decks, cards };
}

// A deck's category is the first character of its `Name` field.
export function deckCategory(deck) {
  return deck.Name[0];
}

// Maps each card id referenced by a deck to the set of direction letters
// (the trailing character of each `Cards[].Card` entry, e.g. `N`/`E`/`A`)
// that deck references it with — a card can appear more than once in the
// same deck's `Cards[]`, once per direction it's quizzed in.
export function cardDirectionsInDeck(deck) {
  const directions = new Map();
  for (const ref of deck.Cards || []) {
    const baseId = ref.Card.slice(0, -1);
    const letter = ref.Card.slice(-1);
    if (!directions.has(baseId)) directions.set(baseId, new Set());
    directions.get(baseId).add(letter);
  }
  return directions;
}

// `Cards[].P` is an independent per-occurrence flag (observed values N/Y,
// uncorrelated with the direction letter — e.g. the same deck has P:"Y"
// entries with every one of N/E/A as their Card suffix) whose real meaning
// isn't something this editor manages. The occurrence's direction is
// encoded *only* in the trailing letter of its `Card` string. Every entry
// this editor writes sets P to this fixed value rather than guessing at
// P's semantics.
const OCCURRENCE_P_VALUE = "N";

// Appends a new occurrence of `cardId` to the end of `deck.Cards[]` with the
// given direction letter. Mutates `deck.Cards` in place. Throws on an
// invalid letter — callers validate the card id itself (e.g. that it
// belongs to this deck) before calling, since that check needs the card
// list this function doesn't take.
export function addOccurrence(deck, cardId, letter) {
  if (!DECK_OCCURRENCE_LETTERS.includes(letter)) {
    throw new Error(
      `invalid occurrence letter "${letter}" (must be one of ${DECK_OCCURRENCE_LETTERS.join(", ")})`
    );
  }
  deck.Cards.push({ Card: `${cardId}${letter}`, P: OCCURRENCE_P_VALUE });
}

// Changes the direction letter of the occurrence at `index` in
// `deck.Cards[]`, keeping it pointed at the same card id. Mutates in place,
// preserving every other occurrence's position (order is the presentation
// sequence). Throws on an out-of-range index or invalid letter.
export function updateOccurrenceLetter(deck, index, letter) {
  const ref = deck.Cards[index];
  if (!ref) throw new Error(`no occurrence at index ${index} in deck "${deck.Name}"`);
  if (!DECK_OCCURRENCE_LETTERS.includes(letter)) {
    throw new Error(
      `invalid occurrence letter "${letter}" (must be one of ${DECK_OCCURRENCE_LETTERS.join(", ")})`
    );
  }
  const cardId = ref.Card.slice(0, -1);
  deck.Cards[index] = { Card: `${cardId}${letter}`, P: OCCURRENCE_P_VALUE };
}

// Removes the occurrence at `index` from `deck.Cards[]`, shifting every
// later occurrence's position down by one. Throws on an out-of-range index.
export function removeOccurrence(deck, index) {
  if (!deck.Cards[index]) throw new Error(`no occurrence at index ${index} in deck "${deck.Name}"`);
  deck.Cards.splice(index, 1);
}

// Fisher-Yates shuffle of a deck's presentation order, in place.
export function shuffleOccurrences(deck) {
  for (let i = deck.Cards.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [deck.Cards[i], deck.Cards[j]] = [deck.Cards[j], deck.Cards[i]];
  }
}

// Case-insensitive substring search over deck titles.
export function searchDecks(decks, query) {
  const needle = query.trim().toLowerCase();
  if (!needle) return [];
  return decks.filter((d) => (d.Title || "").toLowerCase().includes(needle));
}

// Case-insensitive substring search over a card's plain-text content
// (N/E/X/D fields, HTML stripped) — matches content a user would actually
// read, not raw markup.
export function searchCards(cards, query) {
  const needle = query.trim().toLowerCase();
  if (!needle) return [];
  return cards.filter((c) => {
    const text = [c.N, c.E, c.X, c.D].map(stripHtml).join(" ").toLowerCase();
    return text.includes(needle);
  });
}

// Every deck's `Cards[].Card` reference (minus its trailing direction
// letter) must resolve to a card's `ID`; every card's `DECK_ID` must
// resolve to a deck's `Name`.
export function validateReferences(decks, cards) {
  const cardIds = new Set(cards.map((c) => c.ID));
  const deckNames = new Set(decks.map((d) => d.Name));
  const errors = [];

  for (const deck of decks) {
    for (const ref of deck.Cards || []) {
      const baseId = ref.Card.slice(0, -1);
      if (!cardIds.has(baseId)) {
        errors.push(
          `deck "${deck.Name}" references unknown card "${baseId}" (from Cards[] entry "${ref.Card}")`
        );
      }
    }
  }

  for (const card of cards) {
    if (!deckNames.has(card.DECK_ID)) {
      errors.push(`card "${card.ID}" has unresolved DECK_ID "${card.DECK_ID}"`);
    }
  }

  return { valid: errors.length === 0, errors };
}

// Next unused zero-padded 3-digit sequence among a deck's existing card
// ids: `<deckName>` + max existing numeric suffix + 1, zero-padded to 3
// digits. Works correctly even when existing sequence numbers have gaps,
// since it scans for the max rather than counting entries.
export function nextCardId(deckName, cards) {
  let maxSeq = 0;
  for (const card of cards) {
    if (!card.ID.startsWith(deckName)) continue;
    const suffix = card.ID.slice(deckName.length);
    if (/^\d{3}$/.test(suffix)) {
      maxSeq = Math.max(maxSeq, Number.parseInt(suffix, 10));
    }
  }
  return `${deckName}${String(maxSeq + 1).padStart(3, "0")}`;
}

// Replaces a data module's `module.exports = [...]` (or `return [...]`)
// array literal with a freshly generated one built from `newArray`, leaving
// the `__d(...)` wrapper (id, deps, verbose name) untouched.
export function regenerateModuleSource(originalSource, newArray) {
  const ast = parse(originalSource, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const stmt = factory.body.body[0];
  const newArrayNode = t.valueToNode(newArray);

  if (stmt.type === "ReturnStatement") {
    stmt.argument = newArrayNode;
  } else if (
    stmt.type === "ExpressionStatement" &&
    stmt.expression.type === "AssignmentExpression"
  ) {
    stmt.expression.right = newArrayNode;
  } else {
    throw new Error("Unexpected data module shape: cannot locate the exports literal to replace");
  }

  return generate(ast, { comments: false, retainLines: false }).code;
}

// Copies the bundle's current on-disk contents to `<bundle>.bak`, overwriting
// any prior backup. Called immediately before every save, since `ui` is the
// first command that can destructively overwrite a bundle file.
export function backupBundle(bundlePath) {
  fs.copyFileSync(bundlePath, `${bundlePath}.bak`);
}

// Validates referential integrity, backs up the current bundle, regenerates
// both data modules, and reassembles+writes the bundle in place. Both
// modules are always rewritten together, even if only one was logically
// edited. Throws (writing nothing) if validation fails.
export function saveDeckCardModel(bundlePath, { manifest, deckModuleId, cardModuleId, decks, cards }) {
  const { valid, errors } = validateReferences(decks, cards);
  if (!valid) {
    throw new Error(`Referential integrity check failed:\n${errors.join("\n")}`);
  }

  const deckSource = readModuleSource(bundlePath, manifest[deckModuleId]);
  const cardSource = readModuleSource(bundlePath, manifest[cardModuleId]);
  const newDeckSource = regenerateModuleSource(deckSource, decks);
  const newCardSource = regenerateModuleSource(cardSource, cards);

  backupBundle(bundlePath);

  const outBuffer = reassembleBundle(bundlePath, manifest, [
    { moduleId: deckModuleId, newSource: newDeckSource },
    { moduleId: cardModuleId, newSource: newCardSource },
  ]);
  fs.writeFileSync(bundlePath, outBuffer);

  // The manifest's byte offsets are now stale (both modules' lengths
  // changed); regenerate it so a subsequent loadDeckCardModel() in this
  // session reads the right ranges.
  runExplode(bundlePath);
}
