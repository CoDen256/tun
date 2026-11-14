## ADDED Requirements

### Requirement: Refactor equivalence check
The system SHALL verify whether a module's current on-disk source is behavior-equivalent to a given baseline source by canonicalizing both and comparing the canonicalized results for structural equality, reporting pass when they are equal and fail with the detected difference when they are not.

#### Scenario: Refactor-only edit passes the check
- **WHEN** a module's current source differs from its baseline only in local identifier names and formatting
- **THEN** the check reports pass

#### Scenario: A semantic edit fails the check
- **WHEN** a module's current source differs from its baseline in any way that survives canonicalization (e.g. a changed literal, added statement, or different call target)
- **THEN** the check reports fail and shows the canonicalized difference that caused the failure
