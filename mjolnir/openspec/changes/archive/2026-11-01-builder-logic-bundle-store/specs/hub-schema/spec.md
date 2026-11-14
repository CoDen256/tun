## MODIFIED Requirements

### Requirement: `publications` tracks three independently-owned version fields
The system SHALL store `base_version`, `patch_rev`, and `data_rev` as
separate fields on each `publications` row, where `base_version` and
`patch_rev` are read from the `logic_bundles` row active at the moment of
publish, and `data_rev` is always incremented by exactly 1 relative to the
previous publication.

#### Scenario: A content-only publish
- **WHEN** `builder` publishes new or changed card content with no change to
  which `logic_bundles` row is active
- **THEN** the new row's `base_version`/`patch_rev` match the active logic
  bundle's own values, unchanged from the previous publication, and
  `data_rev` is the previous value plus 1

#### Scenario: A publish after activating a different logic bundle
- **WHEN** the operator activates a different `logic_bundles` row before the
  next publish runs
- **THEN** the new `publications` row's `base_version`/`patch_rev` match that
  newly-active row's values, not the previous publication's

## ADDED Requirements

### Requirement: Each publication records which logic bundle it was built from
The system SHALL store a reference from each `publications` row to the
`logic_bundles` row that was active when it was published.

#### Scenario: Tracing a publication back to its logic bundle
- **WHEN** an operator inspects a past publication
- **THEN** they can identify exactly which `logic_bundles` entry (and
  therefore which base+patch bytes) it was built from
