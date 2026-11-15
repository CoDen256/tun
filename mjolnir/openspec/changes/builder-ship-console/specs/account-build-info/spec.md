## MODIFIED Requirements

### Requirement: The account screen shows the installed build's label and data version
The My account screen SHALL show **one** consolidated App version row whose
value is built from the baked globals:
`<buildId> · base <baseVersion> · logic <patchRev> · data <dataVersion> ·
built <YYYY-MM-DD HH:mm>` (UTC, derived from `MJOLNIR_BUILT_AT`). The
separate Label and Data version rows are removed. When the companion is
absent (tier-4 embedded asset), the row SHALL show exactly `embedded` — the
current `&&`/`+` precedence bug that renders `undefined base:undefined` is
fixed.

#### Scenario: a published bundle shows the full version line
- **GIVEN** a device running a bundle published as b000042 with data rev 247
  at 2026-11-15 03:12 UTC
- **WHEN** the user opens My account
- **THEN** the App version row reads
  `b000042 · base 1.5.12 · logic 3 · data 247 · built 2026-11-15 03:12`

#### Scenario: the embedded asset falls back cleanly
- **GIVEN** the device is running the tier-4 embedded asset (no companion)
- **WHEN** the user opens My account
- **THEN** the App version row reads `embedded`, with no `undefined`
  anywhere

### Requirement: Label and data version are baked at assemble time, not read from a server at runtime
Version values SHALL be plain constants exposed synchronously by the
companion with no network request — unchanged. What changes: `LABEL`,
`DATA_VERSION`, and `BUILT_AT` are **corrected at publish time** by the
builder's restamp (they are publish facts), while `BASE_VERSION` and
`PATCH_REV` stay assemble-time facts. "Baked at assemble" remains true only
as the initial value; the restamp is what makes the display accurate.

#### Scenario: still synchronous and offline
- **WHEN** the My account screen renders with no network connectivity
- **THEN** the full App version row renders from the baked constants alone
