## Context

Read `tun/docs/07-decisions.md` D77, D91, D93, and `tun/docs/03-data-model.md`
("Content is regenerated fresh on every publish; positions are frozen
forever") before changing anything here — this design extends those rules,
it doesn't relax them. Read `builder/README.md`, `hub/README.md`, and
`tool/src/otaPublish.js` (`restampCompanionBuildId`, `checkCompanionMatch`,
`findBakedBuildId`) for the exact baked-constant mechanism this design
reuses. Read `patches/js/boot-ok-companion.js` and
`src/commands/companion.js` for how `BUILD_ID` is already substituted at
assembly time — `base_version`/`patch_rev` stamping is the same mechanism,
not a new one.

Today, `builder` holds one path (`BUNDLE_PATH`) to a single file that is
mutated in place forever: it is simultaneously "the base APK + applied
patches" and "every card ever injected." `hub`'s OTA console writes straight
to `data/ota/bundle/<id>.js` + `current.json` without touching that file.
Nothing links the two. A card's actual `N`/`E`/`X`/`A` content is never
stored in `hub`'s own database — only identity (`card_slots`) and shipment
timing (`occurrence_shipments`) are. The only reason a tombstoned note's card
still renders correctly today is that the mutable file never forgets.

No note has been minted into a real publish yet (operator-confirmed,
2026-10-27) — this ships as the actual first version of the model.

## Goals / Non-Goals

**Goals:**
- Separate "which base + patches" (operator-owned, changes rarely) from
  "which cards" (builder-owned, derived constantly) into two independently
  evolving, correctly-attributed stores.
- Make `builder`'s publish pipeline a pure, stateless projection: given the
  active logic bundle and `hub`'s own tables, the output bundle is always
  fully reproducible, with no dependency on a mutable file's history or on
  stabbur still holding a since-tombstoned note.
- Make `base_version`/`patch_rev` genuinely settable, derived from baked
  constants in the assembled bundle rather than silently copied forward
  forever (closing the gap: no code path to bump them exists today).
- Keep `data/ota/bundle/<buildId>.js` + `current.json` exactly as correct and
  immutable/append-only as they already are — this design only changes what
  feeds them.

**Non-Goals:**
- Changing the device-facing OTA wire protocol, the watchdog, or anything in
  `11-ota-contract.md` — frozen, untouched.
- Changing `occurrence_shipments`/`pending_occurrences`' own semantics (D91,
  D93) — this design reads them, doesn't redefine them.
- A migration/backfill path for existing minted cards — there are none yet.
- Multi-operator concurrency or locking on `logic_bundles`/assembly (D90's
  single-operator reasoning still holds).

## Decisions

### D-L1 — `logic_bundles` schema and the baked-constant stamp

```sql
CREATE TABLE logic_bundles (
  id            SERIAL PRIMARY KEY,
  base_version  TEXT NOT NULL,     -- from apktool.yml's versionInfo.versionName
  patch_rev     INTEGER NOT NULL,  -- global monotonic counter, never resets
  file_path     TEXT NOT NULL,     -- data/logic/<id>.js, immutable once written
  bundle_sha    TEXT NOT NULL,
  label         TEXT,
  active        BOOLEAN NOT NULL DEFAULT FALSE,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
-- exactly one row may have active = true; enforced at the application layer
-- (a partial unique index on active would also work; app-layer check chosen
-- to keep the "activate" transaction symmetric with "deactivate the rest")
```

`base_version`/`patch_rev` are baked into the assembled bundle's text as
top-level constants, exactly the way `BUILD_ID` already is — reuses
`src/commands/companion.js`'s existing placeholder-substitution mechanism
(`__MJOLNIR_BASE_VERSION__`/`__MJOLNIR_PATCH_REV__`), not a new mechanism.
`tool/src/otaPublish.js` gains sibling readers to `findBakedBuildId`:
`findBakedBaseVersion`/`findBakedPatchRev`. On ingest (whether via assembly
or a manual drag-drop), `hub` reads these out of the bundle text; only if
absent does the operator get prompted to type a value — matching "yes
nice" from the prior conversation turn.

**Why baked constants, not a sidecar JSON file**: a submitted bundle must be
self-describing on its own — dragging a `.js` file into hub's OTA console
should not also require remembering to attach a matching metadata file. The
companion mechanism already solves exactly this problem for `BUILD_ID`;
reusing it means one substitution pass, one regex-reader pattern, instead of
two parallel provenance mechanisms.

