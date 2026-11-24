# tts-candidate-matching — tasks

## 1. Pygmalion fuzzy tiers

- [x] 1.1 One `normalize` function (casefold, whitespace, punctuation, leading å/en/ei/et/ein/eit, ` + ` join) + trailing-particle stripping, unit-tested on the corpus shapes in design.md
- [x] 1.2 Alembic migration: `pygmalion_audio.match_key` + index; import fills it
- [x] 1.3 Adapter: tier 1 → 2 → 3, first non-empty tier answers; tier-2/3 candidates carry `context` = stored word
- [x] 1.4 Tests per spec scenarios (incl. exact hit not diluted)

## 2. dict.cc speaker in `voice`

- [x] 2.1 Investigate whether the audio endpoint can fetch a specific recording; record the finding in DECISIONS-MADE.md
- [x] 2.2 Parse `<user>` from recording keys; set `voice` per the requirement (one candidate per recording if fetchable, else only for single-recording entries)
- [x] 2.3 Tests with recorded fixtures

## 3. Docs + handoff

- [x] 3.1 Update `smia/CLAUDE.md` (pygmalion now sets `context` on fuzzy candidates) and `docs/06-smia.md` provider notes
- [ ] 3.2 OPERATOR-CHECKLIST: purge `lookup_cache` rows for (tts, pygmalion) and (tts, dictcc_api); re-import pygmalion (shared with calst-full-coverage)
