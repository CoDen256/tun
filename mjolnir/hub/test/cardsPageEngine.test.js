// card-preview-popup task group 5 — pure-logic tests for
// hub/src/cardsPageEngine.js (filter predicate, sort comparator with
// empty-last behavior, pagination math, occurrence-cell state derivation,
// bundle-vs-minted control visibility). No database, no DOM — this is the
// exact file served verbatim at /mjolnir/cards/cards-engine.js.
import test from "node:test";
import assert from "node:assert/strict";
import {
  occurrenceSlots,
  occurrenceCellState,
  controlVisibility,
  matchesFilters,
  sortRows,
  compareRows,
  paginate,
  pageNumbers,
  showingLabel,
  activeFilterChips,
  DEFAULT_FILTERS,
  SAVED_VIEWS,
  defaultView,
} from "../src/cardsPageEngine.js";

function row(overrides) {
  return {
    id: "A01001",
    deckCode: "A01",
    deckTitle: "Everyday life",
    pN: "God morgen",
    pE: "Good morning",
    pX: "",
    rawHtml: "<div>God morgen</div>",
    noteId: "note-1",
    grammarRuleId: null,
    occurrences: [],
    classes: [],
    audioMissing: false,
    mintedAt: null,
    lastShippedAt: null,
    pendingMin: null,
    ...overrides,
  };
}

test("occurrenceSlots: always N·E·A in that order, identical shape regardless of which letters are present", () => {
  const full = occurrenceSlots([{ letter: "N", status: "shipped" }, { letter: "E", status: "pending", remaining: 3 }, { letter: "A", status: "staged", flushing: true }], "minted");
  assert.deepEqual(full.map((s) => s.letter), ["N", "E", "A"]);
  assert.equal(full[0].cls, "flow-u shipped");
  assert.equal(full[1].cls, "flow-u pending");
  assert.equal(full[2].cls, "flow-u staged flush");

  const onlyEA = occurrenceSlots([{ letter: "E", status: "shipped" }, { letter: "A", status: "staged", flushing: false }], "minted");
  assert.deepEqual(onlyEA.map((s) => s.present), [false, true, true]);
  assert.equal(onlyEA[0].cls, "flow-u absent");
  assert.equal(onlyEA[2].cls, "flow-u staged held");

  const onlyN = occurrenceSlots([{ letter: "N", status: "shipped" }], "minted");
  assert.deepEqual(onlyN.map((s) => s.present), [true, false, false]);
  // Same three slots every time — acceptance C31's "identical cell widths".
  assert.equal(full.length, onlyEA.length);
  assert.equal(onlyEA.length, onlyN.length);
});

test("occurrenceCellState: absent carries its own hover text and class, never a letter glyph decision", () => {
  const absent = occurrenceCellState("E", [], "minted");
  assert.equal(absent.present, false);
  assert.equal(absent.cls, "flow-u absent");
  assert.equal(absent.tip, "E · no occurrence");
});

test("occurrenceCellState: Bundle mode renders every present letter as shipped, regardless of its own status", () => {
  const s = occurrenceCellState("N", [{ letter: "N", status: "pending", remaining: 4 }], "b000042");
  assert.equal(s.cls, "flow-u shipped");
});

test("controlVisibility: Minted exposes every control; Bundle hides/disables the minted-only ones, never half-renders them", () => {
  const minted = controlVisibility("minted");
  assert.equal(minted.minted, true);
  assert.equal(minted.noteScopeEnabled, true);
  assert.equal(minted.legendVisible, true);
  assert.deepEqual(minted.sortOptionsDisabled, []);

  const bundle = controlVisibility("b000042");
  assert.equal(bundle.minted, false);
  assert.equal(bundle.noteScopeEnabled, false);
  assert.equal(bundle.hasGrammarRuleToggleVisible, false);
  assert.equal(bundle.audioMissingToggleVisible, false);
  assert.equal(bundle.legendVisible, false);
  assert.ok(bundle.sortOptionsDisabled.includes("minted"));
  assert.ok(bundle.sortOptionsDisabled.includes("shipped"));
  assert.ok(bundle.sortOptionsDisabled.includes("pending"));
  assert.deepEqual(bundle.occStateOptions.map((o) => o[0]), ["any", "present", "absent"]);
});

