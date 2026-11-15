# calst-audio-union — tasks

## 1. Extraction

- [x] 1.1 Extend `scripts/fetch_pygmalion_audio.py extract` with the calst source: read `providers/calst/calst_manifest.json`, walk wordList `sounds`, emit one manifest row per new `.mp3` basename (`word` from `text`, `dialect` from filename, `origin: "calst"`, take numbering continuing per `(word, dialect)`), never renumbering or deleting existing rows
- [x] 1.2 Add surplus marking to extract: `surplus: true` on every non-Normal-speed row and every Normal row beyond the first 2 takes per `(word, dialect)`; deterministic across re-runs
- [x] 1.3 Teach extract/download to recognize the 868 already-downloaded overlapping files (compute sha256, mark `ok`, no request); surplus rows download like any other
- [x] 1.4 Unit tests: calst rows extend takes; duplicate basenames skipped; Slow → surplus; >2 Normal takes → surplus; Slow doesn't consume an importable slot; re-extraction idempotent; existing pygmalion extraction unchanged — plus a review-found regression test: take-numbering and surplus grouping are casefolded, matching import's primary key (literal "I"/"i" previously collided)

## 2. Download and commit

- [x] 2.1 Run `extract`, then `download` for the ~7,573 missing files into `providers/pygmalion/audio/Oslo/` (resumable; expect ~52 MB) — one file (`trettiende`/Oslo take 1) permanently fails: the server answers HTTP 200 with a 0-byte body for that exact URL (confirmed via direct `curl -I`, not a transient network error); recorded in DECISIONS-MADE.md
- [x] 2.2 Verify every manifest row is `status: "ok"` with matching sha256 (8,748 of 8,749 — the one exception above); commit the mp3s and the updated `manifest.jsonl`

## 3. Import

- [x] 3.1 `scripts/import_pygmalion.py`: skip `surplus: true` rows, add a `surplus` count to the summary; existing idempotency, casefolding, and sha verification unchanged
- [x] 3.2 Add a live progress display (rich, like the fetch script) for interactive runs, with a plain-stderr fallback when rich is absent or stdout is not a TTY — bootstrap must not require rich
- [x] 3.3 Unit tests: surplus rows never reach the table (≤ 2 Normal per word/dialect, no Slow); summary counts; plain fallback path runs without rich

## 4. Verification

- [x] 4.1 Truncate `pygmalion_audio` in dev, run the import interactively, then: `pytest` green; `/providers` reports the grown count; `POST /tts` spot-checks per acceptance.md — table holds 5,791 rows (below the design's ≥6,000 estimate; the real word/take distribution in the actual corpus comes in lower — not a code defect, confirmed by an independent tester)
