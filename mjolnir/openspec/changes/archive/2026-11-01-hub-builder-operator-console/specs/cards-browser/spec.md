## ADDED Requirements

### Requirement: Every minted card is browsable, searchable, filterable, and groupable
The system SHALL expose a list of every card ever minted, searchable by
content, filterable by deck and by occurrence status, and optionally grouped
by deck.

#### Scenario: Filtering to cards with a side still pending
- **WHEN** the operator filters by "a side pending"
- **THEN** only cards with at least one occurrence not yet shipped (per
  `occurrence-shipment-log`) are shown

### Requirement: Each card shows per-side occurrence status, not a single status
The system SHALL display each of a card's occurrence letters independently —
shipped (naming the build) or queued (naming how many occurrences remain
before it drains) — rather than a single aggregate status for the card.

#### Scenario: A card with one shipped side and one pending side
- **WHEN** a card's `A` has shipped and its `E` is still queued
- **THEN** the card's row shows both: `A` as shipped (with its build id) and
  `E` as pending (with its remaining count), as two distinct pieces of
  status, not one combined label

### Requirement: Each card links to its source note, and to its grammar rule if applicable
The system SHALL provide a link from a card to the stabbur note it was
projected from, and, for a `type=grammar` card, a separate link to the
grammar rule it references.

#### Scenario: Following a card to its note
- **WHEN** the operator opens a card's source-note link
- **THEN** they are taken to that note's edit page in stabbur's own UI

### Requirement: The card list never implies stabbur-side knowledge
The system SHALL present card-to-note linkage entirely from hub's own
records (hub's minted-note ledger), without requiring or implying any
new capability on stabbur's side.

#### Scenario: stabbur is unreachable
- **WHEN** stabbur is down
- **THEN** the Cards list still renders fully from hub's own data; only the
  destination of the "open note" link is unreachable, not the Cards list
  itself
