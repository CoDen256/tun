# builder-pipeline

## ADDED Requirements

### Requirement: Publish-time version facts are restamped into the bundle at publish
The system SHALL restamp, into the bundle it is about to publish, every
version fact that is determined at publish time — the build identity, the
data revision, and the build timestamp — before the bundle's hash is computed
and the bundle is published. Facts determined at assemble time, namely the
base version and the patch revision, SHALL NOT be restamped.

The restamp SHALL locate each value by its constant name in the bundle, not
by the literal that assemble happened to bake, so that it succeeds regardless
of what the bundle currently says.

#### Scenario: A second publish from the same logic bundle
- **WHEN** a logic bundle that has already been published once is published
  again with a new data revision
- **THEN** the newly published bundle carries the new build identity, the new
  data revision and the new build timestamp, none of them still showing the
  values baked at assemble time

#### Scenario: The bundle's hash reflects the restamped values
- **WHEN** a publish restamps the bundle's publish-time facts
- **THEN** the published bundle's recorded hash is the hash of the bundle
  containing the restamped values

### Requirement: The build timestamp and the publication record are the same instant
The system SHALL use one timestamp for both the build timestamp stamped into
the bundle and the publication record written for that publish, so the
device's reported build time and the console's publication history cannot
disagree.

#### Scenario: Comparing the device's build time to the publication record
- **WHEN** a publish completes
- **THEN** the build timestamp carried by the published bundle equals the
  publication record's creation instant

### Requirement: A deck's on-device description carries the counts actually in the bundle
The system SHALL format, into each deck's description in the published
bundle, the operator's own description text followed by the number of cards
and the number of occurrences that deck actually contains in the bundle being
published. These counts SHALL NOT be written into the database — the
operator's text remains the only stored part of the description.

#### Scenario: Publishing a deck that flushes occurrences in this run
- **WHEN** a deck flushes occurrences during a publish
- **THEN** the published deck description's counts include those
  just-flushed occurrences, rather than the counts as they stood before the
  flush

#### Scenario: The operator edits a deck's description
- **WHEN** the operator edits a deck's description text
- **THEN** only their text is stored, and the counts are re-derived at the
  next publish rather than being persisted alongside it

#### Scenario: Counts describe the bundle, not eventual totals
- **WHEN** a deck holds cards whose further occurrences are still staged or
  queued
- **THEN** the description's occurrence count is the number present in the
  bundle, not the number those cards will eventually contribute
