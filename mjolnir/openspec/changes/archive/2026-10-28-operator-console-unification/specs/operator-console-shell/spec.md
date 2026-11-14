## ADDED Requirements

### Requirement: Hub, builder, and the workbench are presented as sections of one consistent design
The system SHALL present Cards, Builder, OTA, and Tools as sections of one
consistent operator console design — one shared navigation rail, one visual
theme — without requiring the operator to navigate between separately-
styled, separately-themed service pages to reach each one. **Revised**:
navigating between sections MAY be a full page navigation (an ordinary link
in the shared rail), so long as the destination page renders in the same
shared shell/theme — this is not required to be a single-page, no-reload
experience. (An earlier iframe-based "unified console," where every section
was framed inline with no navigation at all, was tried and reversed — see
D109 — because it doubled chrome and visually fought the content it framed;
ordinary navigation within one consistent shell solves the actual problem
without that cost.)

#### Scenario: Switching between sections
- **WHEN** the operator selects a different section (Cards, Builder, OTA, or
  Tools) from the shared navigation rail
- **THEN** that section's page renders using the same shared design (nav
  rail, theme, styling) as every other section, whether or not the
  navigation triggers a full page load

#### Scenario: Each section remains independently reachable
- **WHEN** the operator navigates directly to one service's own existing page
  (not through the shared navigation rail)
- **THEN** that page still works exactly as it did before this change

### Requirement: The unified design does not require merging hub and builder into one backend process
The system SHALL achieve the unified presentation without combining hub's and
builder's independently-deployed backend processes into a single process.

#### Scenario: Hub and builder remain independently deployable
- **WHEN** hub and builder are deployed as separate containers/processes, as
  before this change
- **THEN** the unified presentation still renders Builder's pages correctly
  (hub imports builder's page-rendering functions directly, in-process, sharing
  the same Postgres connection — not a network call to builder's own
  process), with no requirement that they run as one process

### Requirement: The workbench tool is reachable as its own tab, not framed inline
The system SHALL present the bundle-workbench tool as a normally-navigable
page (opening in a new tab is acceptable and the default), rather than
embedding it as an iframe nested inside another page's chrome.

#### Scenario: Opening the workbench from the shared navigation rail
- **WHEN** the operator selects "Bundle workbench" from the shared
  navigation rail
- **THEN** the workbench opens as its own page/tab, with its own internal
  tab bar (Explorer/Compare/Editor/Patches/Assemble/Catalogue) intact and
  not nested inside a second, outer tab bar
