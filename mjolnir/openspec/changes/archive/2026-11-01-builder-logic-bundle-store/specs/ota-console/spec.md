## MODIFIED Requirements

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

## ADDED Requirements

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
