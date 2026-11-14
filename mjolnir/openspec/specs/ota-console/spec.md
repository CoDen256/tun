# ota-console

## Purpose

Defines the operator-facing UI for submitting, verifying, and managing OTA
bundles — drag-and-drop submission, automatic guard verification, build
history management, and bundle inspection — without requiring shell access.

## Requirements

### Requirement: Submitting a bundle requires no shell access
The system SHALL allow an operator to submit a bundle file via the UI
(drag-and-drop or file picker), with no manual script invocation required.
By default, submitting a bundle creates a `logic_bundles` row (reading its
baked `base_version`/`patch_rev`, prompting only if absent) rather than
publishing it to `current.json` directly.

#### Scenario: Submitting a new bundle
- **WHEN** the operator drops a bundle file and confirms submission
- **THEN** a `logic_bundles` row is created using the same guards
  `ota-publish-module` already enforces, with no shell command run by the
  operator, and `current.json` is not repointed as a side effect

#### Scenario: Activating a submitted bundle
- **WHEN** the operator explicitly activates a just-submitted (or any
  existing) `logic_bundles` row
- **THEN** it becomes the active logic bundle `builder`'s next publish will
  build from, and the operator can separately trigger that publish

### Requirement: Force-publishing a raw bundle directly to `current.json` remains available as a distinct action
The system SHALL provide a separate, explicitly-labeled action that
publishes a submitted bundle straight to `current.json`, bypassing
`logic_bundles` activation and `builder` entirely, for emergency/manual use.

#### Scenario: Force-publishing in an emergency
- **WHEN** the operator chooses "force publish to current.json now" on a
  submitted bundle
- **THEN** `current.json` is repointed at it immediately, using the same
  publish guards as any other publish, without requiring that bundle to be
  the active `logic_bundles` entry and without triggering `builder`

#### Scenario: A force-published bundle is still recorded for provenance
- **WHEN** a bundle is force-published
- **THEN** a `logic_bundles` row is still created for it (left inactive),
  so the force-publish leaves an auditable record rather than none at all

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
