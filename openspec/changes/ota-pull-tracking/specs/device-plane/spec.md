# device-plane Specification (delta)

## ADDED Requirements

### Requirement: Observing the device plane is permitted, altering it is not
The system SHALL permit recording, logging and displaying facts about device-plane traffic only where doing so changes nothing the device receives and adds no dependency to the device-plane request path.

This requirement exists so that a change of this shape is measured against a
written rule instead of being argued case by case. The device plane is frozen
because there is an APK in the field that cannot be rolled back; that freeze is
about **what the device receives**, not about what the operator may know.

#### Scenario: Adding observation to a device-plane route
- **WHEN** logging or recording is added for a device-plane route
- **THEN** the route's status codes, headers, body bytes, cache directives and
  authentication behaviour are unchanged, verified by comparing a real response
  before and after

#### Scenario: Observation must not become a dependency
- **WHEN** the mechanism that records device-plane traffic is unavailable,
  failing or full
- **THEN** device-plane requests continue to be served exactly as before

#### Scenario: Altering the device-facing contract
- **WHEN** a change would alter any byte, header, status code or cache
  directive the device receives
- **THEN** it is outside what this requirement permits, regardless of how
  beneficial it appears
