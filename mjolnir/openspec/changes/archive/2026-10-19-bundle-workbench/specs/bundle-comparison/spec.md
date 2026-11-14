## ADDED Requirements

### Requirement: Comparing two open bundle sessions
The system SHALL let a user select two open bundle sessions and view which
modules were added, removed, or changed between them.

#### Scenario: Comparing two sessions
- **WHEN** a user selects two open bundle sessions to compare
- **THEN** the system reports every module as added (present only in the
  second), removed (present only in the first), changed (present in both but
  with different content), or unchanged

### Requirement: Matching modules across bundles by content, not id
The system SHALL match a module between two bundles by its canonicalized
content hash first, and SHALL NOT rely on the module's numeric id to
determine whether it is the same module across the two bundles.

#### Scenario: A module's id shifts between versions but its content is identical
- **WHEN** a module with identical canonicalized content exists in both
  bundles under different numeric ids
- **THEN** the system reports it as unchanged, matched by content hash, not
  by id

### Requirement: Falling back to verboseName for changed modules
The system SHALL fall back to matching by a module's `verboseName` (the
source path Metro embeds in each module) when no exact content-hash match is
found, treating a unique verboseName match on both sides as the same module
with changed content.

#### Scenario: A module's content changed between versions
- **WHEN** two modules in the respective bundles share the same unique
  verboseName but their canonicalized content hashes differ
- **THEN** the system reports that module as changed, not as one added
  module and one removed module

#### Scenario: No verboseName match is available
- **WHEN** a module's verboseName is missing, or not unique on either side
- **THEN** the system treats it as added (if only in the second bundle) or
  removed (if only in the first), rather than guessing at a match

### Requirement: Drilling into a changed module's structural diff
The system SHALL let a user open a changed module's structural diff, showing
which statements are unchanged, modified, added, or removed between the two
versions.

#### Scenario: Viewing a changed module's diff
- **WHEN** a user opens a module reported as changed
- **THEN** the system renders its structural diff with unchanged, modified,
  added, and removed statements visually distinguished
