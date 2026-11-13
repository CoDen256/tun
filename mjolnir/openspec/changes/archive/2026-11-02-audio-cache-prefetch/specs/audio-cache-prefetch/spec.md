## ADDED Requirements

### Requirement: Stock card playback is unaffected
The system SHALL play a stock-prefixed card's audio (`a`, `b`, `c01`–`c17`,
`z`) via the existing local `playSoundFile` path, byte-identical to
unpatched behavior, regardless of network state or cache contents.

#### Scenario: Playing a stock card
- **WHEN** a card id with a stock prefix is played
- **THEN** the app calls the native module's `playSoundFile`, exactly as
  before any audio patch existed

### Requirement: A non-stock card plays only from a locally cached file
The system SHALL play any card id that is not a stock prefix exclusively
from a local file via the native module's `playUrl("file://...")`, and
SHALL NOT attempt to play directly from a remote URL under any
circumstance.

#### Scenario: A cached non-stock card is played
- **WHEN** a non-stock card id is played and its audio file already exists
  in the local cache
- **THEN** the app calls `playUrl` with a `file://` URI pointing at that
  local file

#### Scenario: An uncached non-stock card is played
- **WHEN** a non-stock card id is played and no local cache file exists for
  it
- **THEN** no audio plays, and the app does not attempt to play from any
  remote URL

### Requirement: The device resolves card id to content hash from an in-memory manifest
The system SHALL maintain an in-memory mapping from card id to content
hash, populated by the prefetcher, and SHALL use it to determine a card's
cache file path without a network request at play time.

#### Scenario: Looking up a card's cache path
- **WHEN** a non-stock card is played
- **THEN** its cache file path is derived from the in-memory manifest with
  no fetch performed as part of that lookup

### Requirement: Prefetching starts at app launch, not on first playback attempt
The system SHALL begin fetching the audio manifest and downloading missing
cached files once per app launch, independent of whether any card has been
played yet, and SHALL NOT block app startup on this work.

#### Scenario: App launch with no cards played yet
- **WHEN** the app launches and no audio has been played in this session
- **THEN** the manifest fetch and cache download sweep still begin,
  without waiting for a playback attempt to trigger them

#### Scenario: Prefetching does not delay startup
- **WHEN** the app launches
- **THEN** the UI becomes usable without waiting for the prefetch sweep to
  complete

### Requirement: The manifest is served from an unauthenticated, predictable path
The system SHALL serve each build's audio manifest at a path requiring no
authentication, derived from the build id the device already has baked in.

#### Scenario: Fetching the manifest
- **WHEN** the prefetcher fetches the manifest for the device's current
  build id
- **THEN** the request succeeds with no authentication credentials attached

### Requirement: Downloads are capped and atomic
The system SHALL limit the number of concurrent audio downloads during a
prefetch sweep, and SHALL make each downloaded file addressable only after
it is fully written (download to a temporary name, then rename).

#### Scenario: A prefetch sweep with many missing files
- **WHEN** a prefetch sweep finds more missing files than the concurrency
  cap
- **THEN** at most the capped number of downloads run at once, with the
  remainder queued

#### Scenario: The app is killed mid-download
- **WHEN** the app process ends while a download is in progress
- **THEN** no partially-written file is ever treated as a valid cache entry
  by a later playback attempt

### Requirement: A cache miss never triggers a repeat per-play download attempt
The system SHALL NOT attempt to download a missing file at playback time —
only the periodic prefetch sweep populates the cache.

#### Scenario: Playing an uncached card twice in a row
- **WHEN** a non-stock card with no cached file is played, and played again
  shortly after, with no prefetch sweep in between
- **THEN** neither attempt triggers a download; both are silent skips
