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
