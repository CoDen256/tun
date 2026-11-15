## ADDED Requirements

### Requirement: On-device deck descriptions carry live counts
At every publish, each deck's bundle `Description` SHALL be the operator's
authored prose (`decks.description`) followed by live counts in the form
`· <N> cards · <M> occurrences`, where N is the count of distinct card ids
in the deck's `Cards[]` and M is `Cards[].length`, both computed from the
in-memory model **after** that deck's flush — the counts always describe the
bundle being shipped. The counts SHALL NOT be written into
`decks.description` in the database; the operator's prose remains the only
stored value and stays editable exactly as today.

#### Scenario: counts match the shipped bundle
- **GIVEN** a deck that flushes occurrences this run
- **WHEN** the publish completes and the device activates the new bundle
- **THEN** the deck's description on the device shows the prose followed by
  the card and occurrence counts of the just-published bundle, not the
  pre-flush counts

#### Scenario: prose stays the editable half
- **WHEN** the operator edits a deck's description in the console and the
  next publish runs
- **THEN** the device shows the new prose with regenerated counts appended,
  and the database row contains only the prose

### Requirement: Publish-time version facts are restamped at publish
The publish step SHALL restamp `BUILD_ID`, `LABEL`, `DATA_VERSION`, and
`BUILT_AT` in the working bundle's companion before the bundle's sha256 is
computed and `publish()` runs. `BASE_VERSION` and `PATCH_REV` remain
assemble-time facts. `BUILT_AT` SHALL be an ISO-8601 UTC timestamp, and the
same instant SHALL be written to `publications.created_at`, so the device
display and the console history can never disagree.

#### Scenario: a second publish off one logic bundle is not stale
- **GIVEN** a logic bundle assembled when the latest data rev was 240
- **WHEN** builder publishes twice off it (data 246, then data 247)
- **THEN** the second published bundle carries label/data-version/built-at
  of the second publish, not the assemble-time or first-publish values
