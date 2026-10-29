# Deploying the unified stack

One `git pull` per repo, one `docker compose up` here — this is the only
thing you ever run on the VPS. `mjolnir`, `stabbur`, and `smia` each still
deploy standalone too (their own compose files are unchanged); this just
brings them up together.

## Layout

Sibling checkout — all four repos cloned at the same filesystem level:

```
~/tun/
~/mjolnir/
~/stabbur/
~/smia/
```

```sh
git clone <tun-remote> tun
git clone <mjolnir-remote> mjolnir
git clone <stabbur-remote> stabbur
git clone <smia-remote> smia
```

**smia additionally needs its own `providers/` directory populated on this
host** — gitignored, not fetched by cloning the repo (~1GB of raw provider
dumps: ordbank, kaikki, NST, wikipron, dict.cc). Copy it over separately
(`rsync`/`scp` from wherever it was assembled) before first boot. Without
it, smia starts fine but every data-backed provider (ordbank, nst, kaikki,
wikipron, dict.cc static) returns empty candidates for every single lookup
— a real response, not an error, and easy to mistake for a bug instead of
missing data (confirmed live, D118).

**Requires Docker Compose v2.20+** (`include:` support). Check with
`docker compose version`.

## First boot

Each repo's own `.env` still works the normal way — `tun` adds nothing new
to configure beyond what `mjolnir`'s, `stabbur`'s, and `smia`'s own
`DEPLOY.md`s already describe. The values that matter here: `mjolnir/.env`'s
`STABBUR_UPSTREAM` should be `backend:5056` and `SMIA_UPSTREAM` (optional,
already defaulted) `smia-backend:5055` — both Docker service names resolve
directly once all three projects share a network.

**One-time step, required even under this unified file — do not skip it.**
`mjolnir`'s, `stabbur`'s, and `smia`'s own compose files all declare
`tun-shared` as `external: true` (D98), and `include:` has no way to clear
that back off (confirmed 2026-10-26 — an including file's own `networks:`
override does not work, despite this doc previously claiming otherwise):

```sh
docker network create tun-shared
```

Run it once per host, before the first `docker compose up` here. Already
done? `docker network ls | grep tun-shared` tells you.

```sh
cp mjolnir/.env.example mjolnir/.env   # fill in, per mjolnir/DEPLOY.md
cp stabbur/.env.example stabbur/.env   # fill in, per stabbur's own docs
cp smia/.env.example smia/.env         # fill in, per smia's own docs
cd tun
docker compose up -d
docker compose logs -f caddy          # watch the certificate get issued
```

## What comes up

Everything `mjolnir/compose.yaml`, `stabbur/compose.yaml`, and
`smia/docker-compose.yml` each already define — this file changes nothing
about *what* gets deployed, only brings all three up together. See those
repos' own docs for what each service does.

One addition here: a single Adminer (this file's own definition merges onto
stabbur's own `adminer` service, not a second instance), reachable two ways:

- `https://<host>/adminer` — through Caddy, no port to remember (mjolnir's
  `caddy/Caddyfile` reverse-proxies it by service name; only works when
  brought up this way, via `include:`, since that's the only compose file
  defining a service named `adminer`)
- `http://<host>:8082` — the direct published port (this file's own
  override of stabbur's port, `8081` -> `8082`, so it doesn't collide with
  stabbur's own standalone port if that stack is ever also run directly)

Its login screen accepts `postgres` (mjolnir's hub database),
`stabbur-postgres` (stabbur's), or `smia-postgres` (smia's) as the server —
one tool, all three databases, no per-service instance needed. None of
these routes has its own auth (unlike
`/mjolnir`/`/builder`, gated by `OPERATOR_AUTH_TOKEN`) — treat both as
exposed to anyone who can reach the host at all.

## Navigating between services

Once Caddy is up, the four operator UIs cross-link to each other and share
the same route shape (`/<service>/ui`):

- `https://<host>/mjolnir/ui` — hub: Cards, publish history, OTA console
- `https://<host>/builder/ui` — builder: forecast, schedule, run log
- `https://<host>/stabbur/ui` — stabbur: notes, grammar rules
- `https://<host>/smia/ui` — smia: provider catalog, health, manual try-it

## Verifying it worked

```sh
docker compose ps                     # everything from all three projects should be Up
docker compose exec mjolnir-builder getent hosts backend       # should resolve
docker compose exec mjolnir-caddy getent hosts smia-backend    # should resolve
curl -I https://<host>/stabbur/ui     # 200, through the real proxy
curl -I https://<host>/smia/ui        # 200, through the real proxy
curl -I https://<host>/mjolnir/ui     # 302 (redirect to login) if unauthenticated
```

## Changing what's deployed

Happens in `mjolnir`'s, `stabbur`'s, or `smia`'s own repo, not here — this
file is purely the unification point. A `git pull` in any of them followed
by `docker compose up -d --build` here picks up their changes.
