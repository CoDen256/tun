// card-preview-popup task group 5 — the flush/held split cardsPage.js
// derives for the Cards page's occurrence cells, proven to reuse builder's
// own multiple-of-5 rule (builder/src/cardFlow.js's `nextMultipleOf5`)
// rather than a second copy of it. Pure and DB-free: it takes the two
// counts `shipOrderForDeck` would hand it, not a pool.
import test from "node:test";
import assert from "node:assert/strict";
import { flushHeldSplit } from "../src/cardsPage.js";
import { nextMultipleOf5 } from "../../builder/src/cardFlow.js";

test("flushHeldSplit: nothing staged -> nothing flushes", () => {
  assert.equal(flushHeldSplit(12, 0), 0);
});

test("flushHeldSplit: exactly enough staged to reach the next multiple of 5 -> all flush, none held", () => {
  assert.equal(nextMultipleOf5(12), 15);
  assert.equal(flushHeldSplit(12, 3), 3);
});

test("flushHeldSplit: more staged than needed -> only the need flushes, the rest are held (matches builder-ship-strips' own heldText example)", () => {
  // shipped=12, staged=7 -> need=3 flush (reaching 15), 4 held.
  assert.equal(flushHeldSplit(12, 7), 3);
});

test("flushHeldSplit: a deck already on a multiple of 5 still needs a full 5 before anything flushes", () => {
  assert.equal(nextMultipleOf5(15), 20);
  assert.equal(flushHeldSplit(15, 3), 3);
  assert.equal(flushHeldSplit(15, 5), 5);
  assert.equal(flushHeldSplit(15, 9), 5); // 4 held
});
