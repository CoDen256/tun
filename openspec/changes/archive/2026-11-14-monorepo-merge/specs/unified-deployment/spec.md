## MODIFIED Requirements

### Requirement: The whole stack starts from one compose invocation in `tun`
The system SHALL bring up every service of every project from a single
`docker compose up` run at the repository root, with no other command required
and no checkout other than this repository.

#### Scenario: First boot on a fresh clone
- **WHEN** the repository is cloned, each project's environment file is created
  from its example, and `docker compose up` is run at the root
- **THEN** every service starts, with no manual network creation, no sibling
  checkout, and no per-project command

#### Scenario: No external network
- **WHEN** the stack is brought up on a host that has never run it before
- **THEN** no Docker network has to be created by hand, and no compose file
  declares an external network

### Requirement: One database-exploration tool serves every included database
The system SHALL provide a single database-exploration tool, reachable at one
URL, able to reach every service's database.

#### Scenario: Inspecting two services' databases
- **WHEN** the operator opens the database-exploration tool
- **THEN** every service's database is reachable from that one instance

### Requirement: Each included repo's compose file stays independently usable
The system SHALL keep each project's compose file usable on its own, so that a
single project and the shared dependencies it declares can be brought up without
the rest of the stack.

#### Scenario: Working on one service
- **WHEN** the operator brings up a single service by name from the root, or
  runs compose inside that project's directory
- **THEN** that service and its declared dependencies start, and no unrelated
  service starts
