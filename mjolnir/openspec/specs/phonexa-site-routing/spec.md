# phonexa-site-routing Specification

## Purpose
mjolnir's Caddy exposes phonexa at the authenticated `/phonexa/` path on the
main site, stripping the prefix and passing it along as `X-Forwarded-Prefix`,
without affecting any existing route. Created by archiving changes
phonexa-site-block and phonexa-path-block; the latter superseded the former's
dedicated-hostname routing (D148 -> D149), so the requirements below are the
net result. The superseded subdomain requirement is in the archived
phonexa-path-block delta under REMOVED.

## Requirements


### Requirement: phonexa is served under a path prefix on the main site
The system SHALL serve phonexa under the `/phonexa/` path prefix of the main
site address, stripping that prefix before forwarding to the phonexa backend and
passing it along as `X-Forwarded-Prefix` so phonexa can build its own URLs. A
request for the bare `/phonexa` path SHALL be redirected to `/phonexa/`, because
phonexa's pages resolve their assets relative to the serving directory.

#### Scenario: Requesting a phonexa page
- **WHEN** an authenticated client requests `https://<host>/phonexa/`
- **THEN** the response is phonexa's own page, served by the phonexa backend,
  with its assets loading from `/phonexa/…`

#### Scenario: Bare path without a trailing slash
- **WHEN** a client requests `https://<host>/phonexa`
- **THEN** it is redirected to `https://<host>/phonexa/` and the page then loads
  with its assets

#### Scenario: Prefix-aware frontend
- **WHEN** a phonexa page fetches `/phonexa/api/v1/languages`
- **THEN** the prefix is stripped and the request reaches phonexa's backend as
  `/api/v1/languages`

#### Scenario: Live microphone stream
- **WHEN** an authenticated browser opens the WebSocket at
  `wss://<host>/phonexa/stream`
- **THEN** the connection is upgraded, the prefix is stripped, and the stream is
  proxied to the phonexa backend and stays open for the session

#### Scenario: No existing route is affected
- **WHEN** any request for `/ota/*`, `/blob/*`, `/audio-manifest/*`, `/mjolnir*`,
  `/builder*`, `/stabbur/*`, `/smia/*` or `/adminer/*` arrives
- **THEN** it behaves exactly as before this change

### Requirement: The WebSocket stream is proxied without negotiated compression
The proxy SHALL remove the client's `Sec-WebSocket-Extensions` offer before
forwarding the upgrade, so phonexa never negotiates `permessage-deflate` and
sends uncompressed frames.

#### Scenario: A browser offers permessage-deflate
- **WHEN** a browser opens the live-mic WebSocket, advertising
  `Sec-WebSocket-Extensions: permessage-deflate`
- **THEN** the upgrade succeeds, the response negotiates no extension, and every
  frame the server sends has `RSV1` clear

#### Scenario: Frames still flow
- **WHEN** compression is not negotiated
- **THEN** per-frame formant results arrive in the same wire format as before

### Requirement: Access to phonexa requires the operator credential
Every request under the phonexa prefix SHALL require HTTP basic authentication
with username `operator` and the operator token as the password, verified at the
proxy against a hash configured in `PHONEXA_AUTH_HASH`.

#### Scenario: No credentials
- **WHEN** a request to `/phonexa/*` carries no credentials
- **THEN** the response is 401 with a basic-auth challenge and phonexa's backend
  is not contacted

#### Scenario: Wrong credentials
- **WHEN** a request carries a wrong password
- **THEN** the response is 401 and phonexa's backend is not contacted

#### Scenario: Correct credentials
- **WHEN** a request carries `operator` and the operator token
- **THEN** it is proxied to phonexa

#### Scenario: Destructive endpoints
- **WHEN** an unauthenticated client requests a phonexa admin endpoint (such as
  database import) under the prefix
- **THEN** it receives 401

#### Scenario: Static assets and health
- **WHEN** an unauthenticated client requests a phonexa static asset or `/ping`
  under the prefix
- **THEN** it receives 401 — the gate covers every phonexa route uniformly

### Requirement: The phonexa route fails closed when unconfigured
When `PHONEXA_AUTH_HASH` is not configured, the phonexa route SHALL reject every
request, and SHALL NOT serve phonexa without authentication under any combination
of unset variables.

#### Scenario: Hash unset
- **WHEN** Caddy runs with `PHONEXA_AUTH_HASH` unset
- **THEN** every request to `/phonexa/*` is rejected with 401

### Requirement: mjolnir remains deployable without phonexa
Unset phonexa variables SHALL NOT prevent Caddy from starting and SHALL NOT change
the behavior of any existing route. With phonexa absent, requests under the prefix
SHALL fail at the gate or as a proxy error, never as an open route.

#### Scenario: mjolnir-only deployment
- **WHEN** Caddy starts with neither `PHONEXA_UPSTREAM` nor `PHONEXA_AUTH_HASH`
  set
- **THEN** it starts successfully and every existing route behaves exactly as
  before

#### Scenario: Local plain-HTTP testing mode
- **WHEN** Caddy starts with `TUN_SITE_ADDRESS=:8080` and no phonexa variables
- **THEN** it starts successfully and serves the main site as before

### Requirement: The upstream is configurable with a sensible default
The phonexa upstream SHALL default to `phonexa-backend:5050` and be overridable by
`PHONEXA_UPSTREAM`.

#### Scenario: Default upstream
- **WHEN** `PHONEXA_UPSTREAM` is unset
- **THEN** requests are proxied to `phonexa-backend:5050` over the shared network

### Requirement: Setup requirements are documented
`.env.example` and `DEPLOY.md` SHALL document how to derive `PHONEXA_AUTH_HASH`
from the operator token, that `$`-containing values must be single-quoted in
`.env`, that rotating the operator token requires regenerating the hash, and that
phonexa shares the main site's origin. They SHALL NOT require a DNS record for
phonexa.

#### Scenario: Following the deploy guide
- **WHEN** an operator follows `DEPLOY.md` for phonexa
- **THEN** it lists hash generation, the quoting rule, the rotation rule and the
  shared-origin consequence, and mentions no phonexa hostname or DNS step
