## ADDED Requirements

### Requirement: `logic_bundles` is the versioned store of operator-assembled base+patch bundles
The system SHALL store every assembled base+patch bundle as a row in
`logic_bundles`, recording its `base_version`, `patch_rev`, an immutable file
reference, and its sha256, independently of any card data.

#### Scenario: A new logic bundle is submitted
- **WHEN** an operator submits an assembled bundle (via bundle-workbench
  assembly or a manual drag-drop into hub's OTA console)
- **THEN** a new `logic_bundles` row is created with that bundle's
  `base_version`, `patch_rev`, file reference, and sha256, and the bundle's
  bytes are stored unmodified and never rewritten afterward

### Requirement: `base_version` and `patch_rev` are read from baked constants, not retyped on submission
The system SHALL read `base_version`/`patch_rev` from constants baked into
the submitted bundle's text (the same mechanism used for `BUILD_ID`), and
SHALL only prompt the operator for a manual value when a baked constant is
absent.

#### Scenario: Submitting a bundle with baked version constants
- **WHEN** an operator submits a bundle whose text contains baked
  `base_version`/`patch_rev` constants
- **THEN** the system reads those values directly and does not prompt the
  operator to enter them

#### Scenario: Submitting a bundle with no baked version constants
- **WHEN** an operator submits a bundle with no baked `base_version`/
  `patch_rev` constants
- **THEN** the system prompts the operator to enter both values before the
  submission can complete

### Requirement: `patch_rev` is one global, monotonically increasing counter
The system SHALL compute a new bundle's `patch_rev` as the maximum existing
`logic_bundles.patch_rev` plus one, regardless of whether `base_version`
changed, and SHALL NOT reset the counter when `base_version` changes.

#### Scenario: A base version bump
- **WHEN** a new logic bundle is submitted with a different `base_version`
  than the currently active one
- **THEN** its `patch_rev` continues from the global maximum rather than
  resetting to 0

### Requirement: Exactly one logic bundle is active at a time
The system SHALL maintain exactly one `logic_bundles` row with `active =
true`, and SHALL NOT allow `builder` to read more than one active entry.

#### Scenario: Activating a different logic bundle
- **WHEN** an operator activates a `logic_bundles` row that is not currently
  active
- **THEN** that row becomes active and every other row's `active` flag is
  cleared, in the same operation

#### Scenario: Submitting without activating
- **WHEN** an operator submits a new logic bundle without activating it
- **THEN** the row is stored but the previously active row remains active,
  and `builder`'s next run still builds from the previously active bundle
