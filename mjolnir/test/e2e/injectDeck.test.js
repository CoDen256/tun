import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { runExplode } from "../../src/commands/explode.js";
import { loadDeckCardModel, saveDeckCardModel } from "../../src/deckData.js";
import { readModuleSource } from "../../src/parseBundle.js";
import { createCard, interleaveOccurrences, upsertCardContent, ensureDeck } from "../../src/injectDeck.js";
import { fixtureDecks, fixtureCards, DECK_MODULE_ID, CARD_MODULE_ID } from "../fixtures/deckCardFixture.js";

// An extra, unrelated logic module alongside the deck/card pair, so the
// byte-identical guarantee (deck-card-save's spec) has something real to
// check against for an inject-deck save, not just the two touched modules.
const OTHER_MODULE_ID = 102;
function otherModuleSource() {
  return `__d(function (g, r, i, a, m, e, d) {\n  m.exports = function greet() { return "hi"; };\n}, ${OTHER_MODULE_ID}, []);\n`;
}

function buildBundleWithExtraModule() {
  const moduleSource = (id, array) =>
    `__d(function (g, r, i, a, m, e, d) {\n  m.exports = ${JSON.stringify(array)};\n}, ${id}, []);\n`;
  return (
    moduleSource(DECK_MODULE_ID, fixtureDecks()) +
    moduleSource(CARD_MODULE_ID, fixtureCards()) +
    otherModuleSource() +
    `__r(${DECK_MODULE_ID});\n`
  );
}

function withFixtureBundle(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-injectdeck-e2e-"));
  const bundlePath = path.join(dir, "fixture.bundle");
  fs.writeFileSync(bundlePath, buildBundleWithExtraModule());
  runExplode(bundlePath);
  try {
    return fn(bundlePath);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("inject-deck: create + interleave + upsert, saved, leaves every other module byte-identical", () => {
  withFixtureBundle((bundlePath) => {
    const otherBefore = readModuleSource(bundlePath, loadDeckCardModel(bundlePath).manifest[OTHER_MODULE_ID]);

    const model = loadDeckCardModel(bundlePath);
    const deck = ensureDeck(model.decks, { name: "C20", title: "Substantiv" });

    const newIds = ["C20001", "C20002", "C20003", "C20004", "C20005", "C20006"];
    for (const id of newIds) {
      createCard(model.cards, { id, deckId: "C20", N: `N ${id}`, E: `E ${id}`, D: "Substantiv", X: `X ${id}`, A: "N" });
    }
    interleaveOccurrences(deck, newIds, () => ["N", "E"]);

    // A note edited after minting: content changes, identity and position don't.
    upsertCardContent(model.cards, "A01001", { N: "<div>edited Q1</div>" });

    saveDeckCardModel(bundlePath, model);

    const after = loadDeckCardModel(bundlePath);
    assert.equal(after.cards.length, fixtureCards().length + newIds.length);
    assert.equal(after.decks.find((d) => d.Name === "C20").Cards.length, newIds.length * 2);
    assert.equal(after.cards.find((c) => c.ID === "A01001").N, "<div>edited Q1</div>");
    assert.equal(after.cards.find((c) => c.ID === "A01001").DECK_ID, "A01");

    const otherAfter = readModuleSource(bundlePath, after.manifest[OTHER_MODULE_ID]);
    assert.equal(otherAfter, otherBefore, "the unrelated module must be byte-identical after an inject-deck save");
  });
});
