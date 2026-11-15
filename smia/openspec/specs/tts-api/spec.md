## Purpose

`POST /tts` looks up or synthesizes audio for Norwegian text, following the `lookup-cache` contract. Returns one candidate per available recording/rendering, written into smia's own private content-addressed audio cache (not a canonical store — see ecosystem audio ownership rules).
## Requirements
### Requirement: Audio lookup/synthesis returns multiple candidates
`POST /tts` SHALL accept `{text, lang, provider}` (no `voice` field) and return `{provider, candidates: [{sha256, ...metadata}]}`, calling only the named provider. A provider that has more than one recording/rendering available for the input (e.g. multiple speakers) SHALL return one candidate per recording rather than picking one. Metadata fields (e.g. `gender`, `source`, `voice`) are present when the provider supplies them.

#### Scenario: Synthesized candidate alongside a recording
- **WHEN** the named provider can both locate a real recording and synthesize a voice for the same input (e.g. `dictcc_api`'s synthetic-voice candidate)
- **THEN** the system generates the synthesized audio, stores it, and returns it as its own candidate with `sha256` and available voice metadata (e.g. `voice`), tagged distinctly from any recorded candidate

#### Scenario: Recorded-speech provider with multiple speakers
- **WHEN** the named provider has multiple real recordings for the same input (e.g. `dictcc_api`)
- **THEN** the response's `candidates` array contains one entry per recording, each with its own `sha256`

#### Scenario: Recorded-speech provider with one match
- **WHEN** the named provider locates exactly one real recording (e.g. kaikki.org's `sounds[].mp3_url`)
- **THEN** the response's `candidates` array contains exactly one entry

### Requirement: Provider set
`/tts` SHALL be backed by: Forvo (manual-link fallback — no free tier available, see the manual-link requirement below), `dictcc_api` (dict.cc's mobile-app audio backend, real recordings and synthesized voices), kaikki.org (`sounds[].mp3_url`, real recordings), `pygmalion` (NTNU Pygmalion/LearnNoW human recordings in several Norwegian dialects, served from a local table), and filmot.com (manual-link fallback — no free tier available, see the manual-link requirement below). piper is explicitly excluded from this change. ElevenLabs was implemented and live-tested as a synthesis provider in `add-elevenlabs-provider`, then unregistered after live testing found its free tier 402s synthesizing with any voice this adapter can reach — it is not part of the provider set.

Because dict.cc has no monolingual Norwegian dictionary, a `lang=nb` lookup against `dictcc_api` SHALL check both Norwegian-touching dict.cc pairs (NO↔DE and NO↔EN) and merge their audio candidates, rather than only the one pair a word happens to be filed under. Identical recordings (same resulting `sha256`) from both pairs SHALL be deduplicated into a single candidate.

#### Scenario: No local synthesis fallback
- **WHEN** no configured provider has audio for the requested input
- **THEN** the system returns the provider's failure rather than falling back to a local synthesis engine

#### Scenario: dictcc_api returns both a recording and a synthesized candidate
- **WHEN** `provider=dictcc_api` is used for a word that dict.cc has both a human recording and a synthesized voice for
- **THEN** the response's `candidates` array contains one entry per source, each tagged with a `source` of `human` or `synthetic` (and, for synthetic candidates, the `voice` used)

#### Scenario: A Norwegian word's audio is only in one of dict.cc's two pairs
- **WHEN** `provider=dictcc_api`, `lang=nb` is used for a word that has a recording in dict.cc's NO↔EN data but not its NO↔DE data
- **THEN** the response's `candidates` still includes that recording, sourced from the NO↔EN pair

#### Scenario: Both pairs resolve to the same recording
- **WHEN** both of dict.cc's Norwegian-touching pairs resolve to byte-identical audio for a word
- **THEN** the response's `candidates` includes that recording once (by `sha256`), not twice

#### Scenario: One pair fails, the other succeeds
- **WHEN** `provider=dictcc_api`, `lang=nb` is used and one of the two Norwegian-touching pairs' requests fails (network or parse error) while the other succeeds
- **THEN** the response still includes the successful pair's candidates, rather than the whole request failing

#### Scenario: pygmalion is a listed provider
- **WHEN** `GET /providers` is called after the pygmalion recordings have been imported
- **THEN** the `tts` kind lists `pygmalion` and reports its current recording count, per the `provider-catalog` capability

### Requirement: Manual-link response for providers with no accessible API
Providers with no free or otherwise accessible API (`forvo`, `filmot`) SHALL NOT be called over HTTP. Instead, `POST /tts` for these providers SHALL return `{provider, candidates: [], url}`, where `url` is a link to that provider's own website with the requested word/phrase and language pre-filled, for the caller to open and check manually. This is not an error — `candidates: []` combined with a present `url` is this adapter type's normal, successful response.

#### Scenario: Forvo manual link
- **WHEN** `provider=forvo` is used with a given `text`/`lang`
- **THEN** the response is `{provider: "forvo", candidates: [], url}`, where `url` opens Forvo's page for that word/language

#### Scenario: filmot manual link
- **WHEN** `provider=filmot` is used with a given `text`/`lang`
- **THEN** the response is `{provider: "filmot", candidates: [], url}`, where `url` opens filmot's caption search pre-filled with that phrase/language

#### Scenario: Manual-link responses are cacheable like any other result
- **WHEN** the same `(forvo|filmot, text, lang)` request repeats
- **THEN** the cached `{candidates: [], url}` response is served, per the `lookup-cache` contract — no repeated URL construction needed, since the URL is deterministic from the input

### Requirement: Audio bytes served by content hash
The system SHALL expose `GET /tts/{sha256}` returning the raw audio bytes for a previously created clip, independent of the `lookup-cache` metadata-only `GET /<kind>/{id}` contract.

#### Scenario: Fetching generated audio
- **WHEN** `GET /tts/{sha256}` is called with a hash returned by a prior `POST /tts`
- **THEN** the system returns the audio bytes with an appropriate audio `Content-Type`

### Requirement: smia's audio cache is private, not canonical
Per the ecosystem's audio ownership rule, smia's `/tts` cache SHALL be treated as a private optimization, not a store of record. Callers (e.g. stabbur) that need durable audio SHALL copy bytes into their own canonical storage rather than relying on smia's cache long-term.

#### Scenario: smia cache eviction does not affect canonical storage
- **WHEN** smia evicts or loses a cached clip
- **THEN** no other service's canonical audio is affected, because canonical copies live elsewhere

### Requirement: Citation-form input resolves against the dict.cc audio provider
`POST /tts` SHALL resolve a `lang=nb` input supplied in Norwegian citation form — an indefinite article plus noun (`en kalv`, `ei bok`, `et hus`) or the infinitive marker plus verb (`å komme`) — against the `dictcc_api` provider, not only the bare lemma. The provider SHALL apply the `norwegian-input` capability's query-variant rules, crossing the variant list with the two Norwegian-touching dict.cc pairs it already queries, and SHALL deduplicate the merged audio candidates by `sha256` as it does today.

Because audio candidates are deduplicated by content hash, a recording reachable through more than one (pair, variant) combination SHALL appear exactly once.

The request and response shapes of `POST /tts`, and the behaviour of `GET /tts/{sha256}`, are unchanged.

#### Scenario: An indefinite noun phrase returns the noun's audio
- **WHEN** `POST /tts` is called with `{text: "en kalv", lang: "nb"}` and `provider=dictcc_api`
- **THEN** the response's `candidates` contains the recordings dict.cc has for `kalv`, rather than being empty

#### Scenario: An infinitive returns the verb's audio
- **WHEN** `POST /tts` is called with `{text: "å komme", lang: "nb"}` and `provider=dictcc_api`
- **THEN** the response's `candidates` contains the recordings dict.cc has for `komme`, rather than being empty

#### Scenario: Variants cross the existing pair fan-out
- **WHEN** `provider=dictcc_api`, `lang=nb` is used with a two-variant input
- **THEN** each (pair, variant) combination is queried for its entry id and audio

#### Scenario: The same recording reached twice appears once
- **WHEN** two (pair, variant) combinations resolve to byte-identical audio
- **THEN** the response's `candidates` includes that recording once, identified by its `sha256`

#### Scenario: One combination failing does not fail the lookup
- **WHEN** one (pair, variant) combination's request fails while another succeeds
- **THEN** the successful combination's candidates are returned rather than the whole request failing

#### Scenario: Every combination failing fails the lookup
- **WHEN** every (pair, variant) combination's request fails
- **THEN** the lookup returns the provider's failure, as it does today

#### Scenario: A single lowercase word behaves exactly as before
- **WHEN** `POST /tts` is called with a single already-lowercase Norwegian word
- **THEN** `dictcc_api` makes the same requests it made before this change, and the response is unchanged

#### Scenario: Other audio providers are unaffected
- **WHEN** a provider other than `dictcc_api` is used
- **THEN** it receives the caller's text unchanged, with no variant fan-out

### Requirement: Pygmalion dialect recordings
`POST /tts` with `provider=pygmalion` and `lang=nb` SHALL look up the casefolded, whitespace-trimmed `text` as an exact match against the imported Pygmalion recording table, and SHALL return one candidate per recording of that word across all dialects. Each candidate SHALL be `{sha256, source: "human", voice}`, where `voice` is the speaker's dialect area (e.g. `Oslo`, `Bergen`, `Sandnessjøen`). The provider SHALL reuse the existing candidate metadata fields and SHALL NOT introduce any new field. Candidates SHALL be ordered with `Oslo` first, then the remaining dialects alphabetically, then by recording order within a dialect, and SHALL be deduplicated by `sha256`. The provider SHALL NOT apply the `norwegian-input` query-variant fan-out or any inflection or fuzzy matching. A word with no recording SHALL yield `{provider, candidates: []}`, which is a successful response and not an error. A `lang` other than `nb` SHALL yield `candidates: []`.

The audio bytes SHALL be stored in smia's private audio cache and served by `GET /tts/{sha256}`, and the provider's source data SHALL be loaded from the committed Pygmalion manifest at startup only when its table is empty.

#### Scenario: A word with recordings in several dialects
- **WHEN** `POST /tts` is called with `{text: "led", lang: "nb", provider: "pygmalion"}` and the data holds two Oslo recordings and one Bergen recording of `led`
- **THEN** the response's `candidates` contains three entries, each with `source: "human"` and a `sha256`, the two Oslo entries with `voice: "Oslo"` first and the Bergen entry with `voice: "Bergen"` after

#### Scenario: Multiple recordings in one dialect are all returned
- **WHEN** a word has two recordings in the Oslo dialect
- **THEN** both are returned as separate candidates in recording order, rather than one being picked

#### Scenario: The dialect appears under voice and no new field is added
- **WHEN** any candidate is returned by `pygmalion`
- **THEN** its keys are a subset of `sha256`, `source` and `voice`, and the dialect name is the value of `voice`

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

#### Scenario: No citation-form fan-out
- **WHEN** `POST /tts` is called with `{text: "en kalv", lang: "nb", provider: "pygmalion"}`
- **THEN** the provider matches the text `en kalv` exactly and does not retry the bare noun `kalv`

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

