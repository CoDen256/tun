# split-configs

## Purpose
How a book is segmented into sentences. Server-side analysis producing time ranges only, several named split configurations per book, config-scoped re-analysis, and manual boundary editing by ear.

## Requirements

### Requirement: Segmentation runs server-side and yields ranges only
Chapter and sentence boundaries SHALL be computed by silence analysis of
the stored Opus master, on the server, and persisted as
`{kind, start_ms, end_ms}` rows. The result SHALL be ranges and nothing
else — no audio is cut, copied or stored by an analysis.

Analysis SHALL be repeatable: running it again with different thresholds
SHALL produce a different set of ranges and SHALL leave the stored audio
untouched.

#### Scenario: Re-analysis changes ranges, not audio
- **WHEN** a config is re-analysed with different silence thresholds
- **THEN** its sentence count changes
- **AND** the number of stored audio files is unchanged

### Requirement: A book holds several named split configurations
A book SHALL be able to hold more than one split configuration. Each
configuration SHALL carry its own name, its own two silence thresholds, its
own boundary rows and its own manual edits. Exactly one configuration SHALL
be active at a time, and Study and Explore SHALL always operate on the
active one.

An operator SHALL be able to create, make active, rename, duplicate and
delete a configuration. None of these operations SHALL require re-uploading
or re-transcoding the master.

#### Scenario: Configs are independent
- **WHEN** a second configuration is created with different thresholds
- **THEN** the first configuration's sentence count and boundaries are unchanged
- **AND** switching back to it shows those original boundaries

#### Scenario: Activation does not touch stored audio
- **WHEN** a different configuration is made active
- **THEN** the sentences shown in Study and Explore change
- **AND** the master file is neither rewritten nor re-transcoded

### Requirement: Re-analysis discards manual edits in that configuration only
Re-running analysis on a configuration SHALL discard manual boundary edits
belonging to **that** configuration, SHALL state so in the page before
proceeding, and SHALL leave every other configuration's manual edits
intact. It SHALL NOT discard progress, which does not belong to a
configuration.

Confirmations and warnings SHALL be rendered in the page. The UI SHALL NOT
use browser `alert`, `confirm` or `prompt` dialogs.

#### Scenario: Another config's manual edit survives a re-analysis
- **WHEN** configuration A is re-analysed after configuration B received a
  manual split
- **THEN** B's manually split boundary is still present

### Requirement: Boundaries can be edited manually, by ear
An operator SHALL be able to split a sentence at a chosen position and
merge a sentence with the one following it, from both the Prepare screen
and the Study screen.

Because a boundary cannot be judged without hearing it, every sentence row
in Prepare SHALL offer a waveform of that sentence and a preview that plays
only that sentence, and the split control SHALL present a scrubber on which
the split position is chosen directly.

#### Scenario: A split meets exactly at the chosen position
- **WHEN** a sentence is split at a chosen millisecond
- **THEN** two rows exist whose ranges meet exactly at that millisecond

#### Scenario: A merge spans both originals
- **WHEN** a sentence is merged with the one following it
- **THEN** the resulting range starts at the first's start and ends at the
  second's end
