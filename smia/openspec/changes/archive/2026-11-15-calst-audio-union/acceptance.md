# calst-audio-union — acceptance criteria

All testable in dev compose (`cd smia && docker compose up`) via the smia UI /
API with claude-in-chrome or curl, plus the import script in a terminal. No
live system needed.

1. **Corpus on disk.** `providers/pygmalion/audio/manifest.jsonl` contains ≥ 8,700 rows, every row `status: "ok"`, and `providers/pygmalion/audio/Oslo/` holds ≥ 7,900 mp3 files whose sha256 match their manifest rows (spot-check 5). Rows sourced from calst carry `origin: "calst"`.
2. **Surplus marking is on disk and correct.** Every `_Slow_` row in the manifest has `surplus: true`; for any word with > 2 Normal rows in one dialect, exactly the first 2 takes lack the surplus flag. The 17 pre-existing Slow files are still present on disk and still `status: "ok"`.
3. **Operator-run import shows progress.** Running `python -m scripts.import_pygmalion providers/pygmalion/audio/manifest.jsonl` in a terminal (after truncating `pygmalion_audio`) displays a live progress bar/counter (processed-of-total with running imported/existing/surplus counts) and ends with a summary line that includes a non-zero `surplus` count.
4. **Table is curated.** After that import, SQL on `pygmalion_audio` shows: no `(word, dialect)` group with more than 2 rows, and zero rows whose manifest source is a Slow file. Total row count ≥ 6,000 (was 1,176).
5. **Provider count grew.** `GET /providers` lists tts provider `pygmalion` with a recording count equal to the curated table size (≥ 6,000).
6. **A calst-only word resolves.** `POST /tts {text: "fastsatt", lang: "nb", provider: "pygmalion"}` (or another word absent from the old 180-word set) returns 1–2 candidates with `source: "human"`, `voice: "Oslo"`, and a `sha256` that `GET /tts/{sha256}` serves as playable mpeg audio.
7. **No over-long candidate lists.** For a word that has > 2 Normal Oslo recordings in the manifest, `POST /tts` returns exactly 2 `voice: "Oslo"` candidates.
8. **Old corpus intact, minus Slow.** `POST /tts {text: "led", lang: "nb", provider: "pygmalion"}` still returns multi-dialect candidates, Oslo first; candidate keys remain a subset of `{sha256, source, voice}`.
9. **Idempotent re-extraction.** Running `extract` twice in a row produces a byte-identical `manifest.jsonl` (same surplus marking, no renumbered takes, no duplicate rows), and `download` immediately after reports 0 files to fetch.
10. **Miss is still a success.** `POST /tts {text: "zzzz-not-a-word", lang: "nb", provider: "pygmalion"}` returns `{provider, candidates: []}` with HTTP 200.
11. **Bootstrap fallback works.** Inside the smia container (no rich / no TTY), a truncate + restart re-imports via bootstrap with plain log output and no error, yielding the same table counts as criterion 4.
