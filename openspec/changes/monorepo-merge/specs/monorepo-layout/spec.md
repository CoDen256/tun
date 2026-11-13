## ADDED Requirements

### Requirement: The whole ecosystem is one repository
The system SHALL keep every project of the ecosystem in a single Git
repository, each at its own top-level directory, with the complete commit
history of each former repository reachable from that repository.

#### Scenario: Cloning the ecosystem
- **WHEN** an operator clones the repository
- **THEN** `grind`, `mjolnir`, `stabbur`, `smia`, `phonexa`, `shadow`,
  `hover-translate`, `postgres` and `backup` are all present, with no other
  checkout required

#### Scenario: History of a merged project survives
- **WHEN** `git log --follow` is run on a file that belonged to a former
  repository
- **THEN** its commits from before the merge are listed, with their original
  commit hashes unchanged

### Requirement: Each project composes independently and together
The system SHALL define each project's services in that project's own compose
file, and SHALL compose them into one deployable stack from a root compose file
using Compose's native `include:`.

#### Scenario: One command deploys everything
- **WHEN** `docker compose up` is run at the repository root
- **THEN** every service of every project starts, with no manual network
  creation, no second checkout and no per-project command

#### Scenario: One project runs on its own
- **WHEN** `docker compose up` is run in a single project's directory
- **THEN** that project's services and the shared dependencies it declares
  start, and no other project's services start

#### Scenario: A shared fragment included by two projects
- **WHEN** two projects both `include:` the same shared compose fragment and
  the root includes both projects
- **THEN** the shared services are defined exactly once, with no name conflict

### Requirement: No configuration value is defined in two places
The system SHALL define every configuration value in exactly one file: values
used by more than one project at the repository root, values used by exactly one
project in that project's own environment file.

#### Scenario: A project-specific credential
- **WHEN** a credential is used by exactly one project
- **THEN** it is present in that project's environment file and absent from the
  root environment file

#### Scenario: A shared secret
- **WHEN** a secret is used by more than one project
- **THEN** it is present only at the root, and no project's environment file
  repeats it

#### Scenario: A derivable value
- **WHEN** a value can be computed from another configured value (such as a
  database URL from a password, or an upstream address from a service name)
- **THEN** it is computed, and does not appear in any environment file

### Requirement: One name per service, used everywhere
The system SHALL use a single identifier for each service as its directory or
compose key, its network hostname, its database name where it has one, and its
URL prefix where it has one.

#### Scenario: Reaching a service from another service
- **WHEN** one service addresses another by its name
- **THEN** that name is the same string that identifies the service in the
  compose file and in its URL prefix

#### Scenario: Container naming
- **WHEN** the stack is running
- **THEN** no service sets an explicit container name, and containers are named
  by Compose from the project and service keys
