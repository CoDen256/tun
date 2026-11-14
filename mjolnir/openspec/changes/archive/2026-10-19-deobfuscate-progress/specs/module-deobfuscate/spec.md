## ADDED Requirements

### Requirement: Deobfuscate progress reporting
The system SHALL print progress output identifying the current module as it processes each module during a deobfuscate run, so a long-running pass is visibly active rather than silent.

#### Scenario: Running deobfuscate against a large bundle
- **WHEN** a deobfuscate run is processing a bundle with many logic modules
- **THEN** the system prints a progress line for each module identifying at least its module id as it is processed

### Requirement: Cheap rejection of oversized rule candidates
The system SHALL reject a candidate subtree from full rule-matching without canonicalizing or generating its source whenever the candidate's structural size falls outside a tolerance band around every registered rule's reference pattern size, and SHALL NOT change which candidates ultimately match a rule as a result of this rejection.

#### Scenario: A candidate far larger than any registered rule
- **WHEN** a candidate subtree's node count is far outside the tolerance band of every registered rule's reference pattern
- **THEN** the system rejects the candidate without performing full canonicalization or hash computation on it

#### Scenario: Rejection never skips a true match
- **WHEN** a candidate subtree's structural size falls within the tolerance band of a registered rule that would match it
- **THEN** the system still performs full canonicalization and hash comparison, and the match is detected exactly as it would be without the size pre-filter
