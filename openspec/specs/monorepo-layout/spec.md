# monorepo-layout

## Purpose

One repository holds every project of the ecosystem. This capability covers
the tree, how the projects compose into one deployable stack while each stays
runnable alone, where configuration is allowed to live, and the single-name
rule that keeps a service's directory, compose key, hostname, database and URL
prefix from drifting apart.

Gives D135 its design (D150-D153). Supersedes the sibling-checkout era: the
`tun-shared` external network and its one-time `docker network create` step
(D98/D104) are gone rather than standardised.

## Requirements

### Requirement: The whole ecosystem is one repository
The system SHALL keep every project of the ecosystem in a single Git
repository, each at its own top-level directory, with the complete commit
history of each former repository reachable from that repository.

#### Scenario: Cloning the ecosystem
- **WHEN** an operator clones the repository
- **THEN** `mjolnir`, `stabbur`, `smia`, `phonexa` and `backup` are all
  present, with no other checkout required

#### Scenario: A project that is not deployed with the stack
- **WHEN** a component of the ecosystem is a fork, is standalone, and is never
  deployed alongside the stack
- **THEN** it is NOT a project of this repository, and the repository documents
  it as an external client instead

#### Scenario: History of a merged project survives
- **WHEN** the history of a file that belonged to a former repository is
  inspected with `git blame`, or with `git log --full-history` against its
  pre-merge path
- **THEN** its commits from before the merge are reachable with their original
  commit hashes unchanged, and `git blame` attributes each line to the
  pre-merge commit that wrote it

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

### Requirement: Service names derive from their project, predictably
The system SHALL name every service after the project that owns it, so that a
service's compose key, its network hostname and its URL prefix are derivable
from the project name rather than being independently chosen.

A project's services are `<project>-<role>` (`stabbur-backend`,
`stabbur-postgres`); its URL prefix is `/<project>/`. The compose key and the
network hostname are always the same string. The prefix and the database name
are deliberately NOT required to equal it: `/stabbur/` is served by
`stabbur-backend`, and mjolnir's database is historically named `postgres`.

#### Scenario: Reaching a service from another service
- **WHEN** one service addresses another
- **THEN** it uses the service's compose key as the hostname, and that key is
  prefixed with the owning project's name

#### Scenario: Container naming
- **WHEN** the stack is running
- **THEN** no service sets an explicit container name, and containers are named
  by Compose from the project and service keys
