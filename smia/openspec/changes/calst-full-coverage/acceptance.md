# Acceptance criteria

All checkable in dev compose (`cd smia && docker compose up`) with curl or
claude-in-chrome on the smia UI, plus the crawl/import scripts in a
terminal. Run order: crawl → extract → download → truncate → import.

## calst-full-coverage (item: "[seed] provider pygmalion no entry for målende, målene …")

1. **The reported words resolve.** In the smia UI's manual try-it (kind
   `tts`, provider `pygmalion`), each of `målende`, `målene`, `bindende`,
   `bindene`, `seilende`, `seilene` returns ≥ 1 candidate with
   `source: "human"`, and the candidate's audio plays.
2. **The tonelag pool is complete.** The crawl's coverage report line for
   exercise 947 ("Tonelag 1C") shows status `saturated` and a pool of ≥ 94
   words, and every word in the 2026-11-23 probe list (design.md evidence,
   e.g. `fengslende`, `varslende`, `vrakende`, `lånende`) returns ≥ 1
   candidate from `/tts` provider `pygmalion`.
3. **Stress exercises are no longer skipped.** The coverage report has lines
   for exercises 935, 936, 937 and 938, each with a pool size > 0, and
   `calst_manifest.json` no longer lists any of them under `skipped`.
4. **Small pools cost one request.** For an exercise whose pool is below the
   cap (e.g. 937, 19 words on 2026-11-23), the report shows `samples 1`.
   *(Build note 2026-11-24: 937's real pool is 100 — the 19 came from a
   single draw. Checked instead on all 102 exercises with pool < 20:
   every one shows `samples 1`. PASS.)*
5. **Empty parse fails loudly.** Running the crawler's parser over a
   fixture 200 body that holds no word list makes the run exit non-zero, and
   the failure list names that exercise id.
6. **Re-run is free.** A second crawl run with the cache intact makes zero
   network requests (the report or log shows 0 network calls) and writes a
   byte-identical `calst_manifest.json`.
7. **Dialects.** The coverage report lists the `L2_Dialect` values found.
   If more than Oslo exists: for some word in a non-Oslo pool,
   `/tts` provider `pygmalion` returns a candidate whose `voice` is that
   dialect. If only Oslo exists, the report says so (criterion N/A).
8. **Import policy unchanged.** After the import, no `(word, dialect)` in
   `pygmalion_audio` has more than 2 rows and no row comes from a `_Slow_`
   file; `GET /providers` shows the `pygmalion` count equal to the table's
   row count and larger than before (5,791).
