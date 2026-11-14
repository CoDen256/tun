## Why

P1–P3 proved the delivery mechanism: the phone fetches bundles over the air,
with a native patch that cannot be shipped again without real risk. Nothing
has shipped through it yet except a hand-built test bundle. P4 is the first
time content moves through a real pipeline — stabbur notes become Mjølnir
cards automatically, on a schedule, without you hand-running CLI commands
each time. Until this exists, "add a card" means repeating October's manual
steps (build a companion bundle, scp it, run `ota-publish.sh`) forever.

The data model and every hard rule this pipeline must respect are already
settled (`tun/docs/03-data-model.md`, D74–D80) — this change builds the thing,
it does not redesign it.

## What Changes

- **Move OTA-specific deployment out of `tun`** (D75): `ota-publish.sh`,
  `ota-verify.sh`, the `/ota/*` and `/blob/*` Caddyfile blocks, and the OTA
  half of `DEPLOY.md` become `mjolnir`'s own. `tun` keeps only the shared
  skeleton other services will plug into later.
- **New `tool/` publish module** (D76): the buildId regex, the
  no-reuse-with-different-bytes guard, and the magic-prefix check — today's
  bash logic in `ota-publish.sh` — become one importable module. The CLI
  becomes a thin wrapper over it; `builder` imports it directly, in-process.
- **New `inject-deck` capability**, built on the **existing, tested**
  `src/deckData.js` (`locateDeckCardModules`, `addOccurrence`,
  `regenerateModuleSource`, `saveDeckCardModel`, `nextDeckId`,
  `NEW_DECK_DEFAULTS`) rather than beside it — that module already does the
  shape-location and byte-exact reassembly a from-scratch tool would have had
  to rebuild. Three things are genuinely new on top of it: card ids supplied
  externally (`hub`'s `card_slots` ledger, not a bundle scan —
  `nextCardId`'s approach doesn't apply here), a lag-11 interleave ordering
  across *multiple* new cards in one save (`addOccurrence` only ever appends
  one occurrence at a time today), and upserting an *existing* card's
  `N`/`E`/`X` content by id (nothing today does this — the manual editor
  mutates the in-memory array directly in its own UI layer).
- **New `hub` schema**: `card_slots`, `decks`, `publications` (three
  separately-owned version fields — D77), `build_jobs`, and `hub`'s own
  ledger of minted note ids (D44 — never pushed back to stabbur). Scoped to
  what `builder` needs; `/mjolnir/userdata` sync is P5, not this change.
- **New `hub` operator UI**: publish history, reading `publications`.
  `hub` becomes device-facing *and* operator-facing (D80), correcting its
  original device-only framing.
- **New `builder` worker**, in Node (D76): pull `ready`+audio'd notes from
  stabbur, assign a deck by type/PoS (unmapped PoS → `expression`/C26), hold
  a deck until it has **≥6** newly-eligible notes (hard floor — lag-11 cannot
  separate one card's own occurrences against itself), mint `card_slots` only
  once the floor is met, project note→`{N,E,X,A}` per type (pure, stateless),
  interleave the new block at lag 11, **regenerate every already-minted
  card's content fresh** on every run (positions and ids stay frozen —
  content does not), call `inject-deck`, build `audio.json`, publish.
- **New `builder` operator UI**: a live, non-destructive forecast (which
  decks are close to the floor, computed the same way as a real run but
  minting nothing) and a manual "publish now" button.
- **Trigger: a nightly clock, plus the manual button** (D78) — not
  push-on-ready, not button-only.
- **BREAKING (intended)**: none to the installed app. This change ships no
  native code and no new APK.

Explicitly **not** in this change, flagged so the next session doesn't assume
otherwise: the mod 1440 audio resolver patch + prefetcher companion
(`03-data-model.md` calls it a prerequisite — every Mjølnir card requires
audio, no exception — but it is an independent JS patch to the app's audio
chokepoint, orthogonal to this pipeline and not touched here). Without it,
`builder` can publish cards whose audio the device cannot yet play.

## Capabilities

### New Capabilities
- `ota-publish-module`: the shared buildId/reuse/magic-prefix publish guards,
  importable by `builder` and wrapped by the CLI; the `/ota/*` + `/blob/*`
  deploy pieces moving from `tun` (D75).
- `inject-deck`: externally-keyed card creation, lag-11 multi-occurrence
  interleave, and upsert-by-id content regeneration, layered on the existing
  `deckData.js` primitives.
- `hub-schema`: `card_slots`, `decks`, `publications`, `build_jobs`, the
  minted-note ledger, and the publish-history operator UI.
- `builder-pipeline`: the worker itself — pull, assign, hold-until-floor,
  mint, project, interleave, regenerate, publish, plus its forecast UI and
  the nightly-clock + manual-button trigger.

### Modified Capabilities
<!-- None. `deck-card-data-model` and `deck-card-save` (the bundle-workbench
     editor's existing specs) are reused as a dependency, not changed — their
     requirements still describe the manual-editor path exactly as before.
     `inject-deck` adds new, additive behavior beside them. -->

## Impact

- **New code**: `src/commands/otaPublish.js` (or similar) + CLI wrapper;
  `src/injectDeck.js` building on `src/deckData.js`; `hub/` (new service:
  schema, migrations, publish-history UI); `builder/` (new service: the
  worker + its forecast/button UI).
- **Moved, not new**: `ota-publish.sh`, `ota-verify.sh`, OTA Caddyfile blocks,
  OTA half of `DEPLOY.md` — from `tun` into this repo (D75).
- **Depends on**: `stabbur`'s notes API (`GET /api/notes?...`) existing and
  returning the shape `03-data-model.md` specifies — tracked as a parallel
  change in the `stabbur` repo (`p4-notes`), not this one. This change can be
  built and tested against a stub/fixture of that API without waiting for the
  real one, but cannot run end-to-end without it.
- **No native/APK change.** No `/mjolnir/userdata` sync (P5). No mod 1440
  patch (separate, prerequisite work, not in scope here).
