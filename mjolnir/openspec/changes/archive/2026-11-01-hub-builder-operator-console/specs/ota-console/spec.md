## ADDED Requirements

### Requirement: Submitting a bundle requires no shell access
The system SHALL allow an operator to submit a bundle file via the UI
(drag-and-drop or file picker) and publish it, with no manual script
invocation required.

#### Scenario: Submitting a new bundle
- **WHEN** the operator drops a bundle file and confirms publish
- **THEN** the bundle is published using the same guards
  `ota-publish-module` already enforces, with no shell command run by the
  operator

### Requirement: Verification runs automatically on submission
The system SHALL run the existing publish guards (buildId validity,
reuse-with-different-bytes detection, magic-prefix check) the moment a
bundle is submitted, before the operator can confirm publish.

#### Scenario: Submitting an invalid bundle
- **WHEN** a submitted file fails the magic-prefix check
- **THEN** the UI reports the failure immediately and does not allow publish

### Requirement: Build history supports management, not just viewing
The system SHALL allow the operator to set any existing build as current, edit
its label, or delete it, from the same view that lists publish history.

#### Scenario: Rolling back via the UI
- **WHEN** the operator selects an older build and chooses "set as current"
- **THEN** `current.json` is repointed at that build's id, with no shell
  command required

### Requirement: A submitted or historical bundle can be inspected
The system SHALL provide a way to inspect a bundle's actual contents from
the OTA console, without duplicating bundle-inspection logic that already
exists elsewhere in this repo.

#### Scenario: Inspecting a historical build
- **WHEN** the operator chooses "inspect" on a past build
- **THEN** they are taken to a bundle-content view (reusing the existing
  bundle-workbench tool) rather than a new, separately-built inspector
