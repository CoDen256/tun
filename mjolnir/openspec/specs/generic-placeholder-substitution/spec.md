# generic-placeholder-substitution Specification

## Purpose

Allow the bundle tool to substitute any `__MJOLNIR_<KEY>__` placeholder from a
caller-supplied key/value map, without requiring a code change per new key,
while preserving the existing per-key validation rules (`https`-only
`_URL` keys, `BUILD_ID`/`BASE_VERSION` charset checks, `PATCH_REV` as a
non-negative integer) and the auto-supplied nature of `BASE_VERSION`.

## Requirements

### Requirement: Any key/value pair can be baked as a placeholder
The system SHALL substitute `__MJOLNIR_<KEY>__` with the corresponding
value for any key present in a caller-supplied placeholder map, wherever
that string appears in a companion's source or an assembled bundle — with
no code change required to support a new key.

#### Scenario: A new, previously-unseen key
- **WHEN** a companion's source contains `__MJOLNIR_FOO__` and the caller
  supplies `{ FOO: "bar" }`
- **THEN** every occurrence of `__MJOLNIR_FOO__` is replaced with `bar`,
  with no prior registration of `FOO` anywhere in the codebase

#### Scenario: A placeholder present with no value supplied
- **WHEN** a companion's source contains `__MJOLNIR_FOO__` and the caller's
  placeholder map has no `FOO` key
- **THEN** assembling/appending fails with a clear error naming the
  missing key, same as today's named-placeholder behavior

### Requirement: URL-shaped keys must be https
The system SHALL reject a value for any key ending in `_URL` that is not a
bare `https://` URL.

#### Scenario: A `_URL`-suffixed key given a non-https value
- **WHEN** a placeholder map supplies `{ SYNC_BASE_URL: "http://example.com" }`
- **THEN** substitution fails with a clear error, same as today's
  https-only enforcement

### Requirement: BUILD_ID, BASE_VERSION, and PATCH_REV keep their existing format checks
The system SHALL validate `BUILD_ID`/`BASE_VERSION` against the existing
charset rule and `PATCH_REV` as a non-negative integer, by key name,
regardless of the otherwise-generic substitution mechanism.

#### Scenario: An invalid BUILD_ID
- **WHEN** a placeholder map supplies a `BUILD_ID` value outside the
  existing allowed charset
- **THEN** substitution fails with the same validation error as today

### Requirement: BASE_VERSION is auto-supplied, not operator-set
The system SHALL compute `BASE_VERSION` from the base folder's own
`apktool.yml` and merge it into the placeholder map itself, overriding any
caller-supplied `BASE_VERSION` — it is never read from an operator-facing
field.

#### Scenario: Assembling with an explicit placeholder map
- **WHEN** `assembleBundle` is called with any placeholder map, with or
  without a `BASE_VERSION` key present
- **THEN** the actually-used `BASE_VERSION` value always comes from the
  base folder's `apktool.yml`, never from the caller's map

### Requirement: CLI accepts repeatable --set KEY=VALUE, replacing all named flags
The system SHALL accept zero or more `--set KEY=VALUE` flags on
`bundle-tool companion` and `bundle-tool assemble`, accumulating into one
placeholder map. No per-placeholder named flag (`--build-id`,
`--sync-base-url`, etc.) SHALL exist.

#### Scenario: Supplying multiple placeholders
- **WHEN** `bundle-tool assemble ... --set BUILD_ID=b000123 --set
  SYNC_BASE_URL=https://example.test` is run
- **THEN** both `BUILD_ID` and `SYNC_BASE_URL` are substituted as given,
  with no other CLI flag needed for either
