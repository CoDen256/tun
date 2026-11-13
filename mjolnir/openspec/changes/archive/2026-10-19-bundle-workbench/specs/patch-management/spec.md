## ADDED Requirements

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
