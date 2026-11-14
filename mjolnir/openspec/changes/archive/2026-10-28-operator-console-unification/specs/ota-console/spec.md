## ADDED Requirements

### Requirement: A historical build's exact published bytes can be downloaded with a meaningful filename
The system SHALL let the operator download any historical build's exact
published bytes, and SHALL name the downloaded file using that build's own
label when one is set, rather than only its build id.

#### Scenario: Downloading a labeled build
- **WHEN** the operator downloads a build that has a label set
- **THEN** the downloaded file's proposed name incorporates that label, not
  only the bare build id

#### Scenario: Downloading an unlabeled build
- **WHEN** the operator downloads a build with no label set
- **THEN** the downloaded file's proposed name falls back to the build id
  alone

### Requirement: Every logic bundle can be opened for inspection, same as a historical build
The system SHALL provide the same "open for inspection" action on the logic-
bundles table that the publish-history table already provides per build, so
every logic bundle — active or not — is one click away from being opened in
the bundle workbench.

#### Scenario: Inspecting a non-active logic bundle
- **WHEN** the operator selects "inspect" on a logic bundle that is not the
  currently active one
- **THEN** the system opens that exact logic bundle's file in the bundle
  workbench
