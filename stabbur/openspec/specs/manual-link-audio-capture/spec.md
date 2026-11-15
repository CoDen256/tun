# manual-link-audio-capture

## Purpose

Turns an operator-supplied link (a direct audio file URL, or a YouTube URL +
timecode) into a stabbur-owned, content-addressed audio blob — the other
half of smia's `forvo`/`filmot` manual-link `/tts` providers, which have no
API and only ever return a link to their own site for a human to check by
hand.
## Requirements
### Requirement: A directly-linked audio file can be captured as a blob
The system SHALL provide a backend endpoint that, given a URL to a direct
audio file, downloads it server-side and stores the resulting bytes as a
content-addressed blob, returning the resulting hash unchanged (no
transcoding).

#### Scenario: Capturing a Forvo audio link
- **WHEN** the operator submits a direct audio file URL
- **THEN** the system downloads it, stores the bytes as a blob, and returns
  that blob's sha256

#### Scenario: Submitted link is not audio
- **WHEN** the operator submits a URL whose response is not recognizable as
  audio (e.g. an HTML page)
- **THEN** the system rejects the request with a clear error, and does not
  store the response as a blob

### Requirement: A YouTube URL with a timecode can be captured as a short audio clip
The system SHALL provide a backend endpoint that, given a YouTube URL
carrying a timecode, downloads only the audio for a window of two seconds
before and two seconds after that timecode — not the full video — and
stores the resulting clip as a content-addressed blob.

**Known-blocked as of 2026-11-02**: implemented, but still failing against
real YouTube after several rounds of live debugging (stale yt-dlp pin,
missing JS runtime / bot-check, read-only cookies file / format selection,
player-client-sourced 403s each fixed in turn, with a further failure still
unresolved) — see
`openspec/changes/archive/2026-11-02-manual-link-audio-capture/tasks.md`
task 6.3 for the full history before continuing this.

#### Scenario: Capturing a filmot-found YouTube moment
- **WHEN** the operator submits a YouTube URL with a timecode
- **THEN** the system downloads a roughly four-second audio window centered
  on that timecode and stores it as a blob, returning that blob's sha256

#### Scenario: URL has no timecode
- **WHEN** the operator submits a YouTube URL with no timecode
- **THEN** the system rejects the request rather than downloading the full
  video

### Requirement: Both capture endpoints reject unsafe or malformed targets
The system SHALL reject a submitted URL that is not `http`/`https`, or that
resolves to a private, loopback, or link-local address, before attempting
any download.

#### Scenario: Non-HTTP scheme submitted
- **WHEN** the operator submits a `file://` or other non-http(s) URL
- **THEN** the request is rejected before any fetch is attempted

#### Scenario: URL resolves to an internal address
- **WHEN** a submitted URL resolves to a private, loopback, or link-local
  address
- **THEN** the request is rejected before any fetch is attempted

### Requirement: Audio can be captured from any pasted link, independent of a provider
The system SHALL accept an audio link pasted by the operator without
requiring them to first choose a provider row, and SHALL determine from the
link itself how to obtain the audio — fetching a direct audio file, or
extracting a short clip from a video URL carrying a timecode.

The system SHALL apply the same safety check to such a link as to one
pasted into a provider row, rejecting unsupported schemes and hosts
resolving to private, loopback, link-local, reserved, or multicast
addresses before any request is made.

The existing per-provider paste-back inputs SHALL continue to work
unchanged; this adds a provider-independent entry point rather than
replacing them.

#### Scenario: Pasting a direct audio link
- **WHEN** the operator pastes a URL pointing at an audio file and submits
  it
- **THEN** the audio is fetched, stored as a stabbur blob, and attached to
  the note, with the trim control available exactly as for any other
  attached audio

#### Scenario: Pasting a video link with a timecode
- **WHEN** the operator pastes a video URL carrying a timecode and submits
  it
- **THEN** the system attempts to extract a short clip at that timecode
  rather than treating the URL as a direct audio file

#### Scenario: Pasting a link that is neither
- **WHEN** the operator pastes a URL that is neither a direct audio file
  nor a recognised video URL with a timecode
- **THEN** the system reports what it could not do with the link, rather
  than failing silently or storing a non-audio response

#### Scenario: An unsafe link is refused before any request
- **WHEN** the operator pastes a URL whose scheme is unsupported, or whose
  host resolves to a private or loopback address
- **THEN** it is rejected without any network request being made

#### Scenario: Provider rows still accept paste-back
- **WHEN** the operator pastes a link into a specific provider's
  paste-back input
- **THEN** it is captured exactly as before

### Requirement: A capture path known not to work is presented as such
The system SHALL indicate, where a capture path is known to be failing
against its real-world target, that it is known-blocked rather than
presenting it as an available option on equal footing with working paths.

The video-timecode path is in this state: it is implemented but has not
been made to work against real YouTube, while direct audio capture is
confirmed working. Offering a provider-independent paste box makes this
path more prominent than it was inside a single provider's row, so the
distinction has to be visible rather than discovered by the operator.

#### Scenario: Offering the paste control
- **WHEN** the operator is shown the link-capture control
- **THEN** the link kinds it handles are indicated, with any known-blocked
  path marked as such

#### Scenario: A known-blocked path is attempted anyway
- **WHEN** the operator pastes a link of a known-blocked kind
- **THEN** the attempt is still made and its real failure reported, rather
  than being refused pre-emptively

