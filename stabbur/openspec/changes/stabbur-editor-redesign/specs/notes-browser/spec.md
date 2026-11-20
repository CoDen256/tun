# Spec Delta — notes-browser

## ADDED Requirements

### Requirement: The notes list has rich filters and sorts
The notes browser SHALL filter, server-side and combinable, by:
- status (any, draft, ready)
- type (any subset)
- part of speech (any subset of the supported classes)
- origin (any subset of manual, capture, import)
- audio (any, has audio, no audio)
- missing fields (any subset of: no IPA, no translation, no examples, no
  lemma)
- updated within (any time, today, this week, this month)

It SHALL sort by:
- recently updated
- recently created
- text A–Z
- least complete first, where completeness counts the same applicable
  fields as the editor's done-markers

The text search, paging and total from the existing browsing requirement
apply on top of these filters.

Every active filter SHALL be shown as a removable chip, plus "Clear all".
The result count SHALL update with every change.

The layout differs by width:
- **Phone:** one "Filters" button with an active-count badge opens a filter
  sheet whose primary button reads "Show N notes". Rows are stacked: the
  headword, audio and status glyphs on the right, and one dim line of type ·
  part of speech · first translation · updated.
- **Desktop:** a bar of filter buttons with custom menus and a sort menu,
  above a table with columns Text, Type, Part of speech, Translation, Origin,
  Status, Audio, Complete, Updated.

"Triage these" SHALL open the belt over exactly the current filtered set.

#### Scenario: Adjectives without audio
- **WHEN** the operator filters part of speech = adjektiv and audio = no audio
- **THEN** only adjectives without audio are listed, two removable chips show the filters, and the count matches the rows' total

#### Scenario: Least complete first
- **WHEN** the operator sorts by least complete
- **THEN** a note missing IPA, translations and examples is listed before a fully filled note

#### Scenario: Phone filter sheet
- **WHEN** at 390 px the operator opens Filters, picks verb, and presses "Show N notes"
- **THEN** the sheet closes, a "verb" chip is shown above the list, and N rows' worth of results are in the paged total
