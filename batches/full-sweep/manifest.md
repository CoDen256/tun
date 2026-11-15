# full-sweep

Batch opened 2026-11-15 from all triaged packages.

## Dependencies

- Builder UI rehaul & data versioning **before** Device sync & userdata storage
  — the pull-tracking display identifies bundles, and the builder package
  rethinks bundle/data versioning.

All other packages are parallel-safe.

## Status

| package | status |
|---|---|
| Builder UI rehaul & data versioning | in design |
| Assembly tab usability | building — `mjolnir/openspec/changes/assembly-tab-usability` |
| Device sync & userdata storage | designed (root: `ota-pull-tracking`, `userdata-history-offload`) |
| Stabbur merging & dict.cc translations | pending |
| Shadow studying mode | pending |
| Calst/pygmalion audio consolidation | building (smia: `calst-audio-union`) |

## Packages

### Builder UI rehaul & data versioning
projects: mjolnir

[REHAUL] builder UI new version. Completely new from the scratch in addition to "forecost and publish". Should have similar concept, but it should be based on the ship strip of occurances.
[BUG] builder flush-record-atomicity
[ux] builder should have number of cards/occurances in the descriptions of decks. 
[REHAUL] builder should add the time of build and it should be displayed in the app version. Rethink the logic and data versionning

### Assembly tab usability
projects: mjolnir
status: designed 2026-11-15 — change `assembly-tab-usability` (mjolnir)

Note on item 2: the backlog text says "assembly tab", but the module-number
search the operator wants is the **Explorer** tab's — the Assemble tab's
pickers hold 19 items and need no filter. Corrected in session; the Assemble
tab keeps no search box.

Semantic overlap to watch: this package restructures the `PATCH_REV` /
`LABEL` / `DATA_VERSION` form fields, while "Builder UI rehaul & data
versioning" redefines what those numbers mean. No shared files, so the two
remain build-parallel, but the builder of each should not redefine the
other's half.

Deferred to the builder's judgement (tier 2, not guesses):
- the exact wording of the standalone-mode hint when no server can suggest
  a patch rev
- where the extractor's output lives and how it is invoked, provided it is
  re-runnable and fails loudly on a style map it cannot find
- the visual treatment of the "no audio on this face" indication

[UX] assembly tab: label and patch rev should also be as env vars there, and it should be really preffiled with values, it does not, it say e.g. for logic rev that it is autoincremented to 17, but it doesn't prefill it, and it should suggest it, so the text field with already written value there
[UX] assembly tab should allow search by module number
[UX] card preview should be better reflecting the actuall css used in mjolnir so that i don't need to publish and view it in the app to see how it looks like, we need to use exactly the design in mjolnir to render the cards

### Device sync & userdata storage
projects: mjolnir, backup

[IDEA] sync i should track what bundle and when each bundle was pulled and display it in the ui, if that's not difficult.
[BUG] the mjolnir syncing of devices is nice, but i think the tun-backup gonna explode from the syncing of the deckstats. i think we have to have one mutable userdata per user and use git to track changes instead of saving the new userdata everytime.

Designed 2026-11-15 → two root `openspec/` changes, independently shippable.

**`ota-pull-tracking`** (grind + mjolnir). The explosion was measured first, and so was
the device-tracking dead end: `device_state` already existed and was dropped in
`015_drop_device_state.sql` because nothing on the device ever reported. So pulls are
observed AT THE GATEWAY — a second named Caddy logger scoped to `/ota/bundle/*`, ingested
into a durable `ota_pulls` table deduped on `(at, build_id, remote_ip)` so the record
survives log rotation. No JS patch, no publish, no device work, no byte of the
device-facing response changed. Operator decisions: bundle downloads only (not
`current.json` polls, not `/blob/*`, not `/audio-manifest/*`); **Option A**, a dedicated
Device → Pulls page, over a panel on the account-scoped Sync page.

