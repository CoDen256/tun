# calst-audio-union — acceptance criteria

All testable in dev compose (`cd smia && docker compose up`) via the smia UI /
API with claude-in-chrome or curl. No live system needed.

1. **Corpus on disk.** `providers/pygmalion/audio/manifest.jsonl` contains ≥ 8,700 rows, every row `status: "ok"`, and `providers/pygmalion/audio/Oslo/` holds ≥ 7,900 mp3 files whose sha256 match their manifest rows (spot-check 5). Rows sourced from calst carry `origin: "calst"`.
2. **Provider count grew.** After a fresh import (truncate `pygmalion_audio`, restart), `GET /providers` lists tts provider `pygmalion` with a recording count ≥ 9,000 (was 1,176).
3. **A calst-only word resolves.** `POST /tts {text: "fastsatt", lang: "nb", provider: "pygmalion"}` (or another word absent from the old 180-word set) returns ≥ 1 candidate with `source: "human"`, `voice: "Oslo"`, and a `sha256` that `GET /tts/{sha256}` serves as playable mpeg audio.
4. **Cap at two takes per dialect.** For a word with ≥ 3 Oslo rows in `pygmalion_audio` (verified by SQL), `POST /tts` returns exactly 2 candidates with `voice: "Oslo"` — while the table still holds all its rows.
5. **Old corpus intact.** `POST /tts {text: "led", lang: "nb", provider: "pygmalion"}` still returns multi-dialect candidates, Oslo first, each dialect capped at 2; candidate keys remain a subset of `{sha256, source, voice}`.
6. **Idempotent re-extraction.** Running `extract` twice in a row produces a byte-identical `manifest.jsonl` (no renumbered takes, no duplicate rows), and `download` immediately after reports 0 files to fetch.
7. **Miss is still a success.** `POST /tts {text: "zzzz-not-a-word", lang: "nb", provider: "pygmalion"}` returns `{provider, candidates: []}` with HTTP 200.
