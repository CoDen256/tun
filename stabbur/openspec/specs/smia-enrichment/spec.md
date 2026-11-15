# smia-enrichment

## Purpose

Defines how stabbur's note editor obtains provider-sourced suggestions
(IPA, translations, inflections, TTS) from smia: stabbur proxies every
lookup server-side, never exposes smia's credential or address to the
browser, passes failures through unchanged, and takes ownership of any
audio the operator chooses to use.
## Requirements
### Requirement: Enrichment lookups are proxied to smia, never called directly from the browser
The system SHALL provide stabbur backend endpoints that forward `ipa`,
`translations`, `inflections`, `tts`, and `examples` lookups to smia on the
operator's behalf, attaching smia's own auth token server-side, so the
browser never holds or sends a smia credential and smia's network address
is never exposed to the client.

The system SHALL proxy exactly those kinds for which a note has a
corresponding field. A kind with no note field SHALL NOT be exposed through
the generic proxy.

#### Scenario: Operator requests a suggestion
- **WHEN** the browser calls the stabbur enrichment endpoint for a given kind
  (e.g. `ipa`) with a provider and the kind's input fields
- **THEN** stabbur forwards the equivalent request to smia's `POST /<kind>`
  with its own service credential (`INTERNAL_TOKEN` since `unified-auth` 4.6;
  written as `SMIA_AUTH_TOKEN`, now a retired name), and returns smia's
  response body to the browser unchanged

#### Scenario: Operator requests example sentences
- **WHEN** the browser calls the stabbur enrichment endpoint for `examples`
  with a provider and the query text
- **THEN** stabbur forwards it to smia's `POST /examples` and returns the
  response body unchanged, exactly as for any other proxied kind

#### Scenario: Browser never sees smia's token or address
- **WHEN** inspecting any request the note editor makes while suggesting
- **THEN** every request target is a stabbur-origin path, authenticated with
  the operator's existing stabbur bearer token only

### Requirement: The provider catalog is reachable through stabbur
The system SHALL expose smia's provider catalog (which providers are
currently configured per kind) through a stabbur-side endpoint, so the UI can
render per-kind suggestion rows without talking to smia directly.

#### Scenario: Client loads the suggestion panel
- **WHEN** the note editor opens a suggestion panel for a kind
- **THEN** it calls stabbur's provider-catalog endpoint and renders one row
  per provider currently returned for that kind, including providers that are
  dynamically unavailable (shown as such, not omitted silently without reason)

### Requirement: A lookup failure is surfaced as-is, with no retry or fallback
The system SHALL pass through a provider's failure (no entry found, provider
error, or unavailable) to the client exactly as smia reported it, and the
proxy SHALL NOT automatically retry the same kind against a different
provider. A single lookup yields a single provider's answer, and that
answer — including its failure — reaches the operator as itself.

This prohibition applies to the proxy's handling of a lookup. It does NOT
prohibit the operator from consulting several providers in an order they
configured themselves, provided that:

- the sequence is initiated by an explicit operator action, not by the
  proxy reacting to a failure;
- each provider is consulted through an ordinary, individually
  pass-through lookup; and
- the provider whose answer was used is identified to the operator, so no
  value ever appears without the operator being able to see where it came
  from.

The distinction is between the proxy silently substituting one provider's
answer for another's, which remains forbidden, and the operator running
down their own list with every step visible, which is permitted.

#### Scenario: Provider has no entry for the requested input
- **WHEN** smia responds that the named provider found nothing for the given
  input (e.g. an inflected surface form with no lexicon entry)
- **THEN** stabbur's proxy returns that failure to the client unchanged, and
  does not call any other provider in response

#### Scenario: Unknown provider or kind requested
- **WHEN** the client names a provider not currently configured for the kind,
  or a kind stabbur does not proxy
- **THEN** stabbur responds with an error listing the currently available
  providers for that kind, mirroring smia's own unknown-provider /
  provider-required error shape

#### Scenario: An operator-configured order is walked
- **WHEN** the operator triggers an action that consults their configured
  providers for a kind in order until one answers
- **THEN** each provider is consulted by its own ordinary lookup, each
  response is passed through unchanged, and the provider that supplied the
  value used is identified

#### Scenario: The proxy still does not substitute on its own
- **WHEN** a single lookup for one named provider fails
- **THEN** stabbur returns that failure and does not consult the next
  provider in the operator's order on its own initiative

### Requirement: Using a TTS candidate stores real stabbur-owned audio
The system SHALL, when an operator selects a `/tts` candidate to use for a
note, fetch that candidate's audio bytes from smia server-side and store them
through stabbur's own blob storage — never write a note's `audio_blob` as a
reference into smia's cache, per stabbur owning the canonical learning audio.

#### Scenario: Operator uses a TTS candidate
- **WHEN** the operator clicks "Use" on a `/tts` candidate in the audio
  suggestion panel
- **THEN** stabbur fetches the selected candidate's audio bytes from smia,
  uploads them through its existing blob-upload path, and returns the
  resulting stabbur `sha256` so the client can attach it as the note's
  `audio_blob`

### Requirement: An audio transcription can be proxied to smia's speech-to-text
The system SHALL provide a stabbur backend endpoint that, given a provider
and a reference to audio already stored in stabbur's own blob storage,
forwards that audio to smia's `POST /stt` as multipart with the operator's
requested provider, and returns the transcription unchanged. Unlike the
JSON-body kinds, this endpoint reads its input from stabbur's own storage
rather than from operator-typed fields, and SHALL require an explicit
`provider` on every request (no single-provider default), matching smia's
own `stt-api` contract.

#### Scenario: Transcribing a note's stored audio
- **WHEN** the browser calls the stabbur stt-enrichment endpoint with a
  provider and the sha256 of audio already in stabbur's blob storage
- **THEN** stabbur reads those bytes locally, forwards them to smia's
  `POST /stt` with the requested provider, and returns `{provider, text}`
  to the browser unchanged

#### Scenario: Provider omitted
- **WHEN** the stt-enrichment endpoint is called without a `provider`
- **THEN** the request is rejected, with no provider silently defaulted

#### Scenario: Referenced audio does not exist in stabbur's blob storage
- **WHEN** the stt-enrichment endpoint is called with a sha256 that has no
  corresponding stored blob
- **THEN** the request fails with a client error, and no call is made to smia

### Requirement: An operator-initiated cache bypass is forwarded to the enrichment service
The system SHALL forward a cache-bypass flag to the enrichment service when,
and only when, the client supplies one on an enrichment request, so that a
lookup the operator explicitly asked to re-run consults the provider again
rather than returning the service's cached answer.

The system SHALL NOT originate this flag on its own. Deciding to bypass a
cache is the operator's action, relayed by the proxy; the proxy remains a
pass-through and does not acquire a caching policy of its own.

#### Scenario: Client requests a forced re-run
- **WHEN** the browser sends an enrichment request carrying the cache-bypass
  flag
- **THEN** stabbur forwards it to the enrichment service alongside the
  request's other fields, and returns the resulting response unchanged

#### Scenario: Ordinary lookup is unaffected
- **WHEN** the browser sends an enrichment request without the flag
- **THEN** stabbur forwards the request without it, and a cached answer is
  returned as normal

#### Scenario: The proxy never forces on its own
- **WHEN** stabbur proxies any enrichment request the client did not mark
  for re-run
- **THEN** no cache-bypass flag is added by stabbur

