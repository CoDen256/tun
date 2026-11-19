// card-preview-popup task group 3 ("The card and the popup") — pure logic.
//
// This file holds every piece of task group 3 that is a plain function of
// data, not of the DOM: direction resolution (3.4), stepping across the
// card list (3.5), the occurrence-summary text the bar shows (design.md §4
// / acceptance C22), and the tap-to-play outcome (3.6). It is deliberately
// free of any DOM/BOM reference and of any import, for the same reason
// `cardRenderer.js` is (see that file's header): hub/src/cardPreviewPopup.js
// imports it with a normal ESM `import` for the server-rendered info line
// and for this package's tests, and the browser loads the EXACT SAME file
// as a `<script type="module">` via the read-only static route
// `hub/src/server.js` serves at `/mjolnir/cards/popup-engine.js` (mirrors
// `/mjolnir/cards/render-engine.js`, task 2's own route, byte for byte the
// same pattern). One source of the direction/stepping rules, not a server
// copy and a hand-kept-in-sync client copy.
//
// Contract every caller (the popup's own client script now; the Cards
// page, task group 5, later) must follow for the `card` shape these
// functions take:
//   { A: 'N' | 'E', occurrences: [{ letter: 'N'|'E'|'A', status, buildId?,
//     flushing?, remaining? }, ...] }
// `occurrences` MUST be in the order the card's occurrences actually
// happened (oldest first) — `defaultDirectionFor` reads only its first
// entry, per design.md §3's "the popup opens on the side of the card's
// first occurrence". `A` never appears as a direction; it is always
// resolved through the card's own `A` field to the `N` or `E` it names
// (design.md §3 / §4, acceptance C19).

// --------------------------------------------------------------------------
// 3.4 Direction resolution
// --------------------------------------------------------------------------

// `directionPreference` is the operator's saved default direction setting
// (task group 6 persists it; task group 3 only has to accept and apply
// whatever value it is handed): 'auto' (= "first occurrence"), 'N' or 'E'.
export function defaultDirectionFor(card, directionPreference) {
  if (directionPreference === "N" || directionPreference === "E") return directionPreference;
  const occurrences = (card && card.occurrences) || [];
  const first = occurrences.length && occurrences[0] && occurrences[0].letter ? occurrences[0].letter : "N";
  if (first === "A") {
    // A is a hidden N or E, never a third layout (design.md §3) — resolve
    // through the card's own A field.
    return card && card.A === "E" ? "E" : "N";
  }
  return first === "E" ? "E" : "N";
}

// Which letter sits on which of the card's three faces for a given
// direction. The device shows N on top for direction N, E on top for
// direction E; the OTHER letter always takes the middle; X is always the
// bottom face (design.md §3, acceptance C19).
export function directionSlots(direction) {
  const top = direction === "E" ? "E" : "N";
  const mid = top === "N" ? "E" : "N";
  return { top, mid, bottom: "X" };
}

export function hasAOccurrence(occurrences) {
  return !!(occurrences || []).some((o) => o && o.letter === "A");
}

// --------------------------------------------------------------------------
// 3.5 Stepping
// --------------------------------------------------------------------------

// Returns the next index, or null when there is nowhere to go (the caller
// uses null to disable the ←/→ control at either end of the list — design
// §4 / acceptance C18: "← on the first card and → on the last are
// disabled"). `length` is the full filtered+sorted list's length, which may
// span many pages — stepping crosses page boundaries by construction,
// since it is just array indexing, never a per-page slice.
export function stepIndex(currentIndex, delta, length) {
  if (!Number.isFinite(length) || length <= 0) return null;
  const next = currentIndex + delta;
  if (!Number.isInteger(next) || next < 0 || next >= length) return null;
  return next;
}

// 3.5: "←/→ ... must be ignored while the cursor is focused in an editor or
// text field". Task 4 adds the real editors; this is the one place that
// test, so task 4's editor markup only has to satisfy it (an INPUT/
// TEXTAREA/SELECT, or anything `contenteditable`, or inside a `.CodeMirror`
// instance) rather than re-deciding the rule.
export function isTypingTarget(target) {
  if (!target) return false;
  const tag = target.tagName;
  if (tag && /^(INPUT|TEXTAREA|SELECT)$/.test(tag)) return true;
  if (typeof target.closest === "function" && target.closest('[contenteditable="true"], .CodeMirror')) return true;
  return false;
}

// --------------------------------------------------------------------------
// Occurrence summary (design.md §4 / acceptance C22)
// --------------------------------------------------------------------------

// Exported (card-preview-popup task group 5) so the Cards page's
// occurrence-cell hover text — one slot at a time, N/E/A — is built by the
// SAME function as the popup bar's occurrence summary below, instead of a
// second hand-written copy that could drift from it (acceptance C22's
// "matching the row's hover text" made literal: there is only one text).
export function occurrenceTip(o) {
  if (!o || !o.letter) return "";
  if (o.status === "shipped") return `${o.letter} · shipped${o.buildId ? " in " + o.buildId : " (stock)"}`;
  if (o.status === "staged") return `${o.letter} · staged · ${o.flushing ? "flushes next run" : "held"}`;
  if (o.status === "pending") return `${o.letter} · pending${o.remaining != null ? " · " + o.remaining + " to go" : ""}`;
  return `${o.letter} · ${o.status || "no occurrence"}`;
}

// The SAME function the Cards page's occurrence-cell hover text (task
// group 5) must call, so the bar's summary and the table's hover text
// cannot drift apart (acceptance C22 "matching the row's hover text").
export function occurrenceSummaryText(occurrences) {
  const list = occurrences || [];
  if (!list.length) return "no occurrences";
  return list.map(occurrenceTip).filter(Boolean).join("  |  ");
}

// --------------------------------------------------------------------------
// 3.6 Audio
// --------------------------------------------------------------------------

// Whether `face` (one of 'N'|'E'|'X', i.e. whichever letter currently sits
// on that face per directionSlots) is the face carrying the card's audio.
export function isAudioFace(card, face) {
  return !!card && face === card.A;
}

// `flags` is whatever the caller (task group 5, eventually; a literal prop
// for now per task 3.6) resolved about this card's clip:
//   audioAvailable — true when the blob cache has the clip and it is safe
//                    to play right now.
//   hasAudio       — false when the card is EXPECTED to carry a clip (a
//                    minted card whose A face this is) but the blob is
//                    missing, vs. simply "not checked yet".
export function resolveTapOutcome(card, face, flags) {
  const f = flags || {};
  if (!isAudioFace(card, face)) return { outcome: "no-audio-on-face", message: "No audio on this face" };
  if (f.audioAvailable === true) return { outcome: "play", message: null };
  if (f.hasAudio === false) return { outcome: "unavailable", message: "Audio clip unavailable" };
  return { outcome: "unavailable", message: "Audio clip unavailable" };
}
