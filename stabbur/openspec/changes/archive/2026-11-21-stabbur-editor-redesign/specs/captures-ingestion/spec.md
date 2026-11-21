# Spec Delta — captures-ingestion

## ADDED Requirements

### Requirement: A capture's context seeds the promoted note's first example
When a capture is promoted to its draft note, the note's examples SHALL be:
- the capture's context text as the single element, when the context is
  non-empty
- empty otherwise

The capture itself SHALL keep its `context_text` unchanged. The ingestion
request SHALL keep accepting `context_text` exactly as before.

#### Scenario: Promotion with context
- **WHEN** a capture with selected text "komme i vei" and context "Vi må komme i vei nå." is ingested
- **THEN** its draft note has examples ["Vi må komme i vei nå."] and the capture still records that context