### D-L2 — `patch_rev` is one global counter, never reset by a base change

Confirmed with the operator: a base bump and a patch bump are independent
axes, and `patch_rev` keeps incrementing across a base change rather than
resetting to 0. Computed the same way `nextBuildId`/`nextCardId` already
are — scan existing `logic_bundles.patch_rev` for the max, add 1 — not a
stored running counter, for the same "correct even with gaps" reasoning.

### D-L3 — `card_content`, written at mint and regen, frozen on tombstone

```sql
CREATE TABLE card_content (
  card_id     TEXT PRIMARY KEY REFERENCES card_slots (id),
  n           TEXT,
  e           TEXT,
  x           TEXT,
  a           TEXT NOT NULL,
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

Written (upsert) in exactly the two places `pipeline.js` already projects
content: the newly-minted loop and the `alreadyMinted` regen loop. A
tombstoned note (`deleted_at` set, confirmed excluded from stabbur's read API
at `routes/notes.py:215`) is simply never in a future pull, so its
`card_content` row is never touched again after the note's last live
projection — that's the intended "frozen" behavior, not a special case to
code for separately.

`D` (the redundant deck-title copy, `findings.md` §1) is **not** stored here
— it's filled from the deck row at assembly time, as today, since it's
trivially derivable and storing it would just be one more place a deck
rename could drift from.

### D-L4 — `builder`'s pipeline becomes a stateless replay, not a mutation

Replaces `loadDeckCardModel(bundlePath)` / `saveDeckCardModel(bundlePath,
model)` operating on one persistent file with, every run:

```
1. Read the active logic_bundles row; load its (immutable) file fresh.
2. Replay existing state onto it, in order:
   a. For every card_slots row (ordered by occurrence_shipments.id ASC,
      the real chronological ship order — see Risk below for cards with
      no shipment yet), re-create the card from card_content and append
      its already-shipped occurrences from occurrence_shipments.
   b. Re-create pending_occurrences' live queue state (not written into
      Cards[] — it's queue state, not shipped content).
3. Proceed exactly as today from here: pull from stabbur, regenerate
   already-minted cards' content (card_content + stabbur's current note,
   same as now, now ALSO writing card_content), mint/append newly-eligible
   notes, drain/queue per D91, snapshot + publish.
4. Companion stamping: BUILD_ID restamped as today; base_version/patch_rev
   are already correct because they came from the logic bundle this run
   started from — nothing to restamp for them.
