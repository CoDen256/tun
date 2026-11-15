# calst-audio-union

## Why

The CALST crawl (`providers/calst/calst_manifest.json`) references 8,441 Oslo_Normal recordings covering 3,375 words — the same NTNU corpus, host, and filename scheme as the 1,176 already-imported pygmalion files, but 18× the word coverage (pygmalion: 180 words). 7,573 of those files are not yet downloaded. Exploration settled the "subset" question: neither corpus contains the other (pygmalion's dialect/Slow takes are absent from calst; calst's word breadth is absent from pygmalion), so the right shape is a union exposed through the existing `pygmalion` /tts provider.

## What Changes

- Extend the pygmalion manifest extraction with a second source: the calst crawl manifest. New rows land in the same `providers/pygmalion/audio/manifest.jsonl` as `dialect: "Oslo"` rows with `origin: "calst"`, take numbering continuing after existing takes — existing rows are never renumbered or deleted.
- Download all 7,573 missing files (~52 MB) with the existing polite, resumable downloader into `providers/pygmalion/audio/Oslo/`, committed like the rest of the corpus (the full archive lives in git).
- **Import only what /tts should serve**: Slow recordings are excluded entirely, and at most the **first 2 Normal takes per (word, dialect)** enter `pygmalion_audio` + the audio cache. The skip policy is recorded as metadata in the manifest itself (`surplus: true` on every excluded row), so what was imported vs. merely archived is readable from disk. The adapter stays unchanged — it serves whatever the table holds.
- The import becomes an **operator-run script with a live progress display** (like `fetch_pygmalion_audio.py` has), with a plain fallback so bootstrap's import-when-empty path still works in the runtime image.
- Provider id stays `pygmalion`; no caller changes (D-S1: one combined provider, no fallback chains).

## Capabilities

### New Capabilities

(none)

### Modified Capabilities

- `pygmalion-audio-fetch`: extraction gains the calst manifest as a second source; take numbering must extend, never renumber; extraction marks surplus rows (Slow, or beyond the first 2 Normal takes per word/dialect); the import skips surplus rows and shows live progress when run interactively.

## Impact

- `smia/scripts/fetch_pygmalion_audio.py` (extract step + surplus marking), `smia/scripts/import_pygmalion.py` (surplus skip + progress display), `providers/pygmalion/audio/` (~52 MB new committed mp3s + manifest rows).
- `pygmalion_audio` table: ~180 → ~3,400 words, at most 2 rows per (word, dialect), zero Slow recordings (17 existing Slow rows drop out on re-import). `/providers` count reflects it.
- Re-import is a one-time operator step (truncate `pygmalion_audio`, run the script) — operator checklist item.
- No API shape change, no new provider id, no UI work, no device-plane contact.
