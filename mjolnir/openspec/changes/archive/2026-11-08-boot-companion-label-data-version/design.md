## Context

`boot-ok-companion.js` already bakes `BUILD_ID`/`BASE_VERSION`/`PATCH_REV`
as plain top-level constants, exposed as `globalThis.MJOLNIR_*` globals
read by module 2176's account screen (`typeof globalThis !== 'undefined'
&& globalThis.MJOLNIR_BUILD_ID+' base:'+globalThis.MJOLNIR_BASE_VERSION ||
'embedded'`). `label` and `data_rev` already exist server-side —
`publications.label` (free text, operator-set at publish time) and
`publications.data_rev` (integer, auto-bumped by builder every publish,
`hub/migrations/001_init.sql:37`) — but neither is baked into the bundle
itself, so there's no on-device way to see them without cross-referencing
hub's own OTA console.

## Goals / Non-Goals

**Goals:**
- `MJOLNIR_LABEL`/`MJOLNIR_DATA_VERSION` baked the same way the existing
  three globals are — plain constants, no new mechanism.
- Visible on the account screen as their own rows.
- Workbench pre-fills sensible defaults for both, same spirit as its
  existing `PATCH_REV` next-value suggestion.

**Non-Goals:**
- Not changing what `label`/`data_rev` mean or how they're computed
  server-side — purely exposing the existing values on-device.

## Decisions

### D-L1 — Both are free-form strings, no bespoke validation

Neither needs the `_URL` https-check, the build-id/base-version charset
check, or the patch-rev integer check (`generic-placeholder-
substitution`'s D-G1) — `LABEL` is free text by definition, and
`DATA_VERSION` is baked as a bare string the same way `BASE_VERSION` is
(display-only, nothing parses it back out on-device), even though its
server-side source column is an integer.

### D-L2 — Account screen gets two new rows, not folded into "App version"

Matches the existing settings-row pattern already used for "Completed
sessions"/"Cards archived"/etc. in module 2176 — one label/value pair per
row, not concatenated into the existing "App version" string.

### D-L3 — Workbench pre-fills from `publications`, not hardcoded

`DATA_VERSION`'s pre-filled default reads the most recent `data_rev` from
`hub/src/publications.js`'s `previousVersions()` (same source
`assembleDefaults`/`nextPatchRev` already use for `PATCH_REV`'s
suggestion) — not a hardcoded placeholder value. `LABEL`'s pre-filled
default is whatever label (if any) is already associated with the
in-progress assemble (same field already shown elsewhere in the Assemble
tab, e.g. the existing `label` input used at submit time) — reusing that
same value rather than asking the operator to type it twice.

## Risks / Trade-offs

- **`DATA_VERSION` baked as a string loses its integer-ness on-device** —
  acceptable, since nothing on-device ever needs to do arithmetic on it,
  only display it (same reasoning `BASE_VERSION`/`PATCH_REV` already
  apply, even though `PATCH_REV` itself actually IS baked as a raw
  number literal, not a string — `DATA_VERSION` doesn't need that, since
  nothing reads it as a number anywhere; kept as a plain quoted string for
  simplicity).
