## ADDED Requirements

### Requirement: The companion exposes BUILT_AT and declares the restamp contract
`boot-ok-companion.js` SHALL carry a `BUILT_AT` constant
(`'__MJOLNIR_BUILT_AT__'`) exposed as `globalThis.MJOLNIR_BUILT_AT`,
substituted at assemble via the generic placeholder mechanism and corrected
at publish alongside `BUILD_ID`/`LABEL`/`DATA_VERSION`. The publish-time
restamp SHALL key on the companion's constant **names** (not on the
previously baked literal values), so it succeeds regardless of what assemble
baked. The four publish-stamped constants and the two assemble-stamped ones
(`BASE_VERSION`, `PATCH_REV`) SHALL be documented as such in the companion
source.

#### Scenario: restamp is independent of assemble-time values
- **GIVEN** a logic bundle whose companion was assembled with any
  label/data-version/built-at values
- **WHEN** builder publishes off it
- **THEN** all four publish-stamped constants in the published bundle carry
  this publish's values, verified before the sha256 is computed
