## ADDED Requirements

### Requirement: Audio manifest entries respect a note's trim selection
The system SHALL produce a card's audio manifest entry from the bytes
selected by `audio_sel_ms` when present, rather than the full original blob,
and SHALL leave the original blob in stabbur's canonical store untouched.

#### Scenario: A note with a trim selection
- **WHEN** a card's source note has `audio_sel_ms` set to a sub-range of its
  `audio_blob`
- **THEN** the audio manifest entry for that card references bytes trimmed
  to that range, and the original untrimmed blob remains available and
  unmodified

#### Scenario: A note with no trim selection
- **WHEN** a card's source note has `audio_sel_ms` null
- **THEN** the audio manifest entry references the original blob unchanged

### Requirement: Draining the occurrence queue is deterministic
The system SHALL drain pending occurrences in a fixed, reproducible order
(insertion order) when multiple rows reach `remaining <= 0` in the same run.

#### Scenario: Two rows cross zero in the same run
- **WHEN** two pending occurrences in the same deck both reach
  `remaining <= 0` during one run's drain step
- **THEN** the one queued earlier is always appended to `Cards[]` before the
  one queued later, on every run given the same inputs
