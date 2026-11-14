## Context

Everything this design needs is already decided and recorded — this section
exists to collect it in one place for whoever implements, not to re-derive
it. Read these before writing code, in this order:

1. `tun/docs/03-data-model.md` — the note/card split, the five note types and
   their projection table, the deck allocation table, the lag-11 interleave
   math, the permanence rules. This is the spec of record for *what* a card
   looks like and *where* it goes.
2. `tun/docs/07-decisions.md`, D74–D80 — why stabbur knows nothing about
   decks, why `hub` owns three separately-tracked version fields, why the
   publish trigger is a clock plus a button, why `inject-deck` stays small,
   why both `builder` and `hub` get an operator UI and what each one shows.
3. `mjolnir/builder/README.md` and `mjolnir/hub/README.md` — already rewritten
   to match D74–D80; read them as the short version of this design.
4. `mjolnir/docs/findings.md` §1, C3–C7 — the deck/card shapes as they
   actually exist in the shipped bundle, and the hard constraints
   (6-character ids, `PullCounter` as a block index, contiguous category
   blocks) that make reordering or renumbering catastrophic.
5. **`src/deckData.js`, read in full before writing `inject-deck`.** This is
   the single most important thing to internalize before starting: a
   complete, tested, working implementation of locating the deck/card modules
   by shape, adding occurrences, regenerating module source, and
   byte-exact-reassembling the bundle already exists — built for the
   bundle-workbench GUI editor (`openspec/specs/deck-card-data-model`,
   `deck-card-save`). **Do not re-derive this. Import it.**

## Goals / Non-Goals

**Goals:**
- A `builder` worker that turns ready, audio'd stabbur notes into published
  Mjølnir bundles, automatically, on a schedule, respecting every permanence
  rule in `03-data-model.md`.
- A shared publish module so there is exactly one implementation of "is this
  buildId reuse safe" — not one in bash and a second one reimplemented in
  Node.
- Enough `hub` schema to support `builder` and show a publish history.
  Nothing more — sync, device heartbeat, and `/mjolnir/userdata` are P5.
- Two small, honest operator UIs: a forecast you can trust before anything is
  minted, and a history of what's already true.

**Non-Goals:**
- Re-deriving the data model, the deck table, or the interleave math — all
  settled, cited above.
- The mod 1440 audio resolver patch. Audio is mandatory for every card
  (D74), but shipping the JS patch that makes custom audio *playable* is
  independent work, not part of this change.
- `/mjolnir/userdata` sync, device heartbeat, Firestore-shim work — P5.
- Building `stabbur`'s notes API — tracked in the parallel `p4-notes` change
  in the `stabbur` repo. This change should be built against a fixture of
  that API's response shape so the two can proceed without blocking each
  other, and wired together once both exist.

## Decisions

### D-P1 — `inject-deck` is a layer on `deckData.js`, not a new tool

