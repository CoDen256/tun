# Acceptance criteria

Dev compose (`cd smia && docker compose up`), smia UI manual try-it
(kind `tts`) or curl; tick "Force refresh" for every check.

## Fuzzy pygmalion (item: "[idea] fuzzy search for pygmalion …")

1. Provider `pygmalion`, text `avis` → ≥ 1 candidate, each with
   `context: "ei avis"`, audio plays.
2. Text `bokhandel` → ≥ 1 candidate with `context: "bok + handel"`.
3. Text `hallo` → ≥ 1 candidate with `context: "Hallo!"`.
4. Text `en bil` and text `å stille` → candidates (if `bil` / `stille` are
   stored), each with `context` naming the stored word.
5. Text `stille opp` → candidates with `context: "stille"`.
6. Text `led` (stored exactly) → the same candidates as before this change,
   and none of them has a `context` key.
7. Text `zzzz-not-a-word` → HTTP 200, `candidates: []`.

## Speaker name (item: "[ux] smia source should specify name of the human")

8. Provider `dictcc_api`, text `stille` → every candidate with
   `source: "human"` either has a non-empty `voice` equal to a dict.cc
   user name, or (only when DECISIONS-MADE.md records that dict.cc cannot
   serve individual recordings) lacks `voice` because its entry has
   several Norwegian recordings. No candidate's `voice` is a dialect name.
9. If individual recordings are fetchable: for an entry with ≥ 2 Norwegian
   recordings, the response holds one candidate per recording, with
   different `voice` values.
10. Provider `pygmalion` candidates still carry `voice` = dialect
    (`Oslo`, `Bergen`, …).
