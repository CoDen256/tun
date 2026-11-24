# calst-full-coverage — design

## Context

See proposal.md for the three defects. Evidence, all from 2026-11-23:

- Cached 947 AXB: 10 pairs (nysende, håpende, trekkende, saltende, tapende,
  pustende, bindende, sparkende, sårende, hoppende), each played twice
  (trials 1–20). The operator's browser paste of the same exercise: a
  different 10 (seilende, dyppende, fallende, undrende, blinkende,
  treffende, hakkende, lysende + bindende, sparkende).
- Live probe, 14 requests to 947 alternating AXB/MP: pool 20 → 38 → 52
  (målende) → 62 → 74 → 76 → 82 → 84 → 84 → 88 → 88 → 88 → 92 → 94, still
  growing. Increments of 0 can be followed by +4: saturation needs a run of
  several zero-gain samples, not one.
- Response-size distribution across all types: the mode is exactly 20 words
  (≈ 210 of 350); a response below 20 is a complete pool.

## Decisions (operator, design session 2026-11-23)

1. **One type: LAS.** All types share the pool, so crawling several is only
   accidental extra sampling. LAS is the one type that answers for every
   exercise, quickly, and carries the same `sounds` URLs.
2. **Sample to saturation.** Per (exercise, dialect): request; if the
   response has fewer than the cap, done. Otherwise keep requesting until K
   consecutive responses add no new word, or a hard cap of requests is hit
   (then the exercise is reported `unsaturated`, which counts as a failure).
   K, the cap and the request pacing are builder's choices (tier 2). For
   reference: a 47-pair pool drawn 10 at a time needs ~30 draws for a
   < 0.1 % chance that any pair is still unseen.
3. **Each sample is its own cache entry.** Today the cache key is the
   request alone, so a re-run replays the single stored sample forever. The
   key gains the dialect and the sample index. The existing committed cache
   stays usable as sample 0 for Oslo (no re-download of what is known).
4. **Failure isolation per (exercise, dialect).** A timeout is retried with a
   longer timeout; a persistent failure is recorded and the crawl continues.
5. **All dialects.** The crawler discovers the `L2_Dialect` values CALST
   offers and crawls each. Extraction already derives `dialect` from the
   filename (`<Dialect>_<Speed>_<id>.mp3`), so a non-Oslo file lands under
   its own directory and becomes another `voice` with no adapter change.
   If CALST offers only Oslo, that is recorded in the coverage report and
   the criterion for a non-Oslo voice is reported N/A, not faked.
6. **Loud failure + coverage report.** End of run: one line per (exercise,
   dialect) — title, pool size, samples taken, saturated/unsaturated/failed —
   then a failure list; exit non-zero if the list is non-empty. A 200 with
   no parsed word list is a failure carrying the exercise id and a body hint.
7. **Everything after the crawl is unchanged policy**: extract (no network),
   download (resumable, polite), import ≤ 2 Normal takes per (word, dialect),
   Slow excluded, truncate + re-import to deploy (as in calst-audio-union).

## Non-Goals

- No fuzzy matching here (separate change in this package).
- No use of CALST tone patterns, stress patterns or exercise structure —
  word → audio only, as before.
- No new response fields.

## Risks

- **Server load / blocking.** Saturation adds requests, but only ~36 of 350
  pools per dialect exceed the cap; the rest cost one request each. Polite
  pacing and resumability are already in the crawler.
- **Exercises that hang even on LAS** → reported as failures, crawl
  continues; the operator sees them in the report.
- **More dialects = more audio in git.** Accepted by the operator.

## Migration

Dev: run the crawl (report must exit 0), extract, download, commit,
truncate `pygmalion_audio`, run the import. Deploy: pull, rebuild, truncate
`pygmalion_audio`, run the import (or restart for the bootstrap path).
