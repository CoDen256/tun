// card-preview-popup task group 5 ("The Cards page") — pure logic.
//
// Same pattern as hub/src/cardPreviewEngine.js and hub/src/cardRenderer.js:
// zero imports, no DOM/BOM reference, so this exact file can be `import`ed
// by Node (this package's tests, and any server-side use) AND served
// byte-for-byte at /mjolnir/cards/cards-engine.js for the browser to load
// as a `<script type="module">` — one source of the filter/sort/
// pagination/occurrence-cell rules, never a server copy and a hand-kept-
// in-sync client copy.
//
// What this file deliberately does NOT do: build occurrence-cell HOVER
// TEXT. That is `occurrenceTip`/`occurrenceSummaryText` in
// hub/src/cardPreviewEngine.js, computed once server-side per occurrence
// and carried on the row's own data (`occurrence.tip`) — this file only
// decides which CSS state class a slot gets and which letter occupies
// which of the three fixed positions (design.md §5 / acceptance C31/C32).
// Reusing the popup's tip builder a second time here (via import) would
// make this file resolve differently for Node (a real relative path to
// cardPreviewEngine.js) than for the browser (the route alias
// /mjolnir/cards/popup-engine.js) — carrying the already-computed tip on
// the data avoids that split entirely.

// --------------------------------------------------------------------------
// Occurrence cell (design.md §5 "Occurrence cell" table; acceptance C31/C32)
// --------------------------------------------------------------------------

export const OCCURRENCE_LETTERS = ["N", "E", "A"];

// `card.occurrences` is an array of { letter, status, buildId?, flushing?,
// remaining?, tip? } exactly like cardPreviewEngine.js's contract. `source`
// is "minted" or a build id string ("b000123") — in Bundle mode every
// present letter is rendered in "shipped" style regardless of its `status`
// (design §5: "In Bundle mode every present cell is 'shipped'"), since a
// bundle has no staged/pending concept at all.
export function occurrenceCellState(letter, occurrences, source) {
  const list = occurrences || [];
  const found = list.find((o) => o && o.letter === letter);
  if (!found) return { letter, present: false, cls: "flow-u absent", tip: `${letter} · no occurrence` };
  if (source !== "minted") return { letter, present: true, cls: "flow-u shipped", tip: found.tip || `${letter} · shipped` };
  if (found.status === "staged") {
    return {
      letter,
      present: true,
      cls: found.flushing ? "flow-u staged flush" : "flow-u staged held",
      tip: found.tip || `${letter} · staged`,
    };
  }
  if (found.status === "pending") return { letter, present: true, cls: "flow-u pending", tip: found.tip || `${letter} · pending` };
  // "shipped" and anything else fall back to the shipped look — a stock
  // card's occurrence (no buildId tracked) still means "this letter is
  // real," which is what the fill communicates.
  return { letter, present: true, cls: "flow-u shipped", tip: found.tip || `${letter} · shipped` };
}

// Always N · E · A, in that order, so every row's cell has identical width
// (acceptance C31) regardless of which letters the card actually has.
export function occurrenceSlots(occurrences, source) {
  return OCCURRENCE_LETTERS.map((letter) => occurrenceCellState(letter, occurrences, source));
}

// --------------------------------------------------------------------------
// Source-dependent control visibility (design.md §5 "Filters"; C34)
// --------------------------------------------------------------------------

export const OCC_STATE_OPTIONS_MINTED = [
  ["any", "any"],
  ["none", "none"],
  ["shipped", "shipped"],
  ["staged", "staged"],
  ["pending", "pending"],
  ["notshipped", "not shipped"],
];
export const OCC_STATE_OPTIONS_BUNDLE = [
  ["any", "any"],
  ["present", "present"],
  ["absent", "absent"],
];

export const MINTED_ONLY_SORT_KEYS = ["minted", "shipped", "pending"];
export const SEARCH_SCOPES = [
  ["all", "all text"],
  ["N", "N"],
  ["E", "E"],
  ["X", "X"],
  ["id", "card id"],
  ["note", "note id"],
  ["raw", "raw HTML"],
];

export function isMintedSource(source) {
  return source === "minted" || !source;
}

