# full-sweep

Batch opened 2026-11-15 from all triaged packages.

## Dependencies

- Builder UI rehaul & data versioning **before** Device sync & userdata storage
  — the pull-tracking display identifies bundles, and the builder package
  rethinks bundle/data versioning.
- Assembly tab usability **before** Builder UI rehaul & data versioning — added
  during the builder design session. The strip console's card preview consumes
  the style map emitted by the assembly package's extractor. A DATA dependency
  only (the operator chose it over sharing a renderer module precisely to keep
  the two build-parallel in code), but the file has to exist first.

- smia `dictcc-parsing-fixes` **before** stabbur `stabbur-triage-queues`
  — added during the stabbur design session. The suggest panel orders AUDIO
  candidates by part of speech, and the `context` tag it orders on is what
  the smia change adds to dict.cc `/tts` candidates. A DATA dependency only;
  both are inside the same package, so one build session takes them in order.

- **Card preview redo before Builder UI rehaul & data versioning** — added
  2026-11-17. `builder-ship-strips` task 3.11 renders cards from "the
  extracted style map produced by `assembly-tab-usability`"; that map is
  wrong and is corrected and widened by `card-preview-popup`. Read 3.11 as
  "the style map produced by `card-preview-popup`". Data dependency only;
  the two also share the occurrence-cell look (one definition, see
  `card-preview-popup/design.md` §7).

All other packages are parallel-safe.

## Status

| package | status |
|---|---|
| Builder UI rehaul & data versioning | building — mjolnir: `flush-record-atomicity` then `builder-ship-strips` |
| Assembly tab usability | archived — `mjolnir/openspec/changes/archive/2026-11-15-assembly-tab-usability` (item 3 redone by "Card preview redo") |
| Card preview redo | designed (mjolnir: `card-preview-popup`) |
| Device sync & userdata storage | designed (root: `ota-pull-tracking`, `userdata-history-offload`) |
| Stabbur merging & dict.cc translations | building — smia `dictcc-parsing-fixes` first, then stabbur `stabbur-merge-fixes` + `stabbur-triage-queues` |
| Shadow studying mode | archived — `shadow/openspec/changes/archive/2026-11-16-shadow-studying-mode` |
| Calst/pygmalion audio consolidation | archived (smia: `2026-11-15-calst-audio-union`) |

## Packages

### Builder UI rehaul & data versioning
projects: mjolnir
status: designed 2026-11-15 — changes `builder-ship-strips` (items 1, 3, 4) and
`flush-record-atomicity` (item 2, designed earlier and unchanged), both mjolnir

Item 1 is a REPLACEMENT, not an addition: the backlog says "in addition to
forecast and publish", and the operator reversed that in session — one page,
so nothing has to stay in sync. The 5-stage pipeline rail and the
past-batches section are dropped from it (the run log owns past runs).

Three correctness defects were found while designing against the real data,
and all three are folded into `builder-ship-strips` because the redesign is
worthless if the cells lie:
- `shipOrderForDeck`'s open-slot count measures against the next multiple of
  5 above *shipped*, so a deck at 245 shipped with 9 staged computes −4,
  clamps to 0, and logs a "data-integrity signal" blaming the data. Spotted
  by the operator noticing C30 had no open cells in the mockup.
  `card-flow-view`'s own spec contains a scenario wrong in the same
  direction; the change supersedes it explicitly, so the build phase cannot
  "fix" the formula back.
- `syncDeckDescription` runs before `flushDeck`'s append loop, so any count
  formatted there is stale by exactly that run's flush.
- `LABEL`/`DATA_VERSION` are baked at assemble and never restamped — the
  operator's "data version is either not being updated or just not that
  relevant" was the first of those two.

Also corrected in the UI copy: D91's prose says the queued `E` waits for "11
other occurrences", but the implementation decrements by the count of new
CARDS. The mechanism is unchanged; every label now describes it accurately.

Scope note added after `assembly-tab-usability` archived: this package also
adds a read-only `BUILT_AT` row to the **Assemble tab**. The companion
aborts on an unsubstituted placeholder, so assemble must fill it; and a
standalone (D108) assemble is never restamped, so there it is the only build
time that bundle will ever carry. Additive to a closed change, not a reopen.

Accepted mockup: `builder-ship-strips/mockups/ship-strips-console.html`,
after three operator iterations — inline strip text removed (it broke the
40-cell grid), the page trimmed of prose, one stat order adopted everywhere,
deltas added per deck, and staged split into flushing vs held.