**`userdata-history-offload`** (backup + mjolnir). Measured: `userdata_history` is
30.9 MB of a 32 MB `mjolnir.sql` — 73 rows at ~424 KB each, a full copy of the account
document per PATCH, re-committed to git daily. Operator decisions: exclude its DATA from
the dump; the **backup service** exports one mutable, key-sorted, pretty-printed
`userdata/<uid>.json` per account so git's own history becomes the version history (NOT
`mjolnir-sync`, which would put a write in the device-plane path); 30-day retention on the
table, swept by hub, which **amends D-S5**. The archive must exist and be verified before
the exclusion lands — getting that order wrong opens a window where nothing holds the
history.

Verified live during design, not assumed (caddy:2-alpine v2.11.7) — two silent traps,
recorded in `ota-pull-tracking/design.md`: the **last-declared** named logger becomes the
site default, so the wrong order sends every request in all seven zones to the OTA pull
log while stdout goes dark; and `default` is a reserved logger name that exits 1 after
printing what looks like a successful boot.

Deferred to the builder (tier 2): Caddy `roll_size`/`roll_keep`/`roll_keep_for` values;
the exact serializer for the JSON export (`jq -S --indent 2` is the obvious one — any
serializer with sorted keys and stable output qualifies); ingest cooldown length; the
retention sweep's trigger point inside hub; how `_check_backup_sources.py` spells its new
"recovered from the backup repo's own export" category.

Nothing here touches the device plane: no change under `mjolnir/sync/`, `mjolnir/patches/`
or the APK, and both changes carry an explicit acceptance criterion diffing a real
device-facing response byte for byte.

### Stabbur merging & dict.cc translations
projects: stabbur, smia

[ux] triage should be possible to do for any filter (only those missing audio, only those matching some query text, only those having PoS this and status this)
[ux] notes list going out of bounds, make status and audio much smaller. Make pagination.
[ux] convenient phone portrait display for stabbur
[ux] search by text in audio of stabbur to attach to a different note.
[ux] stabbur similar notes i should be able to go to that note
[ux] ipa should be additive when i say "use"
[ux] stabbur ignore variety field do something, can't se anything there
[bug] smia dict_cc can't parse "do"  (en/et do | doen/doet | doer/do | doene/doa)
[ux] merging removes everything not saved even if i didn't tell to merge those fields, should not remove,also merging should add context add translation always, not replace them. it should replace the audio and ipa if said so, inflections should be merged as tranlsations and context 
[REHAUL] rethink dictcc parsing and stabbur displaying of translations. also dict_cc audios not everyone is present and stabbur when asking dict_cc should filter by PoS, because he picks the wrong PoS sometimes
[UX] smia filmot link for multiword should search them in a quotes: https://filmot.com/search/%22fastsatt%20av%22/1?lang=no&hideDeleted=1&gridView=1&

### Shadow studying mode
projects: shadow

[OVERHAUL] shadow shadowing should support studying mode where i just press 3 buttons (one makes the audio play, the second compares, the third marks as completed and goes to the next one) RETHINK THE DESIGN

### Calst/pygmalion audio consolidation
projects: smia

[IDEA] explore smia/providers/calst, we need to download all the audio files from the manifest, check whether pygmalion has exactly the same stuff 
but is a subset of calst, combine them into one or extend pygmalion tts from all those 

Designed 2026-11-15 → smia change `calst-audio-union`. Subset question answered during design: neither corpus
contains the other (868/1,176 pygmalion files overlap; calst adds 7,573 Oslo_Normal files / 3,211 new words).
Operator decisions (revised same day): one combined provider under the existing `pygmalion` id; download and
commit all files (~52 MB full archive); Slow recordings excluded entirely; import only the first 2 Normal
takes per (word, dialect) — skipped rows marked `surplus: true` in the manifest as the durable record; import
is an operator-run script with live progress (plain fallback for bootstrap). Adapter unchanged. No UI, so no
mockups. Deferred to builder (tier 2): take-numbering mechanics, existing-file recognition in the downloader,
progress-display details.

## Dropped / deferred

(none)
