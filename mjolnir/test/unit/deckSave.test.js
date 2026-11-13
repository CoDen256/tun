import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { runExplode } from "../../src/commands/explode.js";
import { loadDeckCardModel, saveDeckCardModel } from "../../src/deckData.js";
import { buildFixtureBundleSource } from "../fixtures/deckCardFixture.js";

function withFixtureBundle(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-decksave-"));
  const bundlePath = path.join(dir, "fixture.bundle");
  fs.writeFileSync(bundlePath, buildFixtureBundleSource());
  runExplode(bundlePath);
  try {
    return fn(bundlePath);
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

test("saving with no edits leaves every other module untouched and re-parses identically", () => {
  withFixtureBundle((bundlePath) => {
    const before = loadDeckCardModel(bundlePath);
    saveDeckCardModel(bundlePath, before);

    const after = loadDeckCardModel(bundlePath);
    assert.deepEqual(after.decks, before.decks);
    assert.deepEqual(after.cards, before.cards);
  });
});

test("saving with one new card leaves the rest of the model intact and adds the card", () => {
  withFixtureBundle((bundlePath) => {
    const model = loadDeckCardModel(bundlePath);
    const newCard = {
      DECK_ID: "A01",
      ID: "A01003",
      N: "<div>Q4</div>",
      E: "<div>A4</div>",
      D: "Deck A1",
      X: "<div>X4</div>",
      A: "X",
    };
    model.cards.push(newCard);
    model.decks[0].Cards.push({ Card: "A01003N", P: "N" });

    saveDeckCardModel(bundlePath, model);

    const after = loadDeckCardModel(bundlePath);
    assert.equal(after.cards.length, 4);
    assert.deepEqual(
      after.cards.find((c) => c.ID === "A01003"),
      newCard
    );
    assert.equal(after.decks[0].Cards.length, 3);
  });
});

test("a save that would break referential integrity is rejected and the bundle file is untouched", () => {
  withFixtureBundle((bundlePath) => {
    const before = fs.readFileSync(bundlePath);
    const model = loadDeckCardModel(bundlePath);
    model.decks[0].Cards.push({ Card: "A01999N", P: "N" });

    assert.throws(() => saveDeckCardModel(bundlePath, model), /Referential integrity/);

    const after = fs.readFileSync(bundlePath);
    assert.ok(before.equals(after));
    assert.equal(fs.existsSync(`${bundlePath}.bak`), false);
  });
});

test("saving creates/overwrites a .bak file with the pre-save bundle contents", () => {
  withFixtureBundle((bundlePath) => {
    const originalBytes = fs.readFileSync(bundlePath);
    const model = loadDeckCardModel(bundlePath);
    model.cards.push({
      DECK_ID: "A01",
      ID: "A01003",
      N: "x",
      E: "x",
      D: "x",
      X: "x",
      A: "X",
    });
    model.decks[0].Cards.push({ Card: "A01003N", P: "N" });

    saveDeckCardModel(bundlePath, model);

    const backupBytes = fs.readFileSync(`${bundlePath}.bak`);
    assert.ok(originalBytes.equals(backupBytes));
  });
});
