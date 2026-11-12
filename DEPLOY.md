# Deploying the unified stack

One `git pull` per repo, one `docker compose up` here — this is the only
thing you ever run on the VPS. `mjolnir`, `stabbur`, `smia` and `phonexa`
each still deploy standalone too (their own compose files are unchanged);
this just brings them up together.

## Layout

Sibling checkout — all five repos cloned at the same filesystem level:

```
~/tun/
~/mjolnir/
~/stabbur/
~/smia/
~/phonexa/
```

```sh
git clone <tun-remote> tun
git clone <mjolnir-remote> mjolnir
git clone <stabbur-remote> stabbur
git clone <smia-remote> smia
git clone <phonexa-remote> phonexa
```

`phonexa` needs nothing extra on the host beyond the checkout and its own
`.env` — no large out-of-band data directory like smia's `providers/`
below.

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
cp phonexa/.env.example phonexa/.env   # fill in, per phonexa's own docs
cp tun/.env.example tun/.env           # backup service; see below
cd tun
docker compose up -d
docker compose logs -f caddy          # watch the certificates get issued
```

**`PHONEXA_POSTGRES_PASSWORD` must be the same value in `phonexa/.env` and
`tun/.env`.** phonexa's compose reads it from its own `.env`; the backup
service reads it from `tun`'s. Nothing syncs them. If they drift, phonexa's
`pg_dump` fails — and since the three dumps are one all-or-nothing
transaction, the whole backup run aborts loudly instead of quietly backing
up only mjolnir and stabbur. (Same hazard `STABBUR_POSTGRES_PASSWORD`
already has.)

### phonexa's hostname, DNS and login

phonexa is **not** at `https://<host>/phonexa` the way `/stabbur` and
`/smia` are. It is served on a hostname of its own, behind HTTP basic auth
with the operator token — because its frontend hardcodes absolute API paths
and opens its live-mic WebSocket at `location.host + '/stream'` (both
frozen), and because phonexa has no login of its own at all.

That routing lives in `mjolnir`, which owns the only Caddy in the stack
(D84/D148). **Follow "Optional: phonexa on its own hostname" in
`mjolnir/DEPLOY.md`** for the DNS record, the one-time
`caddy hash-password` step, and the single-quoting rule for the resulting
hash. Until you do, nothing breaks: the phonexa site block stays inert and
fails closed, and phonexa is simply unreachable from outside.

## What comes up

Everything `mjolnir/compose.yaml`, `stabbur/compose.yaml`,
`smia/docker-compose.yml` and `phonexa/docker-compose.yml` each already
define — this file changes nothing about *what* gets deployed, only brings
all four up together. See those repos' own docs for what each service does.

phonexa contributes `phonexa-postgres`, `phonexa-backend` and its audio
volume. Its own development Adminer does **not** start here: phonexa puts
it behind a `dev` compose profile precisely so the shared one below is the
only database browser running.

