## Context

- `tun/docs/07-decisions.md`, **D94** — the decision this change implements,
  and why it doesn't reopen D81's rejected design (cross-repo file
  *references* inside one service's Caddyfile) even though both involve
  multiple repos.
- `tun/docs/13-operator-console-ux.md` — the "no shell commands on the VPS"
  requirement this change exists to satisfy.
- **Confirmed on disk before writing this**: `tun` today has zero deploy
  artifacts (D84 fully executed — no `compose.yaml`, `Caddyfile`, `bin/`,
  `DEPLOY.md` anywhere in this repo). This is the first code `tun` has ever
  shipped.
- **Confirmed on disk**: `stabbur/scripts/bootstrap.py` already runs
  `alembic upgrade head` before starting Flask — auto-migration already
  works there. `mjolnir`'s `hub` has no `Dockerfile` or bootstrap at all yet
  (tracked in `mjolnir`'s `hub-builder-operator-console` proposal). Don't
  duplicate that work here; this change only states and verifies the
  cross-stack guarantee.

## Goals / Non-Goals

**Goals:**
- One `git pull` (×3 repos) + one `docker compose up` in `tun` brings up the
  whole stack.
- Neither `mjolnir`'s nor `stabbur`'s own `compose.yaml` loses its standalone
  usability.
- One `adminer`, both databases reachable from it.

**Non-Goals:**
- Writing `mjolnir/hub`'s `Dockerfile` or bootstrap script — that's
  `hub-builder-operator-console`'s task, this proposal only depends on it
  existing for the full stack to be useful, and can be written/tested before
  it lands (against whatever `mjolnir/compose.yaml` currently defines).
- Moving Caddy, or building a real shared front door across all four
  eventual services — not yet needed (D94 confirms Caddy stays in `mjolnir`).
- Any change to `stabbur`'s or `mjolnir`'s own compose file *contents* —
  `include:` composes them as-is.

## Decisions

### D-T1 — `include:`, not git submodules, not a setup script

Compose's native `include:` directive (stable since Compose v2.20) merges
multiple compose files into one project with one shared network — service
name DNS resolution (`stabbur:8000` reachable from a container defined in
`mjolnir`'s file) works automatically once both files are included together,
no extra network wiring needed. Chosen over:
- **Git submodules** — adds a layer of git mechanics (`git submodule
  update --init`) for something `include:` already solves natively, with no
  submodule-specific footguns to learn.
- **A setup script that clones/symlinks things** — more to maintain than a
  15-line YAML file Compose already knows how to read.

### D-T2 — the included files are referenced by relative path, assuming sibling checkout

```yaml
# tun/compose.yaml
include:
  - ../mjolnir/compose.yaml
  - ../stabbur/compose.yaml
services:
  adminer:
    image: adminer
    # ...
```

This hardcodes the sibling-checkout assumption into the file itself — not
configurable via an env var, since the operator has already confirmed this
is how they'll check the repos out (three `git clone`s, same level), and a
configurable path for a one-person deployment is complexity with no
real user.

### D-T3 — one `adminer`, two servers, via its login-screen server picker

Adminer's login screen already accepts a server address, not just
credentials — no plugin or special config needed to point it at two
different Postgres hosts in sequence (or side by side, depending on how the
operator wants to bookmark each). One container, one URL, both databases.

### D-T4 — naming consistency is purely cosmetic, but done anyway

`stabbur/docker-compose.yml` → `compose.yaml`. Zero behavior change — both
names work identically with `docker compose up` in that directory — but
having `include:` reference two differently-named sibling files while this
repo's own file carries the modern canonical name would read as an
inconsistency with no reason behind it. Fixed because it's free, not because
it was blocking anything.

## Risks / Trade-offs

- **`include:` requires a reasonably recent Compose version** (v2.20+,
  2023). → Confirm the VPS's installed Compose version before relying on
  this; document the minimum in `DEPLOY.md`.
- **A rename in `stabbur` (D-T4) is a small cross-repo coordination point** —
  anyone with `stabbur/docker-compose.yml` already bookmarked/scripted needs
  to know it moved. → One line in `stabbur`'s own changelog/README, not a
  big deal, but worth not forgetting.
- **This proposal can ship before `hub-builder-operator-console` adds real
  `mjolnir` services** — the unified compose file will "work" even with
  `mjolnir`'s file only defining `caddy`+`postgres`+`mjolnir-node` as it does
  today. → That's fine; this proposal's value compounds as the other lands,
  it isn't blocked waiting for it.

## Migration Plan

No existing deployment to migrate — this is new capability, additive.

1. `tun/compose.yaml` with `include:`, tested against whatever
   `mjolnir`/`stabbur` compose files currently define (even before
   `hub-builder-operator-console` lands).
2. `adminer` service, verified against both databases.
3. `stabbur/docker-compose.yml` → `compose.yaml` rename.
4. `tun/DEPLOY.md` — sibling-checkout instructions, Compose version
   requirement, first-boot walkthrough.
5. Re-verify once `hub-builder-operator-console` actually adds `hub`/
   `builder` services to `mjolnir`'s file — confirm they come up correctly
   through the `include:`, with working Caddy routes and auto-migration.
