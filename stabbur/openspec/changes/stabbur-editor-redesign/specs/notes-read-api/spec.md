# Spec Delta — notes-read-api

## MODIFIED Requirements

### Requirement: The response shape matches the documented contract exactly
The system SHALL return each note with exactly the fields of the documented
read contract (D-N4), with one amendment from `stabbur-editor-redesign`:
`examples`, an array of strings, replaces `context_text`. No other field is
renamed, omitted or added.

#### Scenario: A consumer built against the documented shape
- **WHEN** a consumer parses the read API's response using the documented field names and types
- **THEN** every field is present with the documented name and type, `examples` is an array of strings, and no `context_text` field is present
