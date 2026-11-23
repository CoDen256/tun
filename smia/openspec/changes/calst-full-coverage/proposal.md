# calst-full-coverage

## Why

The `pygmalion` /tts provider misses words the operator has heard on CALST
(`målende`, `målene`, `bindende`, `bindene`, `seilende`, …). The design session
of 2026-11-23 found three independent defects in `scripts/crawl_calst.py`,
which produced `providers/calst/calst_manifest.json` on 2026-11-13:

1. **CALST samples randomly.** `POST /Exercises/Details` returns a random
   draw of at most 20 words (10 pairs) from the exercise's word pool on every
   request. The crawler made one request per (exercise, type). A live probe of
   exercise 947 ("Tonelag 1C") grew the pool to ≥ 94 words in 14 requests —
   `målende` first appeared on the 3rd. All five types draw from the SAME pool
   (AXB == MP in 272/307 exercises, LAS == LAW in 314/350 — the differences
   are exactly the oversized pools), so the old crawl only ever saw ≤ 5
   draws of each pool, by accident.
2. **An unrecognised data variable was silently empty.** The Tonelag 1A–4B
   and "Word pairs" exercises keep their data in `Calst.WordList`, which is
   not in `DATA_VARS`, so 20 responses were HTTP 200 with zero words parsed,
   and the run reported success. 147 words / 308 files are recoverable from
   the committed cache alone.
3. **One failing type threw away a whole exercise.** Exercises 935–938
   ("Stress, 2/3 syllables") hang server-side on AXB/MP, still, today; the
   crawler skipped the exercise entirely, discarding LAS/LAW, which answer
   in ~4 s.

Additionally the crawl only ever asked for `L2_Dialect=1` (Oslo).

## What Changes

- The crawler requests ONE type per exercise — **LAS** (answers for all 350
  exercises; AXB/MP 300-redirect for 43 and hang for 935–938; LAC answers for
  only 43) — and **samples each exercise until its pool is saturated**. A
  response with fewer than the cap (20 words) is the whole pool: one request.
- Every `Calst.<Name> = [ … ]` array holding word lists is parsed; a 200 that
  yields no words is a **failure**, never an empty success.
- Every dialect CALST offers (`L2_Dialect` values) is crawled; each dialect's
  recordings become further `voice`s on the existing `pygmalion` provider.
- Each run prints a **coverage report** and exits non-zero on any failure.
- Extract → download → import is reused unchanged in policy: ≤ 2 Normal takes
  per (word, dialect), no Slow.

## Capabilities

### New Capabilities
- `calst-crawl`: how the CALST corpus is crawled — sampling to saturation,
  dialect coverage, loud failure, coverage report.

### Modified Capabilities
(none — extraction already walks word lists at any depth and derives the
dialect from the filename; the import policy is unchanged)

## Impact

- `smia/scripts/crawl_calst.py`, `providers/calst/` (manifest + cache),
  `providers/pygmalion/audio/` (new mp3s + manifest rows), `pygmalion_audio`
  table (truncate + re-import on deploy).
- No API shape change: candidates stay `{sha256, source: "human", voice}`.
- Device plane untouched; stabbur untouched.
