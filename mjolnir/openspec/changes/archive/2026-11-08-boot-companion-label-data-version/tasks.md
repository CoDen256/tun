## 0. Before you write any code

Depends on `generic-placeholder-substitution` landing first — this change
adds new keys to that mechanism, not new plumbing. Read `design.md` in
full, especially D-L1 (free-form strings, no bespoke validation) and D-L3
(workbench pre-fill sources, not hardcoded values). Read the real current
source of `patches/js/boot-ok-companion.js` and
`patches/js/2176-my-account-build-id.edited.js` before patching — confirm
the existing "App version" row's exact structure to match its style for
the two new rows.

## 1. Boot companion

- [x] 1.1 `boot-ok-companion.js`: bake `__MJOLNIR_LABEL__`/
      `__MJOLNIR_DATA_VERSION__` as plain string constants, exposed as
      `globalThis.MJOLNIR_LABEL`/`globalThis.MJOLNIR_DATA_VERSION`, same
      pattern as the existing three globals.
- [x] 1.2 Tests: the companion's test harness confirms both globals are
      set correctly when the placeholders are substituted, and confirms
      the existing three globals' behavior is unaffected.

## 2. Account screen

- [x] 2.1 `2176-my-account-build-id.edited.js`: add "Label" and "Data
      version" rows, same label/value pair pattern as "App version",
      reading `globalThis.MJOLNIR_LABEL`/`globalThis.MJOLNIR_DATA_VERSION`
      with the same "embedded" fallback the existing row uses when unset.
- [x] 2.2 Tests: both new rows render the baked values when present, and
      the "embedded" fallback when absent (e.g. the tier-4 asset case).

## 3. Workbench pre-fill

- [x] 3.1 Assemble tab's key/value editor (from `generic-placeholder-
      substitution`) pre-fills `DATA_VERSION` from hub's `publications`
      table's most recent `data_rev` (same source `PATCH_REV`'s
      suggestion already reads), and `LABEL` from whatever label value is
      already associated with the in-progress assemble (reusing the
      existing label input's value, not asking the operator to type it
      twice).
- [x] 3.2 Tests: the pre-filled defaults match what the OTA console
      displays for the same build.

## 4. Sign-off

- [x] 4.1 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
- [x] 4.2 **(Operator, outside this change)** Assemble/install a bundle
      with a known label/data version; confirm on-device the account
      screen shows them correctly.
