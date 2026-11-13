## ADDED Requirements

### Requirement: Every deployed service conforms to one shape
The system SHALL apply one common configuration shape to every long-running
service: an automatic restart policy, a health check covering the service
itself, host port publishing bound to the loopback interface and gated behind a
development profile, and the same database major version across every service
that uses one.

#### Scenario: A service's container exits unexpectedly
- **WHEN** any long-running service's container exits for a reason other than
  an explicit stop
- **THEN** it is restarted automatically

#### Scenario: Health of a backend
- **WHEN** the stack is inspected
- **THEN** every backend service reports a health state of its own, not only
  the database it depends on

#### Scenario: Ports on a production host
- **WHEN** the stack is deployed without a development profile
- **THEN** no service other than the gateway publishes a port on a non-loopback
  interface

### Requirement: Every service runs its migrations without a manual step
The system SHALL apply each service's schema migrations automatically when that
service starts, using one mechanism per language rather than one per service.

#### Scenario: Fresh database
- **WHEN** a service starts against an empty database
- **THEN** its schema exists once the service reports healthy, with no operator
  command

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
