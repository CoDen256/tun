# Spec Delta

## ADDED Requirements

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
