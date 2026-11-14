## Purpose

Unify the deployment of every project behind a single `docker compose`
invocation at the root of the `tun` repository, while keeping each project's
own compose file independently usable on its own.

Since D150 `mjolnir`, `stabbur`, `smia`, `phonexa` and
`backup` are top-level **directories of this one repository**, not sibling
checkouts, and there is no `tun-shared` external network: one repository is
one Compose project is one default network. The requirements below that still
describe sibling clones and the one-time `docker network create tun-shared`
step are MODIFIED by the `monorepo-merge` change's own delta spec and are
corrected there rather than twice.

## Requirements

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

### Requirement: Each included repo's compose file stays independently usable

The system SHALL keep each project's compose file usable on its own, so that a
single project and the shared dependencies it declares can be brought up without
the rest of the stack.

#### Scenario: Working on one service
- **WHEN** the operator brings up a single service by name from the root, or
  runs compose inside that project's directory
- **THEN** that service and its declared dependencies start, and no unrelated
  service starts

### Requirement: Services across included files can reach each other by name
The system SHALL allow a container defined in one included compose file to
reach a container defined in another by its service name, with no manual
network configuration.

#### Scenario: mjolnir's Caddy reaching stabbur
- **WHEN** the gateway container is configured to reverse-proxy to
  `stabbur-backend:5056` (the service key, which is also the hostname — D152;
  this scenario was written as `stabbur:8000`, a service name and port that
  never shipped)
- **THEN** that name resolves on the project's default network, with no
  network configuration and no external network to create

### Requirement: One database-exploration tool serves every included database

The system SHALL provide a single database-exploration tool, reachable at one
URL, able to reach every service's database.

#### Scenario: Inspecting two services' databases
- **WHEN** the operator opens the database-exploration tool
- **THEN** every service's database is reachable from that one instance

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
