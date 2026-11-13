# card-preview

## Purpose

TBD

## Requirements

### Requirement: A card's rendered content can be previewed in the stock app's own visual style
The system SHALL provide, for any card, a preview of its N/E/X content
rendered using the real Mjølnir app's own extracted colors, fonts, and
emphasis styling, not an approximation invented independently of the app.

#### Scenario: Previewing a card with multiple styled fields
- **WHEN** the operator opens the preview for a card whose content uses the
  app's own emphasis classes (e.g. bold, teal, red, left-aligned text)
- **THEN** the preview renders each field with those same visual treatments,
  matching the colors/weights the real app itself uses for them

#### Scenario: Previewing a card with no special styling
- **WHEN** the operator opens the preview for a card with plain, unstyled
  content
- **THEN** the preview still renders using the app's base font and text color

### Requirement: The preview indicates which face carries the card's audio
The system SHALL visually flag whichever of the card's N/E/X faces its audio
is attached to, and SHALL offer real playback of that audio when the
underlying clip is available on disk, degrading to a non-playable indicator
when it is not.

#### Scenario: Audio is available
- **WHEN** the card's audio clip exists in the audio blob cache
- **THEN** the preview's flagged face offers a working audio player for that
  clip

#### Scenario: Audio is not available
- **WHEN** the card's audio clip is not present in the audio blob cache
- **THEN** the preview's flagged face still shows which face the audio
  belongs to, with no non-functional player presented as if it worked

### Requirement: The preview is reached inline from the card's own row, not a separate page
The system SHALL let the operator open a card's preview directly from its
row in the Cards list, expanding in place, rather than navigating to a
separate page — and SHALL ensure at most one card's preview is expanded at a
time, collapsing any other already-open preview when a new one is opened.

#### Scenario: Opening a preview from the Cards list
- **WHEN** the operator selects the preview action on a card's row
- **THEN** that card's preview expands directly under its row, with no
  navigation away from the Cards list

#### Scenario: Opening a second card's preview while one is already open
- **WHEN** the operator opens a different card's preview while another
  card's preview is already expanded
- **THEN** the previously-expanded preview collapses and the newly-selected
  one expands, so at most one is visible at a time

### Requirement: The preview's three faces are arranged vertically, styled from the app's dark theme
The system SHALL arrange a card's N/E/X preview faces in a single vertical
column, and SHALL style them using the real app's dark-theme colors
specifically (not its light theme).

#### Scenario: Viewing a card's preview layout
- **WHEN** the operator views a card's expanded preview
- **THEN** its three faces (N, E, X) are stacked vertically, each styled
  with the app's dark-theme background and text colors
