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
| Builder UI rehaul & data versioning | designed — changes: `mjolnir/flush-record-atomicity`, `mjolnir/builder-ship-console` |
| Assembly tab usability | pending |
| Device sync & userdata storage | pending |
| Stabbur merging & dict.cc translations | pending |
| Shadow studying mode | pending |
| Calst/pygmalion audio consolidation | designed (smia: `calst-audio-union`) |

## Packages

### Builder UI rehaul & data versioning
projects: mjolnir

Designed 2026-11-15. Two changes: `flush-record-atomicity` (pre-existing,
design settled: deferred deletes, commit-before-publish, per-deck recovery
drain + uniqueness constraints, integrity banner) and `builder-ship-console`
(new Ship strips page — deck-rails layout locked via mockup; on-device deck
counts; publish-time restamp with BUILT_AT; single App-version row). No item
dropped. Deferred to builder judgment (tier 2): exact restamp regex/helper
shape, strip pagination/virtualization if a deck outgrows rendering, nav
placement details, timestamp formatting helper. Build order within the
package: flush-record-atomicity first (builder-ship-console's strip reads
the tables it constrains).

[REHAUL] builder UI new version. Completely new from the scratch in addition to "forecost and publish". Should have similar concept, but it should be based on the ship strip of occurances.
[BUG] builder flush-record-atomicity
[ux] builder should have number of cards/occurances in the descriptions of decks. 
[REHAUL] builder should add the time of build and it should be displayed in the app version. Rethink the logic and data versionning

### Assembly tab usability
projects: mjolnir

[UX] assembly tab: label and patch rev should also be as env vars there, and it should be really preffiled with values, it does not, it say e.g. for logic rev that it is autoincremented to 17, but it doesn't prefill it, and it should suggest it, so the text field with already written value there
[UX] assembly tab should allow search by module number
[UX] card preview should be better reflecting the actuall css used in mjolnir so that i don't need to publish and view it in the app to see how it looks like, we need to use exactly the design in mjolnir to render the cards

### Device sync & userdata storage
projects: mjolnir, backup

[IDEA] sync i should track what bundle and when each bundle was pulled and display it in the ui, if that's not difficult.
[BUG] the mjolnir syncing of devices is nice, but i think the tun-backup gonna explode from the syncing of the deckstats. i think we have to have one mutable userdata per user and use git to track changes instead of saving the new userdata everytime.

### Stabbur merging & dict.cc translations
projects: stabbur, smia

[ux] stabbur ignore variety field do something, can't se anything there
[ux] merging removes everything not saved,also mergingg should add context add translation, not replace them.
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
Operator decisions: one combined provider under the existing `pygmalion` id; download and commit all files
(~52 MB); /tts capped at 2 takes per (word, dialect) — presentation-only, all data imported. No UI, so no
mockups. Deferred to builder (tier 2): take-numbering mechanics, existing-file recognition in the downloader,
manifest provenance field details.

## Dropped / deferred

(none)
