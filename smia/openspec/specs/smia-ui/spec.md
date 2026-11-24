# smia-ui Specification

## Purpose
TBD - created by archiving change smia-ui-tts-polish. Update Purpose after archive.
## Requirements
### Requirement: Section order
The smia operator page SHALL show its sections in the order Provider catalog, Manual try-it, Provider health.

#### Scenario: Health below try-it
- **WHEN** the operator opens `/smia/`
- **THEN** the Provider health section appears below the Manual try-it section

### Requirement: Inline playback in the try-it result
For a `tts` response, the try-it result SHALL render the pretty-printed JSON with a play control beside every line carrying a `sha256` value, and SHALL NOT render a separate list of audio players. The control SHALL fetch `GET /tts/{sha256}`, show a loading state, then play on activation, show a stop state while playing, and show an error state carrying the HTTP status when the fetch fails. At most one candidate SHALL play at a time. The control SHALL contribute no characters to a text selection of the result.

#### Scenario: Play a candidate inline
- **WHEN** a `tts` try-it returns three candidates and the operator clicks the control beside the second `sha256`
- **THEN** that candidate's audio plays and its control shows the stop state

#### Scenario: Copy stays clean JSON
- **WHEN** the operator selects the whole result and copies it
- **THEN** the clipboard text parses as JSON after the `HTTP 200` line, with no play glyphs
