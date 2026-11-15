# card-flow-view

## MODIFIED Requirements

### Requirement: A deck's real ship order is reconstructable as shipped, staged, open, and pending zones
The system SHALL expose, per deck, the real sequence of occurrences in the
order they shipped (from `occurrence_shipments`, ordered by id) followed by
the order they are currently staged (from `staged_occurrences`, ordered by
id), followed by a computed "open" count — the occurrences still needed,
beyond everything already shipped AND staged, to reach the next multiple of
5 strictly greater than their sum — followed by the deck's pending
occurrences grouped by drain tier. Each occurrence in the shipped and staged
zones SHALL include its card id, side letter, and source note text where
resolvable.

The open count SHALL always be between 1 and 5 inclusive. It SHALL NOT be
computed against the next multiple of 5 above the shipped count alone, which
yields a negative value whenever the staged occurrences already carry the
deck past it.

#### Scenario: A deck exactly on the 5-grid with a partial next batch staged
- **WHEN** a deck has shipped a multiple of 5 and has 1-4 occurrences
  currently staged
- **THEN** the open count is `5 - (staged count)`, reported alongside the
  shipped and staged zones

#### Scenario: A deck whose staged occurrences carry it past the next multiple of 5
- **WHEN** a deck has 245 shipped occurrences and 9 staged
- **THEN** the open count is 1 — the distance from 254 to 255 — and no
  negative value is computed and no data-integrity diagnostic is emitted,
  because the data is correct

#### Scenario: A deck with no staged occurrences at all
- **WHEN** a deck's staged occurrence count is zero and its shipped count is
  already a multiple of 5
- **THEN** the open count is 5 — a whole batch is awaited — superseding the
  previous expectation of 0, which made the view assert that nothing was
  awaited when in fact five more cards were needed before anything could
  ship

#### Scenario: Note text is unresolvable for a card
- **WHEN** a shipped or staged occurrence's card has no resolvable source
  note text (e.g. a hand-created card with no backing note)
- **THEN** that occurrence is still included in its zone, reporting its card
  id and side letter without note text, rather than being omitted or
  erroring

## ADDED Requirements

### Requirement: The content-change signal names which faces change
The system SHALL report, for each already-minted card whose projection
differs from its stored content, which of the card's content faces differ —
not merely that the card changed.

#### Scenario: A note edit that changes one face only
- **WHEN** an already-minted card's note is edited so that exactly one of its
  content faces projects differently
- **THEN** the forecast reports that card as changing, identifying that one
  face, and does not report the unchanged faces

#### Scenario: A card whose content is unchanged
- **WHEN** an already-minted card's projection matches its stored content in
  every face
- **THEN** the card is not reported as changing