// What task 5.5 calls "hidden or disabled, never shown broken": every
// Minted-only control this page offers, resolved once from the source so
// both the initial server render and the client's re-sync after a source
// change agree on the same list.
export function controlVisibility(source) {
  const minted = isMintedSource(source);
  return {
    minted,
    occStateOptions: minted ? OCC_STATE_OPTIONS_MINTED : OCC_STATE_OPTIONS_BUNDLE,
    noteScopeEnabled: minted,
    hasGrammarRuleToggleVisible: minted,
    audioMissingToggleVisible: minted,
    legendVisible: minted,
    sortOptionsDisabled: minted ? [] : MINTED_ONLY_SORT_KEYS,
  };
}

// --------------------------------------------------------------------------
// Filtering (design.md §5 "Filters"; acceptance C35)
// --------------------------------------------------------------------------

export const DEFAULT_FILTERS = {
  search: "",
  scope: "all",
  decks: [],
  occ: { N: "any", E: "any", A: "any" },
  xEmpty: false,
  ipa: false,
  rule: false,
  missing: false,
  cls: "",
};

export const DEFAULT_SORT = { key: "id", desc: false };
export const DEFAULT_PAGE_SIZE = 25;

// `row` carries: id, deckCode, pN, pE, pX (stripped text), rawHtml, noteId,
// occurrences, classes (array), hasAudioExpected/audioAvailable, grammarRuleId.
export function matchesFilters(row, filters, source) {
  const f = { ...DEFAULT_FILTERS, ...filters, occ: { ...DEFAULT_FILTERS.occ, ...((filters && filters.occ) || {}) } };
  const minted = isMintedSource(source);

  if (f.search) {
    const q = f.search.toLowerCase();
    const hay =
      {
        all: `${row.pN || ""} ${row.pE || ""} ${row.pX || ""}`,
        N: row.pN || "",
        E: row.pE || "",
        X: row.pX || "",
        id: row.id || "",
        note: row.noteId || "",
        raw: row.rawHtml || "",
      }[f.scope] || "";
    if (!hay.toLowerCase().includes(q)) return false;
  }

  if (f.decks && f.decks.length && !f.decks.includes(row.deckCode)) return false;

  for (const letter of OCCURRENCE_LETTERS) {
    const want = f.occ[letter] || "any";
    if (want === "any") continue;
    const has = (row.occurrences || []).some((o) => o && o.letter === letter);
    if (want === "none" || want === "absent") {
      if (has) return false;
      continue;
    }
    if (!has) return false;
    if (want === "present") continue;
    const occ = (row.occurrences || []).find((o) => o && o.letter === letter);
    if (minted) {
      if (want === "notshipped") {
        if (occ.status === "shipped") return false;
      } else if (occ.status !== want) {
        return false;
      }
    }
  }

  if (minted && f.missing && !row.audioMissing) return false;
  if (f.xEmpty && (row.pX || "").trim()) return false;
  if (f.ipa && !(row.classes || []).some((c) => c === "arialFont" || c === "arialFontNormal")) return false;
  if (f.cls && !(row.classes || []).includes(f.cls)) return false;
  if (minted && f.rule && !row.grammarRuleId) return false;
  return true;
}

// --------------------------------------------------------------------------
// Sorting (design.md §5 "Sort"; acceptance C36 — empty values always last)
// --------------------------------------------------------------------------

export const SORT_KEYS = [
  ["id", "card id"],
  ["deck", "deck"],
  ["minted", "minted"],
  ["shipped", "last shipped"],
  ["pending", "pending remaining"],
  ["front", "front text A–Z"],
];

function sortValue(row, key) {
  switch (key) {
    case "deck":
      return row.deckCode ? `${row.deckCode} ${row.id}` : null;
    case "minted":
      return row.mintedAt != null ? row.mintedAt : null;
    case "shipped":
      return row.lastShippedAt != null ? row.lastShippedAt : null;
    case "pending":
      return row.pendingMin != null ? row.pendingMin : null;
    case "front":
      return (row.pN || "").toLowerCase() || null;
    default:
      return row.id || null;
  }
}

// A stable comparator: empty values ALWAYS sort last, in both asc and desc
// (acceptance C36), ties broken by card id so repeated sorts are stable.
export function compareRows(a, b, key, desc) {
  const av = sortValue(a, key);
  const bv = sortValue(b, key);
  if (av == null && bv == null) return a.id < b.id ? -1 : a.id > b.id ? 1 : 0;
  if (av == null) return 1;
  if (bv == null) return -1;
  let c;
  if (av < bv) c = -1;
  else if (av > bv) c = 1;
  else c = a.id < b.id ? -1 : a.id > b.id ? 1 : 0;
  return desc ? -c : c;
}

