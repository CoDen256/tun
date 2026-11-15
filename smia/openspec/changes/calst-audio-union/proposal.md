# calst-audio-union

## Why

The CALST crawl (`providers/calst/calst_manifest.json`) references 8,441 Oslo_Normal recordings covering 3,375 words — the same NTNU corpus, host, and filename scheme as the 1,176 already-imported pygmalion files, but 18× the word coverage (pygmalion: 180 words). 7,573 of those files are not yet downloaded. Exploration settled the "subset" question: neither corpus contains the other (pygmalion's dialect/Slow takes are absent from calst; calst's word breadth is absent from pygmalion), so the right shape is a union exposed through the existing `pygmalion` /tts provider.

## What Changes

- Extend the pygmalion manifest extraction with a second source: the calst crawl manifest. New rows land in the same `providers/pygmalion/audio/manifest.jsonl` as `dialect: "Oslo"` rows, with take numbering continuing after existing takes — existing rows are never renumbered or deleted.
- Download all 7,573 missing files (~52 MB) with the existing polite, resumable downloader into `providers/pygmalion/audio/Oslo/`, committed like the rest of the corpus.
- Import them through the existing idempotent `import_pygmalion` path into `pygmalion_audio` + the audio cache. Provider id stays `pygmalion`; no caller changes (D-S1: one combined provider, no fallback chains).
- Cap `/tts` pygmalion candidates at **2 takes per (word, dialect)** — presentation-only; all recordings are still downloaded, committed, and imported. (Operator: takes sound like one speaker; metadata carries no speaker id, so keep 2 in case.)

## Capabilities

### New Capabilities

(none)

### Modified Capabilities

- `pygmalion-audio-fetch`: extraction gains the calst manifest as a second source; take numbering must extend, never renumber.
- `tts-api`: the pygmalion provider requirement changes from "one candidate per recording" to "at most 2 takes per (word, dialect)", still deduplicated by sha256 and Oslo-first ordered.

## Impact

- `smia/scripts/fetch_pygmalion_audio.py` (extract step), `smia/adapters/pygmalion_tts.py` (take cap), `providers/pygmalion/audio/` (~52 MB new committed mp3s + manifest rows).
- `pygmalion_audio` table grows ~180 → ~3,400 words; `/providers` count reflects it. Bootstrap import must be re-triggered (it only imports when the table is empty — operator checklist item).
- No API shape change, no new provider id, no UI work, no device-plane contact.
