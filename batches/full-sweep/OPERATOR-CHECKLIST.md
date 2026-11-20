# full-sweep

## Assembly tab usability
`mjolnir/openspec/changes/archive/2026-11-15-assembly-tab-usability`

No schema migration, no data migration. Deploy is a normal pull + rebuild +
restart of `mjolnir-hub` only — `mjolnir-builder`, `mjolnir-sync`, device
plane and the APK are all untouched.

### Deploy
- `git pull`, `docker compose build mjolnir-hub && docker compose up -d mjolnir-hub`.
- No env var changes, no new secrets. `OPERATOR_AUTH_TOKEN` is now echoed
  (masked, with a reveal toggle) to the Assemble tab's SYNC_TOKEN row — this
  is an intentional, logged reversal of hub's prior "booleans only" rule
  (`DECISIONS-MADE.md`), confined to the operator-plane Assemble tab.

### Flows to test live
1. **Assemble tab** (`/mjolnir/workbench` → Assemble, or embedded in hub):
   open it and confirm the Placeholders list shows seven prefilled rows
   (PATCH_REV, LABEL, DATA_VERSION, BUILD_ID, SYNC_BASE_URL, SYNC_TOKEN,
   AUDIO_BASE_URL) with real values already typed in, not empty boxes —
   this was the original complaint. Reveal/re-mask the SYNC_TOKEN row.
   Assemble a bundle unedited, then again after editing PATCH_REV/LABEL,
   and confirm the `/mjolnir/ota` row shows what you typed.
