# operator-settings

## Purpose

Server-side storage, in hub's own database, for the operator's view and
preview preferences on the Cards page — so a preference survives a browser
change and a database outage degrades to defaults instead of breaking the
page.

## Requirements

### Requirement: Operator view settings are persisted server-side in hub
Hub SHALL keep a key → JSON settings store in its own database, holding the
Cards page view (source, filters, sort and its direction, page size, page) and the
preview's preferences (simulated device, theme, font size, default
direction, tools drawer size, active tab, drawer open or closed). There is
one operator, so the store SHALL have no user dimension.

Loading the Cards page SHALL restore the saved settings; changing any of
them SHALL save them without a separate save action. A saved value that no
longer applies (a build no longer published, a filter not offered for the
saved source) SHALL fall back to its default rather than break the page.
When the database is unavailable the page SHALL render with defaults (D157)
rather than fail. The store SHALL be reachable only from the operator plane.

#### Scenario: Settings survive a browser change
- **WHEN** the operator sets the source to a bundle, sorts by deck
  descending, picks 50 per page, sets the preview to Dark at font 18, then
  opens the Cards page in a fresh browser profile
- **THEN** the page opens with that source, sort, page size, theme and font
  size

#### Scenario: Reset view
- **WHEN** the operator presses Reset view
- **THEN** every list and preview setting returns to its default and the
  defaults are what a reload shows
