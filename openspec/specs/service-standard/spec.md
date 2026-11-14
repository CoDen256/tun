# service-standard

## Purpose

One shape every deployed service conforms to, so a drift is visible rather
than discovered: restart policy, health checks that distinguish serving from
ready, loopback-only port publishing, one migration mechanism per language,
one test layout per language, and no CI (D152, deliberately).

## Requirements

### Requirement: Every deployed service conforms to one shape
The system SHALL apply one common configuration shape to every long-running
service: an automatic restart policy, host port publishing bound to the
loopback interface, and a health check of its own for every application
backend.

Two deliberate limits, both recorded rather than implied:
- Host ports are published by a **per-project `compose.override.yaml`**, not by
  a compose profile. A per-port profile does not exist — `profiles:` gates a
  whole service — and the override file is loaded only for the primary compose
  file of the directory it runs in, so the unified stack publishes nothing.
- The database major version is **converging**, not converged: the linguistics
  service is still a major version behind, because changing its image without
  a dump and restore would fail against its existing data directory. The
  consolidation change performs that migration.

#### Scenario: A service's container exits unexpectedly
- **WHEN** any long-running service's container exits for a reason other than
  an explicit stop
- **THEN** it is restarted automatically

#### Scenario: Health of a backend
- **WHEN** the stack is inspected
- **THEN** every application backend reports a health state of its own, not
  only the database it depends on

#### Scenario: Services with no health check
- **WHEN** a service has no health check of its own
- **THEN** it is one of the gateway, the database-exploration tool or the
  backup service, and that exemption is recorded rather than silent

#### Scenario: Ports on a production host
- **WHEN** the stack is brought up from the repository root
- **THEN** no service other than the gateway publishes a port on a non-loopback
  interface

#### Scenario: Working on one service locally
- **WHEN** compose is invoked inside a single project's directory
- **THEN** that project's services publish loopback ports for a native
  development environment to connect to

### Requirement: Tests are discovered the same way in every service
The system SHALL use one test layout and one invocation per language across all
services of that language.

#### Scenario: Running one service's tests
- **WHEN** the standard test command is run in any Python service's directory
- **THEN** that service's tests are discovered and run, with the same command
  in each

### Requirement: The ecosystem has no continuous-integration pipeline
The system SHALL NOT define automated build, publish or deployment pipelines in
the repository.

#### Scenario: Pushing to the default branch
- **WHEN** a commit is pushed
- **THEN** no automated build, image publish or site deployment is triggered
