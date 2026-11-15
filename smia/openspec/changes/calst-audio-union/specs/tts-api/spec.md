# tts-api — delta for calst-audio-union

## MODIFIED Requirements

### Requirement: Pygmalion dialect recordings
`POST /tts` with `provider=pygmalion` and `lang=nb` SHALL look up the casefolded, whitespace-trimmed `text` as an exact match against the imported Pygmalion recording table, and SHALL return candidates for that word across all dialects, capped at **two takes per dialect**: for each dialect, the first two recordings in take order, every further take of that dialect omitted from the response (but retained in the table and cache). Each candidate SHALL be `{sha256, source: "human", voice}`, where `voice` is the speaker's dialect area (e.g. `Oslo`, `Bergen`, `Sandnessjøen`). The provider SHALL reuse the existing candidate metadata fields and SHALL NOT introduce any new field. Candidates SHALL be ordered with `Oslo` first, then the remaining dialects alphabetically, then by recording order within a dialect, and SHALL be deduplicated by `sha256`. The provider SHALL NOT apply the `norwegian-input` query-variant fan-out or any inflection or fuzzy matching. A word with no recording SHALL yield `{provider, candidates: []}`, which is a successful response and not an error. A `lang` other than `nb` SHALL yield `candidates: []`.

The audio bytes SHALL be stored in smia's private audio cache and served by `GET /tts/{sha256}`, and the provider's source data SHALL be loaded from the committed Pygmalion manifest at startup only when its table is empty.

#### Scenario: A word with recordings in several dialects
- **WHEN** `POST /tts` is called with `{text: "led", lang: "nb", provider: "pygmalion"}` and the data holds two Oslo recordings and one Bergen recording of `led`
- **THEN** the response's `candidates` contains three entries, each with `source: "human"` and a `sha256`, the two Oslo entries with `voice: "Oslo"` first and the Bergen entry with `voice: "Bergen"` after

#### Scenario: More than two recordings in one dialect are capped at two
- **WHEN** a word has four Oslo recordings in the table (e.g. after the calst import)
- **THEN** the response contains exactly the first two Oslo takes as candidates, in take order, and the other two are not returned — while all four remain in the table and their audio in the cache

#### Scenario: A calst-imported word resolves through the same provider
- **WHEN** `POST /tts` is called with `{text: "fastsatt", lang: "nb", provider: "pygmalion"}` and that word exists only in the calst-sourced rows
- **THEN** the response contains up to two candidates with `voice: "Oslo"` and `source: "human"`, indistinguishable in shape from pre-existing pygmalion candidates

#### Scenario: The dialect appears under voice and no new field is added
- **WHEN** any candidate is returned by `pygmalion`
- **THEN** its keys are a subset of `sha256`, `source` and `voice`, and the dialect name is the value of `voice`

#### Scenario: Matching ignores case and surrounding whitespace
- **WHEN** `POST /tts` is called with `{text: "  Led ", lang: "nb", provider: "pygmalion"}`
- **THEN** the response contains the same candidates as for `led`

#### Scenario: Phrases match only as exact entries
- **WHEN** `POST /tts` is called with `{text: "la du", lang: "nb", provider: "pygmalion"}` and the data holds that exact phrase
- **THEN** the response contains that phrase's recordings, and `la deg` — which is not in the data — yields `candidates: []`
