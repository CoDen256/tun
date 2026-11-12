## ADDED Requirements

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
