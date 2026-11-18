## MODIFIED Requirements

### Requirement: Notes of every status are browsable, filterable, sortable, and searchable
The operator-only notes browser SHALL list notes of every status, with
filters, a sort, and a text search over text, lemma and translations.

The listing SHALL be **paged by the server**: the request SHALL carry a
page size and an offset, and the response SHALL carry both the page's rows
and the **total** number of rows matching the filters. The browser SHALL
show which slice of that total is displayed, and SHALL offer page
navigation and a page-size choice.

The listing SHALL NOT return every matching row in one response.

Status and the presence of audio SHALL be shown as compact indicators with
accessible descriptions rather than as full-width text columns, so the
note's text keeps the available width and the table does not overflow its
container.

This requirement governs the operator-only authoring listing only. The
one-directional read API that external consumers pull from (`notes-read-api`)
is a separate route and SHALL NOT be paged, filtered or reshaped by this
requirement.

#### Scenario: A page and its total
- **GIVEN** 312 notes match the current filters and the page size is 20
- **WHEN** the third page is requested
- **THEN** 20 rows are returned
- **AND** the browser shows that these are rows 41 to 60 of 312

#### Scenario: The last page is partial
- **GIVEN** 312 matching notes and a page size of 50
- **WHEN** the last page is requested
- **THEN** 12 rows are returned and the browser shows 301 to 312 of 312

#### Scenario: Filtering resets to the first page
- **GIVEN** the browser is on page three
- **WHEN** a filter is changed
- **THEN** the first page of the new result set is shown, with its own total

#### Scenario: Status and audio are compact
- **WHEN** the listing is shown
- **THEN** each row's status and audio presence are single indicators carrying an accessible description
- **AND** the table does not scroll horizontally at a typical desktop width

#### Scenario: The read API is unaffected
- **WHEN** the read API is called with its existing parameters
- **THEN** it returns every matching note as before, with no paging and no change of shape
