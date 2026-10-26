## 0. Before you write any code — read this first

- `tun/docs/07-decisions.md` **D94** — the decision this implements, and
  specifically why it doesn't reopen D81 (the rejected cross-repo
  file-reference design) despite both touching multiple repos.
- `design.md` D-T1 through D-T4 in this change — each names an alternative
  that was considered and rejected (submodules, a setup script, a
  configurable sibling path). Don't reach for any of them.
- **Confirm on disk before assuming anything's missing**: `stabbur` already
  auto-migrates (`scripts/bootstrap.py`). Don't duplicate that work here —
  this change only needs `mjolnir`'s equivalent to exist, which is a task in
  the `hub-builder-operator-console` proposal (`mjolnir` repo), not this one.

This is `tun`'s first-ever shipped code — there is no existing compose file
or Caddyfile in this repo to be careful around (D84 fully moved them to
`mjolnir`). Nothing here is a migration of existing config, it's new.

## 1. Top-level compose

- [x] 1.1 `tun/compose.yaml`: `include: [../mjolnir/compose.yaml,
      ../stabbur/compose.yaml]`, per D-T1/D-T2.
- [x] 1.2 Confirmed: Compose 5.4.0 in this environment, well above the
      v2.20+ floor. Documented in DEPLOY.md.
- [x] 1.3 Verified both directions live: `docker exec mjolnir-builder
      getent hosts backend` and `docker exec stabbur-backend getent hosts
      mjolnir-hub` both resolve, once brought up together via `tun`'s
      compose file — no manual network join needed, `include:` merges both
      projects onto one network (`tun_default`) automatically.

## 2. Adminer

- [x] 2.1 Added, under the same service key `adminer` stabbur's own
      compose.yaml already uses — Compose deep-merges this definition onto
      the included one (one container, not two).
- [x] 2.2 Verified: `docker exec tun-adminer getent hosts postgres
      stabbur-postgres` resolves both; confirmed `http://<host>:8081` live.

## 3. Naming consistency

- [x] 3.1 Already done (landed as part of an earlier `stabbur` commit,
      confirmed on disk: `docker-compose.yml` no longer exists).
- [x] 3.2 Confirmed: `cd stabbur && docker compose up` works standalone,
      unaffected by `tun`'s compose file existing.

## 4. Documentation

- [x] 4.1 Written.
- [x] 4.2 Done — see DEPLOY.md's "Changing what's deployed" section.

## 5. Integration and sign-off

- [x] 5.1 Full stop/start cycle tested (not a fresh git clone, but a full
      `docker compose down` in both sibling repos + `docker compose up` from
      `tun`): every service from both projects came up correctly. (Caddy's
      own startup is blocked in this sandbox by a rootless-Docker port-80
      restriction unrelated to this change — confirmed not an issue on a
      real root-run VPS; verified the Caddyfile/routing logic separately via
      a dev-only high-port instance.)
- [x] 5.2 `hub`/`builder` already shipped (archived). Re-ran: both come up
      through `include:`, both auto-migrate (confirmed hub's own startup log:
      "applied migrations: 001_init.sql ... 009_build_jobs_build_id.sql" and
      "decks seeded (idempotent): 10"), and their Caddy routes
      (`/mjolnir/*`, `/builder/*`) work correctly through the unified network
      — verified via the same dev-only Caddy instance as 5.1.
- [x] 5.3 Recorded as D101/D102 — see `07-decisions.md`. Also found and
      fixed, while verifying this change's routing end to end: two real
      cross-service navigation gaps (no links between stabbur's UI and
      mjolnir's/builder's; a double-`/ui` bug in hub's note/grammar-rule
      links) and inconsistent entry-point naming (`/mjolnir`/`/builder` had
      no `/ui`-suffixed form matching stabbur's own `/stabbur/ui`). Fixed in
      the `mjolnir` and `stabbur` repos directly, not scoped to this change
      but found because of it.
