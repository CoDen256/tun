## Context

`C30011` and `C30012` are `pronunciation`-type notes currently minted as
Lexic cards. Tracing why (git history of `deckAssignment.js` +
`hub/src/deckConsolidationMigration.js`): `deck-consolidation`'s migration
derives a card's new family from the **old deck code it was minted under**,
not its note's current `type` — stated explicitly in that migration's own
comment: "the note may have changed since the card was originally minted,
and the old deck code is itself the permanent, authoritative record of what
it was minted as." These two notes were minted before that migration, under
whatever deck assignment applied at the time, landed under a code the
migration mapped to `lexic`, and were reclassified to `pronunciation`
afterward. That design choice is correct in general (it stops a note's
*future* reclassification from silently rewriting a card's *historical*
family) — this change is a one-time correction for these two specific cards,
not a reversal of that policy.

The operation looked like a simple metadata edit (`UPDATE card_slots SET
deck_code = 'C20' WHERE id IN (...)`) until reading `builder/src/replay.js`:
every publish re-derives each deck's `Cards[]` by joining
`occurrence_shipments.card_id` to **`card_slots`'s current `deck_code`**,
not whatever deck it shipped under originally. So any correction to
`deck_code` for an already-shipped card changes which deck's `Cards[]` it
appears in on the *next* publish — for the source deck, that means an
occurrence disappears from the middle of its array, shifting every later
occurrence's position by one. `docs/findings.md` §C4 documents why that's
dangerous: `PullCounter` is a block index into `Cards[]`
(`deck.Cards.slice(5*PullCounter, +5)`), synced in each device's own
`userdata`; a position shift silently skips or duplicates cards for any
device that has already pulled past the shifted point.

Checked directly against the current `userdata` dump: `C30` never appears in
either seeded device's `decksStatus`, and no `C30`-prefixed id appears in
either device's `totalCards`. Concretely: no device has pulled `C30` at all,
so no `PullCounter` is currently indexed into it, so removing 2 occurrences
from its middle today shifts nothing for anyone. `C20`, conversely, already
has 3 graduated, studied cards on a real device — which is exactly why this
move only touches `C30` (the source) and only *appends* to `C20` (the
destination, where append is always safe per §C4 — "Appending to Cards[] is
safe").

## Goals / Non-Goals

**Goals:**
- Move `C30011`/`C30012` to `C20` as `C20005`/`C20006`, repointing every
  referencing row, with zero shift to any real device's existing pull
  position.
- Make the safety precondition an enforced, automated check in the tool
  itself — not a one-time manual dump inspection (what this review did) —
  so the same tool is safe to reach for again without re-deriving this
  analysis from scratch.
- Leave `deck-consolidation`'s general policy (derive family from mint-time
  deck code) completely unchanged.

**Non-Goals:**
- Not a general "edit any card's deck assignment" admin feature — scoped
  specifically to moving a card whose source deck has zero real pull
  history, by construction unsafe to use otherwise, and the tool SHALL
  refuse to run outside that condition.
- Not a fix for `C20`'s underlying content thinness — after this move, C20
  has 6 occurrences (still not a multiple of 5); it still waits on
  `occurrence-shipment-windowing`'s existing, correct, self-healing
  mechanism for the next flush, same as before.
- Does not address preventing a note's `type` from being edited post-mint —
  operator decision: not pursuing that guard. A recurrence of this class of
  drift would be corrected the same way, using this change's own tool.

## Decisions

**The precondition check queries live `userdata`, not a hardcoded
"we checked once" assumption.** For the move's source deck, the tool SHALL
query every `userdata` row for either (a) a `decksStatus` entry whose
`PullCounter > 0` for that deck's numeric `ID`, or (b) any card id with that
deck's code prefix present in `totalCards`. If either is true for any
device, the tool refuses to run. This reuses the exact join
`hub/src/userdata.js`'s `perCardProgress` already does (`totalCards[].ID` →
`card_slots.deck_code`) rather than inventing a second way to answer "has
anyone studied this deck."
- *Alternative considered*: a manual runbook step ("check the dump before
  running"), matching what this review actually did. Rejected — a step a
  human can forget is exactly the kind of guard that should be code, given
  how silently catastrophic getting this wrong is (§C4).

**Reuse `deckConsolidationMigration.js`'s repoint-every-table pattern
directly, as a named, narrower function, not a copy-paste.** Both operations
are "move a `card_slots` row to a new id under a new deck, repoint
`card_content`/`minted_notes`/`pending_occurrences`/`staged_occurrences`/
`occurrence_shipments`, in one transaction." The existing migration's inner
per-row loop (insert new, repoint referencing tables, delete old) is
extracted into a shared helper both call, rather than duplicated.
- *Alternative considered*: a bespoke one-off script, thrown away after use.
  Rejected given `card-deck-reassignment` is proposed as a capability
  precisely because this situation is plausible to recur (any note
  reclassified between being captured and being minted produces the same
  mismatch) — worth keeping as a real, tested tool.

**New ids are assigned via the existing `card_no` allocation
(`MAX(card_no)+1` for the destination deck), not by preserving any part of
the old id.** `C20`'s current max `card_no` is 4, so the two moved cards
become `C20005`/`C20006` — ordinary next-available ids, exactly as if they
had been minted fresh into `C20` today. No special "ported" id scheme.

## Risks / Trade-offs

**[Risk] The precondition check only sees devices that have synced to
hub's `userdata` table at least once — a device that pulled `C30` but
never synced would be invisible to this check.** → Mitigation: this is the
same blind spot `userdata-console`'s own read-only reporting already has
(local state is the working copy, Firestore/hub's copy is backup,
`docs/findings.md` §C8); no new exposure introduced. Given the overall
install base here is small and recent, and the specific finding (zero
`decksStatus` entries for `C30` across every synced device) is a strong
signal, this is an accepted residual risk, not one this change can close
completely from the server side alone.

**[Risk] Running this after the safety window closes (some device does
pull `C30` before the fix ships) would make the precondition check
correctly refuse — but an operator could be tempted to bypass it.** →
Mitigation: the tool has no bypass flag. If the precondition fails, the
correct resolution is to leave the two cards in `C30` permanently (matching
`deck-consolidation`'s own stated philosophy that a card's mint-time family
is the permanent record) and only fix the operator-facing explanation (the
`builder-card-flow-ui` change's per-deck detail banner), not the data.

**[Risk] `C20` reaching 6 occurrences (still not a multiple of 5) might
read as "the fix didn't work."** → Mitigation: this is expected and
correctly described as such in the card-flow UI — the fix corrects
*attribution*, not *volume*; `occurrence-shipment-windowing`'s existing
mechanism still governs when `C20` actually flushes its next batch.
