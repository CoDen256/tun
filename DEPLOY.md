# Deploying the unified stack

One `git pull` per repo, one `docker compose up` here — this is the only
thing you ever run on the VPS. `mjolnir` and `stabbur` each still deploy
standalone too (their own compose files are unchanged); this just brings
them up together.

## Layout

Sibling checkout — all three repos cloned at the same filesystem level:

```
~/tun/
~/mjolnir/
~/stabbur/
```

```sh
git clone <tun-remote> tun
git clone <mjolnir-remote> mjolnir
git clone <stabbur-remote> stabbur
```

**Requires Docker Compose v2.20+** (`include:` support). Check with
`docker compose version`.

## First boot

Each repo's own `.env` still works the normal way — `tun` adds nothing new
to configure beyond what `mjolnir`'s and `stabbur`'s own `DEPLOY.md`s already
describe. The one value that matters here: `mjolnir/.env`'s
`STABBUR_UPSTREAM` should be `backend:5056` — the Docker service name
resolves directly once both projects share a network.

**One-time step, required even under this unified file — do not skip it.**
Both `mjolnir`'s and `stabbur`'s own compose files declare `tun-shared` as
`external: true` (D98), and `include:` has no way to clear that back off
(confirmed 2026-10-26 — an including file's own `networks:` override does
not work, despite this doc previously claiming otherwise):

```sh
docker network create tun-shared
```

Run it once per host, before the first `docker compose up` here. Already
done? `docker network ls | grep tun-shared` tells you.

```sh
cp mjolnir/.env.example mjolnir/.env   # fill in, per mjolnir/DEPLOY.md
cp stabbur/.env.example stabbur/.env   # fill in, per stabbur's own docs
cd tun
docker compose up -d
docker compose logs -f caddy          # watch the certificate get issued
```

## What comes up

Everything `mjolnir/compose.yaml` and `stabbur/compose.yaml` each already
define — this file changes nothing about *what* gets deployed, only brings
both up together. See those repos' own docs for what each service does.

One addition here: a single Adminer, reachable at `http://<host>:8081` (same
port `stabbur`'s own compose already published — this file's own definition
merges onto that service, not a second instance). Its login screen accepts
either `postgres` (mjolnir's hub database) or `stabbur-postgres` (stabbur's)
as the server — one tool, both databases, no per-service instance needed.

## Navigating between services

Once Caddy is up, the three operator UIs cross-link to each other and share
the same route shape (`/<service>/ui`):

- `https://<host>/mjolnir/ui` — hub: Cards, publish history, OTA console
- `https://<host>/builder/ui` — builder: forecast, schedule, run log
- `https://<host>/stabbur/ui` — stabbur: notes, grammar rules

## Verifying it worked

```sh
docker compose ps                     # everything from both projects should be Up
docker compose exec mjolnir-builder getent hosts backend   # should resolve
curl -I https://<host>/stabbur/ui     # 200, through the real proxy
curl -I https://<host>/mjolnir/ui     # 302 (redirect to login) if unauthenticated
```

## Changing what's deployed

Happens in `mjolnir`'s or `stabbur`'s own repo, not here — this file is
purely the unification point. A `git pull` in either repo followed by
`docker compose up -d --build` here picks up their changes.
