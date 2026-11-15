## MODIFIED Requirements

### Requirement: Explorer view over the existing read-only module surface
The Explorer SHALL list a session's modules with id, classification, size
and verboseName, sortable by each, and SHALL offer one search box over
that list.

That search box SHALL find a module **by its own number** as well as by
its source text. Today it cannot: the query goes only to the server-side
full-text source search, and a module's id never appears inside its own
body, so searching `2110` returns every module that `require`s 2110 and
never module 2110 itself.

When the query is numeric the results SHALL be grouped, in this order:

1. **exact id** — the module whose id equals the query, presented as a
   single prominent jump row carrying the same id / classification / size /
   verboseName the unsearched list shows, and labelled as an exact-id match
2. **ids containing the query** — e.g. `12110` and `21100` for `2110`,
   same row shape
3. **source mentions** — the existing full-text hits with their snippets,
   under a heading that makes clear these are source matches

When the query is not numeric, only the source-mentions group SHALL
render, exactly as today. Empty groups SHALL be omitted rather than shown
empty. There SHALL be no mode toggle — one box serves both kinds of query.

#### Scenario: Searching for a module by its number
- **WHEN** the operator types `2110` into the Explorer search box for a
  session containing module 2110
- **THEN** a jump row for module 2110 appears first, above any source hits
- **AND** selecting it opens module 2110 in the detail pane

#### Scenario: A number that is also a substring of other ids
- **WHEN** the operator types `2110` and the session also contains modules
  `12110` and `21100`
- **THEN** both appear under an "ids containing" group, below the exact
  match and above the source hits

#### Scenario: A numeric query with no module of that id
- **WHEN** the operator types a number matching no module id
- **THEN** no exact-id group renders, and the source hits render as today

#### Scenario: A non-numeric query is unchanged
- **WHEN** the operator types `subscription`
- **THEN** only source-mention hits render, with snippets, as today