Locked after operator click-through (no longer builder decisions): the
pending delta carries the queued/drained split in BOTH the global totals and
every deck rail, and the off-grid chip names the offending shipped count
("Off the 5-grid — 12 shipped is not a multiple of 5").

Deferred to the builder's judgement (tier 2, not guesses):
- the stalled-run threshold, and the progress polling interval
- the exact icon/glyph set for the five stats, provided it is identical in
  the global totals and every rail header
- the detail view's exact field order
- where the extractor's style map is read from, provided an absent map fails
  loudly instead of falling back to invented values


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
versioning" redefines what those numbers mean. Still no shared files, but
the two are no longer order-free: see the dependency above. The builder of
each must not redefine the other's half — in particular `LABEL` keeps being
baked and `logic_bundles.label` stays the bundle's name in the console;
only the DEVICE's display of it is removed, by the other package.

Deferred to the builder's judgement (tier 2, not guesses):
- the exact wording of the standalone-mode hint when no server can suggest
  a patch rev
- how the extractor is invoked, provided it is re-runnable and fails loudly
  on a style map it cannot find. Its OUTPUT LOCATION is no longer fully
  free: `builder-ship-strips` reads that style map to render cards in its
  detail view, so it must land somewhere another service in the monorepo can
  read, not inside a single tab's private assets
- the visual treatment of the "no audio on this face" indication

[UX] assembly tab: label and patch rev should also be as env vars there, and it should be really preffiled with values, it does not, it say e.g. for logic rev that it is autoincremented to 17, but it doesn't prefill it, and it should suggest it, so the text field with already written value there
[UX] assembly tab should allow search by module number
[UX] card preview should be better reflecting the actuall css used in mjolnir so that i don't need to publish and view it in the app to see how it looks like, we need to use exactly the design in mjolnir to render the cards

### Card preview redo
projects: mjolnir
status: designed 2026-11-17 — change `card-preview-popup` (mjolnir)

Added 2026-11-16 from live feedback on the archived "Assembly tab
usability" item 3, which passed its own criteria and was rejected by the
operator. A redo, not a fix: an independent read of the stock bundle
(`card-preview-popup/research/render-research.md`) showed the old
preview's foundations were false. `.center` was drawn semibold, but on the
device its SemiBold font is dropped because it is not in `systemFonts`;
that is the "bold words" complaint. Text was centred, but the device
left-aligns. The card had a background, but the device has none. The face
ratios and base size were wrong. Every class colour was hand-typed, and the
catalogue showed none of them.

Operator decisions over six mockup iterations, all in the change:
- **Popup preview.** The card is shown alone: the operator removed the
  phone chrome. The tools drawer is resizable and remembered. There is an
  N|E direction switch with no A option, since A is a hidden N or E
  resolved through the card's `A` field. ←/→ steps across pages.
- **Editor.** Kept, minus its throwaway banner.
- **Classes/tags and symbols tables.** The Kind column is dropped, and
  clicking a row copies it.
- **Cards page.** One flat paged table: Card · Deck · Front · Back ·
  Occurrences · ↗.
- **Source picker.** Minted ledger, or any **published** build. The
  operator declined the stock `base/` bundle and unpublished assembled
  bundles as sources.
- **Occurrence cell.** Drawn in the **`builder-ship-strips`** cell
  vocabulary, as three fixed N·E·A slots, with a small dimmed ✕ for an
  absent letter.
- **Filters and views.** A structured filter bar (not a query language),
  sort, pages of 25/50/100, two saved views.
- **Settings store.** Server-side in a new hub table rather than browser
  storage.

The operator locked the final mockup with "lock exactly the design you
showing now, this is to be exactly implemented as you proposed it". The
mockup is the look-and-interaction reference; its rows are sample data
(design.md §1).

