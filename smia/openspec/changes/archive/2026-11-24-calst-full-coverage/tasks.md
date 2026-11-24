# calst-full-coverage — tasks

## 1. Crawler

- [x] 1.1 Parse every `Calst.<Name> = [ … ]` word-list array (incl. `Calst.WordList`); a 200 with no parsed words is a recorded failure
- [x] 1.2 Request type `LAS` only; per-(exercise, dialect) sampling to saturation (cap detection, K consecutive zero-gain samples, request cap → `unsaturated`)
- [x] 1.3 Cache key = (exercise, dialect, sample index); treat the existing committed cache entries as Oslo sample 0 so known data is not re-requested
- [x] 1.4 Failure isolation per (exercise, dialect) with a longer-timeout retry; no whole-exercise skipping
- [x] 1.5 Discover the `L2_Dialect` values CALST offers; crawl each
- [x] 1.6 End-of-run coverage report + non-zero exit on any unsaturated/failed
- [x] 1.7 Unit tests from cached/fixture bodies: WordList parsed; empty parse → failure; small pool stops at 1 sample; saturation stop rule; cache key distinctness; report + exit code

## 2. Data

- [x] 2.1 Run the crawl (exit 0, or every remaining failure explained in DECISIONS-MADE.md); commit `calst_manifest.json` + cache — Oslo only (operator decision); exit 0, 354/354 saturated, c5a46246
- [x] 2.2 `extract` → `download` → commit new mp3s + `manifest.jsonl` (2-take cap and Slow exclusion unchanged) — 1,454 new rows, 7040e400 (after the take-renumbering fix c69fc600)
- [x] 2.3 Truncate `pygmalion_audio` in dev, run `python -m scripts.import_pygmalion`, verify per acceptance.md — 7,160 imported, tester PASS

## 3. Handoff

- [x] 3.1 OPERATOR-CHECKLIST: deploy = pull, rebuild, truncate `pygmalion_audio`, run the import
