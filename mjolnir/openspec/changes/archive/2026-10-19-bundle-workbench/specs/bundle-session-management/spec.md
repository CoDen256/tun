## ADDED Requirements

### Requirement: Single persistent app server
The system SHALL provide a command that starts one HTTP server bound to
`127.0.0.1` without requiring a bundle path argument, serving a general
bundle-workbench UI.

#### Scenario: Starting the app without a bundle
- **WHEN** a user runs the UI command with no bundle argument
- **THEN** the system starts a local server bound to `127.0.0.1` and serves
  the app shell, with no bundle session open yet

### Requirement: Opening a bundle session by path
The system SHALL let a user open a bundle session by typing or pasting a
local filesystem path to a bundle file, and SHALL make that bundle's module
index available once opened.

#### Scenario: Opening a valid bundle path
- **WHEN** a user submits a path to an existing, parseable bundle file
- **THEN** the system opens a session for that bundle (building its module
  index if not already cached) and the Explorer view becomes available for it

#### Scenario: Opening an invalid or missing path
- **WHEN** a user submits a path that does not exist or does not parse as a
  bundle
- **THEN** the system reports a clear error and does not create a session

### Requirement: Multiple concurrent bundle sessions
The system SHALL support more than one bundle session open at the same time
within a single running server.

#### Scenario: Opening a second bundle while one is already open
- **WHEN** a user opens a second bundle path while a first bundle's session
  is already open
- **THEN** both sessions remain open and independently accessible

### Requirement: Sessions are not persisted across server restarts
The system SHALL NOT persist open bundle sessions to disk; sessions exist
only for the lifetime of the running server process.

#### Scenario: Restarting the server
- **WHEN** the server process is restarted
- **THEN** no bundle sessions are open until re-opened by path through the UI

### Requirement: Explorer view over the existing read-only module surface
The system SHALL provide an Explorer view for an open bundle session showing
a sortable, filterable list of modules (by size, classification, verbose
name) with full-text search, a per-module source view with a toggle for
deobfuscated output, and that module's dependencies/dependents.

#### Scenario: Browsing modules
- **WHEN** a user views the Explorer for an open bundle session
- **THEN** the system lists its modules with size and classification, and
  lets the user sort or filter that list

#### Scenario: Searching module source
- **WHEN** a user enters a search term in the Explorer
- **THEN** the system shows matching modules and the matching excerpt,
  equivalent to the existing `grep` command's output

#### Scenario: Viewing a module's dependencies
- **WHEN** a user opens a specific module in the Explorer
- **THEN** the system shows that module's source (raw or deobfuscated, per
  the toggle) and its direct dependencies and dependents
