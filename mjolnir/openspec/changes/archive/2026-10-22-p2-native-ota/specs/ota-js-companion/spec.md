## ADDED Requirements

> Source of truth: `tun/docs/11-ota-contract.md` §4 (JS side) and §5. This is
> the JS half the frozen native watchdog depends on; it ships in the bundle and
> is itself redeployable.

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
