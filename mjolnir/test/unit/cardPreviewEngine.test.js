import test from "node:test";
import assert from "node:assert/strict";
import {
  defaultDirectionFor,
  directionSlots,
  hasAOccurrence,
  stepIndex,
  isTypingTarget,
  occurrenceSummaryText,
  isAudioFace,
  resolveTapOutcome,
} from "../../hub/src/cardPreviewEngine.js";
import * as directEngine from "../../hub/src/cardPreviewEngine.js";

// card-preview-popup task group 3 ("The card and the popup") — unit tests
// for the two pieces of task 3 that are pure functions of data, per that
// task's own instruction to write tests for exactly these two (direction
// resolution 3.4, stepping 3.5) since the rest (actual popup open/close,
// backdrop, audio playback) is browser-only and verified later by a
// tester agent. Imported through `cardPreviewPopup.js`'s `_engine` to also
// prove the popup's wiring calls these exact functions, not a second,
// hand-kept-in-sync copy (see that file's header) — and once more
// straight from `cardPreviewEngine.js` to prove that module (served
// VERBATIM to the browser at /mjolnir/cards/popup-engine.js, like task 2's
// render-engine.js) is the one real source.

import { _engine } from "../../hub/src/cardPreviewPopup.js";

test("cardPreviewPopup.js's _engine re-exports the exact cardPreviewEngine.js functions (no second copy)", () => {
  assert.equal(_engine.defaultDirectionFor, directEngine.defaultDirectionFor);
  assert.equal(_engine.directionSlots, directEngine.directionSlots);
  assert.equal(_engine.stepIndex, directEngine.stepIndex);
  assert.equal(_engine.occurrenceSummaryText, directEngine.occurrenceSummaryText);
  assert.equal(_engine.hasAOccurrence, directEngine.hasAOccurrence);
  assert.equal(_engine.resolveTapOutcome, directEngine.resolveTapOutcome);
});

// ---------------------------------------------------------------------
// 3.4 direction resolution — design.md §3/§4, acceptance C19/C20
// ---------------------------------------------------------------------

test("defaultDirectionFor: operator's saved default N/E wins outright", () => {
  const card = { A: "E", occurrences: [{ letter: "A" }] };
  assert.equal(defaultDirectionFor(card, "N"), "N");
  assert.equal(defaultDirectionFor(card, "E"), "E");
});

test("defaultDirectionFor: 'auto' resolves to the first occurrence's letter", () => {
  assert.equal(defaultDirectionFor({ A: "E", occurrences: [{ letter: "N" }, { letter: "E" }] }, "auto"), "N");
  assert.equal(defaultDirectionFor({ A: "N", occurrences: [{ letter: "E" }] }, "auto"), "E");
});

test("defaultDirectionFor: A is resolved through the card's own A field, never a third option — acceptance C19", () => {
  // "a card whose A field is E and whose first occurrence is A": opens on E.
  assert.equal(defaultDirectionFor({ A: "E", occurrences: [{ letter: "A" }] }, "auto"), "E");
  assert.equal(defaultDirectionFor({ A: "N", occurrences: [{ letter: "A" }] }, "auto"), "N");
});

test("defaultDirectionFor: no occurrences at all falls back to N", () => {
  assert.equal(defaultDirectionFor({ A: "N", occurrences: [] }, "auto"), "N");
  assert.equal(defaultDirectionFor({ A: "N" }, "auto"), "N");
});

test("directionSlots: N on top puts E in the middle, X always at the bottom", () => {
  assert.deepEqual(directionSlots("N"), { top: "N", mid: "E", bottom: "X" });
});

test("directionSlots: switching to E swaps top and middle, X stays at the bottom — acceptance C19", () => {
  assert.deepEqual(directionSlots("E"), { top: "E", mid: "N", bottom: "X" });
});

test("directionSlots: the switch has exactly two meaningful inputs, N and E — anything else behaves like N", () => {
  assert.deepEqual(directionSlots("A"), { top: "N", mid: "E", bottom: "X" });
  assert.deepEqual(directionSlots(undefined), { top: "N", mid: "E", bottom: "X" });
});

test("hasAOccurrence", () => {
  assert.equal(hasAOccurrence([{ letter: "N" }, { letter: "A" }]), true);
  assert.equal(hasAOccurrence([{ letter: "N" }, { letter: "E" }]), false);
  assert.equal(hasAOccurrence(undefined), false);
});

// ---------------------------------------------------------------------
// 3.5 stepping — design.md §4, acceptance C18
// ---------------------------------------------------------------------

