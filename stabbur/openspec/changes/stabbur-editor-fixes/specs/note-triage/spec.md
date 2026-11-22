# Spec Delta — note-triage

## MODIFIED Requirements

### Requirement: Prefill runs automatically or on demand, as the operator configures
The system SHALL let the operator choose whether prefill runs as soon as a
note is presented for review, or only when they activate a fill control,
and SHALL provide that fill control in either mode so a note can be
refilled after its query has been changed.

Returning to the **previous** note SHALL NOT prefill it, in either mode. A
note reached by Previous has already been reviewed, and re-running providers
over it would overwrite nothing but would re-fetch and re-tag work the
operator has already done. Ready & next, Skip and Send to back are
unaffected and still prefill under the automatic setting.

#### Scenario: Automatic prefill
- **WHEN** the operator has chosen automatic prefill and a note is
  presented
- **THEN** its empty fields are filled without further action

#### Scenario: On-demand prefill
- **WHEN** the operator has chosen on-demand prefill and a note is
  presented
- **THEN** no provider is consulted until the operator activates the fill
  control

#### Scenario: Refilling after changing a query
- **WHEN** the operator edits a note's text and activates the fill control
- **THEN** the empty fields are filled again using the new value

#### Scenario: Previous does not prefill
- **GIVEN** automatic prefill is on
- **WHEN** the operator presses Previous
- **THEN** the previous note is shown with its stored values and no lookup is requested for it

#### Scenario: Previous then prefill by hand
- **GIVEN** the operator has returned to a previous note
- **WHEN** they press Prefill
- **THEN** that note's empty fields are filled as usual

## ADDED Requirements

### Requirement: Force prefill overwrites values that are already there
Alongside the gap-filling Prefill, the system SHALL offer a **Force prefill**
action that runs the same walk over the same providers in the same order but
ignores every "already has a value" guard, so each field it reaches is
replaced by the provider's value.

Force prefill SHALL bypass the lookup cache, so that it re-asks the providers
rather than replaying answers already held for the note. It SHALL be reachable
from the ⋯ tray in the triage and note-detail contexts, and SHALL state that
it overwrites before it is pressed. It SHALL record provenance for every field
it replaces, exactly as Prefill does.

#### Scenario: Overwriting a filled field
- **GIVEN** a note under review whose translation reads a value the operator does not want
- **WHEN** they choose Force prefill and it completes
- **THEN** the translation holds the provider's value and the field shows that provider as its provenance

#### Scenario: Prefill is unchanged
- **GIVEN** the same note
- **WHEN** the operator presses Prefill rather than Force prefill
- **THEN** the already-filled translation is left exactly as it was

#### Scenario: Force prefill re-asks
- **GIVEN** a note whose providers have already answered during this session
- **WHEN** the operator chooses Force prefill
- **THEN** the providers are queried again rather than answered from the cache
