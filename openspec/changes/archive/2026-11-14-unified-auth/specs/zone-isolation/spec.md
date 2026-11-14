## MODIFIED Requirements

### Requirement: Shared infrastructure is limited to the gateway and the database
The system SHALL NOT introduce any runtime dependency shared across zones
beyond the gateway and the database cluster, and SHALL keep the device update
path dependent on neither.

#### Scenario: Authentication is not a shared service
- **WHEN** operator authentication is enforced
- **THEN** it is enforced within the gateway, adding no service whose failure
  would affect more than one zone

#### Scenario: Device path unaffected by shared infrastructure
- **WHEN** the database cluster is unavailable
- **THEN** the device update path continues to serve unchanged
