## ADDED Requirements

### Requirement: Semantic diff between baseline and modified source
The system SHALL compute and report the semantic differences between a module's refactor-baseline source and its currently-edited source by canonicalizing both and performing a structural comparison, matching nodes by the content hash of their canonicalized subtree with sibling occurrence order used only to disambiguate hash collisions, and SHALL report this diff without writing any output file.

#### Scenario: Reporting a real semantic change
- **WHEN** a module's current source contains a changed literal, added statement, removed statement, or different call target relative to its refactor baseline
- **THEN** the system reports each such change as part of the diff

#### Scenario: Renames produce no reported diff
- **WHEN** a module's current source differs from its refactor baseline only in local identifier spelling or formatting
- **THEN** the system reports no semantic changes

#### Scenario: Disambiguating structurally identical sibling statements
- **WHEN** a module's refactor baseline and current source each contain multiple sibling statements that canonicalize to the same content hash
- **THEN** the system matches same-hash siblings by their relative occurrence order among siblings sharing that hash, rather than misattributing an edit to the wrong one

### Requirement: Patch-back onto the original module
The system SHALL apply a module's diffed semantic changes to the original (pre-deobfuscation) module's AST at the corresponding structurally-matched locations, and SHALL re-minify only that module's resulting source, without altering the module's `__d(...)` wrapper id or dependency array.

#### Scenario: Applying a semantic edit to the original module
- **WHEN** a diff reports semantic changes for a module
- **THEN** the system produces a new version of that module's original AST with those changes applied, re-minified, with its module id and dependency array unchanged

### Requirement: Byte-exact reassembly of unchanged modules
The system SHALL reassemble a full bundle file by copying every module not targeted by patch-back verbatim from its original byte offsets, splicing in re-minified patched modules in their place, and preserving the bundle's prelude and entry-point trailer unchanged.

#### Scenario: Reassembling with no changed modules
- **WHEN** reassembly is run with no modules targeted for patch-back
- **THEN** the resulting bundle file is byte-identical to the original bundle

#### Scenario: Reassembling with one changed module
- **WHEN** reassembly is run with exactly one module targeted for patch-back
- **THEN** every other module's bytes in the resulting bundle are identical to the original bundle's corresponding byte ranges, and the targeted module's bytes reflect its re-minified patched source
