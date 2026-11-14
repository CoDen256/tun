## Purpose

Store and apply named, content-located patches independently of any single bundle version — persisting each patch's baseline and modified source so it can be relocated by content in a new bundle and reapplied using the existing statement-realignment algorithm.

## Requirements

### Requirement: Patch storage format
The system SHALL store each patch as one JSON file containing a name,
description, locator, the target module's baseline source, its modified
source, a creation timestamp, and a list of bundle versions it has been
verified against.

#### Scenario: Saving a patch
- **WHEN** a patch is saved
- **THEN** the system writes one JSON file containing that patch's name,
  description, locator, baseline source, modified source, creation
  timestamp, and verified-versions list

### Requirement: Configurable patch storage directory
The system SHALL store patch files in a configurable directory, defaulting
to a `patches` directory relative to the current working directory.

#### Scenario: Using the default patch directory
- **WHEN** no patch directory is configured
- **THEN** the system reads and writes patch files under `./patches/`
  relative to the directory the command was run from

#### Scenario: Using a configured patch directory
- **WHEN** a patch directory is configured
- **THEN** the system reads and writes patch files under that directory
  instead of the default

### Requirement: Locating a patch's target module by content
The system SHALL locate a patch's target module in a bundle by searching
that bundle's modules for the patch's locator string, and SHALL NOT require
or rely on a specific module id.

#### Scenario: Locating a patch's target in a bundle where the module id differs from authoring time
- **WHEN** a patch is applied to a bundle where its target module exists
  under a different numeric id than when the patch was authored
- **THEN** the system locates the target module by its locator string and
  applies the patch to it

#### Scenario: The locator does not match any module
- **WHEN** a patch's locator string does not match any module in the target
  bundle
- **THEN** the system reports that the patch's target could not be located
  and does not apply the patch

### Requirement: Applying a patch reuses the existing realignment algorithm
The system SHALL apply a patch to a located target module using the same
statement-realignment algorithm used by the existing patch-back command,
computing the diff between the patch's baseline and modified source and
reapplying it onto the target module's current content.

#### Scenario: Applying a patch to a bundle whose target module content has not diverged from the baseline
- **WHEN** a patch is applied to a bundle whose located target module's
  content matches the patch's recorded baseline
- **THEN** the system's reapplied result matches the patch's modified source
  exactly, modulo binding realignment

#### Scenario: Previewing a patch before applying
- **WHEN** a user requests to apply a patch to an open bundle session
- **THEN** the system shows a diff preview of the change before writing
  anything, requiring explicit confirmation to commit it

### Requirement: Listing stored patches
The system SHALL let a user list the patches currently stored in the
configured patch directory, showing each patch's name, description, and
locator.

#### Scenario: Listing patches
- **WHEN** a user views the patch list
- **THEN** the system shows every patch file in the configured directory
  with its name, description, and locator

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
