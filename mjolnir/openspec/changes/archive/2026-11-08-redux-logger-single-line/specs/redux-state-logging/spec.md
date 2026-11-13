## ADDED Requirements

### Requirement: Redux action/state log entries render as single lines
The system SHALL render every Redux `action`/`prev state`/`next state`
log entry emitted by the store's logging middleware as a single
`console.log` call producing one `JSON.stringify`'d line, not a
pretty-printed multi-line object tree.

#### Scenario: An action is dispatched
- **WHEN** any Redux action is dispatched through the store
- **THEN** the `%c action` log entry it produces is a single
  `JSON.stringify`'d line, not a multi-line pretty-printed object

#### Scenario: State changes as a result of a dispatch
- **WHEN** a dispatched action changes the store's state
- **THEN** both the `%c prev state` and `%c next state` log entries are
  each a single `JSON.stringify`'d line, not multi-line pretty-printed
  object trees

### Requirement: Logging volume and captured data are unchanged
The system SHALL continue to log the same actions and the same state
content as before this change — only the rendering format changes.

#### Scenario: Comparing logged content before and after the format change
- **WHEN** the same sequence of actions is dispatched
- **THEN** the same actions and the same state values appear in the log
  stream as before, differing only in single-line vs. multi-line
  rendering
