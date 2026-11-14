## Why

`builder` today keeps exactly one mutable file (`BUNDLE_PATH`) that conflates
two things with completely different owners and change cadences: which base
APK + hand-applied JS patches are in effect (the operator's concern, changes
rarely), and which cards have been minted/regenerated into it (builder's own
concern, derived from `stabbur` constantly). Because they share one set of
bytes, an operator-submitted new base/patch bundle via hub's OTA console is
silently discarded the moment `builder` next runs — it loads the *old*
working file, re-injects cards into *that*, and republishes the stale base.
Worse, no code path exists today to actually bump `publications.base_version`
or `patch_rev` at all; they are permanently copied forward (a gap in the
original `hub-schema` design that was never implemented). Separately, a
card's actual rendered content (`N`/`E`/`X`/`A`) is never stored anywhere in
`hub`'s own database — it survives only as a side effect of the mutable file
never being discarded, which would silently blank any tombstoned note's card
the moment that file-based memory goes away. No notes have been minted for
real yet, so this is the right moment to fix the model, with zero migration
cost — not after real on-device progress depends on it.

## What Changes

- **New `logic_bundles` store** (hub): the operator-managed, versioned record
  of assembled base+patch JS bundles. Exactly one is `active` at a time —
  that is what `builder` builds onto. Each entry's `base_version`/`patch_rev`
  are read from constants baked into the bundle at assembly time (the same
  mechanism `BUILD_ID` already uses in the boot-ok companion), not typed by
  the operator at submission unless the baked values are absent.
- **Patch assembly gains multi-patch selection and version stamping**
  (bundle-workbench / `patch-management`): choosing a base APK folder and one
  or more stored patches to apply in one pass, producing one output bundle.
  `base_version` is read from the chosen base's `apktool.yml`
  (`versionInfo.versionName`) and baked into the output; `patch_rev` is a
  single global counter (never reset by a base change) baked in alongside it.
- **hub's OTA console "Submit bundle" targets `logic_bundles`, not
  `current.json`, by default.** Dropping a bundle reads its baked
  base_version/patch_rev (prompting for manual entry only if absent),
  creates/activates a `logic_bundles` row. **A separate, explicitly-labeled
  "force publish to current.json now" action is kept** for direct emergency
  publishing — it does not feed `builder` and does not require activating a
  logic bundle first.
- **New `card_content` table** (hub): each card's last-known-good rendered
  `N`/`E`/`X`/`A`, written at mint and refreshed on every regeneration while
  the source note is still returned by stabbur's pull; left untouched once
  the note is tombstoned (stabbur's read API excludes `deleted_at` notes
  forever — confirmed in `stabbur/routes/notes.py`).
- **`builder`'s pipeline becomes fully stateless.** **BREAKING**: the single
  persistent mutable working-bundle file (`BUNDLE_PATH`) is removed from the
  design entirely. Every run starts fresh from the currently-active
  `logic_bundles` entry and rebuilds the deck/card data as a pure projection:
  replay `card_slots` + `card_content` in `occurrence_shipments` order,
  apply `pending_occurrences`' live queue, then mint/append anything newly
  eligible. The existing immutable `data/ota/bundle/<buildId>.js` snapshot
  store and `current.json` pointer are unchanged — only what feeds them
  changes.
- **`publications.base_version`/`patch_rev` are now sourced from the
  `logic_bundles` row active at publish time**, replacing the never-actually-
  implemented "copied forward unless operator overrides" rule.
- No data migration: no note has ever been minted into a real publish yet
  (operator-confirmed) — this ships as the first real model, not a backfill.

## Capabilities

### New Capabilities
- `logic-bundle-store`: the versioned store of operator-assembled base+patch
  bundles, which one is active, and how `builder`/the OTA console read it.
- `card-content-store`: durable per-card rendered content, independent of any
  bundle file and of stabbur still holding the source note.

### Modified Capabilities
- `builder-pipeline`: the pipeline is now a stateless projection onto
  whichever `logic_bundles` entry is active, replacing the mutable
  working-file model; content/order are replayed from `card_slots` +
  `card_content` + `occurrence_shipments` + `pending_occurrences` on every
  run, not carried forward in file bytes.
- `hub-schema`: `publications.base_version`/`patch_rev` are now derived from
  the active `logic_bundles` row at publish time, not copied-forward/
  operator-overridden per publish; `publications` gains a reference to the
  `logic_bundles` entry it was built from.
- `ota-console`: the submit-bundle flow's default target changes from
  `current.json` to `logic_bundles`; the direct-to-`current.json` path
  becomes an explicit, separately-labeled action instead of the only outcome
  of a submit.
- `patch-management`: gains selecting multiple stored patches to apply
  together in one assembly pass against a chosen base, and stamps
  `base_version` (read from the base's `apktool.yml`) and a monotonic
  `patch_rev` into the output bundle as baked constants.

## Impact

- `builder/src/pipeline.js`, `config.js` — drop `BUNDLE_PATH`; stateless
  rebuild from the active logic bundle + hub's ledger tables.
- `hub/src/ota.js`, `server.js`, `publications.js` — new `logic_bundles`
  table/routes/UI; submit-bundle flow retargeted; force-publish kept as a
  distinct action.
- `hub/migrations/` — new migrations: `logic_bundles`, `card_content`,
  `publications` FK to `logic_bundles`.
- `src/commands/` (bundle-tool) — multi-patch assembly command/UI surface in
  bundle-workbench, version-stamping (base_version from `apktool.yml`,
  patch_rev counter) baked alongside the existing boot-ok companion
  mechanism.
- `DEPLOY.md`, `.env.example` — `BUNDLE_PATH` removed; replaced by a
  `logic_bundles` storage directory config.
- No stabbur or smia changes.
