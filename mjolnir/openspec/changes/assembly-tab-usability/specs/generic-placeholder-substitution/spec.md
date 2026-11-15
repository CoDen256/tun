## ADDED Requirements

### Requirement: The Assemble tab has exactly one home for every baked value
The Assemble tab SHALL present every operator-settable value as a row in
the one Placeholders list, and SHALL NOT present any such value in a
dedicated field of its own. The dedicated "Label" field and the dedicated
"Patch rev (logic version)" field SHALL be removed.

The `PATCH_REV` row SHALL be the single source of the run's patch rev — it
feeds hub's own `patch_rev` column and the submitted bundle's
`__MJOLNIR_PATCH_REV__` substitution alike, not merely the latter. The
`LABEL` row SHALL likewise be the single source of the logic bundle's
label. Neither value SHALL be readable from two places in the form, and no
client-side "copy this field into that row if the row is blank" reconciling
SHALL remain.

`BASE_VERSION` stays absent from the list (D-G2: always read from the base
folder's own `apktool.yml`).

#### Scenario: Opening the Assemble tab
- **WHEN** the operator opens the Assemble tab in embedded mode
- **THEN** no field labelled "Label" and no field labelled "Patch rev"
  exists anywhere outside the Placeholders list
- **AND** the Placeholders list contains a `PATCH_REV` row and a `LABEL` row

#### Scenario: An edited PATCH_REV row reaches the database
- **WHEN** the operator changes the `PATCH_REV` row's value to a number
  other than the suggested one and assembles
- **THEN** the created logic bundle's `patch_rev` is that number
- **AND** the bundle's baked `__MJOLNIR_PATCH_REV__` is the same number

#### Scenario: An edited LABEL row reaches the database
- **WHEN** the operator changes the `LABEL` row's value and assembles
- **THEN** the created logic bundle's label is that value

### Requirement: Placeholder rows arrive prefilled with the server's actual resolved values
In embedded mode the Assemble tab SHALL populate its placeholder rows with
the values that would actually be used, written into the inputs as real
editable text — not described in hint text beside an empty box.

`/mjolnir/ota/assemble-defaults` SHALL therefore return the resolved
values, not merely booleans reporting that a value is configured:
`nextPatchRev`, a suggested `label`, `dataRev`, and the resolved
`SYNC_BASE_URL`, `AUDIO_BASE_URL` and `SYNC_TOKEN`.

This REVERSES the "booleans only — never the token value itself" choice
recorded in `hub/src/ota.js`. The operator decided it explicitly: the value
is `OPERATOR_AUTH_TOKEN`, which the browser already holds in order to reach
any operator-plane page at all, so returning it to that same page adds no
reader who did not already have it. The route stays inside the operator
plane and is never reachable from the device plane.

`BUILD_ID` SHALL remain blank in embedded mode, since hub assigns its own
at submit time, and SHALL say so rather than appearing merely unset.

#### Scenario: Prefilled values are present as text
- **WHEN** the operator opens the Assemble tab in embedded mode against a
  hub whose last publication had patch rev 16 and data rev 247
- **THEN** the `PATCH_REV` row's value input reads `17`
- **AND** the `LABEL` row's value input reads the suggested
  `<base_version>-patch17`
- **AND** the `DATA_VERSION` row's value input reads `247`
- **AND** the `SYNC_BASE_URL` and `AUDIO_BASE_URL` rows read the server's
  configured URLs
- **AND** assembling without touching any of them produces exactly those
  values

#### Scenario: The token row is prefilled but masked
- **WHEN** the operator opens the Assemble tab on a server with
  `OPERATOR_AUTH_TOKEN` configured
- **THEN** the `SYNC_TOKEN` row holds the real token as a masked value
- **AND** a reveal control next to it shows the token in clear text and
  hides it again

#### Scenario: Standalone mode cannot suggest version values
- **WHEN** the Assemble tab runs standalone (no hub reachable, so no
  `assemble-defaults`)
- **THEN** the `PATCH_REV`, `LABEL` and `DATA_VERSION` rows still exist and
  are empty, with a hint stating no server was reachable to suggest them
- **AND** the `SYNC_BASE_URL` / `SYNC_TOKEN` / `AUDIO_BASE_URL` rows behave
  as today, blank meaning "use this process's own environment"
