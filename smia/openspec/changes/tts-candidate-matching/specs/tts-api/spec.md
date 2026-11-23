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

## MODIFIED Requirements

### Requirement: dict.cc human candidates name their speaker
A `dictcc_api` `/tts` candidate with `source: "human"` SHALL carry `voice` set to the dict.cc user name of the recording it is, taken from the recording key `<recId>_<user>_<country>_lid<N>_v`. When dict.cc can serve a specific recording, every Norwegian recording of an entry SHALL be its own candidate with its own `voice`. When it cannot, `voice` SHALL be present only if the entry has exactly one Norwegian recording, and absent otherwise.

#### Scenario: Single recording names its speaker
- **WHEN** an entry has exactly one Norwegian recording by user `X`
- **THEN** its candidate has `source: "human"` and `voice: "X"`

#### Scenario: No guessing
- **WHEN** an entry has two Norwegian recordings and dict.cc cannot serve them separately
- **THEN** the candidate carries no `voice`
