# calst-audio-union — tasks

## 1. Extraction

- [ ] 1.1 Extend `scripts/fetch_pygmalion_audio.py extract` with the calst source: read `providers/calst/calst_manifest.json`, walk wordList `sounds`, emit one manifest row per new `.mp3` basename (`word` from `text`, `dialect` from filename, `origin: "calst"`, take numbering continuing per `(word, dialect)`), never renumbering or deleting existing rows
- [ ] 1.2 Teach extract/download to recognize the 868 already-downloaded overlapping files (compute sha256, mark `ok`, no request)
- [ ] 1.3 Unit tests: calst rows extend takes; duplicate basenames skipped; re-extraction idempotent; existing pygmalion extraction unchanged

## 2. Download and commit

- [ ] 2.1 Run `extract`, then `download` for the ~7,573 missing files into `providers/pygmalion/audio/Oslo/` (resumable; expect ~52 MB)
- [ ] 2.2 Verify every manifest row is `status: "ok"` with matching sha256; commit the mp3s and the updated `manifest.jsonl`

## 3. Import and adapter

- [ ] 3.1 Confirm `scripts/import_pygmalion.py` ingests the extended manifest unchanged (casefolded words, phrases verbatim); truncate `pygmalion_audio` in dev and re-import via bootstrap
- [ ] 3.2 Cap `adapters/pygmalion_tts.py` at two takes per `(word, dialect)` in the returned candidates, ordering and dedup-by-sha256 unchanged
- [ ] 3.3 Unit tests: cap-at-two (4 Oslo takes → first 2 returned), calst-only word resolves, non-nb and miss behavior unchanged

## 4. Verification

- [ ] 4.1 `pytest` green; `/providers` reports the grown pygmalion count; `POST /tts` spot-checks per acceptance.md
