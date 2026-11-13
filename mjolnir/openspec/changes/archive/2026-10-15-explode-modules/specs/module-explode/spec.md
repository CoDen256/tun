## ADDED Requirements

### Requirement: Per-module file explode
The system SHALL write every module in a parsed bundle's index to its own file under a predictable output directory derived from the bundle path, and SHALL overwrite that directory's contents in full on every invocation rather than performing an incremental or partial update.

#### Scenario: Exploding a bundle for the first time
- **WHEN** a user runs the explode command against a bundle with no existing exploded output
- **THEN** the system creates the output directory and writes one file per module id

#### Scenario: Re-exploding an already-exploded bundle
- **WHEN** a user runs the explode command against a bundle whose output directory already exists
- **THEN** the system rebuilds the module index from the current bundle contents and overwrites every file in the output directory, rather than merging with or preserving prior output

### Requirement: Pretty-printed module output
The system SHALL write each module's factory source re-formatted via the same parse/generate path used by isolated module inspection, and SHALL fall back to the module's raw source for a given file if re-parsing that module fails, consistent with the existing pretty-print failure fallback behavior.

#### Scenario: Exploding a module that pretty-prints successfully
- **WHEN** a module's factory source re-parses without error during explode
- **THEN** the system writes the pretty-printed source to that module's file

#### Scenario: Exploding a module that fails to re-parse
- **WHEN** a module's factory source fails to re-parse during explode
- **THEN** the system writes that module's raw original source to its file instead of failing the entire explode operation

### Requirement: Explode manifest
The system SHALL write a single manifest file alongside the per-module files recording, for every module, its exploded file path, its original byte offsets (module start/end and factory start/end), its dependency ids, and its data-or-logic classification.

#### Scenario: Reading the manifest after an explode
- **WHEN** a user or later tooling reads the manifest produced by an explode operation
- **THEN** every module id present in the bundle's index has a corresponding manifest entry with its file path, byte offsets, dependency ids, and classification

### Requirement: Data-versus-logic classification
The system SHALL classify each module as `data` if it has no dependencies and its factory body consists of a single return or exports assignment of an array or object literal containing no nested function declarations or function expressions anywhere within that literal, and SHALL classify every other module as `logic`.

#### Scenario: Classifying a dependency-free literal-exporting module
- **WHEN** a module has an empty dependency array and its factory body is a single statement assigning or returning an array or object literal with no function declarations or expressions nested inside it
- **THEN** the system classifies that module as `data`

#### Scenario: Classifying a module that merely references data-shaped property names
- **WHEN** a module's factory body contains control flow, function declarations, or property access expressions rather than being a single literal-only return or assignment
- **THEN** the system classifies that module as `logic`, regardless of whether its code references property names that also appear in data modules
