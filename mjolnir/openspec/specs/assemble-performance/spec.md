# assemble-performance

## Purpose

Defines the performance and correctness bar for `assembleBundle`: it must
build the bundle's module index once per call rather than re-parsing per
patch step, must keep producing byte-identical output to the prior
implementation, and must report its own wall-clock duration so regressions
are visible to operators without a debug flag.

## Requirements

### Requirement: Assembling does not re-parse the whole bundle per patch applied
The system SHALL build the bundle's module index at most once per
`assembleBundle` call, applying every patch, patch-back pair, companion,
and placeholder substitution against an in-memory representation, and
SHALL write the final output to disk exactly once.

#### Scenario: Assembling with multiple patches
- **WHEN** `assembleBundle` is called with N patches and/or patch-back pairs
- **THEN** the underlying bundle source is parsed once, not N times, and
  the total time taken does not scale linearly with N

### Requirement: Identical output to the previous (slower) implementation
The system SHALL produce byte-identical output bundles, for the same
inputs, to what the previous per-step-reparse implementation produced.

#### Scenario: Same inputs, same patches, same order
- **WHEN** the same base folder, patches, patch-back pairs, companions, and
  placeholder values are assembled
- **THEN** the resulting bundle's bytes are identical regardless of which
  implementation produced it

### Requirement: Assemble duration is logged
The system SHALL log the total wall-clock time taken by an `assembleBundle`
call, visible to the operator without a debug flag.

#### Scenario: An operator assembles a bundle
- **WHEN** `assembleBundle` completes (success or failure)
- **THEN** a log line reports how long the call took
