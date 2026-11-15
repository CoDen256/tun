# calst-audio-union — design

## Context

Two crawls of the same NTNU recording corpus exist in `smia/providers/`:

- **pygmalion/**: 1,176 committed mp3s (180 words, 7 dialects, Normal+Slow), already imported into `pygmalion_audio` and served by the `pygmalion` /tts adapter (exact casefolded lookup, candidates per recording).
- **calst/**: `calst_manifest.json` (50 MB, committed), referencing 8,441 Oslo_Normal mp3s for 3,375 words on the same host (`polymetis.hf.ntnu.no/.../Words_MP3/`), each mapping to exactly one word text. 868 of pygmalion's files appear in it; 7,573 files are new.

Infrastructure already exists: `scripts/fetch_pygmalion_audio.py` (offline `extract` → `manifest.jsonl`, polite resumable `download`), `scripts/import_pygmalion.py` (idempotent, sha-verified import into cache + table), bootstrap import when the table is empty.

Operator decisions (design session 2026-11-15): one combined provider under the existing `pygmalion` id; download and commit all 7,573 files; cap /tts at 2 takes per (word, dialect) because the takes sound like a single speaker and metadata carries no speaker id.

## Goals / Non-Goals

**Goals:**
- Union the two corpora under the one existing provider; word coverage 180 → ~3,400.
- Reuse the extract/download/import machinery; no new pipeline.
- Keep every recording in git, the cache, and the table; cap only what /tts returns.

**Non-Goals:**
- No new provider id, no renaming (`pygmalion` stays despite being a corpus-name misnomer — renaming ripples to stabbur and docs for zero functional gain).
- No dialect/Slow recovery from calst (its crawl references Oslo_Normal only).
- No use of calst's lesson/exercise/translation structure — tts needs word → audio only.
- No UI work.

## Decisions

1. **Extend extraction, not a parallel manifest.** `fetch_pygmalion_audio.py extract` gains the calst manifest as a second source feeding the same `audio/manifest.jsonl`. Rationale: the download/resume/import contract is keyed on that one manifest; a second manifest would duplicate the whole pipeline. Rows get `dialect: "Oslo"`, word from the calst wordList text (casefolded at import as today), takes numbered continuing after any existing (word, dialect) takes — re-extraction stays idempotent and never renumbers (existing spec scenario, preserved).
2. **Files already present are not re-downloaded.** The 868 overlapping basenames already exist under `Oslo/`; extract recognizes an existing file (same repaired-state logic the downloader already has: compute sha, mark `ok`).
3. **Take cap in the adapter, not the data.** `pygmalion_tts.lookup` returns at most 2 takes per (word, dialect), Oslo-first ordering unchanged. All rows stay in `pygmalion_audio`. Alternative rejected: importing only 2 takes — throws away data and makes a later cap change a re-crawl instead of a one-line edit.
4. **Provenance field.** Manifest rows from calst carry `"origin": "calst"` so a future untangling is possible; the import and adapter ignore it.

## Risks / Trade-offs

- [~52 MB more committed audio] → consistent with the existing committed-corpus convention; git handles it; one-time.
- [Word texts from calst include capitalized items (letters "A", "B") and phrases] → import already casefolds; phrases kept verbatim per existing spec.
- [Bootstrap imports only when `pygmalion_audio` is empty] → deploy requires a one-time truncate + restart (or manual import run) — spelled out in the operator checklist.
- [polymetis could throttle/block a 7,573-file crawl] → downloader is already polite (single connection, jitter, Retry-After, resume); run is operator-side, resumable at any point.

## Migration Plan

Dev: run extract, download (resumable, ~52 MB), commit files + manifest, run import, verify /tts. Deploy: pull, rebuild, truncate `pygmalion_audio`, restart (bootstrap re-imports). Rollback: revert the commit; old table rows re-import from the old manifest the same way.

## Open Questions

(none — operator decisions above settle the open points)
