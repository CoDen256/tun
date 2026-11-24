# Spec Delta

## ADDED Requirements

### Requirement: Prepare's sentence preview follows the shared player model
The preview offered on every sentence row in Prepare SHALL follow the shared
play/pause model of the study loop: play restarts, a secondary pause pauses
and resumes, and its playhead tracks actual playback.

#### Scenario: Preview pause in Prepare
- **WHEN** a row's preview is paused and resumed
- **THEN** playback resumes from the paused point

### Requirement: Chapters can be split, merged and titled by hand
In Prepare, the operator SHALL be able to start a new chapter at any
sentence boundary inside a chapter, merge a chapter with the following one,
and give a chapter an optional title — each confirmed in the page, followed
by an offer to undo. A chapter boundary SHALL always coincide with a
sentence boundary. These edits SHALL belong to the active configuration only,
SHALL count as its manual edits, and SHALL NOT change any sentence span or
any progress. Re-analysing that configuration SHALL discard them, and its
in-page warning SHALL say so.

#### Scenario: A new chapter starts at the chosen sentence
- **WHEN** a new chapter is started at sentence 5 of chapter 2
- **THEN** chapter 2 holds sentences 1–4, chapter 3 starts with the former
  sentence 5, later chapters are renumbered, and the done count is unchanged

#### Scenario: Chapters merge
- **WHEN** chapter 2 is merged with chapter 3
- **THEN** one chapter holds both chapters' sentences and the chapter count
  falls by one

#### Scenario: Undo restores
- **WHEN** a chapter break is made and undo is invoked
- **THEN** the chapters are as before the break

#### Scenario: Other configurations are untouched
- **WHEN** a chapter break is made in one configuration and another is made
  active
- **THEN** the other configuration's chapters are unchanged
