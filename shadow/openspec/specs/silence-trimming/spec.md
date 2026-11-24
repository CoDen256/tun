# silence-trimming

## Purpose
How shadow skips the silence around speech: a playback-and-display-only
window inside each sentence's stored span, one setting governing both the
audiobook's sentences and the learner's takes, and the hard rule that
trimming never touches stored spans or progress.

## Requirements

### Requirement: Silence is trimmed for playback and display, never for progress
A sentence SHALL carry, in addition to its stored span, the window within
that span where speech actually occurs. Playback and the drawn waveform
SHALL use the speech window. The sentence's stored span SHALL NOT change.

Marking a sentence done SHALL continue to cover its **full stored span**, not
the trimmed window. Therefore the coverage rule, conjunctive merge,
preserving split, cross-configuration carry-over and the time-position cursor
are unaffected by trimming, and no progress migration is required.

Tightening a sentence's stored boundaries to the speech window is
explicitly FORBIDDEN: the silence between sentences would then belong to no
sentence and could never be marked done, leaving a wider sentence in another
configuration permanently not-done.

#### Scenario: Trimming does not change any sentence's done state
- **WHEN** trimming is enabled and then disabled
- **THEN** the set of sentences reading as done is identical in both states

#### Scenario: Marking done still covers the full span
- **WHEN** a sentence is marked done while trimming is enabled
- **THEN** a sentence of another configuration lying entirely inside that
  sentence's FULL stored span reads as done

#### Scenario: Stored spans are untouched
- **WHEN** trimming is enabled, disabled, or recomputed
- **THEN** no segment's stored start or end position changes

### Requirement: One setting governs trimming of both the sentence and the recording
Trimming SHALL be controlled by exactly one operator-facing setting, default
ON, applying to both the audiobook's sentences and the learner's recordings.
It SHALL live with the application's settings, not among the per-sentence
study controls.

Detection SHALL be conservative at speech onsets: clipping the beginning of a
soft consonant changes what the learner shadows against, and does so
invisibly.

#### Scenario: One control, both lanes
- **WHEN** the setting is turned off
- **THEN** both the sentence and the recording play and draw their full spans

#### Scenario: Leading silence is skipped
- **WHEN** a sentence whose span begins with silence is played with trimming on
- **THEN** sound begins promptly rather than after the silence

### Requirement: Trimming a recording does not make it persistent
Trimming of the learner's take SHALL happen in the browser, on bytes
discarded with the session. No trimmed or untrimmed take SHALL be sent to the
server for storage.

#### Scenario: A trimmed take is still ephemeral
- **WHEN** a take is recorded, trimmed and played back, and the page is reloaded
- **THEN** no take exists for that sentence
- **AND** no request carrying recorded audio was sent for storage

### Requirement: A manually edited sentence trims like an analysed one
The speech window of a sentence produced by a manual split or merge SHALL
equal, within 20 ms at each edge, the window analysis would produce for the
same span under the same configuration's thresholds. Windows of rows created
before this requirement are not recomputed; re-analysing the configuration
replaces them.

#### Scenario: Split halves trim like analysed sentences
- **WHEN** a sentence with leading and trailing silence is split in two and
  each half has silence at its outer edge
- **THEN** each half plays without its outer edge silence, as an analysed
  sentence does
