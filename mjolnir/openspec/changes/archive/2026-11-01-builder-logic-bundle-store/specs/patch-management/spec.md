## ADDED Requirements

### Requirement: Assembling an output bundle from multiple selected patches
The system SHALL let an operator select a base bundle and an ordered list of
stored patches, and apply all of them in a single pass to produce one output
bundle, reusing the existing per-patch locate-and-apply algorithm for each
patch in the list.

#### Scenario: Assembling from several patches
- **WHEN** an operator selects a base bundle and three stored patches, in
  order, and requests assembly
- **THEN** the system applies all three patches in the given order against
  the base and produces one output bundle reflecting all three changes

#### Scenario: One patch in the list fails to locate
- **WHEN** one patch in the selected list cannot locate its target module in
  the base bundle
- **THEN** the system reports which patch failed and does not produce a
  partially-applied output bundle

### Requirement: Assembly stamps `base_version` and `patch_rev` into the output
The system SHALL read `base_version` from the selected base's `apktool.yml`
(`versionInfo.versionName`) and compute `patch_rev` as the global maximum
existing `logic_bundles.patch_rev` plus one, baking both into the output
bundle as top-level constants using the same substitution mechanism already
used for `BUILD_ID`.

#### Scenario: Assembling against a known base folder
- **WHEN** an operator assembles a bundle from a base folder containing an
  `apktool.yml` with `versionInfo.versionName: 1.5.12`
- **THEN** the output bundle's baked `base_version` constant reads `1.5.12`

#### Scenario: Two assemblies against the same base
- **WHEN** an operator assembles two separate output bundles from the same
  base folder, one after the other
- **THEN** the second assembly's baked `patch_rev` is exactly one greater
  than the first's, regardless of `base_version` being unchanged