Deferred to the builder's judgement (tier 2, not guesses):
- simulated-device pixel densities and the status/bottom insets in the
  card-height formula (the mockup's are assumptions)
- the editor library, provided highlighting, wrapping and auto-grow behave
  as in the mockup
- how the occurrence-cell look is shared with `builder-ship-strips`,
  provided it is one definition
- server-side vs client-side filtering/paging, provided the page carries no
  per-row preview payload
- the settings table's name and key scheme, and the write debounce
- caching of parsed published bundles (per build id)

Not verified against a real phone yet: line metrics, Android font padding,
whether long `.flex` children wrap (B01047). The operator will compare a
screenshot after the build; mismatches become new backlog items.

[ux] mjolnir cards the row is too wide, preview should be on click of the card and source note should be just a link symol. the front and back side should be truncated those are too wide as well
[ux] mjolnir preview should display a popup of that card dimming out the background. Currently the preview is nothing like the mockup 2026-11-15-assembly-tab-usability/mockups/assembly-tab-usability.html. the colors are different, the class and tag map has to colors, the words are bold, but they shouldn't be. the editor is not that good and flexible. the long divs are not being wrapped, like in the phone. It should be redone, but we still have to use that mockup(only card preview part), maybe improve it a little. Make another independent research on how those are really displayed in the phone and come up with a new mock and design but reuse some of the ideas like the table of avaliable css classes from the previous mack. Maybe i can make a screen and you can verify against it, but later, now let's explore it

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

Designed 2026-11-16 → three changes, built in this order:
**`dictcc-parsing-fixes`** (smia) → **`stabbur-merge-fixes`** (stabbur,
independent) and **`stabbur-triage-queues`** (stabbur, reads the first
change's output).

Two defects were root-caused against the running code rather than inferred
from the report, and both reports were right about the effect while wrong
about the cause:

- **Merge does not "remove" unsaved fields — it never sees them.**
  `commitSimilarMerge` posts only `{survivor_id, absorbed_ids, take}`; the
  server reads the survivor FROM THE DATABASE and the UI re-renders from
  the response, so the open form's unsaved state is overwritten by the
  stored row. Destructive and silent, since the absorbed note is
  hard-deleted in the same transaction. Fixed by carrying the form's values
  in the merge request (save-then-merge), takes applying on top.
- **The `do` bug is the article splitter, not the pipe parser.** Confirmed
  live against `app_translations.php`: dict.cc returns
  `en / et do | doen / doet | doer / do | doene / doa`, and
  `seg.split(maxsplit=1)` takes `article="en"`, `sg_indef="/ et do"`.
  `do` is a TWO-GENDER noun; nothing about the word is special and every
  `en/et` noun broke identically.

The decision most likely to be got wrong at build time, and the one the
operator corrected mid-session: **part of speech ORDERS candidates, it
never filters them.** His diagnosis was that the right candidate was
already in the response and simply was not first — `walkProviders` takes
`candidates[0]`. So nothing is withheld; matching candidates sort first so
automatic prefill picks the right sense, in translations AND audio. With no
part of speech on the note, or no match, the provider's order is left
untouched and no preference is invented.

A deliberate asymmetry, recorded in both changes so it is not "made
consistent": merge's **Take IPA replaces**, the suggest panel's **Use
appends** (with a space, since the operator is assembling a multiword
transcription token by token). Same column, two gestures, two intents.

The operator also reversed his own backlog text on one point: it says
"inflections should be merged as tranlsations and context", and in session
he made inflections **purely replacive**, carrying the source's PoS with
them. Only translations and context are additive.

**Conflict with a settled decision, surfaced:** prefill assembling a
multiword transcription reverses **D2 of the archived
`smia-ipa-multiword-response`**, which forbade any stabbur-side join and
called it "the one place where doing less is the requirement". The operator
was shown that decision and reversed it deliberately (D161). The archived
design.md is annotated in place with the reversal and its bounds; D3 of
that change is kept and extended.

Accepted mockup:
`stabbur/openspec/changes/stabbur-triage-queues/mockups/stabbur-merge-dictcc.html`,
accepted on the first pass with one scope change — portrait removed.

**Deferred by the operator, NOT dropped:** phone portrait display
(`[ux] convenient phone portrait display for stabbur`). It was designed in
full and then deliberately taken out of the package so the operator can do
it later; the fourth change that would have carried it was never created.
What was settled is recorded verbatim in the root `BACKLOG.md` so it need
not be re-derived, and `stabbur-triage-queues` task 8.1 forbids any
responsive work, with acceptance criterion 55 failing a diff that contains
it.

Deferred to the builder's judgement (tier 2, not guesses):
- the default and maximum page size, and the page-navigation widget's shape
- the glyphs chosen for the status and audio indicators, provided each
  carries an accessible description
- the updated-since window's offered intervals
- how a queue's filters are keyed in the settings JSONB, and whether the
  built-in queues are literal rows or synthesised
- the gap marker's appearance in an assembled transcription, provided an
  absent token is visible rather than silently dropped
- whether the audio search is a new endpoint or a parameter on the
  authoring route
- the exact wording of the dirty-form marker and the merge confirmation

### Shadow studying mode
projects: shadow
status: archived 2026-11-16 — `shadow/openspec/changes/archive/2026-11-16-shadow-studying-mode`

[OVERHAUL] shadow shadowing should support studying mode where i just press 3 buttons (one makes the audio play, the second compares, the third marks as completed and goes to the next one) RETHINK THE DESIGN

The "RETHINK THE DESIGN" was taken literally and the operator **reversed a
founding decision**: shadow now stores audio server-side. `db/models.py`,
`shadowing.py` and D147 all assert the opposite and are corrected in place
by the change. What makes the reversal safe is that the thing originally
reverted was server-side *decoding per request* (a Praat decode on upload,
again on split, again on every chapter request, nothing cached) — not
storage. This design transcodes **once** to a mono Opus master and cuts a
chapter chunk as a stream copy. The whole point is the phone: without a
server-side master, continuing a book on a phone means re-picking a
multi-hour file through a file input (no File System Access API on mobile)
and re-decoding it locally, which is why the phone was unusable.

Three buttons became four — the operator was asked whether Compare could be
demoted on mobile and said no. Slow playback (0.7×) was **removed**
outright, and so was the upload time-range selector.

The subtle decision, and the one most likely to be got wrong at build time:
**progress is a set of completed TIME RANGES on the book**, not per-segment
booleans, and the cursor is a **time position**. That is what lets a book
hold several named split configs with progress carrying across them for
free — and it makes merge conjunctive (done only if both halves were) and
split preserving (both halves done). It also forces a one-time migration of
the operator's existing `done` flags, which carries its own acceptance
criterion (19) because he is part-way through a book and a lossy migration
loses his place irrecoverably.

Four screens under one navigation — Library, Explore, Study, Prepare. The
operator rejected a second per-book tab row as redundant. Explore is new:
browse by chapter, preview any sentence, range-select or whole-chapter
select, bulk mark done, jump straight into Study.

Accepted mockup:
`shadow/openspec/changes/shadow-studying-mode/mockups/shadow-studying-mode.html`,
after three operator iterations — Compare promoted to a mobile primary,
slow playback deleted, split/merge added to the Study tray, Explore added,
Prepare rebuilt around named split configs with per-sentence audio preview
(the operator: "otherwise i can't see anything"), the duplicated per-book
tab row removed, and the phone's `⋯` trigger moved to the top.

Nothing here touches the device plane, and no other project is modified —
notably `backup/` is untouched, because the audio volume is deliberately
**not** added to the backup set. That is the same failure this batch's
`userdata-history-offload` package exists to undo.

Deferred to the builder's judgement (tier 2, not guesses):
- resumable-upload chunk size and abandoned-upload cleanup policy
- the Opus bitrate and ffmpeg flags, provided the master is mono and a
  chapter cut is a stream copy
- whether `shadowing_segments.done` is dropped or kept as a derived column
- the chapter-chunk cache's location, naming and eviction, provided it is
  derivable and its loss costs only a re-cut
- the server-side silence-analysis implementation, provided re-analysis is
  repeatable from the two thresholds already in the data model
- waveform rendering detail, and when Explore virtualises its grid
- the exact wording of in-page confirms and warnings

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

- **`[ux] convenient phone portrait display for stabbur`** — deferred by the
  operator 2026-11-16, out of the "Stabbur merging & dict.cc translations"
  package, AFTER it was fully designed. Not a drop: the operator wants it,
  later, by themselves. The settled design is recorded verbatim in the root
  `BACKLOG.md`; the mockup's "Portrait" blocks show the treatment;
  `stabbur-triage-queues` task 8.1 and acceptance criterion 55 forbid any
  responsive work landing in this package by accident.

## Out-of-package changes that rode along

- **`8c337e78` — `postgres/compose.yaml` + `postgres/init/bootstrap.sh`**,
  committed during the Shadow studying mode build. It fixes a real
  socket-vs-TCP race in `postgres-init` (the health check probed the UNIX
  socket while `bootstrap.sh` connects over TCP, so a probe landing while
  the entrypoint runs its temporary `listen_addresses=''` server reported
  healthy and bootstrap got "Connection refused"; the role guard then could
  not distinguish "no such role" from "the query never ran" and took the
  CREATE branch, exiting 1 — which eight services gate on).
  **It is outside this package's scope** (projects: shadow), was not
  designed, is covered by no acceptance criterion, and was not verified by
  this package's tester. Acceptance criterion 50 ("nothing outside shadow/
  and docs/ is modified") is therefore FAILED AS WRITTEN — the tester's PASS
  was measured before this commit existed. Surfaced to the operator rather
  than reverted, because the fix looks correct and reverting a boot-race fix
  blind is worse than keeping it; it needs its own backlog item so it is
  judged on its own merits.
