## ADDED Requirements

### Requirement: The whole stack starts from one compose invocation in `tun`
The system SHALL bring up every included service (at minimum `mjolnir`'s and
`stabbur`'s own compose-defined services) from a single `docker compose up`
run in the `tun` repository, with no other command required.

#### Scenario: First boot on a fresh checkout
- **WHEN** `tun`, `mjolnir`, and `stabbur` are freshly cloned as sibling
  directories and `docker compose up` is run in `tun`
- **THEN** every service defined in `mjolnir`'s and `stabbur`'s own compose
  files starts, with no manual step in either of those repos

### Requirement: Each included repo's compose file stays independently usable
The system SHALL NOT require any change to `mjolnir`'s or `stabbur`'s own
compose file for either to keep working when run standalone in its own
repository, given the one-time `docker network create tun-shared` D98
already requires for the "two independent stacks" deployment mode — this
change does not add any *further* precondition beyond that one.

#### Scenario: Running `mjolnir` alone
- **WHEN** `tun-shared` already exists (D98) and `docker compose up` is run
  inside `mjolnir`'s own directory, independent of `tun`
- **THEN** it starts exactly the services it already defines, unaffected by
  whether `tun`'s unified compose file exists

### Requirement: Services across included files can reach each other by name
The system SHALL allow a container defined in one included compose file to
reach a container defined in another by its service name, with no manual
network configuration.

#### Scenario: mjolnir's Caddy reaching stabbur
- **WHEN** `mjolnir`'s Caddy container is configured to reverse-proxy to
  `stabbur:8000`
- **THEN** that name resolves correctly once both files are brought up
  together via `tun`'s unified compose

### Requirement: One database-exploration tool serves every included database
The system SHALL provide a single database-exploration tool reachable at one
URL, able to connect to every service's Postgres instance, rather than one
instance of the tool per database.

#### Scenario: Inspecting two different services' databases
- **WHEN** the operator opens the database-exploration tool
- **THEN** they can connect to either `mjolnir`'s or `stabbur`'s database
  from the same running instance, without starting a second one
