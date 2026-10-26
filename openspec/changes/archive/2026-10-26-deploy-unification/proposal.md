## Why

`tun` is genuinely docs-only today (D84 — `compose.yaml`, `Caddyfile`,
`bin/`, `DEPLOY.md` all actually moved to `mjolnir`, confirmed on disk).
That was correct while `mjolnir` was the only thing being deployed. Now
`stabbur` needs deploying too, and the operator wants exactly one
`git pull` + `docker compose up`, not two separate stacks to remember to
bring up. This is the first code `tun` has ever shipped — everything before
this was documentation.

## What Changes

- **New `tun/compose.yaml`**, using Compose's native `include:` to pull in
  `../mjolnir/compose.yaml` and `../stabbur/compose.yaml` as one merged
  project. Neither included file changes — each stays fully usable standalone
  (`cd mjolnir && docker compose up` keeps working exactly as today).
- **Sibling checkout**: `tun`, `mjolnir`, `stabbur` cloned at the same
  filesystem level. Documented in a new `tun/DEPLOY.md` (first one `tun` has
  ever had).
- **Consistent compose file naming**: `stabbur/docker-compose.yml` renamed
  to `compose.yaml`, matching `mjolnir`'s existing name and this change's
  new top-level file.
- **One `adminer`**, defined in `tun/compose.yaml`, pointed at both Postgres
  instances via Adminer's native server picker — not a container per
  database.
- **Caddy stays exactly where it is, in `mjolnir`** — not cross-service
  today (only `/ota/*`/`/blob/*` are live), not moved here.
- **Migrations run automatically on every container boot, across every
  service.** `stabbur` already does this correctly
  (`scripts/bootstrap.py`: `alembic upgrade head`, then exec into the app —
  confirmed on disk, nothing to change there). `mjolnir`'s `hub` has no
  bootstrap or `Dockerfile` at all yet; adding the equivalent is tracked in
  `mjolnir`'s own `hub-builder-operator-console` proposal, not duplicated
  here — this proposal only states the requirement and verifies it holds
  across the unified stack once that work lands.
- **Fixed-catalog data (the 10 `C20`–`C29` decks) auto-seeds on boot**,
  idempotently — a `hub`-side concern (decks are Mjølnir-only, D43; stabbur
  has no deck-shaped anything), also tracked in `hub-builder-operator-console`.
  Sample/test fixtures (`stabbur`'s `scripts/seed_p4_notes.py`) stay a
  manual, explicit script — never auto-run.
- **BREAKING**: none to either included repo's own standalone deployment
  path — this only adds a second, unifying way to start them together.

## Capabilities

### New Capabilities
- `unified-deployment`: the top-level `tun/compose.yaml`, sibling-checkout
  convention, consistent naming, the single shared `adminer`.
- `auto-migration`: migrate-on-boot for every service with a schema, and the
  fixed-catalog-vs-test-fixture seeding split.

### Modified Capabilities
<!-- None in tun itself — tun has no prior specs. The two included repos'
     own compose files are referenced, not modified: `mjolnir`'s and
     `stabbur`'s compose.yaml each stay exactly as their own repos define
     them. -->

## Impact

- **New files in `tun`**: `compose.yaml`, `DEPLOY.md`, `.env.example` (for
  whatever top-level-only variables the `adminer`/`include:` setup needs).
- **One rename in `stabbur`**: `docker-compose.yml` → `compose.yaml`
  (coordinate with that repo directly — it's a one-line rename, not a
  behavior change, but it is a file both this proposal and anyone currently
  running `stabbur` standalone needs to know about).
- **Zero changes to `mjolnir`'s or `stabbur`'s own `compose.yaml` contents**
  — `include:` composes them, it doesn't alter them. The migrate-on-boot and
  auto-seed behavior is each service's own entrypoint concern, implemented
  in that service's own repo (tracked in each repo's relevant proposal —
  `hub-builder-operator-console` for `mjolnir`'s side, and as a task in
  `stabbur` if `p4-notes`'s existing setup doesn't already auto-migrate).
- **Depends on nothing else landing first** — this can be written and tested
  against whatever `mjolnir`/`stabbur` compose files exist today; it only
  gets more useful as `hub-builder-operator-console` adds real services to
  `mjolnir`'s file.
