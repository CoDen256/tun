## ADDED Requirements

### Requirement: Shared publish guards, one implementation
The system SHALL implement buildId validation, reuse detection, and bundle
magic-prefix validation as a single importable module, used both by an
in-process caller (`builder`) and a CLI wrapper, with no second
implementation of any of these checks anywhere else in the codebase.

#### Scenario: buildId fails the filename-safe charset check
- **WHEN** a publish is attempted with a buildId that does not match
  `^[A-Za-z0-9._-]{1,64}$`
- **THEN** the module refuses the publish before touching the filesystem

#### Scenario: Reusing an existing buildId with identical bytes
- **WHEN** a publish names a buildId whose bundle file already exists on disk
  with the same sha256
- **THEN** the module treats this as a no-op republish of `current.json` only,
  writing no new bundle file

#### Scenario: Reusing an existing buildId with different bytes
- **WHEN** a publish names a buildId whose bundle file already exists on disk
  with a different sha256
- **THEN** the module refuses the publish and writes nothing

#### Scenario: Bundle missing the magic prefix
- **WHEN** a publish is attempted with a file that does not start with the
  26-byte `var __BUNDLE_START_TIME__=` prefix
- **THEN** the module refuses the publish before writing anything

### Requirement: The CLI and the in-process caller share the module, not a duplicate
The system SHALL expose the publish module's functions as plain importable
functions from `tool/`, with `bin/bundle-tool.js`'s `ota-publish` command and
`builder`'s publish step both calling the same functions — neither reimplements
any guard independently.

#### Scenario: A guard is fixed once
- **WHEN** a bug is found in the no-reuse-with-different-bytes check
- **THEN** fixing it in the shared module fixes it for both the CLI and
  `builder`, with no second file to update

### Requirement: `ota-publish.sh` becomes a thin wrapper
The system SHALL replace `ota-publish.sh`'s guard logic with a call to the
Node CLI, keeping the script only as an operator-facing entry point.

#### Scenario: Running the existing script
- **WHEN** the operator runs `ota-publish.sh <bundle> <buildId> [label]` as
  before
- **THEN** it invokes `node bin/bundle-tool.js ota-publish` with the same
  arguments and produces identical behavior to before the move
