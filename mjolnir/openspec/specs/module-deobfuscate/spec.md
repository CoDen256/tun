## Purpose

Make known minified idioms in logic modules readable without relying on any metadata, by fingerprinting code shape through AST canonicalization and rewriting matches to named helper calls.

## Requirements

### Requirement: Alpha-equivalence canonicalization
The system SHALL provide a canonicalization function that, given a module's AST, renames every local binding introduced by a function parameter, variable declarator, or catch clause parameter to a name derived solely from the deterministic order in which bindings are first encountered during traversal, while leaving property names, member-expression property identifiers, literals, and globally-resolved (unbound) identifiers unchanged.

#### Scenario: Two alpha-equivalent modules canonicalize identically
- **WHEN** two modules are structurally identical except for the spelling of their local parameter and variable names
- **THEN** canonicalizing both produces ASTs that generate to byte-identical source

#### Scenario: Property names and globals are not canonicalized
- **WHEN** a module's AST contains an object property key, a member expression property, or a reference to an unbound (global) identifier
- **THEN** canonicalization leaves that name unchanged

### Requirement: Pattern-fingerprint rule matching
The system SHALL identify instances of a known minified idiom within a logic module's AST by comparing the canonicalization-derived content hash of each candidate subtree against the content hash of a registered rule's reference pattern, and SHALL replace each match with a call to a named helper function.

#### Scenario: Matching the interop-wildcard helper pattern
- **WHEN** a logic module's AST contains a subtree structurally equivalent (after canonicalization) to the registered interop-wildcard IIFE pattern
- **THEN** the system replaces that subtree with a call to a named `_interopRequireWildcard` helper

#### Scenario: No match for unrelated code
- **WHEN** a logic module's AST contains no subtree matching any registered rule's canonicalized hash
- **THEN** the system leaves that module's code unmodified by the rule engine

### Requirement: Deobfuscated output location
The system SHALL write a deobfuscated version of every `logic`-classified module (per the explode manifest's classification) to a dedicated subdirectory of the bundle's exploded output, and SHALL skip `data`-classified modules.

#### Scenario: Deobfuscating an exploded bundle
- **WHEN** a user runs the deobfuscate command against a bundle that has already been exploded
- **THEN** the system writes one deobfuscated file per `logic`-classified module to a `deobfuscated/` subdirectory of the exploded output, and writes no file there for `data`-classified modules

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