2. **Explorer search**: type a real module number (any id visible in the
   session's module list) into the search box and confirm a jump row
   appears above the source-text hits; confirm a plain word like
   "subscription" still only returns source hits.
3. **Card preview** (hub → Cards page → expand any card's preview row):
   confirm it renders as **one** bordered card (not three boxes), tap each
   face to hear its audio (no visible `<audio>` control), try the class
   and symbol catalogues below it, and try the throwaway HTML editor —
   confirm a banner says edits are never saved, and reloading the page
   shows no trace of an edit.
4. On a phone or a resized browser window, switch the preview's simulated
   device size and confirm the card's geometry and font sizes visibly
   rescale.

### Known follow-ups (not blocking, not regressions)
- None. All 40 acceptance criteria passed on re-verification
  (`acceptance.md` in the archived change folder), including the one
  centring bug caught in the first test pass and fixed before archive.

## Calst/pygmalion audio consolidation
`smia/openspec/changes/archive/2026-11-15-calst-audio-union`

No schema migration. One **required one-time data migration**: the
`pygmalion_audio` table must be rebuilt from the new manifest, or deployed
Oslo recordings stay capped at the old 180-word corpus.

### Deploy
- `git pull`, `docker compose build smia-backend && docker compose up -d smia-backend`
  (pulls in the ~7,572 newly committed mp3s under `smia/providers/pygmalion/audio/Oslo/`
  and the updated `manifest.jsonl` — no env var changes, no new secrets).
- **Required migration step** — truncate and re-import so the curated table
  reflects the new corpus (old Slow rows and any >2-take words must drop out):
  ```
  docker compose exec postgres psql -U tunadmin -d smia -c "TRUNCATE pygmalion_audio;"
  docker compose exec smia-backend python -m scripts.import_pygmalion providers/pygmalion/audio/manifest.jsonl
  ```
  (or skip the second command and restart `smia-backend` — bootstrap re-imports
  automatically into an empty table, just without the live progress bar).
  Verify afterward: `pygmalion_audio` row count should land at **5,791**
  (was 1,176 before this change).

### Data / storage verification
- `GET /providers` (operator-plane, bearer `INTERNAL_TOKEN` or via the gateway)
  should report `tts.pygmalion` at 5,791.
- `smia/providers/pygmalion/audio/manifest.jsonl` is the durable record of
  what was deliberately excluded: any row with `"surplus": true` (Slow
  recordings, or a word/dialect's 3rd+ Normal take) was archived to disk but
  never imported — this is normal, not a bug.

### Testing & checkout
- `POST /tts {"text": "<any word new to this corpus, e.g. "bens" or "tør">", "lang": "nb", "provider": "pygmalion"}`
  should return 1–2 candidates with `source: "human"`, `voice: "Oslo"`.
- `POST /tts {"text": "de", "lang": "nb", "provider": "pygmalion"}` (one of
  the few old multi-dialect words) should still return both Oslo and Bergen
  candidates, Oslo first, and no more than 2 per dialect.

### Known follow-ups (not blocking, not regressions)
- One calst-sourced recording (`trettiende`, Oslo, take 1) is permanently
  `status: "failed"` in the manifest — the upstream server answers
  `HTTP 200` with a **0-byte body** for that exact URL every time (confirmed
  directly, not a transient error); no retry can fix it. The word's other
  take still imported fine, so `/tts` for it just returns one candidate
  instead of two.
- The design's acceptance criteria estimated the curated table would reach
  "≥ 6,000" rows; the real corpus's actual word/take distribution lands at
  5,791. Confirmed by an independent tester as a measurement gap in the
  original estimate, not a code defect — every curation invariant (≤2 Normal
  takes per word/dialect, zero Slow rows) holds.
- A real, rare case-folding collision was found and fixed during review:
  the live calst data contains the literal words `"I"` and `"i"` (both
  alphabet-letter and preposition), which previously got independent take-0
  sequences during extraction and then collided onto the same DB row at
  import — one recording silently vanished. Fixed by grouping take-numbering
  and surplus-marking by `word.casefold()`, matching the import's primary
  key; verified in the live corpus (both recordings of "i" now resolve).

---

## Shadow studying mode — `shadow-studying-mode` (shadow)

**This change reverses a founding decision: shadow now stores audio.** One
mono Opus master per book, transcoded once on upload. D162 records the
reversal; D147 is annotated in place.

### Deploy

Standard pull / rebuild / restart — `shadow-backend` only.

```bash
git pull
docker compose up -d --build shadow-backend
```

- The `shadow_audio` named volume is created by compose. Nothing to do.
- **The migration runs itself at boot** (serve-before-migrate, D157). There
  is no manual migration step.
- **Read the migration's log line before using the app:**
  ```bash
  docker compose logs shadow-backend | grep -i "done sentences preserved"
  ```
  It must report your done sentences preserved and verified. It raises inside
  the transaction on any mismatch, so a successful boot already means it
  held — but read it once anyway, because this is the one irreversible step.
- **`alembic downgrade` on shadow now REFUSES and exits 1.** Deliberate: a
  downgrade would drop every progress range and then a re-upgrade would
  silently rebuild month-old `done` flags while printing "verified
  identical". If you ever truly need to go back, restore from a dump.

### The first thing you will notice

Your existing books (16, 19) show **no audio**. They kept every segment,
every done flag and their place in the book, but there is no server-side
master for them — the audio only ever lived in your browser. The row says
so. **Re-upload those files** (same file, any name) to get audio features
back; the split and progress reattach.

### Data / storage verification

- `docker compose exec shadow-backend ls -R /data/audio/books` — one
  `master.opus` per book, plus a `chunks/` cache. **Nothing per sentence.**
  If you ever see a file count that scales with sentences, that is a bug.
- `docker compose exec postgres psql -U shadow -d shadow -c "select count(*) from shadowing_progress_ranges;"`
  — this is your real progress now. `shadowing_segments.done` is a frozen
  legacy column: never read, never written, kept only so the migration stays
  auditable.
- **The audio volume is NOT backed up, deliberately.** `shadow.sql` carries
  split configs, boundaries, progress, cursor and transcripts — the
  irreplaceable things. Masters are re-uploadable. Confirm after a backup run
  that the repo did not grow by an audiobook.

### Flows to test live

1. **Upload a real audiobook.** Watch the determinate byte counter, then the
   automatic transcode → analysis (you should not have to press anything).
   Kill the tab mid-upload and re-drop the same file — it must resume, not
   restart.
2. **The loop, on the desktop.** Open Study. `Space` plays and must stop dead
   at the sentence end. `Enter` marks and advances. `←`/`→` must move without
   marking anything. `?` shows every binding.
3. **Record and Compare — this is the part agents could not test.** There is
   no microphone and no STT provider in dev, so criteria 27, 28, 29 and half
   of 30 are unverified. Press `R`, speak, press `R`, then `C`: you should
   hear the reference then your take, and see two pitch contours overlaid.
   Reload and confirm your take is **gone** — it must never persist.
4. **Transcribe.** Press `T` on a sentence. Needs a working smia STT
   provider; in dev there was none, so this reported "unknown provider".
5. **Formant Lab.** Press `F`. It must send the **audiobook's** sentence, not
   your voice — even when you have just recorded.
6. **The phone.** Open shadow on your actual phone. Record/Play/Compare and
   the Done bar must sit under your thumb; `⋯` is at the top. Enter a chapter
   and confirm it downloads once and then plays every sentence instantly —
   put the phone in airplane mode afterwards to prove it.
7. **Continuity.** Leave off mid-chapter on the desktop without marking
   anything, then open the phone. It must land on that same sentence.
8. **Split configs.** In Prepare, duplicate a config and re-analyse it with
   different thresholds. Your progress must carry across by time coverage,
   and the other config's manual edits must be untouched.
9. **Lock the phone mid-sentence.** Playback must stop at the sentence end,
   not run on into the chapter. (This failed before a review fix and the fix
   is verified only with rAF suppressed in a desktop browser — your real
   phone is the honest test.)

### Known, not defects

- Prepare's sliders cannot produce an inverted threshold pair by hand
  (sentence max 1200 ms, chapter min 1200 ms); the API refuses one anyway.
- A tester saw Study's tray "Merge with next" ignore one click on the label
  text immediately after a tray re-render, then work on the next click. Not
  reproduced reliably — worth one look if you hit it.
- The per-upload lock is process-local, which is sound only because shadow
  runs a single process. It carries an in-code note to become a Postgres
  advisory lock if that ever changes.

### Out of scope, needs your decision

Commit `8c337e78` touches **`postgres/`** — shared infrastructure this
package does not own. See the final report; it was not designed, not covered
by any acceptance criterion, and not verified by this package's tester.

---

## Stabbur merging & dict.cc translations

Three changes: smia `dictcc-parsing-fixes`, stabbur `stabbur-merge-fixes`,
stabbur `stabbur-triage-queues`.

### Deploy

Standard pull / rebuild / restart, **plus one schema migration**.

```
git pull
docker compose build smia-backend stabbur-backend
docker compose up -d smia-backend stabbur-backend
```

**One-time migration — `stabbur`, revision `e91c7b35a2df` (saved triage
queues).** It adds one nullable JSONB column and seeds nothing:

```
docker compose exec stabbur-backend alembic upgrade head
docker compose exec stabbur-backend alembic current     # e91c7b35a2df (head)
```

Verify the column exists before using the Triage page — without it every
queue request 500s:

```
docker compose exec postgres psql -U stabbur -d stabbur -c "\d settings" | grep triage_queues
```

Rollback is `alembic downgrade c3f8a0d2e5b1`; it drops the column and with
it any saved queues. The three built-in origin queues are synthesised in
code, so they survive a downgrade — you lose only your own named queues.

**Hard-refresh the browser** (Ctrl-Shift-R) after deploying. `ui.js` and
`ui.css` revalidate by etag, and a stale asset reads exactly like an
unimplemented feature.

### Test live

**dict.cc audio — the headline fix.** Open any Norwegian note and the audio
suggest panel.
- Recordings are **human only** now. The dict.cc synthetic voice ("Liv") is
  never requested, and an entry with no human recording in your language is
  skipped rather than fetched — it used to return a synthesised clip
  labelled "human".
- Each candidate names the phrase it actually reads plus its part of speech:
  `[verb] å stille krav`.
- Candidates matching the note's part of speech sort first, so automatic
  prefill picks the right sense. **Nothing is hidden** — the other senses are
  still listed under their own headings.
- Worth a direct check on `stille`: you should get ~22 recordings including
  `å stille klokka`, `å stille klokken` and `å stille ut` (EN↔NO only, and
  unreachable before this), and you should NOT get `å stille opp noe`,
  `å gå stille i dørene` or `Stille vann har dypest grunn` — those have no
  Norwegian recording. All three still appear under **translations**.

**Merging.** Open a note with related notes.
- Type into a field, do **not** save, then merge. Your typing survives — the
  merge saves it first, then applies the takes. This is the data-loss fix.
- Each take button says what it does: translations and context **add**,
  everything else **replaces**, inflections **replaces + PoS**.
- New "Take text" and "Take lemma" buttons.
- Every related row has an "Open in new tab" link, including `ready` rows
  whose other controls are disabled.

**Triage queues.** The origin dropdown is gone.
- `import` / `manual` / `capture` are now built-in queues; they behave
  exactly as the dropdown did and cannot be edited or deleted.
- Build a filter set (status, type, origin, PoS, source language, updated
  since, text search, and has/missing per field) and save it as a named
  queue. Queues live in the database, so they reach any device.
- Each chip shows its remaining count.
- From the Notes page, "Triage these results" opens the belt over whatever
  you have filtered, as an unsaved queue you can then name.

**Notes list.** Status and audio are single glyphs (hover for the label),
and the list is paged with a slice-of-total readout.

**IPA.** "Use" now **appends with a space** instead of overwriting, so you
can assemble a multiword transcription token by token; ticks accumulate.
Prefill also assembles when smia cannot supply a whole-phrase value, marked
"assembled from single words" — and a token it could not resolve leaves a
visible gap rather than silently vanishing. Variety is **hover-only** now.

**Audio reuse.** In the audio panel, search your own notes and attach an
existing recording. Both notes then reference the same blob — nothing is
copied, and the source note is untouched.

### Known gaps

- **Phone portrait is NOT in this batch.** It was designed and then
  deliberately deferred; the settled design is in the root `BACKLOG.md`.
- A short, very common word can still produce a long audio list (`do` has
  ~50 dict.cc entries). The human-only filter cut this a lot, but there is
  no cap — tell me if it is still unwieldy.

## Builder UI rehaul & data versioning

Changes: `flush-record-atomicity`, `builder-ship-strips` (both mjolnir, archived 2026-11-19).

### One-time migration — REQUIRED

`hub/migrations/019_occurrence_uniqueness.sql` applies on the next
`mjolnir-hub` boot. It de-duplicates defensively (keeping the OLDEST row),
then adds unique `(card_id, letter)` indexes to `staged_occurrences`,
`pending_occurrences` and `occurrence_shipments`.

Before restarting, confirm production has no duplicates — the migration will
collapse them silently if it does:

```sh
docker compose exec -T postgres psql -U mjolnir -d mjolnir -c "
  SELECT 'staged' t, card_id, letter, count(*) FROM staged_occurrences GROUP BY 1,2,3 HAVING count(*)>1
  UNION ALL SELECT 'pending', card_id, letter, count(*) FROM pending_occurrences GROUP BY 1,2,3 HAVING count(*)>1
  UNION ALL SELECT 'shipped', card_id, letter, count(*) FROM occurrence_shipments GROUP BY 1,2,3 HAVING count(*)>1;"
```

Zero rows = clean. The dev cluster was zero. After restart, confirm all
THREE indexes exist (fewer than three means the migration did not run):

```sh
docker compose exec -T postgres psql -U mjolnir -d mjolnir -c "\\di *_card_letter_idx"
```

### Deploy note — build time will not appear until you re-assemble

`BUILT_AT` is a NEW companion constant. A logic bundle assembled BEFORE this
change does not contain it, so the first publish logs
`restamp: … — NOT PRESENT …: BUILT_AT` (non-fatal, by design) and the
phone's App version row omits the `built …` segment. **Assemble a fresh
logic bundle** in the Assemble tab to pick it up; everything else
(build id, base, logic, data) is correct immediately.

### Dev-cluster leftovers

Two throwaway databases were created on the dev Postgres for testing and are
NOT used by any service: `mjolnir_test`, `mjolnir_hubtest`. Drop them when
convenient. The production `mjolnir` database was never written to.

### Live flows to test

**Builder page** (`/builder`, and hub's own copy under Builder → the console
entry — they must look identical):
1. Every deck's strip is visible with no clicking. There is no 5-stage
   pipeline rail and no past-batches section.
2. **Hover an occurrence cell**: you get `#index · card id · letter`, then
   the N face (truncated), then what this publish does to that card
   ("E and X change this publish" / "unchanged" / "new card — …"). The same
   card's OTHER occurrence lights up elsewhere in the strip at the same time.
3. **Click a cell**: a drawer pushes the page aside (the strip stays visible)
   showing the shipping build and timestamp, the partner occurrence's
   position, and the card rendered in mjølnir's real CSS. On a card whose
   content changes this publish, the drawer says the preview is the NEW
   content, not what is on the device.
4. Counts read `◆ minted · ✎ edited · Σ eventual · ● shipped · ◐ staged ·
   ○ pending` in that order in BOTH the global totals and every deck header.
   Pending's delta shows `+queued / −drained` in both.
5. A deck on the 5-grid shows NO status chip. If one ever reads
   "Off the 5-grid — N shipped is not a multiple of 5", that is a real
   integrity fault, not cosmetic.
6. The legend is at the bottom. Its `?` explains the countdown is in new
   CARDS.

**The integrity banner** — it appears ONLY when something is wrong. On the
dev database it currently reports 4 genuine anomalies (C20002, C20077,
C20098, C20099 each owe an occurrence that exists nowhere — verified true
positives, deliberately not repaired). Check what production says; if it
reports nothing, that is the expected state.

**Publish**:
7. Press **Publish now** with nothing newly eligible → it should say nothing
   needed publishing and stop. It must NOT spin forever.
8. Press it with real work pending → an in-progress indication plus the run's
   own log lines appearing live; then a result banner at the top with the
   build id and what shipped.
9. **Reload the page afterwards** — the result must still be there. It is
   derived from `build_jobs`, so a nightly run you never watched also reports
   itself the next time you open the page.
10. Open **Run log** for that run: it should now be substantially more
    detailed — per-deck `flush-calc:` arithmetic, a `commit: applying …`
    line itemising what is about to be consumed, a `commit: COMMITTED` line,
    and `done: … in N ms`. If a run ever fails, the log itself now names the
    phase and the error instead of simply stopping.

**On the phone**, after a publish from a freshly-assembled logic bundle:
11. Account screen shows ONE `App version` row:
    `b0000NN · base … · logic … · data … · built <local time>`.
    No separate Label or Data version row.
12. Deck list descriptions read `<your prose> · N cards · M occ`, and the
    counts include what that publish just shipped.

### Known, deliberately not fixed

- `probeDurationMs` (`builder/src/audioSnapshot.js`) has no try/catch around
  `ffprobe`, so one unreadable blob still fails a whole publish — a D-F1
  violation, confirmed pre-existing. In BACKLOG.md. It now consumes no
  occurrences when it fires.
- The projector throws on a verb note with `inflections: {}`. In BACKLOG.md.
- Builder test #39 (projector transcription) fails because of `74ba89ca` /
  `b41aa964`, which are your own commits, not this batch.

## Card preview redo
`mjolnir/openspec/changes/archive/2026-11-20-card-preview-popup`

This REDOES the card preview from the earlier `assembly-tab-usability`
build, after you rejected that version's result against the real app —
`.center` bold, centred text, a card background, wrong face ratios. This
build is an independent extractor-rules read of the stock bundle, with a
widened extractor, and the hand-typed preview CSS deleted entirely.

No schema migration for the preview itself; one small one for settings
storage (see below). Deploy touches `mjolnir-hub` only —
`mjolnir-builder`, `mjolnir-sync`, device plane and the APK are untouched
(verified byte-for-byte: `/ota/current.json` and the bundle file are
unchanged by browsing any source on the Cards page).

### Deploy
- `git pull`, `docker compose build mjolnir-hub && docker compose up -d mjolnir-hub`.
- **One-time migration, runs automatically on hub boot**: hub's own
  migration runner applies `hub/migrations/020_operator_settings.sql`,
  adding a new `operator_settings` table (`key`, `value` JSONB,
  `updated_at`) in the shared `mjolnir` database — no manual step, no data
  backfill, nothing to run by hand. If you want to confirm it landed:
  `docker exec <postgres container> psql -U mjolnir -d mjolnir -c "\dt operator_settings"`.
- No new secrets, no env var changes.

### Flows to test live
1. **Cards page** (hub → Cards): confirm it is now **one flat table** —
   Card · Deck · Front (N) · Back (E) · Occurrences · ↗ — with no per-deck
   panels and no inline preview row. Click a card's Front/Back text (not
   the ↗ icons) to open the popup.
2. **The popup**: confirm it shows the study card **alone** — no phone
   chrome, no status bar, no answer buttons — on the theme's screen
   background, with the deck name above it. Switch Light ↔ Dark and
   confirm the colour *inside* the card border and the margin *around* it
   match (white in Light, `#1B1D21` in Dark) — this was the exact bug you
   rejected the old preview over.
3. **Direction switch**: pick a card with both N and E occurrences, toggle
   N ↔ E, and confirm the top/middle faces swap and the audio icon follows
   whichever face is currently showing the card's `A` side.
4. **Tap-to-play**: tap the face carrying audio on a card whose clip is
   present — it should actually play, with no visible `<audio>` control
   anywhere. Tap a different face — a brief "no audio on this face" message.
5. **Tools drawer**: click "Tools", drag its edge to resize it (the card
   should visibly shrink to fit while you drag), reload the page and
   reopen a card's popup — the drawer should reopen at the size you left
   it. Try the Edit HTML tab: type into the N/E/X editors, confirm the
   card re-renders live, select some text and click a colour swatch to
   wrap it in a `<span class="...">`, then hit Reset and confirm the
   `edited (throwaway)` chip disappears and the card goes back to its
   stored content. Reload the page — the edit should be nowhere, including
   in the database (it was never saved).
6. **Classes & tags / Symbols tables** (inside Tools): click a few rows —
   each should copy something to your clipboard and show a brief "Copied"
   confirmation. Colour class rows (`.teal`, `.royalRed`, etc.) should show
   their actual colour in the Sample column.
7. **Source picker**: switch from `Minted (hub ledger)` to a published
   build — the table should refilter to exactly that build's cards, with
   hub-minted ones carrying a small dot, and the Minted-only filters
   (grammar rule, audio-missing, etc.) should grey out rather than vanish
   or break.
8. **Filters, sort, pagination**: try the *Pending E sides* and *Uses IPA*
   saved views, change page size, and confirm the occurrence cells (small
   N/E/A boxes) look the same here as on the builder's ship-strips page —
   same colours for shipped/staged-flushing/staged-held/pending.
9. **Settings persistence**: change the theme, font size, or page size,
   then reload the page (or open it in a different browser) — your choices
   should still be there. This is the new `operator_settings` table at
   work; nothing to configure, it's automatic.

### Known follow-ups (not blocking, not regressions)
- None outstanding. All 41 acceptance criteria passed on the final
  re-verification pass (`acceptance.md` in the archived change folder).
  Two rounds of fixes landed first: a tools-drawer scope bug, a missing
  `[hidden]` CSS override on the Minted-only legend, the card-stage
  background colour, default-direction persistence across popup reopen,
  a silent bundle-degrade path, an empty class filter in Bundle mode, the
  extractor not failing loudly on a missing fixed colour-class anchor, a
  trailing `<br>` not producing a second line box, and the drawer's resize
  handle being mispositioned by a corrupted CSS comment.
- Line metrics (Poppins/Arial line-height) and whether long `.flex`
  children wrap are *inferred*, not read from the device — the design
  record flagged this as unverified against a real phone. Compare a real
  screenshot against the preview when you get a chance; a mismatch is a
  new backlog item, not a build defect.

### Live feedback addressed (2026-11-20, commit `bdd4e2f8`)
Four small items from actually using the built page:
- A "Save view…" control next to the two built-in presets, so you can
  name and keep your own filter/sort/page-size combinations. Try it:
  set some filters, click Save view…, name it, and it reappears in the
  Saved views dropdown (persisted server-side, survives a reload).
- Ctrl/Cmd+Z and Shift+Z/Y now undo/redo inside the drawer's HTML
  editors (they didn't before — the syntax highlighter's repaint was
  silently breaking the browser's native undo on every keystroke).
- Reset/Copy HTML/Copy all buttons now stand out (accent-colored),
  instead of blending into every other control in the bar.
- Clicking a class row (Classes & tags) now copies just the class name
  (`royalRed`), not `class="royalRed"`.

Caught along the way: a pre-existing bug in the generic settings client
that silently blocked a live fetch for any setting key other than the
popup's own prefs — the new Save-view feature was the first thing to
actually hit it. Worth knowing if a future feature's settings seem to
silently not load: check `cardPreviewPopup.js`'s `settingsCache` seeding
first.
