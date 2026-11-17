## MODIFIED Requirements

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
