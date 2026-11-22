# Spec Delta — builder-pipeline

## ADDED Requirements

### Requirement: Translations are one line per language, joined within a language
The projection SHALL build the E face by grouping a note's translations by
language:
- one line per language, in the order each language is first seen in the
  note's translations
- within a line, that language's values in stored order, joined by ` / `
- the lines joined by `<br>`, inside one `<div class="center">` wrapper

A translation without a language SHALL be grouped under a single
no-language line rather than dropped. No translation value SHALL be omitted.

With one value per language this SHALL produce exactly what the previous
projection produced, so a note unaffected by stabbur's slash split mints an
identical card.

#### Scenario: Two values in one language
- **WHEN** a note with translations en "hurry", en "rush" is projected
- **THEN** E is exactly `<div class="center">hurry / rush</div>`

#### Scenario: Two languages, one value each
- **WHEN** a note with translations en "hurry", de "eilen" is projected
- **THEN** E is exactly `<div class="center">hurry<br>eilen</div>`

#### Scenario: Several values across several languages
- **WHEN** a note with translations en "hurry", de "eilen", en "rush", de "hasten" is projected
- **THEN** E is exactly `<div class="center">hurry / rush<br>eilen / hasten</div>`

#### Scenario: Language order follows first appearance
- **WHEN** a note with translations de "eilen", en "hurry", de "hasten" is projected
- **THEN** E is exactly `<div class="center">eilen / hasten<br>hurry</div>`

#### Scenario: A translation with no language is kept
- **WHEN** a note with translations en "hurry" and one value "skynde" with no language is projected
- **THEN** E contains both values, on separate lines, and neither is dropped

#### Scenario: Unchanged for one value per language
- **GIVEN** any note that carries at most one translation per language
- **WHEN** it is projected
- **THEN** E is byte-identical to what the previous projection produced for it
