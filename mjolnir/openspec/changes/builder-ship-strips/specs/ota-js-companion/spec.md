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
