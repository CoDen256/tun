## MODIFIED Requirements

### Requirement: Example lookup returns a short ranked candidate list
`POST /examples` SHALL accept `{text, lang, provider, limit?}` (`lang` defaults to `nb`; only Norwegian Bokmål is supported) and return `{provider, candidates: [{text, source?, sense?}]}`, following the `lookup-cache` contract and calling only the named provider.

Each candidate's `text` SHALL be Norwegian example text from the source, **normalised as a sentence** as described in "Example text is returned as a well-formed sentence". A candidate SHALL NOT carry a translation of that text; `/examples` answers "how is this word used in Norwegian", and translation is `/translations`' concern.

`source` SHALL name the sub-source a candidate came from, so a caller can tell which dataset answered. `sense` SHALL carry the meaning a candidate illustrates where the provider attaches its examples to a definition. Either field SHALL be omitted by a provider that has nothing meaningful to report, rather than filled with a placeholder.

`limit` SHALL default to 3 and SHALL be clamped to the range 1–10. It is part of the request's identifying input, so requests differing only in `limit` are distinct cache resources.

A provider with no examples for the requested text SHALL return `{provider, candidates: []}` rather than an error.

#### Scenario: A word with examples
- **WHEN** `POST /examples` is called with `{text: "kalv", lang: "nb"}` and a provider that has examples for it
- **THEN** the response contains at most 3 candidates, each with Norwegian `text`

#### Scenario: Candidates carry no translation
- **WHEN** any provider returns a candidate, including one whose underlying source holds a translation of the example
- **THEN** the candidate contains no translation field, and the source's translation is discarded

#### Scenario: Explicit limit
- **WHEN** `POST /examples` is called with `limit: 10`
- **THEN** at most 10 candidates are returned

#### Scenario: Limit is clamped
- **WHEN** `POST /examples` is called with a `limit` below 1 or above 10
- **THEN** the effective limit is clamped into the 1–10 range rather than rejected

#### Scenario: Limit participates in cache identity
- **WHEN** the same text is requested with `limit: 3` and then with `limit: 10` for the same provider
- **THEN** the two resolve to different resource ids, each retrievable via `GET /examples/{id}` and each returning the payload that its own `POST` returned

#### Scenario: No examples found
- **WHEN** the named provider has no examples for the requested text
- **THEN** the response is `{provider, candidates: []}` and the request succeeds

#### Scenario: Unsupported language
- **WHEN** `POST /examples` is called with a `lang` other than `nb`
- **THEN** the request is rejected with a client error rather than silently answered from Norwegian data

## ADDED Requirements

### Requirement: Example text is returned as a well-formed sentence
Every candidate `text` returned by `POST /examples` and by `GET /examples/{id}` SHALL:

- have outer whitespace trimmed;
- start with an upper-case letter: the first letter, after any leading quotes, dashes, brackets or spaces, is upper-cased (including `æ ø å`), and every other character is unchanged;
- end in terminal punctuation: when the text, ignoring trailing closing quotes or brackets, does not already end in `.`, `!`, `?` or `…`, a `.` is added.

Normalisation SHALL be applied to the response after any lookup-cache read, so that cached payloads are returned normalised without being rewritten, and the cache SHALL continue to store the provider's own text.

Within one response, a candidate whose normalised text equals an earlier candidate's SHALL be omitted. An empty text after trimming SHALL be omitted.

#### Scenario: A lower-case fragment
- **WHEN** a provider's candidate text is `komme seg opp`
- **THEN** the returned text is `Komme seg opp.`

#### Scenario: Already a sentence
- **WHEN** a provider's candidate text is `Kommer du i morgen?`
- **THEN** the returned text is `Kommer du i morgen?`, unchanged

#### Scenario: Leading quote and Norwegian letter
- **WHEN** a provider's candidate text is `«øya ligger langt ute»`
- **THEN** the returned text starts with `«Øya` and ends with a full stop next to the closing quote

#### Scenario: A cached raw payload
- **GIVEN** a `/examples` payload cached before this change, with a lower-case candidate that has no final punctuation
- **WHEN** the same request is made again and answered from the cache
- **THEN** that candidate comes back capitalised and ending in `.`

#### Scenario: Duplicates after normalisation
- **WHEN** a provider returns `komme seg` and `Komme seg.` in the same answer
- **THEN** the response carries one candidate `Komme seg.`