```

`BUNDLE_PATH` as a long-lived config value is removed. The working file
becomes a scratch path the run writes into before `publish()` snapshots it —
safe to delete between runs, since every run fully reconstructs it.

**Alternative considered**: keep incremental mutation as the common case,
and only do a full replay when the active `logic_bundles` row changes
(detected via a remembered "last built from logic_bundles.id" marker). This
is less new code and avoids a replay on every run, but means two code paths
(incremental append vs. full replay) that must stay behaviorally identical
forever — exactly the kind of drift this whole proposal exists to remove.
**Rejected**: at this project's stated scale (thousands of cards), a full
replay every run is cheap (an ordered `SELECT` + loop), and "one code path,
always correct" is worth more than the saved cycles, consistent with how
`03-data-model.md` already treats content regeneration as unconditional
rather than conditional on what changed.

### D-L5 — hub's OTA console: submit targets `logic_bundles`; force-publish stays, separately

Drag-drop submit now:
1. Reads baked base_version/patch_rev (or prompts if absent).
2. Writes a `logic_bundles` row, verifies via the same shared guards
   (`ota-publish-module`) already used elsewhere — no second
   implementation.
3. Optionally marks it `active` (a checkbox/button, not automatic) — this is
   the hook for "primarily done to update base, then trigger the builder":
   activating is a distinct click from submitting, so a submit that's just
   "save this for later" doesn't silently cut over.

A **separate, clearly-labeled "force-publish this exact bundle to
current.json now"** action remains, mirroring today's `setCurrent`/"set as
current" semantics but for a raw uploaded bundle rather than only a
previously-published one. It does not touch `logic_bundles.active` and does
not run `builder` — it's the emergency/manual-override path the operator
asked to keep, explicitly decoupled from the normal flow.

### D-L6 — `publications` gains a `logic_bundle_id` FK; `base_version`/`patch_rev` are read, not copied

```sql
ALTER TABLE publications ADD COLUMN logic_bundle_id INTEGER REFERENCES logic_bundles (id);
```

`writePublication` now reads `base_version`/`patch_rev` off the active
`logic_bundles` row at the moment of publish, instead of
`previousVersions()`'s "copy the last publication's values forward." This
closes the gap where no code path ever actually changed them —
`hub-schema`'s original "operator-flagged override" scenario is retired in
favor of "the active logic bundle's own values," which is strictly more
honest about where the value actually comes from.

### D-L7 — `patch-management` assembly: multi-patch selection, base read from `apktool.yml`

Extends the existing patch-apply flow (`patchback`'s locate-by-content
algorithm, unchanged) to: pick a base folder, pick an ordered list of stored
patches, apply all of them in one pass against that base, append the boot-ok
companion with build-id/base-version/patch-rev placeholders filled, and hand
the result to `hub` as a `logic_bundles` submission (or save it locally for
manual drag-drop — both paths produce the same artifact shape). `base_version`
is read via a small `apktool.yml` parser (`versionInfo.versionName`) — this
is genuinely base-folder metadata, confirmed not present anywhere in the
bundle's own bytes.

## Risks / Trade-offs

- **A card with zero shipped occurrences yet** (minted this run, nothing
  drained/appended before the replay step runs) has no `occurrence_shipments`
  row to order by. → Replay only ever processes cards that have *already*
  shipped at least one occurrence; a same-run mint is handled by the
  existing mint/append code path right after replay, same as today's
  newly-eligible loop. Not a gap — just means "replay" and "mint" stay two
  separate steps within one run, which they already are.
- **Full replay every run costs more than incremental mutation.** → Accepted
  per D-L4; revisit only if real-scale measurement (not speculation) shows
  it's actually slow.
- **Reusing the companion's baked-constant mechanism for two new values**
  touches `tool/src/otaPublish.js`'s `checkCompanionMatch`-adjacent code,
  which has existing tests. → Add sibling tests for
  `findBakedBaseVersion`/`findBakedPatchRev`, run the full `otaPublish`/
  `companion` suites after.
- **`logic_bundles.active` as an app-layer-enforced single-row invariant**,
  not a DB constraint. → Acceptable at this scale (one operator, infrequent
  activation); a partial unique index is a cheap future hardening, not
  required now.
- **Removing `BUNDLE_PATH` is a breaking config change.** → `.env.example`/
  `DEPLOY.md` updated in the same change; no deployed instance has real data
  riding on the old config today (operator-confirmed), so there's no
  silent-data-loss window to protect against.

## Migration Plan

No data migration — no note has been minted into a real publish yet.
Sequencing within this change still matters:

1. Schema first: `logic_bundles`, `card_content`, `publications.logic_bundle_id`
   — independently testable, no behavior change yet.
2. Baked-constant stamping (`src/commands/companion.js` + `apktool.yml`
   reader) + `tool/src/otaPublish.js` readers — testable in isolation
   against a hand-built fixture bundle.
3. `builder`'s stateless replay (D-L4) — the correctness-critical piece;
   needs its own test bundle fixtures exercising replay-then-mint-in-the-
   same-run.
4. `hub`'s OTA console retarget (D-L5) + UI for `logic_bundles`
   history/activation.
5. `patch-management`/bundle-workbench assembly UI (D-L7) — last, since it's
   the operator-facing convenience layer over everything above, not a
   dependency of it (an operator can still hand-produce a bundle with the
   right baked constants and drag it in without this UI existing yet).

## Open Questions

- Should `logic_bundles` ever prune old, inactive, never-published entries,
  or keep every assembly attempt forever (cheap, it's just JS text)? Lean
  toward keeping all of them — matches this project's general "storage is
  cheap, lost provenance is not" bias (e.g. `bad-<id>` tombstones, D65).
- Does "force-publish a raw bundle to current.json" need its own
  `logic_bundles` row written alongside it (so it's not a total dead-end for
  provenance), or is it acceptable for a force-published emergency bundle to
  leave no `logic_bundles` trace at all? Lean toward: still write a
  `logic_bundles` row (inactive) for the audit trail, even though it isn't
  what `builder` will build from next — cheap, and avoids a second
  provenance gap mirroring the one this whole proposal is closing.
