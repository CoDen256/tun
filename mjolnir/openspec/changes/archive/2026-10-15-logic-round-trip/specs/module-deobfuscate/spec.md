## ADDED Requirements

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
