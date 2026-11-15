# pygmalion-audio-fetch — delta for calst-audio-union

## MODIFIED Requirements

### Requirement: Recording inventory is extracted into a manifest
`scripts/fetch_pygmalion_audio.py extract` SHALL read `providers/pygmalion/vowels.json` and `providers/pygmalion/consonants.json`, visit every `MP_wordpair` record at any depth, and write `providers/pygmalion/audio/manifest.jsonl` with one JSON row per distinct audio file. It SHALL additionally read `providers/calst/calst_manifest.json`, visit every wordList entry's `sounds` at any depth, and emit one row per distinct `.mp3` basename not already present in the manifest, with `word` taken from the entry's `text`, `dialect` parsed from the filename (`Oslo_Normal_…` → `Oslo`), `origin: "calst"`, and `path` under the dialect's directory. Each row SHALL carry `word`, `dialect`, `take`, `translation`, `url`, `path` and `status`. For pygmalion-sourced rows the `dialect` SHALL be derived from the `audio_<Dialect>` key the path was listed under, never from the filename. The `url` SHALL be the fixed base `https://polymetis.hf.ntnu.no/static/WordObjectContent/Norwegian/Words_MP3/` followed by the path's basename. The `take` SHALL be the file's 0-based order of first appearance within its `(word, dialect)`, with calst-sourced rows numbered after any existing takes of the same `(word, dialect)` — re-extraction SHALL never renumber or delete an existing row. This command SHALL NOT perform any network request.

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

## ADDED Requirements

### Requirement: Surplus recordings are marked in the manifest, not imported
`extract` SHALL stamp `surplus: true` on every manifest row the import must skip: any recording whose filename speed component is not `Normal` (e.g. `Slow`), and any `Normal` recording beyond the first two takes within its `(word, dialect)` in take order. All other rows SHALL carry no `surplus` field or `surplus: false`. Surplus rows SHALL still be downloaded and committed like any other row — the manifest's `surplus` marking is the durable record of what was deliberately left out of the table. Re-extraction SHALL recompute the marking deterministically, so running `extract` twice yields identical output.

#### Scenario: Slow recordings are surplus
- **WHEN** a manifest row's filename is `Bergen_Slow_….mp3`
- **THEN** the row has `surplus: true`, regardless of how many takes its word has

#### Scenario: Only the first two Normal takes per word and dialect are importable
- **WHEN** a word has four Normal Oslo recordings with takes 0–3
- **THEN** the rows with takes 0 and 1 are not surplus and the rows with takes 2 and 3 have `surplus: true`

#### Scenario: Slow takes do not consume an importable slot
- **WHEN** a word's Oslo recordings are take 0 `Normal`, take 1 `Slow`, take 2 `Normal`
- **THEN** takes 0 and 2 are not surplus and take 1 is surplus

#### Scenario: Surplus files are still downloaded
- **WHEN** a surplus row's `status` is not `ok`
- **THEN** `download` fetches it exactly like a non-surplus row

### Requirement: Import skips surplus rows and reports progress
`scripts/import_pygmalion.py` SHALL skip every row with `surplus: true`, counting them separately in its summary (`surplus` alongside `imported`, `existing`, `skipped`, `mismatched`), so the resulting `pygmalion_audio` table holds at most two Normal-speed recordings per `(word, dialect)` and no Slow recording. When run interactively in a terminal it SHALL display live progress — rows processed out of total and the running imported/existing/surplus counts — in the manner of `fetch_pygmalion_audio.py download`. The progress display's dependencies SHALL NOT be required by the bootstrap import path: without them (or without a TTY) the script SHALL fall back to plain stderr output and identical behavior.

#### Scenario: Surplus rows never reach the table
- **WHEN** the import runs over a manifest where a word has two non-surplus and two surplus Oslo rows
- **THEN** `pygmalion_audio` holds exactly two Oslo rows for that word, and the summary counts the other two under `surplus`

#### Scenario: Operator sees live progress
- **WHEN** the operator runs `python -m scripts.import_pygmalion providers/pygmalion/audio/manifest.jsonl` in a terminal
- **THEN** a live progress display shows rows processed out of total and the running counts, and a final summary line is printed when it completes

#### Scenario: Bootstrap import works without the progress dependencies
- **WHEN** the bootstrap path imports an empty `pygmalion_audio` table inside the runtime image, where `rich` is not installed
- **THEN** the import completes identically, emitting plain summary output and no import error
