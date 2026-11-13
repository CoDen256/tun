## Purpose

Unify the deployment of the `tun`, `mjolnir`, and `stabbur` services behind a
single `docker compose` invocation in the `tun` repository, while keeping
each included repo's own compose file independently usable on its own.

## Requirements

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

### Requirement: phonexa is reached by path prefix, with no DNS prerequisite
The deployment documentation SHALL describe phonexa as reachable at `/phonexa/`
on the stack's single site address, like `/stabbur` and `/smia`, and SHALL NOT
require a hostname or DNS record of its own for phonexa.

#### Scenario: Reaching phonexa
- **WHEN** an operator opens `https://<host>/phonexa/` and authenticates
- **THEN** phonexa's own pages are served, its API calls, audio and live-mic
  WebSocket all work, and no phonexa-specific DNS record was needed

#### Scenario: Deploy documentation
- **WHEN** an operator follows `DEPLOY.md`
- **THEN** it lists no DNS step for phonexa and no phonexa hostname variable, and
  it still lists hash generation, the single-quote rule and the rotation rule

#### Scenario: Bare path
- **WHEN** an operator types `https://<host>/phonexa` without a trailing slash
- **THEN** the documentation explains that a redirect to `/phonexa/` is what makes
  the page's relative assets resolve, so a blank page is diagnosable

#### Scenario: Shared origin
- **WHEN** an operator reads the phonexa section
- **THEN** it states that phonexa now shares an origin with hub and builder, and
  what that means for their session cookie

### Requirement: The decision log records why phonexa's routing changed
The decision log SHALL record phonexa's routing as path-prefix based, SHALL retain
D148's authentication decision and its verified Caddy and compose findings, and
SHALL annotate rather than delete the superseded subdomain reasoning.

#### Scenario: Reading the log after the change
- **WHEN** someone reads D147 and D148
- **THEN** they find the subdomain reasoning marked superseded with a pointer to
  the new ADR, the auth decision still stated as current, and the reason the
  premise changed — that phonexa became prefix-aware

#### Scenario: Looking for a previously verified fact
- **WHEN** someone needs to know whether `basic_auth` blocks a WebSocket upgrade,
  or how Caddy treats a set-but-empty environment variable
- **THEN** those findings are still findable in D148 rather than lost with the
  superseded routing decision