test("stepIndex: steps forward/backward across the full list", () => {
  assert.equal(stepIndex(0, 1, 137), 1);
  assert.equal(stepIndex(25, 1, 137), 26);
  assert.equal(stepIndex(26, -1, 137), 25);
});

test("stepIndex: disabled (null) at either end — acceptance C18 '← on the first and → on the last are disabled'", () => {
  assert.equal(stepIndex(0, -1, 137), null);
  assert.equal(stepIndex(136, 1, 137), null);
});

test("stepIndex: crosses page boundaries by construction — it is just array indexing over the FULL filtered+sorted list", () => {
  // 25-per-page table, page 1 is indices 0-24; stepping from the last row
  // of page 1 moves to index 25 (page 2's first row), not nowhere.
  assert.equal(stepIndex(24, 1, 137), 25);
});

test("stepIndex: an empty/invalid list never produces an index", () => {
  assert.equal(stepIndex(0, 1, 0), null);
  assert.equal(stepIndex(0, 1, -1), null);
});

test("isTypingTarget: ignores stepping while focus is in any input/textarea/select", () => {
  assert.equal(isTypingTarget({ tagName: "INPUT" }), true);
  assert.equal(isTypingTarget({ tagName: "TEXTAREA" }), true);
  assert.equal(isTypingTarget({ tagName: "SELECT" }), true);
  assert.equal(isTypingTarget({ tagName: "DIV" }), false);
  assert.equal(isTypingTarget(null), false);
});

test("isTypingTarget: ignores stepping while focus is inside a future editor (contenteditable / CodeMirror) — future-proofing for task group 4", () => {
  const closestHit = { tagName: "SPAN", closest: () => ({}) };
  assert.equal(isTypingTarget(closestHit), true);
  const closestMiss = { tagName: "SPAN", closest: () => null };
  assert.equal(isTypingTarget(closestMiss), false);
});

// ---------------------------------------------------------------------
// occurrence summary text — design.md §4, acceptance C22
// ---------------------------------------------------------------------

test("occurrenceSummaryText: matches design.md §4's example shape", () => {
  const occ = [
    { letter: "N", status: "shipped", buildId: "b42" },
    { letter: "E", status: "pending", remaining: 7 },
  ];
  assert.equal(occurrenceSummaryText(occ), "N · shipped in b42  |  E · pending · 7 to go");
});

test("occurrenceSummaryText: staged flushing vs held", () => {
  assert.equal(occurrenceSummaryText([{ letter: "N", status: "staged", flushing: true }]), "N · staged · flushes next run");
  assert.equal(occurrenceSummaryText([{ letter: "N", status: "staged", flushing: false }]), "N · staged · held");
});

test("occurrenceSummaryText: a stock (never-shipped-by-build) shipped occurrence says '(stock)'", () => {
  assert.equal(occurrenceSummaryText([{ letter: "N", status: "shipped" }]), "N · shipped (stock)");
});

test("occurrenceSummaryText: no occurrences at all", () => {
  assert.equal(occurrenceSummaryText([]), "no occurrences");
  assert.equal(occurrenceSummaryText(undefined), "no occurrences");
});

// ---------------------------------------------------------------------
// 3.6 audio tap outcome — acceptance C21
// ---------------------------------------------------------------------

test("isAudioFace: true only for the face currently showing the card's A side", () => {
  assert.equal(isAudioFace({ A: "E" }, "E"), true);
  assert.equal(isAudioFace({ A: "E" }, "N"), false);
  assert.equal(isAudioFace({ A: "E" }, "X"), false);
});

test("resolveTapOutcome: a non-A face always says 'no audio on this face', regardless of flags", () => {
  const card = { A: "E" };
  assert.equal(resolveTapOutcome(card, "N", { audioAvailable: true }).outcome, "no-audio-on-face");
  assert.equal(resolveTapOutcome(card, "X", { hasAudio: true }).outcome, "no-audio-on-face");
});

test("resolveTapOutcome: the A face plays when the clip is available", () => {
  const card = { A: "E" };
  assert.equal(resolveTapOutcome(card, "E", { audioAvailable: true }).outcome, "play");
});

test("resolveTapOutcome: the A face says unavailable when the clip is expected but missing", () => {
  const card = { A: "E" };
  const result = resolveTapOutcome(card, "E", { audioAvailable: false, hasAudio: false });
  assert.equal(result.outcome, "unavailable");
  assert.ok(result.message);
});

test("resolveTapOutcome: the A face with no flags at all still refuses to play (never assumes availability)", () => {
  const card = { A: "N" };
  assert.equal(resolveTapOutcome(card, "N", {}).outcome, "unavailable");
  assert.equal(resolveTapOutcome(card, "N", undefined).outcome, "unavailable");
});
