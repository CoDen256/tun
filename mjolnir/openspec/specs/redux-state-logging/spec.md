# redux-state-logging

## Purpose

Defines how the app's stock Redux action/state stream is rendered to
`adb logcat`. The stock `redux-logger` middleware (module 956, wired in
module 953's store setup) must emit each `%c action`/`%c prev state`/
`%c next state` entry as a single-line `JSON.stringify`'d log, matching
this project's existing one-line breadcrumb convention (D63,
`[mjolnir-ota-debug]`, `[mjolnir-audio-prefetch]`, etc.) rather than the
stock pretty-printed, multi-line default — so `adb logcat` stays usable
for live debugging instead of being drowned out by dozens of lines per
dispatched action.

## Requirements

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