export function sortRows(rows, key, desc) {
  return [...rows].sort((a, b) => compareRows(a, b, key, desc));
}

// --------------------------------------------------------------------------
// Pagination (design.md §5 "Pagination"; acceptance C36)
// --------------------------------------------------------------------------

export const PAGE_SIZES = [25, 50, 100];

export function totalPages(count, pageSize) {
  return Math.max(1, Math.ceil(count / (pageSize || DEFAULT_PAGE_SIZE)));
}

export function clampPage(page, pages) {
  return Math.min(Math.max(1, page || 1), pages);
}

export function paginate(rows, page, pageSize) {
  const size = pageSize || DEFAULT_PAGE_SIZE;
  const pages = totalPages(rows.length, size);
  const clamped = clampPage(page, pages);
  const start = (clamped - 1) * size;
  return {
    page: clamped,
    pages,
    pageRows: rows.slice(start, start + size),
    start,
    end: Math.min(rows.length, start + size),
    total: rows.length,
  };
}

// Numbered pages with an ellipsis for >5 pages: always first, last, and the
// current page's immediate neighbours (design.md §5 / acceptance C36).
export function pageNumbers(current, pages) {
  const want = new Set([1, pages, current - 1, current, current + 1].filter((x) => x >= 1 && x <= pages));
  const list = [...want].sort((a, b) => a - b);
  const out = [];
  let prev = 0;
  for (const n of list) {
    if (n - prev > 1) out.push({ gap: true });
    out.push({ page: n, current: n === current });
    prev = n;
  }
  return out;
}

export function showingLabel(start, end, total) {
  if (total === 0) return "Showing 0 of 0";
  return `Showing ${start + 1}–${end} of ${total}`;
}

// --------------------------------------------------------------------------
// Saved views (design.md §5 "Saved views"; acceptance C36)
// --------------------------------------------------------------------------

export const SAVED_VIEWS = {
  "pending-e": {
    label: "Pending E sides",
    apply: (view) => ({
      ...view,
      filters: { ...DEFAULT_FILTERS, occ: { ...DEFAULT_FILTERS.occ, E: "pending" } },
      sort: { key: "pending", desc: false },
      page: 1,
    }),
  },
  ipa: {
    label: "Uses IPA",
    apply: (view) => ({
      ...view,
      filters: { ...DEFAULT_FILTERS, ipa: true },
      sort: { key: "id", desc: false },
      page: 1,
    }),
  },
};

export function defaultView(source) {
  return { source: source || "minted", filters: { ...DEFAULT_FILTERS }, sort: { ...DEFAULT_SORT }, pageSize: DEFAULT_PAGE_SIZE, page: 1 };
}

// --------------------------------------------------------------------------
// Active-filter chips (design.md §5 "removable label x"; acceptance C35)
// --------------------------------------------------------------------------

export function activeFilterChips(filters, source) {
  const f = { ...DEFAULT_FILTERS, ...filters, occ: { ...DEFAULT_FILTERS.occ, ...((filters && filters.occ) || {}) } };
  const minted = isMintedSource(source);
  const opts = minted ? OCC_STATE_OPTIONS_MINTED : OCC_STATE_OPTIONS_BUNDLE;
  const chips = [];
  if (f.search) {
    const scopeLabel = (SEARCH_SCOPES.find((s) => s[0] === f.scope) || [, f.scope])[1];
    chips.push({ key: "search", label: `"${f.search}" in ${scopeLabel}` });
  }
  for (const deck of f.decks || []) chips.push({ key: `deck:${deck}`, label: `deck ${deck}` });
  for (const letter of OCCURRENCE_LETTERS) {
    const v = f.occ[letter];
    if (v && v !== "any") {
      const o = opts.find((x) => x[0] === v);
      chips.push({ key: `occ:${letter}`, label: `${letter} ${o ? o[1] : v}` });
    }
  }
  if (minted && f.missing) chips.push({ key: "missing", label: "audio clip missing" });
  if (f.xEmpty) chips.push({ key: "xEmpty", label: "X empty" });
  if (f.ipa) chips.push({ key: "ipa", label: "has IPA" });
  if (f.cls) chips.push({ key: "cls", label: `.${f.cls}` });
  if (minted && f.rule) chips.push({ key: "rule", label: "has grammar rule" });
  return chips;
}
