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
