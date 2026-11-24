# smia-tts

Batch opened 2026-11-23 from one triaged package.

## Dependencies

None — single package. (The sibling backlog package "smia provider data, PoS
ownership & responses" also touches dict.cc `/tts`, but is not in this batch.)

## Status

| package | status |
|---|---|
| smia tts provider data and ui | archived 2026-11-24 — smia: `calst-full-coverage` (item 5), `tts-candidate-matching` (items 2, 4), `smia-ui-tts-polish` (items 1, 3) |

## Packages

### smia tts provider data and ui
projects: smia

[ux] smia ui put provider healch below the "manual try it"
[ux] smia source should specify name of the human
[ux] smia ui nice ux idea: can we somehow add within the json response text field small play buttons, near "sha256" that will play the audio when pressed, instead of placing them below the response field
[idea] fuzzy search for pygmalion, since there are a lot of similar audios at least should ignore "å"/"en/et/ie" prefixes and any particiles afterwards?
[seed] provider pygmalion no entry for målende, målene, missing some big portion of audios, that accessible via calst, need to check the import and reimport of calst. very important, need discussion and thorough diagnose

## Design notes (2026-11-23)

- Build order inside the package: `calst-full-coverage` before
  `tts-candidate-matching` — the fuzzy tiers' `match_key` is filled by the
  re-import the CALST change requires, and the fuzzy acceptance words come
  from the corpus it produces. `smia-ui-tts-polish` is independent.
- Deploy: ONE truncate + re-import of `pygmalion_audio` serves both data
  changes; purge `lookup_cache` for (tts, pygmalion) and (tts, dictcc_api).

- Operator decision (build session, 2026-11-23): the FULL 8-dialect CALST
  crawl (~15–20 h) + extract + download + import runs on the VPS, operator-
  run, and the operator commits + pushes the resulting `providers/` data
  from the VPS. The build verifies locally with the Oslo crawl ONLY (no other
  dialect is crawled locally); `calst-full-coverage` acceptance 7 (a
  non-Oslo `voice`) is verified by the operator on the VPS via
  OPERATOR-CHECKLIST, which carries the VPS commands.

- Operator decision (build session, 2026-11-23): claude-in-chrome cannot
  connect from this WSL setup, so `smia-ui-tts-polish` acceptance 2–7
  (playback, copy, layout, tooltip) are NOT agent-verified; the operator
  verifies them live via OPERATOR-CHECKLIST. Criterion 1 (section order)
  is checked over HTTP. Archive proceeds on that basis.

## Deferred to the builder (tier 2)

- CALST saturation parameters: K consecutive zero-gain samples, the
  per-exercise request cap, request pacing.
- How CALST's available `L2_Dialect` values are discovered.
- The exact trailing-particle list for fuzzy tier 3 (must include the
  minimum in `tts-candidate-matching/design.md`).
- Whether dict.cc can serve an individual recording (decides one candidate
  per recording vs. `voice` only on single-recording entries).

## Dropped / deferred

(none)
