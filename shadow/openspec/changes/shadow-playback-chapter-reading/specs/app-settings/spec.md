# Spec Delta

## Purpose
Where shadow's preferences live and whose they are: shadow has exactly one
owner, no profile concept, and keeps its settings in a store it owns rather
than in phonexa.

## ADDED Requirements

### Requirement: shadow has exactly one owner and no profiles
shadow SHALL operate for a single owner. No screen SHALL render a profile
picker or any control for choosing, creating, renaming or deleting a
profile. Every book, upload, progress range and cursor SHALL belong to that
one owner, whose id is fixed once by migration.

The migration that fixes the owner SHALL abort, changing nothing, when the
existing data belongs to more than one distinct owner id.

shadow SHALL NOT call phonexa to list, create or verify users.

#### Scenario: No profile picker anywhere
- **WHEN** any shadow screen is opened
- **THEN** no profile picker or profile-management control is rendered

#### Scenario: Existing progress is kept
- **WHEN** the change is deployed over data belonging to one owner
- **THEN** every book, its done sentences and its reading position are shown
  exactly as before

#### Scenario: Ambiguous ownership aborts
- **WHEN** the migration runs over data carrying two distinct owner ids
- **THEN** it fails with a message naming both ids and no row is changed

### Requirement: Settings are stored by shadow
shadow's preferences SHALL be stored in shadow's own database and read only
from there. On first start after this change, values previously stored for
the owner in phonexa SHALL be imported once; when phonexa is unreachable or
holds no value, defaults SHALL apply (trim silence ON, STT provider
`hf_whisper`). After a value is stored, phonexa SHALL NOT be consulted for it.

The theme SHALL be a per-device preference and SHALL NOT be stored server-side.

#### Scenario: Settings survive with phonexa down
- **WHEN** phonexa is stopped and a setting is changed and the page reloaded
- **THEN** the changed value is shown

#### Scenario: Earlier choices are carried over
- **WHEN** the owner had chosen a non-default STT provider and trim OFF in
  phonexa before this change
- **THEN** after the change shadow shows that provider and trim OFF

### Requirement: Settings is a screen of the app
shadow's single navigation SHALL offer a Settings screen (⚙) inside the same
application, grouping: Appearance (theme: system, light or dark, per device);
Playback (trim silence; play sentence when opened; trim in audiobook mode);
Transcription (speech-to-text provider, with whether smia is reachable); and
a read-only, collapsed-by-default Books overview. Each change SHALL be saved
as it is made and acknowledged on its row; there SHALL be no save button.
The navigation SHALL NOT carry a separate theme toggle, and the Library
SHALL NOT carry the trim switch.

#### Scenario: A change saves itself
- **WHEN** a switch is flipped in Settings and the page is reloaded
- **THEN** the switch shows the new state

#### Scenario: Theme is chosen only in Settings
- **WHEN** any screen is open
- **THEN** the navigation shows no theme toggle, and Settings offers System,
  Light and Dark
