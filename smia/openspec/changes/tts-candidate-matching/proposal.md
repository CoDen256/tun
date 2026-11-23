# tts-candidate-matching

## Why

Two backlog items in batch `smia-tts`:

- `[idea] fuzzy search for pygmalion, since there are a lot of similar audios at least should ignore "å"/"en/et/ie" prefixes and any particiles afterwards?`
- `[ux] smia source should specify name of the human`

**Fuzzy.** `pygmalion` matches the casefolded text exactly, but the corpus
stores many words in forms no caller sends. Of 3,391 words (2026-11-23):
505 carry an article or `å` (`ei avis`), 56 are compounds written with
` + ` (`bok + handel`), 91 are capitalised and/or punctuated (`Hallo!`).
So `avis`, `bokhandel` and `hallo` miss today although the audio exists,
and a caller sending `en bil`, `å stille` or `stille opp` misses the
stored `bil` / `stille`.

**Speaker name.** dict.cc human candidates say only `source: "human"`, but
dict.cc's recordings endpoint names each speaker (keys shaped
`<recId>_<user>_<country>_lid<N>_v`). CALST and the old pygmalion corpus
have no names — only dialect — so the name applies to dict.cc.

## What Changes

- `pygmalion` lookup gains tiers, used **only when the previous tier
  returned nothing**: (1) exact, as today; (2) normalized key on both
  sides; (3) the query with trailing particles dropped, normalized.
- A candidate from tier 2 or 3 carries `context` = the stored text it
  matched (`"ei avis"`, `"stille"`), so the caller sees it is not exact.
- dict.cc human `/tts` candidates carry the speaker's dict.cc user name in
  **`voice`** (operator's choice over a new field). Each Norwegian recording
  of an entry becomes its own candidate when dict.cc can serve a recording
  by id.

## Capabilities

### Modified Capabilities
- `tts-api`: the `pygmalion` requirement (matching tiers, `context` on
  fuzzy candidates); dict.cc human candidates' `voice`.

## Impact

- `adapters/pygmalion_tts.py`, `pygmalion_audio` (a normalized match key,
  filled at import), `scripts/import_pygmalion.py`, `adapters/dictcc_api.py`.
- Cached `/tts` responses for `pygmalion` and `dictcc_api` predate the new
  fields; they must be purged on deploy (the lookup cache has no version).
- `smia/CLAUDE.md`'s "Other providers set no `context`" sentence becomes
  stale for `pygmalion` and is updated.
- stabbur unchanged: it already shows `context` on audio candidates and
  ignores `voice`.
