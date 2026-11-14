## MODIFIED Requirements

### Requirement: The CLI and the in-process caller share the module, not a duplicate
The system SHALL expose the publish module's functions as plain importable
functions from `tool/`, with `bin/bundle-tool.js`'s `ota-publish` command,
`builder`'s publish step, and `hub`'s OTA console handler all calling the
same functions — none of the three reimplements any guard independently.

#### Scenario: A guard is fixed once
- **WHEN** a bug is found in the no-reuse-with-different-bytes check
- **THEN** fixing it in the shared module fixes it for the CLI, `builder`,
  and `hub`'s OTA console, with no second or third file to update

#### Scenario: Submitting via the OTA console uses the same guards as the CLI
- **WHEN** the operator submits a bundle through `hub`'s OTA console
- **THEN** the same buildId, reuse, and magic-prefix checks run as when the
  same bundle is published via the CLI
