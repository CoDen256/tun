## MODIFIED Requirements

### Requirement: The whole stack starts from one compose invocation in `tun`
The system SHALL bring up every included service (`mjolnir`'s, `stabbur`'s, `smia`'s and `phonexa`'s own compose-defined services) from a single `docker compose up` run in the `tun` repository, with no other command required.

#### Scenario: First boot on a fresh checkout
- **WHEN** `tun`, `mjolnir`, `stabbur`, `smia` and `phonexa` are freshly cloned as sibling directories and `docker compose up` is run in `tun`
- **THEN** every service defined in those repos' own compose files starts (except services gated behind a non-default compose profile), with no manual step in any of those repos beyond creating each repo's `.env`

#### Scenario: phonexa's schema
- **WHEN** the stack starts with an empty phonexa database volume
- **THEN** phonexa's tables exist once `phonexa-backend` is healthy, with no manual migration step

### Requirement: One database-exploration tool serves every included database
The system SHALL provide a single database-exploration tool reachable at one URL, able to connect to every service's Postgres instance (`mjolnir`'s, `stabbur`'s, `smia`'s and `phonexa`'s), rather than one instance of the tool per database.

#### Scenario: Inspecting two different services' databases
- **WHEN** the operator opens the database-exploration tool
- **THEN** they can connect to either `mjolnir`'s or `stabbur`'s database from the same running instance, without starting a second one

#### Scenario: Inspecting phonexa's database
- **WHEN** the operator opens the database-exploration tool and enters `phonexa-postgres` as the server
- **THEN** they can browse phonexa's database from the same instance, and phonexa's own development Adminer is not running

## ADDED Requirements

### Requirement: phonexa's own development tooling does not start in the unified stack
The system SHALL NOT start any phonexa service gated behind phonexa's `dev` compose profile when `docker compose up` runs in `tun` without that profile.

#### Scenario: Unified boot
- **WHEN** `docker compose up` runs in `tun` with no profiles enabled
- **THEN** no `phonexa-adminer` container exists
