import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { buildFixtureBundleSource, fixtureDecks, fixtureCards } from "../../test/fixtures/deckCardFixture.js";
import { cardIndex, resetCardIndexCache } from "../src/cardText.js";

function makeDataDir() {
  const dataDir = fs.mkdtempSync(path.join(os.tmpdir(), "mjolnir-cardtext-"));
  fs.mkdirSync(path.join(dataDir, "ota", "bundle"), { recursive: true });
  return dataDir;
}

function writeCurrent(dataDir, buildId) {
  fs.writeFileSync(path.join(dataDir, "ota", "current.json"), JSON.stringify({ buildId }));
}

test("cardText.cardIndex: no published build is current -> empty index, reason given", () => {
  resetCardIndexCache();
  const dataDir = makeDataDir();
  const index = cardIndex(dataDir);
  assert.equal(index.cardById.size, 0);
  assert.equal(index.deckTitleByUpper.size, 0);
  assert.match(index.reason, /no published build is current/);
});

test("cardText.cardIndex: current.json points at a bundle that isn't on disk -> empty index, reason given, never throws", () => {
  resetCardIndexCache();
  const dataDir = makeDataDir();
  writeCurrent(dataDir, "b-missing");
  const index = cardIndex(dataDir);
  assert.equal(index.cardById.size, 0);
  assert.ok(index.reason && index.reason.length > 0);
});

test("cardText.cardIndex: resolves card/deck text from the published bundle, cached per build_id", () => {
  resetCardIndexCache();
  const dataDir = makeDataDir();
  writeCurrent(dataDir, "b-fixture-1");
  fs.writeFileSync(path.join(dataDir, "ota", "bundle", "b-fixture-1.js"), buildFixtureBundleSource());

  const index = cardIndex(dataDir);
  assert.equal(index.reason, null);
  assert.equal(index.buildId, "b-fixture-1");

  const card = index.cardById.get("A01001");
  assert.ok(card);
  assert.equal(card.N, "<div>Q1</div>");

  assert.equal(index.deckTitleByUpper.get("DECK A1"), "Deck A1");

  // Calling again with the same current build reuses the cached parse —
  // deleting the bundle file afterward must not surface a failure, since
  // a fresh parse should never be attempted.
  fs.rmSync(path.join(dataDir, "ota", "bundle", "b-fixture-1.js"));
  const again = cardIndex(dataDir);
  assert.equal(again.cardById.get("A01001")?.N, "<div>Q1</div>");
});

test("cardText.cardIndex: a new current build invalidates the cache", () => {
  resetCardIndexCache();
  const dataDir = makeDataDir();
  writeCurrent(dataDir, "b-fixture-a");
  fs.writeFileSync(
    path.join(dataDir, "ota", "bundle", "b-fixture-a.js"),
    buildFixtureBundleSource({ decks: fixtureDecks(), cards: fixtureCards() })
  );
  const first = cardIndex(dataDir);
  assert.equal(first.buildId, "b-fixture-a");

  writeCurrent(dataDir, "b-fixture-b");
  fs.writeFileSync(
    path.join(dataDir, "ota", "bundle", "b-fixture-b.js"),
    buildFixtureBundleSource({
      decks: [{ ID: 9, Name: "Z09", Title: "Zed", Cards: [{ Card: "Z09001N", P: "N" }] }],
      cards: [{ DECK_ID: "Z09", ID: "Z09001", N: "<div>Zed Q</div>", E: "<div>Zed A</div>", D: "Zed", X: "", A: "N" }],
    })
  );
  const second = cardIndex(dataDir);
  assert.equal(second.buildId, "b-fixture-b");
  assert.equal(second.cardById.has("A01001"), false); // the first build's cards are gone
  assert.equal(second.deckTitleByUpper.get("ZED"), "Zed");
});
