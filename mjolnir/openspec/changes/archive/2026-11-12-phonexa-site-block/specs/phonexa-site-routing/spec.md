## ADDED Requirements

### Requirement: phonexa is served on its own hostname
The system SHALL serve phonexa on a dedicated hostname (configured by `PHONEXA_SITE_ADDRESS`), proxying all paths to the phonexa backend, with HTTPS certificates managed automatically for that hostname.

#### Scenario: Requesting a phonexa page
- **WHEN** an authenticated client requests `https://<phonexa-host>/`
- **THEN** the response is phonexa's own page, served by the phonexa backend

#### Scenario: Absolute-path frontend
- **WHEN** a phonexa page fetches `/api/v1/languages` on that hostname
- **THEN** the request reaches phonexa's backend without any path rewriting

#### Scenario: Live microphone stream
- **WHEN** an authenticated browser opens the WebSocket at `wss://<phonexa-host>/stream`
- **THEN** the connection is upgraded and proxied to the phonexa backend and stays open for the session

### Requirement: Access to phonexa requires the operator credential
Every request on the phonexa hostname SHALL require HTTP basic authentication with username `operator` and the operator token as the password, verified at the proxy against a hash configured in `PHONEXA_AUTH_HASH`.

#### Scenario: No credentials
- **WHEN** a request to the phonexa hostname carries no credentials
- **THEN** the response is 401 with a basic-auth challenge and phonexa's backend is not contacted

#### Scenario: Wrong credentials
- **WHEN** a request carries a wrong password
- **THEN** the response is 401 and phonexa's backend is not contacted

#### Scenario: Correct credentials
- **WHEN** a request carries `operator` and the operator token
- **THEN** it is proxied to phonexa

#### Scenario: Destructive endpoints
- **WHEN** an unauthenticated client requests a phonexa admin endpoint (such as database import)
- **THEN** it receives 401

### Requirement: The phonexa site fails closed when unconfigured
When `PHONEXA_AUTH_HASH` is not configured, the phonexa site SHALL reject every request, and SHALL NOT serve phonexa without authentication under any combination of unset variables.

#### Scenario: Hash unset
- **WHEN** Caddy runs with `PHONEXA_AUTH_HASH` unset and a phonexa hostname configured
- **THEN** every request to that hostname is rejected with 401

### Requirement: mjolnir remains deployable without phonexa
Unset phonexa variables SHALL NOT prevent Caddy from starting, SHALL NOT cause a certificate request for a public hostname, and SHALL NOT change the behavior of any existing route.

#### Scenario: mjolnir-only deployment
- **WHEN** Caddy starts with none of `PHONEXA_SITE_ADDRESS`, `PHONEXA_UPSTREAM`, `PHONEXA_AUTH_HASH` set
- **THEN** it starts successfully and the existing `/ota`, `/blob`, `/mjolnir`, `/builder`, `/stabbur`, `/smia` and `/adminer` routes behave exactly as before

#### Scenario: Local plain-HTTP testing mode
- **WHEN** Caddy starts with `TUN_SITE_ADDRESS=:8080` and no phonexa variables
- **THEN** it starts successfully and serves the main site as before

### Requirement: The upstream is configurable with a sensible default
The phonexa upstream SHALL default to `phonexa-backend:5050` and be overridable by `PHONEXA_UPSTREAM`.

#### Scenario: Default upstream
- **WHEN** `PHONEXA_UPSTREAM` is unset
- **THEN** requests are proxied to `phonexa-backend:5050` over the shared network

### Requirement: Setup requirements are documented
`.env.example` and `DEPLOY.md` SHALL document the DNS prerequisite, how to derive `PHONEXA_AUTH_HASH` from the operator token, that `$`-containing values must be single-quoted in `.env`, and that rotating the operator token requires regenerating the hash.

#### Scenario: Following the deploy guide
- **WHEN** an operator follows `DEPLOY.md` for phonexa
- **THEN** it lists the DNS record, hash generation, quoting rule and rotation rule