test("matchesFilters: search scope, deck filter, occurrence state, and the Minted-only toggles", () => {
  const r = row({ occurrences: [{ letter: "E", status: "pending", remaining: 7 }] });

  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, search: "morgen", scope: "N" }, "minted"), true);
  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, search: "zzz", scope: "N" }, "minted"), false);

  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, decks: ["B01"] }, "minted"), false);
  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, decks: ["A01"] }, "minted"), true);

  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, occ: { ...DEFAULT_FILTERS.occ, E: "pending" } }, "minted"), true);
  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, occ: { ...DEFAULT_FILTERS.occ, E: "shipped" } }, "minted"), false);
  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, occ: { ...DEFAULT_FILTERS.occ, N: "none" } }, "minted"), true);

  // Minted-only toggles have no effect at all in Bundle mode.
  const bundleRow = row({ grammarRuleId: null, occurrences: [{ letter: "N", status: "shipped" }] });
  assert.equal(matchesFilters(bundleRow, { ...DEFAULT_FILTERS, rule: true }, "b000042"), true);
  assert.equal(matchesFilters(row({ grammarRuleId: null }), { ...DEFAULT_FILTERS, rule: true }, "minted"), false);
});

test("matchesFilters: raw-HTML search scope and uses-class filter", () => {
  const r = row({ rawHtml: '<div class="royalRed">farger</div>', classes: ["royalRed"] });
  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, search: "royalRed", scope: "raw" }, "minted"), true);
  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, cls: "royalRed" }, "minted"), true);
  assert.equal(matchesFilters(r, { ...DEFAULT_FILTERS, cls: "arialFont" }, "minted"), false);
});

test("compareRows: sorting by front text A-Z, and empty values always sort last in BOTH directions", () => {
  const rows = [row({ id: "C", pN: "Charlie" }), row({ id: "A", pN: "alpha" }), row({ id: "B", pN: "" })];
  const asc = sortRows(rows, "front", false).map((r) => r.id);
  assert.deepEqual(asc, ["A", "C", "B"]); // B has no front text -> last, even ascending
  const desc = sortRows(rows, "front", true).map((r) => r.id);
  assert.deepEqual(desc, ["C", "A", "B"]); // still last when reversed
});

test("compareRows: pending-remaining and minted-date sorts, empty last", () => {
  const rows = [row({ id: "X", pendingMin: null }), row({ id: "Y", pendingMin: 3 }), row({ id: "Z", pendingMin: 1 })];
  assert.deepEqual(sortRows(rows, "pending", false).map((r) => r.id), ["Z", "Y", "X"]);
  assert.deepEqual(sortRows(rows, "pending", true).map((r) => r.id), ["Y", "Z", "X"]);
  assert.equal(compareRows(row({ id: "A", mintedAt: null }), row({ id: "B", mintedAt: null }), "minted", false), -1);
});

test("paginate: page math, clamping, and the Showing label", () => {
  const rows = Array.from({ length: 137 }, (_, i) => row({ id: String(i) }));
  const page1 = paginate(rows, 1, 50);
  assert.equal(page1.pageRows.length, 50);
  assert.equal(page1.pages, 3);
  assert.equal(showingLabel(page1.start, page1.end, page1.total), "Showing 1–50 of 137");

  const page2 = paginate(rows, 2, 50);
  assert.equal(showingLabel(page2.start, page2.end, page2.total), "Showing 51–100 of 137");

  const clamped = paginate(rows, 99, 50); // way past the end
  assert.equal(clamped.page, 3);

  const empty = paginate([], 1, 25);
  assert.equal(showingLabel(empty.start, empty.end, empty.total), "Showing 0 of 0");
});

test("pageNumbers: ellipsis only kicks in past 5 pages", () => {
  assert.deepEqual(pageNumbers(1, 3).map((n) => (n.gap ? "…" : n.page)), [1, 2, 3]);
  const withGap = pageNumbers(5, 10);
  assert.ok(withGap.some((n) => n.gap));
  assert.deepEqual(withGap.filter((n) => !n.gap).map((n) => n.page), [1, 4, 5, 6, 10]);
});

test("activeFilterChips + Clear all semantics: every active filter renders one removable chip", () => {
  const filters = { ...DEFAULT_FILTERS, search: "hei", decks: ["A01"], occ: { ...DEFAULT_FILTERS.occ, E: "pending" }, ipa: true };
  const chips = activeFilterChips(filters, "minted");
  assert.ok(chips.some((c) => c.key === "search"));
  assert.ok(chips.some((c) => c.key === "deck:A01"));
  assert.ok(chips.some((c) => c.key === "occ:E"));
  assert.ok(chips.some((c) => c.key === "ipa"));
  assert.equal(activeFilterChips(DEFAULT_FILTERS, "minted").length, 0);
});

test("saved views: Pending E sides and Uses IPA set exactly the documented filter/sort", () => {
  const base = defaultView("minted");
  const pendingE = SAVED_VIEWS["pending-e"].apply(base);
  assert.equal(pendingE.filters.occ.E, "pending");
  assert.equal(pendingE.sort.key, "pending");
  assert.equal(pendingE.sort.desc, false);

  const ipa = SAVED_VIEWS.ipa.apply(base);
  assert.equal(ipa.filters.ipa, true);
});
