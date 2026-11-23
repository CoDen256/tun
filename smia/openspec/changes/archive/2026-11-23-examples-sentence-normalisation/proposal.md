# Proposal — examples-sentence-normalisation

Batch `stabbur-fixes`, package "stabbur fixes" (item 6). This is the smia half
of the package. The stabbur half is `stabbur/openspec/changes/stabbur-prefill-and-settings-fixes`.
The two halves ship independently: neither one depends on the other.

## Why

Operator finding, verbatim:

> [ux] stabbur Also would be nice to always capitalize the first letter of the
> example and force "dot" at the end

Example candidates come back exactly as each source stores them. Dictionary
providers (ordbokene, kaikki, lexin) mostly hold lower-case fragments with no
final punctuation, such as `komme seg opp`. Corpus providers (tatoeba,
leipzig) mostly hold full sentences. The operator wants every example to read
as a sentence.

In the design session the operator placed this in **smia**, not stabbur: a
`/examples` candidate is meant to be an example *sentence*, so making it
well-formed is part of what the endpoint returns. It is not a display choice
in one client. stabbur is the only consumer of `/examples` (hover-translate
does not call it).

## What changes

- `POST /examples` and `GET /examples/{id}` return each candidate's `text`
  **normalised**: the first letter is upper-cased, and the text ends in
  terminal punctuation (`.` added unless it already ends in `.`, `!`, `?` or
  `…`, optionally followed by a closing quote or bracket).
- Normalisation is applied **at the response boundary, after the cache
  read**. Candidates that are already cached come out normalised as well, so
  no cache purge or migration is needed.
- Two candidates from the same provider that become identical once
  normalised are collapsed into one, keeping the first.
- The `examples-api` requirement that `text` is returned "as the source holds
  it" is amended.

## Non-goals

- No change to any other kind (`/translations`, `/ipa`, …).
- No change to ranking, limits or the cache key.
- No change to stabbur in this change (stabbur's loose de-duplication is in
  its own change).
