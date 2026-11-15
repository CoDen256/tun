# calst-audio-union — design

## Context

Two crawls of the same NTNU recording corpus exist in `smia/providers/`:

- **pygmalion/**: 1,176 committed mp3s (180 words, 7 dialects; 1,159 Normal + 17 Slow), already imported into `pygmalion_audio` and served by the `pygmalion` /tts adapter (exact casefolded lookup, candidates per recording).
- **calst/**: `calst_manifest.json` (50 MB, committed), referencing 8,441 Oslo_Normal mp3s for 3,375 words on the same host (`polymetis.hf.ntnu.no/.../Words_MP3/`), each mapping to exactly one word text. 868 of pygmalion's files appear in it; 7,573 files are new.

Infrastructure already exists: `scripts/fetch_pygmalion_audio.py` (offline `extract` → `manifest.jsonl`, polite resumable `download` with a rich live progress display), `scripts/import_pygmalion.py` (idempotent, sha-verified import into cache + table), bootstrap import when the table is empty.

Operator decisions (design session 2026-11-15, revised same day): one combined provider under the existing `pygmalion` id; download and commit all files; **Slow recordings are not wanted at all**; **import only the first 2 Normal takes per (word, dialect)** — the rest stays archived on disk, with the skip recorded in metadata; the **import is run by the operator with a live progress display** like the fetch script's.

## Goals / Non-Goals

**Goals:**
- Union the two corpora under the one existing provider; word coverage 180 → ~3,400.
- Reuse the extract/download/import machinery; no new pipeline.
- The table holds exactly what /tts serves: ≤ 2 Normal takes per (word, dialect), no Slow. The full archive stays in git; the manifest records which rows were deliberately not imported.
- The import is a first-class operator script: live progress (processed/total, imported/skipped/surplus counts), resumable-safe (already idempotent), with a plain non-TTY fallback so bootstrap still works.

**Non-Goals:**
- No new provider id, no renaming (`pygmalion` stays despite being a corpus-name misnomer — renaming ripples to stabbur and docs for zero functional gain).
- No adapter changes — it serves whatever the table holds; no response-side capping.
- No deletion of Slow or surplus files from git — exclusion happens at import, not on disk.
- No use of calst's lesson/exercise/translation structure — tts needs word → audio only.
- No UI work.

## Decisions

1. **Extend extraction, not a parallel manifest.** `fetch_pygmalion_audio.py extract` gains the calst manifest as a second source feeding the same `audio/manifest.jsonl`. Rationale: the download/resume/import contract is keyed on that one manifest; a second manifest would duplicate the whole pipeline. Rows get `dialect: "Oslo"`, word from the calst wordList text, `origin: "calst"`, takes numbered continuing after any existing (word, dialect) takes — re-extraction stays idempotent and never renumbers (existing spec scenario, preserved).
2. **Surplus marking lives in the manifest, at extract time.** Extract stamps `surplus: true` on every row that import must skip: any Slow-speed recording, and any Normal take beyond the first 2 within its (word, dialect). This is the "metadata somewhere" the operator asked for: committed, human-readable, and it keeps the importer read-only with respect to the manifest. Alternatives rejected: capping in the adapter (table would hold rows /tts hides — confusing); importer-side-only policy (nothing on disk records what was skipped); a DB meta table (state about committed files belongs next to them).
3. **Importer skips surplus rows** and counts them separately in its summary. Everything else about it is unchanged (sha verification, content-addressed store, idempotent re-runs).
4. **Progress display mirrors the fetch script**: rich live bar when run interactively (dev-time dependency, same as fetch), plain stderr lines when rich is unavailable or not a TTY — bootstrap's `run()` path must not require rich in the runtime image.
5. **Files already present are not re-downloaded.** The 868 overlapping basenames already exist under `Oslo/`; the downloader's existing repaired-state logic (compute sha, mark `ok`) covers them. Surplus files ARE still downloaded — the git archive is complete; only the table is curated.

## Risks / Trade-offs

- [~52 MB committed audio, part of it never imported] → deliberate: the archive is complete and a later policy change (more takes, Slow back) is an extract+import re-run, not a re-crawl.
- [Existing 17 Slow rows and >2-take words are already in the table] → they drop out only on re-import; the operator checklist carries the truncate + re-run step.
- [Word texts from calst include capitalized items (letters "A", "B") and phrases] → import already casefolds; phrases kept verbatim per existing spec.
- [polymetis could throttle/block a 7,573-file crawl] → downloader is already polite (single connection, jitter, Retry-After, resume); run is operator-side, resumable at any point.

## Migration Plan

Dev: run extract (marks surplus), download (resumable, ~52 MB), commit files + manifest, truncate `pygmalion_audio`, run `python -m scripts.import_pygmalion` interactively, verify /tts. Deploy: pull, rebuild, truncate `pygmalion_audio`, run the import (or restart and let bootstrap do it — same result, no progress bar). Rollback: revert the commit; the old manifest re-imports the old corpus the same way.

## Open Questions

(none — operator decisions above settle the open points)