One addition here: a single Adminer (this file's own definition merges onto
stabbur's own `adminer` service, not a second instance), reachable two ways:

- `https://<host>/adminer` — through Caddy, no port to remember (mjolnir's
  `caddy/Caddyfile` reverse-proxies it by service name; only works when
  brought up this way, via `include:`, since that's the only compose file
  defining a service named `adminer`)
- `http://<host>:8082` — the direct published port (this file's own
  override of stabbur's port, `8081` -> `8082`, so it doesn't collide with
  stabbur's own standalone port if that stack is ever also run directly)

Its login screen accepts `mjolnir-postgres` (mjolnir's hub database),
`stabbur-postgres` (stabbur's), `smia-postgres` (smia's) or
`phonexa-postgres` (phonexa's) as the server — one tool, all four
databases, no per-service instance needed. None of
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

phonexa is deliberately **not** in that list: it lives on its own hostname
behind its own basic-auth prompt (see above), so there are no cross-links
to or from it yet — a different origin and a separate credential prompt.

## Verifying it worked

```sh
docker compose ps                     # everything from all four projects should be Up
docker compose exec mjolnir-builder getent hosts backend       # should resolve
docker compose exec mjolnir-caddy getent hosts smia-backend    # should resolve
curl -I https://<host>/stabbur/ui     # 200, through the real proxy
curl -I https://<host>/smia/ui        # 200, through the real proxy
curl -I https://<host>/mjolnir/ui     # 302 (redirect to login) if unauthenticated
```

## Backups

The `backup` service in this file dumps all three databases and mirrors two
file stores into the private git repo at `BACKUP_REPO_URL`:

| In the backup repo | What it is |
| --- | --- |
| `mjolnir.sql` | mjolnir's database, minus the regenerable `job_logs`/`build_jobs` |
| `stabbur.sql` | stabbur's database |
| `phonexa.sql` | phonexa's database, **no table excluded** — every phonexa table is user data, including Shadowing media, segments, progress, users and settings |
| `blobs/` | stabbur's flat, content-addressed blob store |
| `phonexa-audio/` | phonexa's audio tree, mirrored at the same relative paths |

The three dumps are one all-or-nothing transaction: if any fails, none of
the committed `.sql` files is touched and no commit is made. Trigger a run
by hand with:

```sh
docker compose run --rm -e RUN_ONCE=1 backup
```

**Shadowing needs no separate backup.** Its recordings are deliberately
ephemeral and never stored server-side; the database holds only the
fingerprints, split points, progress and transcripts — so `phonexa.sql`
*is* the Shadowing backup. Don't "optimize" those tables out with an
exclusion later.

**`phonexa-audio/` is copy-if-absent, and that has a known consequence.**
A file is copied only when its relative path is not already in the backup
repo; nothing is ever overwritten or deleted. Unlike stabbur's write-once,
content-addressed blobs, phonexa's audio files *can* be rewritten in place
(Formant Lab's sample trim, or re-recording under the same key). So an
edited sample keeps its **pre-edit** audio in the backup, and a sample
deleted in phonexa stays in the mirror. This is an accepted trade-off
(D147) — the alternative rewrites git history on every edit. To refresh one
file on purpose, delete it from the backup repo clone and let the next run
copy the current version:

```sh
docker compose exec backup rm /data/tun-backup/phonexa-audio/<rel/path.wav>
docker compose run --rm -e RUN_ONCE=1 backup
```

### Restoring phonexa

**Restore into an EMPTY database, and do _not_ run `alembic upgrade head`
first.** `phonexa.sql` is a full `pg_dump` — it carries its own `CREATE
TABLE` statements *and* the `alembic_version` row, so it rebuilds the
schema, the data and the migration state in one pass. Pre-creating the
schema makes the load fail part-way (verified: `ERROR: relation "settings"
already exists`, `psql` exit 3), which is worse than failing cleanly
because earlier statements have already applied.

```sh
# target must be empty — recreate the database if it is not
docker compose exec phonexa-postgres \
    psql -U phonexa -d postgres -c 'DROP DATABASE phonexa' -c 'CREATE DATABASE phonexa'
# load schema + data + alembic_version in one pass
docker compose exec -T phonexa-postgres \
    psql -v ON_ERROR_STOP=1 -U phonexa phonexa < phonexa.sql
```

`ON_ERROR_STOP=1` is not optional: without it `psql` reports success while
having skipped every failed statement. Afterwards `alembic upgrade head`
is a no-op if the backup was current, or applies only the migrations added
since — which is exactly what you want.

The audio mirror is restored by copying `phonexa-audio/` back into
phonexa's audio volume at the same relative paths — a plain file copy, not
automated here.

## Changing what's deployed

Happens in `mjolnir`'s, `stabbur`'s, `smia`'s or `phonexa`'s own repo, not
here — this file is purely the unification point. A `git pull` in any of them followed
by `docker compose up -d --build` here picks up their changes.
