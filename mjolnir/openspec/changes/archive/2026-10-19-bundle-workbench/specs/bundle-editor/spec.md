## ADDED Requirements

### Requirement: Opening a module for editing in an external IDE
The system SHALL, when a user chooses to edit a module, ensure that
module's deobfuscated source exists as a file on disk, and SHALL open it in
an external editor via a configurable shell command rather than providing an
in-browser code editor.

#### Scenario: Opening a module that has not been deobfuscated yet
- **WHEN** a user chooses to edit a module that has no existing deobfuscated
  file on disk
- **THEN** the system deobfuscates that module to a file first, then opens it

#### Scenario: Opening a module that already has a deobfuscated file
- **WHEN** a user chooses to edit a module whose deobfuscated file already
  exists on disk
- **THEN** the system opens the existing file without regenerating it

#### Scenario: The configured editor command is not available
- **WHEN** the configured command to open a file in an editor fails to run
- **THEN** the system surfaces the failure and the file's absolute path,
  rather than failing silently

### Requirement: Configurable editor command
The system SHALL let the editor command used to open a module's file be
configured, with a default of opening the file in Visual Studio Code.

#### Scenario: Using the default editor command
- **WHEN** no editor command is configured
- **THEN** the system opens a module's file using the default command

#### Scenario: Using a configured editor command
- **WHEN** an editor command is configured
- **THEN** the system uses the configured command, substituting the file's
  path into it, instead of the default

### Requirement: Live diff against the on-disk file
The system SHALL, while a module's edit panel is open, periodically re-read
its deobfuscated file from disk and render its current diff against the
module's original baseline source.

#### Scenario: The file is edited and saved externally
- **WHEN** a user edits and saves a module's deobfuscated file in an external
  editor while that module's edit panel remains open
- **THEN** the system's rendered diff updates to reflect the saved changes
  without requiring the user to manually refresh

#### Scenario: The file is unchanged from baseline
- **WHEN** a module's deobfuscated file on disk is identical to its original
  baseline source
- **THEN** the system renders no differences

### Requirement: Saving a verified edit as a patch
The system SHALL let a user save a module's current edited state (baseline
and current on-disk content) as a named patch directly from its edit panel.

#### Scenario: Saving an edit as a patch
- **WHEN** a user saves a module's edit panel as a patch with a name
- **THEN** the system persists a patch capturing that module's baseline and
  current content under the given name
