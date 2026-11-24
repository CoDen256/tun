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
A provider with no accessible API SHALL answer with a link a human can
open, never with audio bytes.

The filmot link SHALL wrap a **multiword** query in literal double quotes
before percent-encoding, so filmot searches the phrase rather than its
separate words. A single-word query SHALL NOT be quoted. The link's query
parameters SHALL be otherwise unchanged.

#### Scenario: A phrase is searched as a phrase
- **WHEN** a filmot link is built for the Norwegian query `fastsatt av`
- **THEN** the URL path segment is the percent-encoded form of `"fastsatt av"`, carrying `%22` at both ends

#### Scenario: A single word is not quoted
- **WHEN** a filmot link is built for the Norwegian query `hus`
- **THEN** the URL is exactly what it was before this change, with no quote characters

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
The dict.cc `/tts` provider SHALL offer **only real human recordings**, and
SHALL NEVER offer computer-generated audio.

Availability SHALL be determined from dict.cc's own recordings endpoint,
batched once per lookup, NOT by probing the audio endpoint. The audio
endpoint synthesises when no recording exists, so a successful fetch is not
evidence of a recording.

An entry SHALL yield an audio candidate **iff** it has a recording whose
language id matches the requested language. An entry with recordings only in
the pair's other language SHALL yield no candidate and SHALL NOT be fetched.

The provider SHALL ask for audio across **every** language pair that carries
the requested language, and SHALL ask for each pair with the requested
language on its correct side — a self-lookup directed at the wrong side
returns nothing and silently hides that pair's entire dataset.

Each candidate SHALL carry a `context` naming the phrase the recording
actually reads — dict.cc's own source field verbatim, infinitive marker
included — together with its part-of-speech tag where dict.cc supplies one,
so the operator can tell which sense they are hearing. (`/translations`
contexts keep their established stripped form; only `/tts` is verbatim,
because only `/tts` is describing a sound.) Candidates SHALL
dedupe on content hash only; two different recordings of the same phrase
SHALL both survive.

The response SHALL NOT be filtered by part of speech, and the request SHALL
NOT accept a part-of-speech parameter. Ordering by part of speech is the
caller's.

#### Scenario: An entry with no recording in the requested language is skipped
- **GIVEN** a dict.cc entry whose only recording is in the pair's other language
- **WHEN** audio is requested for the queried language
- **THEN** no candidate is returned for that entry
- **AND** no audio request is made for it

#### Scenario: Computer-generated audio is never offered
- **WHEN** audio is requested for any word
- **THEN** every returned candidate corresponds to a listed human recording
- **AND** no candidate is produced by the provider's synthetic voice

#### Scenario: A later entry's recording is reachable
- **WHEN** a word's first dict.cc entry has no human recording and a later entry does
- **THEN** the later entry's recording is returned as a candidate

#### Scenario: Both language pairs are searched
- **GIVEN** a Norwegian phrase whose only recording lives in the EN–NO pair
- **WHEN** audio is requested for Norwegian
- **THEN** that recording is returned

#### Scenario: Candidates name the phrase being read
- **WHEN** a word has entries of more than one part of speech, each with a recording
- **THEN** each candidate's `context` carries that entry's phrase and its bracketed part-of-speech tag
- **AND** no candidate is omitted on the basis of its part of speech

#### Scenario: A misaligned recordings response is refused
- **WHEN** the recordings endpoint returns a different number of tokens than ids requested
- **THEN** the lookup raises rather than pairing recordings with the wrong entries

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
