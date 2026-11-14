## MODIFIED Requirements

### Requirement: Single persistent app server
The system SHALL provide a command that starts one HTTP server bound to
`127.0.0.1` without requiring a bundle path argument, serving a general
bundle-workbench UI, **and SHALL additionally make that same UI reachable
embedded within hub's own operator console, with no local `bundle-tool
ui`/npx invocation required for a deployed instance.**

#### Scenario: Starting the app without a bundle
- **WHEN** a user runs the UI command with no bundle argument
- **THEN** the system starts a local server bound to `127.0.0.1` and serves
  the app shell, with no bundle session open yet

#### Scenario: Reaching the workbench through a deployed hub, with no local invocation
- **WHEN** an operator navigates to `/mjolnir/workbench` on a deployed hub
  instance
- **THEN** the system serves the same bundle-workbench app shell — Explorer,
  Compare, Editor, Patches, Assemble — gated by the same operator-auth check
  every other hub page already uses, without the operator needing to run
  `bundle-tool ui` (or `npx`) on any machine

#### Scenario: Opening a specific bundle from hub's publish history
- **WHEN** an operator clicks "inspect" on a row in hub's publish-history page
- **THEN** the system opens a bundle-workbench session for that exact
  published build's file (via a `?open=<path>` query param) and switches to
  the Explorer view, with no path to copy-paste by hand
