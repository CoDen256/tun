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
