# ota-js-companion Specification

## Purpose

The OTA JS companion is the JavaScript half of the OTA system, shipped inside
the bundle that native loads. It cooperates with the frozen `native-ota-loader`
watchdog by signaling a stable boot, and it carries the one mechanism by which
a live bundle can rotate the OTA endpoint or token without a reinstall. Unlike
native, this half is itself redeployable over the air.

> Source of truth: `tun/docs/11-ota-contract.md` §4 (JS side) and §5.
## Requirements
### Requirement: Boot-ok marker is written after a stable launch

The published bundle SHALL write `boot-ok-<buildId>` into
`<documentDirectory>mjolnir-ota/` after the root component has mounted **and** a
3 s timer has elapsed (D52). It SHALL NOT write the marker on first render
alone, so that crashes in early data access are still covered. The write SHALL
use the `documentDirectory` (`file://` + trailing slash) form that resolves to
the same file native addresses under `getFilesDir()` (D56).

#### Scenario: Marker written only after the timer
- **WHEN** the root component mounts and 3 s pass without the app being killed
- **THEN** the companion writes `boot-ok-<buildId>` for the running build

#### Scenario: Early crash leaves no boot-ok
- **WHEN** the app is killed within 3 s of launch
- **THEN** no `boot-ok-<buildId>` is written, so the native watchdog can count
  the attempt

#### Scenario: BuildId matches the loaded bundle
- **WHEN** the companion writes the marker
- **THEN** it uses the buildId of the bundle native actually loaded, so the
  marker pairs with the correct `bundle-<id>.js`

### Requirement: Config rotation capability

The published bundle SHALL be able to rewrite
`<documentDirectory>mjolnir-ota/config.json` with a new `{url, token}` to rotate
the OTA endpoint or token without a reinstall (D39), and whenever it does so it
SHALL keep `url` as `https` so native does not reject it. Exercising this is
optional — a bundle that never writes `config.json` leaves native on its
baked-in defaults — but the capability MUST be available to a live bundle.

#### Scenario: Rotating the OTA token from a live bundle
- **WHEN** a live bundle writes a valid `{url, token}` with an https `url` to
  `config.json`
- **THEN** native's next refresh uses the new url/token

#### Scenario: Companion never downgrades transport
- **WHEN** the companion writes `config.json`
- **THEN** it only ever writes an `https` url, preserving the D53 invariant

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

