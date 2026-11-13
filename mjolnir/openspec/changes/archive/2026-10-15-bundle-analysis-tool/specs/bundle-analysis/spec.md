## ADDED Requirements

### Requirement: Module index extraction
The system SHALL parse a Metro bundle file by walking its top-level AST statements and SHALL identify every module as a top-level `__d(factory, moduleId, dependencyArray[, verboseName])` call expression, recording each module's exact byte start/end offsets, factory byte start/end offsets, numeric module id, dependency ids, and the file's entry module id from the trailing `__r(entryId)` call.

#### Scenario: Module spanning multiple physical lines
- **WHEN** a module's factory body contains a block comment with literal embedded newlines (e.g. unminified vendor code bundled as-is)
- **THEN** the system identifies it as a single module with byte offsets covering its entire `__d(...)` call, not split by line boundaries

#### Scenario: Entry point identification
- **WHEN** the bundle ends with a top-level `__r(<id>)` call
- **THEN** the system records `<id>` as the entry module id

### Requirement: Cached, invalidation-safe index
The system SHALL persist the module index to a JSON cache file alongside the analyzed bundle, keyed by the bundle's file size and modification time, and SHALL automatically rebuild the cache (re-parsing the bundle) whenever the bundle's current size or mtime no longer matches the cached values.

#### Scenario: Unchanged bundle, repeated query
- **WHEN** a command is run against a bundle whose cache is present and matches the bundle's current size and mtime
- **THEN** the system reuses the cached index without re-parsing the bundle

#### Scenario: Bundle replaced by a new upstream build
- **WHEN** a command is run against a bundle whose size or mtime no longer matches the cached index's recorded values
- **THEN** the system re-parses the bundle and overwrites the cache before answering the query

### Requirement: Bidirectional dependency graph
The system SHALL expose, for any module id, both its direct dependencies (from its dependency array) and its direct dependents (modules whose dependency array references it), and SHALL support walking either direction to an arbitrary requested depth.

#### Scenario: Forward dependency walk
- **WHEN** a user requests the dependencies of a module id at depth N
- **THEN** the system returns all module ids reachable by following dependency edges up to N hops, grouped by hop distance

#### Scenario: Reverse dependency walk
- **WHEN** a user requests the dependents of a module id at depth N
- **THEN** the system returns all module ids that transitively depend on it up to N hops, grouped by hop distance

### Requirement: Bounded output
The system SHALL cap the number of module ids printed per dependency-graph depth level at a fixed limit, and SHALL indicate how many additional ids were omitted rather than silently truncating or printing an unbounded list.

#### Scenario: Querying a widely-shared utility module
- **WHEN** a user requests the dependents of a module that has more direct or transitive dependents than the print limit
- **THEN** the system prints up to the limit, followed by an explicit count of the remaining omitted ids

### Requirement: Isolated module inspection
The system SHALL allow retrieving a single module's source by id, either as the original raw bytes or re-formatted/pretty-printed in isolation, without requiring the full bundle file to be read or printed in its entirety.

#### Scenario: Viewing a single minified module
- **WHEN** a user requests to show a module id that is part of a multi-megabyte bundle
- **THEN** the system returns only that module's source (raw or pretty-printed), reading just its byte range rather than the whole file

#### Scenario: Pretty-print failure fallback
- **WHEN** a module's isolated source fails to re-parse for pretty-printing
- **THEN** the system reports the failure and falls back to returning the raw source rather than failing the request entirely

### Requirement: Scoped content search
The system SHALL support searching module source for a literal string or regular expression pattern across the bundle, returning only matching module ids with small bounded context snippets rather than full module contents or unbounded match output.

#### Scenario: Pattern match within a module
- **WHEN** a search pattern matches text inside a module's source
- **THEN** the system reports the module id and a short snippet of surrounding context, not the full module body

#### Scenario: Excess matches
- **WHEN** the number of matches exceeds a configured limit
- **THEN** the system stops reporting further matches and indicates the limit was reached
