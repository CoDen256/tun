# ota-js-companion

## ADDED Requirements

### Requirement: The companion bakes and exposes the build timestamp
The system SHALL bake a build-timestamp constant into the boot companion
alongside the existing version constants, and expose it as a global readable
synchronously by any screen, so a build can report when it was produced
without a filesystem read or network request.

#### Scenario: A screen reads the build timestamp
- **WHEN** code running after the bundle's entry call reads the build
  timestamp global
- **THEN** the value is present as a plain constant, with no fetch and no
  wait on the boot-ok delay

#### Scenario: The embedded asset with no companion
- **WHEN** the running build is the embedded asset, which ships with no
  companion
- **THEN** the build-timestamp global is unset, and readers treat that as "no
  OTA active" exactly as they already do for the other version globals

### Requirement: The build timestamp is an assemble-substituted placeholder shown in the assemble UI
The system SHALL express the build timestamp as a placeholder substituted at
assemble like the other companion constants, and SHALL surface its value in
the assemble interface as an automatically-derived, non-editable field
labelled as the assemble time and noted as replaced at publish.

#### Scenario: Assembling a bundle
- **WHEN** a bundle is assembled
- **THEN** the build-timestamp placeholder is substituted with the assemble
  instant, and the assemble interface shows that value without the operator
  typing it

#### Scenario: A standalone assemble that is never published
- **WHEN** a bundle is assembled by the standalone workbench, with no hub and
  no publish step
- **THEN** the assemble-time build timestamp is the value that bundle
  carries, since no restamp occurs

#### Scenario: The field cannot be edited
- **WHEN** the operator views the build-timestamp field in the assemble
  interface
- **THEN** it is not editable, and its value is not stored as configuration
