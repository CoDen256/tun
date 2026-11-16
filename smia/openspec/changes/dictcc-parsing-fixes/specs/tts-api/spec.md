## MODIFIED Requirements

### Requirement: Citation-form input resolves against the dict.cc audio provider
The dict.cc `/tts` provider SHALL request audio for **every distinct entry**
the underlying lookup returned, identified by entry id — never only the
first. A word whose first entry carries no recording SHALL still yield the
recordings of its later entries.

Each returned candidate SHALL carry an optional `context` string naming the
sense the recording belongs to, using the same bracketed part-of-speech
convention the `/translations` candidates use (for example `[noun] do {n}`).
Providers other than dict.cc SHALL NOT be required to set `context`, and a
consumer that does not read it SHALL be unaffected.

Candidates SHALL continue to dedupe on content hash, so byte-identical
recordings reached through different entries collapse into one. An entry
whose audio request fails SHALL be skipped; the lookup SHALL fail only when
every attempt failed.

The response SHALL NOT be filtered by part of speech, and the request SHALL
NOT accept a part-of-speech parameter. Ordering by part of speech is the
caller's, performed on the `context` this requirement supplies.

#### Scenario: A later entry's recording is reachable
- **WHEN** a word's first dict.cc entry has no human recording and a later entry does
- **THEN** the later entry's recording is returned as a candidate
- **AND** the response is not empty

#### Scenario: Candidates name their sense
- **WHEN** a word has dict.cc entries of more than one part of speech, each with a recording
- **THEN** each candidate carries a `context` whose leading bracketed tag is that entry's part of speech
- **AND** no candidate is omitted on the basis of its part of speech

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