`deckData.js` already solves module location (`locateDeckCardModules`, by
shape — survives renumbering), safe reassembly (`regenerateModuleSource`,
`saveDeckCardModel`, byte-exact except the two touched modules), and
single-occurrence append (`addOccurrence`, which already hardcodes `P:"N"` —
matching the P22 pitfall's fix exactly). `inject-deck` adds three things,
each independently small:

```
createCard(cards, { id, deckId, type, N, E, X, A })
  — id comes from hub's card_slots ledger (the caller), never generated
    here. Unlike nextCardId, this function does not scan the bundle.

interleaveOccurrences(deck, newCardIds, occurrenceSetFor)
  — computes an ORDER of (cardId, letter) pairs achieving lag >= 11 across
    the whole new block, then calls the existing addOccurrence() once per
    pair, in that order. Does not touch addOccurrence's internals.

upsertCardContent(cards, id, { N, E, X, A })
  — finds the existing card object by id, overwrites only its content
    fields. Never touches DECK_ID, never moves its position, never
    touches Cards[].
```

All three are plain functions over the same in-memory `{decks, cards}` shape
`loadDeckCardModel` already returns. `builder` calls `loadDeckCardModel`,
mutates via these three functions plus the existing `nextDeckId`/
`NEW_DECK_DEFAULTS` (for the one-time creation of C20–C29), then calls
`saveDeckCardModel` — the exact same save path the GUI editor already uses
and already has tests for.

**Alternative considered:** a from-scratch tool reusing only `patchback`'s
shape-matching idea, as sketched in D79. Rejected once `deckData.js` turned
out to already implement that idea completely, tested, with a working save
path. Building a second implementation of "locate by shape and reassemble"
would be pure duplication.

### D-P2 — the shared publish module lives in `tool/`, not in `hub`

`builder` is Node (D76) specifically so it can import this in-process. A
Python module in `hub` would force either a subprocess or an HTTP round trip
for every publish — paid on every single run, for no benefit, since `builder`
and the publish logic can share a process.

```
tool/src/otaPublish.js
  exports: validateBuildId(id), checkReuse(existingPath, newBytes),
           checkMagicPrefix(bytes), publish(bundlePath, buildId, label, opts)

bin/bundle-tool.js ota-publish <bundle> <buildId> [label]
  — thin CLI wrapper, replaces ota-publish.sh's logic (not its existence —
    see D-P4 on what becomes of the script itself)

builder/src/publish.js
  import { publish } from '../../tool/src/otaPublish.js'
  — in-process, no subprocess, no HTTP
```

### D-P3 — `hub`'s schema, scoped to exactly what P4 needs

```sql
card_slots(deck_code, card_no, note_id, retired_bool)
decks(code, title, category, max_interval, auto_tick_streak,
      auto_hammer_count, enabled)
publications(build_id, base_version, patch_rev, data_rev, bundle_sha,
             created_at)
build_jobs(id, status, requested_at, started_at, finished_at, error)
minted_notes(note_id, card_slot_id, minted_at)  -- hub's own ledger (D44)
```

`base_version`/`patch_rev` are written by the operator and simply copied
forward by `builder` on every publish unless explicitly overridden; `builder`
always sets `data_rev = previous_data_rev + 1` on a run that actually
publishes (D77). No `/mjolnir/userdata`, no `device_state`, no
`userdata_history` — those belong to the sync change (P5), not this one.

### D-P4 — what happens to `ota-publish.sh` itself

It becomes a thin wrapper that shells out to
`node bin/bundle-tool.js ota-publish "$@"` — kept as a script because the
operator already has muscle memory for typing it directly on the VPS, and
because a one-line wrapper costs nothing to keep. `ota-verify.sh` is
unaffected (it only exercises the HTTP surface, never the publish guards).

### D-P5 — the forecast is a true dry run, not a second code path

`builder`'s "what would publish if I ran this now" view calls the *same*
pull → eligibility-filter → deck-assignment → floor-check functions the real
run uses, stopping before `createCard`/`interleaveOccurrences` ever mutate
anything. One implementation of "which notes are eligible and where do they
go," two call sites (dry run for the UI, real run for the schedule/button).

**Alternative considered:** a separate, simpler "count ready notes per deck"
query for the forecast. Rejected — it would drift from the real eligibility
logic (the `pos`-not-in-table → C26 fallthrough, the audio-required filter)
the first time either changes, and the whole point of the forecast is that it
can be trusted.

## Risks / Trade-offs

- **`deckData.js` was built for a human clicking buttons one at a time, not
  an automated batch process.** → Read it fully before extending it
  (Context §5). If `saveDeckCardModel`'s backup-file convention or
  `runExplode` re-manifest step turns out to assume a single interactive
  session, that's a real integration gap to resolve explicitly, not paper
  over — flag it here with an ADR amendment if found, per the project's
  established practice (`tun/docs/07-decisions.md` D65/D71/D72 are all
  exactly this pattern).
- **`builder` publishing against a note set that changes mid-run** (operator
  edits a note while `builder` is assembling). → `builder` should snapshot
  the note set it pulled at the start of a run and work from that snapshot
  only; a mid-run edit simply waits for the next run, same as a
  below-threshold deck does.
- **The forecast silently drifting from real publish behavior** → covered by
  D-P5's single-implementation design; still worth an explicit test that
  asserts forecast output and a subsequent real run agree on which notes
  would be minted.
- **`inject-deck` upserting the wrong card** if an id collision ever occurred
  → card ids are globally unique and permanent by construction (`card_slots`
  is the only minter); `upsertCardContent` should still assert exactly one
  match and fail loudly on zero or multiple, rather than silently taking the
  first.

## Migration Plan

No migration in the rollback sense — this is new schema and a new service,
nothing existing changes shape. Sequencing that matters:

1. `tool/`'s publish module + CLI wrapper first (D-P2) — everything else can
   be tested against it in isolation.
2. `inject-deck` on top of `deckData.js` (D-P1) — testable standalone against
   fixture bundles, no `hub`/`builder` dependency yet.
3. `hub` schema + migrations (D-P3) — can be stood up and tested with
   hand-inserted rows before `builder` exists.
4. `builder`'s pipeline, wired to a **fixture** of stabbur's notes API first
   (per the proposal's Non-Goals) — do not block on `p4-notes` landing.
5. Both operator UIs last — they're thin reads over what's already correct
   underneath by this point.
6. Wire `builder` to the real `stabbur` API once `p4-notes` ships; this is
   expected to be a small, late step if the fixture matched the real
   contract (`03-data-model.md`'s `note` schema).

## Open Questions

- Does `build_jobs` need more than one row in flight at a time, or is "one
  job running, the rest queued" sufficient for a single operator? Affects
  whether the worker needs any locking at all.
- Exact shape of the forecast UI's "how many more notes does this deck need"
  — a plain count is enough for the floor rule, but worth deciding before
  building it whether per-note detail (which specific notes are waiting) is
  wanted too.
