# tts-api — delta for tts-candidate-matching

## ADDED Requirements

### Requirement: Pygmalion falls back to normalized and particle-stripped matching
The `pygmalion` provider SHALL answer from the first of these tiers that yields at least one recording, and SHALL NOT mix tiers: (1) the casefolded, trimmed input equals the stored word; (2) the normalized input equals the stored word's normalized match key; (3) the normalized input with trailing particle/preposition/reflexive tokens removed equals the match key. Normalization SHALL casefold, collapse whitespace, drop surrounding punctuation, drop one leading `å`, `en`, `ei`, `et`, `ein` or `eit` when followed by another token, and join ` + ` compounds into one word. Candidates from tier 2 or 3 SHALL carry `context` set to the stored word text they matched; tier-1 candidates SHALL carry no `context`.

#### Scenario: Article-stored word found by its bare form
- **WHEN** the corpus stores `ei avis` and the request is `{text: "avis", provider: "pygmalion"}`
- **THEN** the response holds that word's recordings, each with `context: "ei avis"`

#### Scenario: Article in the query
- **WHEN** the corpus stores `bil` and the request text is `en bil`
- **THEN** the response holds `bil`'s recordings with `context: "bil"`

#### Scenario: Compound written with plus
- **WHEN** the corpus stores `bok + handel` and the request text is `bokhandel`
- **THEN** the response holds its recordings with `context: "bok + handel"`

#### Scenario: Trailing particle dropped only as a last resort
- **WHEN** the request text is `stille opp`, no stored word matches it in tier 1 or 2, and `stille` is stored
- **THEN** the response holds `stille`'s recordings with `context: "stille"`

#### Scenario: Exact hit is not diluted
- **WHEN** the corpus stores both `avis` and `ei avis` and the request text is `avis`
- **THEN** only the recordings of `avis` are returned, without `context`

### Requirement: dict.cc human candidates name their speaker
A `dictcc_api` `/tts` candidate with `source: "human"` SHALL carry `voice` set to the dict.cc user name of the recording it is, taken from the recording key `<recId>_<user>_<country>_lid<N>_v`. When dict.cc can serve a specific recording, every Norwegian recording of an entry SHALL be its own candidate with its own `voice`. When it cannot, `voice` SHALL be present only if the entry has exactly one Norwegian recording, and absent otherwise.

#### Scenario: Single recording names its speaker
- **WHEN** an entry has exactly one Norwegian recording by user `X`
- **THEN** its candidate has `source: "human"` and `voice: "X"`

#### Scenario: No guessing
- **WHEN** an entry has two Norwegian recordings and dict.cc cannot serve them separately
- **THEN** the candidate carries no `voice`

## MODIFIED Requirements

### Requirement: Pygmalion dialect recordings
`POST /tts` with `provider=pygmalion` and `lang=nb` SHALL look up the casefolded, whitespace-trimmed `text` first as an exact match against the imported Pygmalion recording table (falling back to the normalized and particle-stripped tiers of the requirement "Pygmalion falls back to normalized and particle-stripped matching" only when the exact match finds nothing), and SHALL return one candidate per recording of that word across all dialects. Each candidate SHALL be `{sha256, source: "human", voice}`, plus `context` on a fuzzy-tier match only, where `voice` is the speaker's dialect area (e.g. `Oslo`, `Bergen`, `Sandnessjøen`). The provider SHALL reuse the existing candidate metadata fields and SHALL NOT introduce any new field. Candidates SHALL be ordered with `Oslo` first, then the remaining dialects alphabetically, then by recording order within a dialect, and SHALL be deduplicated by `sha256`. The provider SHALL NOT apply the `norwegian-input` query-variant fan-out or any inflection. A word with no recording SHALL yield `{provider, candidates: []}`, which is a successful response and not an error. A `lang` other than `nb` SHALL yield `candidates: []`.

The audio bytes SHALL be stored in smia's private audio cache and served by `GET /tts/{sha256}`, and the provider's source data SHALL be loaded from the committed Pygmalion manifest at startup only when its table is empty.

#### Scenario: A word with recordings in several dialects
- **WHEN** `POST /tts` is called with `{text: "led", lang: "nb", provider: "pygmalion"}` and the data holds two Oslo recordings and one Bergen recording of `led`
- **THEN** the response's `candidates` contains three entries, each with `source: "human"` and a `sha256`, the two Oslo entries with `voice: "Oslo"` first and the Bergen entry with `voice: "Bergen"` after

#### Scenario: Multiple recordings in one dialect are all returned
- **WHEN** a word has two recordings in the Oslo dialect
- **THEN** both are returned as separate candidates in recording order, rather than one being picked

#### Scenario: The dialect appears under voice and no new field is added
- **WHEN** any candidate is returned by `pygmalion`
- **THEN** its keys are a subset of `sha256`, `source`, `voice` and (on a fuzzy-tier match only) `context`, and the dialect name is the value of `voice`

#### Scenario: Matching ignores case and surrounding whitespace
- **WHEN** `POST /tts` is called with `{text: "  Led ", lang: "nb", provider: "pygmalion"}`
- **THEN** the response contains the same candidates as for `led`

#### Scenario: Phrases match only as exact entries
- **WHEN** `POST /tts` is called with `{text: "la du", lang: "nb", provider: "pygmalion"}` and the data holds that exact phrase
- **THEN** the response contains that phrase's recordings, and `la deg` — which is not in the data — yields `candidates: []`

#### Scenario: Unknown word yields an empty, successful response
- **WHEN** `POST /tts` is called with a word the Pygmalion data does not contain
- **THEN** the response is `{provider: "pygmalion", candidates: []}` with no error

#### Scenario: Non-Norwegian language yields no candidates
- **WHEN** `POST /tts` is called with `provider=pygmalion` and `lang` other than `nb`
- **THEN** the response's `candidates` is empty

#### Scenario: An exact phrase wins over its bare noun
- **WHEN** `POST /tts` is called with `{text: "en kalv", lang: "nb", provider: "pygmalion"}` and the data holds the exact entry `en kalv`
- **THEN** only `en kalv`'s recordings are returned, without `context`, and the bare noun `kalv` is not consulted

#### Scenario: Returned audio is retrievable
- **WHEN** a `sha256` returned by `pygmalion` is requested with `GET /tts/{sha256}`
- **THEN** the system returns the recording's bytes with an `audio/mpeg` `Content-Type`

#### Scenario: Import runs only on an empty table
- **WHEN** smia starts and the Pygmalion table already contains rows
- **THEN** the import is skipped, and when the table is empty the manifest's `status: "ok"` rows are imported

#### Scenario: Import rejects a corrupted file
- **WHEN** a manifest row's file hashes to a value other than the row's recorded `sha256`
- **THEN** that row is skipped and counted, and nothing for it enters the audio cache or the table

#### Scenario: Missing manifest does not stop startup
- **WHEN** the manifest file is absent at startup
- **THEN** startup continues with a warning, and the provider returns empty candidate lists
