## ADDED Requirements

### Requirement: Every card's rendered content is durably stored, independent of any bundle file
The system SHALL store each card's rendered `N`/`E`/`X`/`A` fields in
`card_content`, keyed by card id, so that the bundle's deck/card data can be
fully reconstructed without reading any previously-produced bundle file.

#### Scenario: A card is minted
- **WHEN** `builder` mints a new card for an eligible note
- **THEN** a `card_content` row is created for that card's id with its
  projected `N`/`E`/`X`/`A` content

### Requirement: Content refreshes while the source note is still live, and freezes once it is not
The system SHALL overwrite a card's `card_content` row every time its source
note is returned by stabbur's pull and regenerated, and SHALL leave the row
unchanged once the source note is no longer returned (tombstoned or
otherwise absent).

#### Scenario: A note is edited after its card is minted
- **WHEN** a minted card's source note is edited on stabbur and returned in
  a later pull
- **THEN** that card's `card_content` row is overwritten with the newly
  projected content on the next publish

#### Scenario: A note is tombstoned after its card is minted
- **WHEN** a minted card's source note is later tombstoned on stabbur
  (excluded from every future pull)
- **THEN** that card's `card_content` row keeps whatever content it last
  held, and no later publish attempts to re-project it

### Requirement: A card's content is recoverable without any bundle file
The system SHALL be able to reconstruct a card's full content from
`card_content` alone, with no dependency on a previously-built bundle file
still existing on disk.

#### Scenario: Rebuilding a card's content from scratch
- **WHEN** `builder` rebuilds the deck/card data onto a freshly-loaded logic
  bundle
- **THEN** every previously-minted card's `N`/`E`/`X`/`A` content comes from
  `card_content`, not from re-reading any prior bundle file
