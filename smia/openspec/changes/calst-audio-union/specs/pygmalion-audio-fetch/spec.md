# pygmalion-audio-fetch — delta for calst-audio-union

## MODIFIED Requirements

### Requirement: Recording inventory is extracted into a manifest
`scripts/fetch_pygmalion_audio.py extract` SHALL read `providers/pygmalion/vowels.json` and `providers/pygmalion/consonants.json`, visit every `MP_wordpair` record at any depth, and write `providers/pygmalion/audio/manifest.jsonl` with one JSON row per distinct audio file. It SHALL additionally read `providers/calst/calst_manifest.json`, visit every wordList entry's `sounds` at any depth, and emit one row per distinct `.mp3` basename not already present in the manifest, with `word` taken from the entry's `text`, `dialect` and the speed component parsed from the filename (`Oslo_Normal_…` → `Oslo`), `origin: "calst"`, and `path` under the dialect's directory. Each row SHALL carry `word`, `dialect`, `take`, `translation`, `url`, `path` and `status`. For pygmalion-sourced rows the `dialect` SHALL be derived from the `audio_<Dialect>` key the path was listed under, never from the filename. The `url` SHALL be the fixed base `https://polymetis.hf.ntnu.no/static/WordObjectContent/Norwegian/Words_MP3/` followed by the path's basename. The `take` SHALL be the file's 0-based order of first appearance within its `(word, dialect)`, with calst-sourced rows numbered after any existing takes of the same `(word, dialect)` — re-extraction SHALL never renumber or delete an existing row. This command SHALL NOT perform any network request.

#### Scenario: The same word repeated across exercises yields one row per file
- **WHEN** the word `led` appears in several exercises listing the same Oslo file
- **THEN** the manifest contains exactly one row for that file, with `word: "led"` and `dialect: "Oslo"`

#### Scenario: Dialect comes from the key, not the filename
- **WHEN** a path is listed under `audio_Sandnessjøen` and its basename starts with `Sandnessjoeen_`
- **THEN** the row's `dialect` is `Sandnessjøen` and its `path` is under the `Sandnessjoeen/` directory

#### Scenario: Takes are numbered per word and dialect
- **WHEN** `led` has two distinct Oslo files and one Bergen file
- **THEN** the Oslo rows have `take` 0 and 1 and the Bergen row has `take` 0

#### Scenario: Calst takes extend, never renumber
- **WHEN** a word already has Oslo takes 0 and 1 from the pygmalion source and the calst manifest references two further distinct Oslo files for it
- **THEN** the calst rows get takes 2 and 3 and the existing rows are unchanged

#### Scenario: A calst file already referenced by pygmalion yields no second row
- **WHEN** a calst sound URL's basename equals a basename already present in the manifest
- **THEN** no new row is created for it

#### Scenario: A calst file already on disk is not re-downloaded
- **WHEN** a calst-sourced row's file already exists at its final `path` (one of the 868 overlapping files)
- **THEN** a later `download` run computes its `sha256` and size, marks the row `ok`, and performs no request for it

#### Scenario: Phrases are kept verbatim
- **WHEN** a record's `word` is `la du` or `i-en`
- **THEN** the row's `word` is exactly that string, with its space or hyphen intact

#### Scenario: Empty dialect lists contribute nothing
- **WHEN** a record's `audio_Tromsø` list is empty
- **THEN** no row is created for it, and no warning is raised

#### Scenario: Entries the server mapping cannot reach are skipped and reported
- **WHEN** a path is not of the form `…\Words_MP3\<name>.mp3` (e.g. the `…\OriginalWords_Wav\…bolig….wav` entries)
- **THEN** no manifest row is created for it, and the command reports each skipped path with its reason

#### Scenario: Re-extraction preserves download progress
- **WHEN** `extract` is run again and a URL already has a manifest row with `status: "ok"`, `bytes` and `sha256`
- **THEN** that row keeps its `status`, `bytes` and `sha256`, new URLs are added as `pending`, and no row is deleted
