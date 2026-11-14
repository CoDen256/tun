# Deploying tun

One repository, one Compose project, one command. A deploy is:

```sh
git pull && docker compose up -d --build
```

That is the whole thing. There is no second checkout, no network to create by
hand, no out-of-band data directory to copy, and no per-repo `git pull` to
forget.

> **What changed, and why this file was rewritten (monorepo-merge, D150/D151).**
> Every instruction in the previous version of this file is now false, so it
> was replaced rather than amended. For the record, because these are exactly
> the steps an operator remembers doing and might try to redo:
> - **No `docker network create tun-shared`.** One repository is one Compose
>   project is one default network. The external network, its
>   `external: true` declarations and that one-time step (D98, corrected by
>   D104) are deleted outright. If the network still exists on the host it is
>   simply unused; `docker network rm tun-shared` is safe once the stack is
>   up on this branch.
> - **No sibling checkouts.** `mjolnir/`, `stabbur/`, `smia/`, `phonexa/`,
>   and `backup/` are directories in *this* repo. `hover-translate` is NOT
>   (D154) — it is its own repository and is never deployed.
> - **No `rsync` of smia's `providers/`.** The old claim that it is gitignored
>   and must be copied in separately was wrong: it is tracked in git (4,082
>   tracked files under `smia/`, of which 3,858 are `providers/`). A clone
>   gives a working smia. Only the two Leipzig archives and the nbno zip are
>   gitignored, and `smia/scripts/bootstrap.py` warns rather than fails for
>   any absent file.
> - **No per-repo `.env` to keep in sync.** One root `.env` holds every shared
>   value; a project's own `.env` holds only values nothing else uses. No
>   value is defined in two files (D151) — which retires P35 and P36.

**Requirements on the host:** Docker Engine with the Compose plugin.
`include:` needs Compose **v2.20+**; everything here was verified on
**v5.4.0**. Nothing else is installed on the host — no node, no python, no
postgres client.

---

## 1. Layout

```
tun/                     ← the only clone
  compose.yaml           include:s all four deployed projects + adminer + backup
  .env                   every value used by more than one project (gitignored)
  .dockerignore           derived from the real COPY lines; 31 MB of build context
  bin/check-standards.sh  the D150-D153 standards check
  docs/                  the ecosystem design docs and the ADR log
  openspec/              ecosystem-level changes
  mjolnir/     gateway (Caddy), hub, builder, the OTA data dir, its own DEPLOY.md
  stabbur/     learning content: notes, captures, blobs
  smia/        linguistics services + the tracked providers/ lookup data
  phonexa/     the phonetics lab
  backup/      the backup service's image
```

`docker compose` is run **from this root** for a real deploy. Each project's
`compose.yaml` still stands alone for development — see §5.

## 2. First boot

```sh
# 1. Docker, if the host does not have it (Debian/Ubuntu)
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker "$USER"          # log out and back in

# 2. One clone
git clone <your-remote>/tun.git && cd tun

# 3. One config file
cp .env.example .env
$EDITOR .env                             # see §3 — read the database warning first

# 4. Optional project-local config (see the table below). None is required.
cp smia/.env.example smia/.env
cp mjolnir/.env.example mjolnir/.env

# 5. stabbur's optional yt-dlp cookie jar. Create the FILE even if empty:
#    a bind mount of a path that does not exist makes Docker create a
#    DIRECTORY there, and routes/enrich.py only checks that the path exists.
touch stabbur/cookies.txt

# 6. Up
docker compose up -d --build
docker compose logs -f caddy             # watch the certificate get issued
```

**Point DNS at the box before step 6.** An A record (and AAAA if you have v6)
for `TUN_SITE_ADDRESS`, grey-clouded / DNS-only — never proxied through a CDN
(D57: a CDN in the body path re-encodes responses and breaks the frozen
sha256 contract, and it intercepts the ACME challenge). Ports 80 and 443 must
be open in the provider firewall; Caddy answers the HTTP-01 challenge on 80.

### Which projects have their own `.env`

The invariant is cardinality, not location (D151): a value used by more than
one project lives in the **root** `.env`; a value used by exactly one project
lives in **that project's** `.env`; a value derivable from another is computed
in compose and typed nowhere. Everything below is optional — every project
starts with its project-local file absent (`required: false`).

| file | holds | if absent |
|---|---|---|
| `mjolnir/.env` | `SOURCE_LANG` and the local-only `ALLOW_HTTP` / `ALLOW_NO_COMPANION`. **No longer `PHONEXA_AUTH_HASH`** — the gateway derives the operator hash from `OPERATOR_AUTH_TOKEN` at start (§4) | everything defaults |
| `smia/.env` | `HF_TOKEN`, `DEEPL_TOKEN`, `ELEVENLABS_TOKEN` | smia starts; those providers fail at call time with "needs a *_TOKEN" |
| `phonexa/.env` | `AUDIO_BACKEND` (only `local` is implemented) | the backend already defaults to `local` |
| `stabbur/.env` | **nothing. Do not create it.** Everything stabbur needs is shared or derived | — |

Never copy a value from the root `.env` into one of these. If
`bin/check-standards.sh` finds a key in two `.env.example` files it fails, and
that check exists because the pre-merge layout had `SMIA_AUTH_TOKEN` typed
into three files with nothing keeping them in step.

`DATABASE_URL`, `STABBUR_BASE_URL`, `STABBUR_UI_BASE` and `SMIA_BASE_URL` are
**derived in compose** and must not appear in any `.env`. The old
`STABBUR_UPSTREAM` / `SMIA_UPSTREAM` / `PHONEXA_UPSTREAM` keys are gone
entirely: `grind/caddy/Caddyfile` (the gateway moved out of `mjolnir/` —
`unified-auth` section 1, superseding D84) names `stabbur-backend`,
`smia-backend` and `phonexa-backend` directly, because one Compose project means a service
name always resolves.

## 3. Postgres passwords — read this before editing `.env`

> **This section had two readers and was written for only one of them.**
> `postgres-consolidation` replaced the four per-project instances with ONE
> cluster holding one database per service, so the steady state below is no
> longer four keys. But the four-password hazard is still live **while
> reading the OLD volumes during the cutover**, which is the only time it
> bites. Both are documented; do not apply the wrong one.

### 3a. Steady state after the cutover — ONE key

One `postgres:17-alpine` cluster (`postgres/compose.yaml`), five databases —
`mjolnir`, `stabbur`, `smia`, `phonexa`, `shadow` — one role per database
with its own password **derived in compose** from a single key:

```sh
POSTGRES_PASSWORD=<required — no default, the stack refuses to start without it>
```

Per-service `DATABASE_URL`s are derived, never typed (D151: no value in two
files). A service's role reaches only its own database.

Verify what is actually running before trusting either half of this section:

```sh
docker compose exec postgres psql -U tunadmin -d postgres -c '\l'
```

### 3b. The old per-instance passwords — ONLY for reading pre-cutover volumes

Before consolidation there were four instances and four keys
(`MJOLNIR_POSTGRES_PASSWORD` required; `STABBUR_`/`SMIA_`/`PHONEXA_` each
defaulting to the project name). Those volumes are **retained deliberately**
as the rollback that does not involve the dumps, and each still has its
original password baked in.

**Do not collapse those four into one value when connecting to them. This is
the single most dangerous mistake available in this file.** Postgres applies `POSTGRES_PASSWORD`
**only when it initialises a fresh data directory**. The existing volumes were
each created with the literal their old compose file hardcoded:

| volume | password baked in at init |
|---|---|
| `mjolnir_postgres_data` | the operator's real value (was `POSTGRES_PASSWORD` in `mjolnir/.env`) |
| `stabbur_stabbur-pg-data-17` | `stabbur` |
| `smia_smia-pg-data` | `smia` |
| `phonexa_postgres_data` | `phonexa` (or whatever `PHONEXA_POSTGRES_PASSWORD` was set to when it was created) |

Setting one shared value authenticates against **none** of them. Nothing
errors at startup, nothing appears in the Postgres logs explaining it: each
backend simply fails authentication, and the backup service aborts every run.

When reading a **retained pre-cutover volume**, `MJOLNIR_POSTGRES_PASSWORD`
must be exactly the value that was in `mjolnir/.env` as `POSTGRES_PASSWORD`
before the merge, and the other three must be left at their defaults unless
you know the volume was
created with something else.

On a **genuinely fresh** host (no volumes at all) any values work, because
every data directory is initialised on first boot.

The collapse into one `POSTGRES_PASSWORD` belongs to the planned
`postgres-consolidation` change — **not done** — which dump/restores into a
fresh cluster. That is the only point at which a new password can take effect.
Attempting it here is a silent outage. (smia is also deliberately still on
`postgres:16` while the other three are on `postgres:17-alpine`; the upgrade
is that same change's job, and bumping the image alone leaves the server
refusing to start against the PG16 data directory.)

The other root `.env` values, briefly:

| key | notes |
|---|---|
| `TUN_SITE_ADDRESS` | bare hostname ⇒ automatic HTTPS; `:8080` for local plain HTTP |
| `TUN_PUBLIC_BASE` | `https://<host>` — used to build browser-facing links |
| `OTA_TOKEN` | **device plane.** Baked into the APK. Changing it cuts every installed device off from updates until a new `config.json` is pushed (D39). See `docs/11-ota-contract.md` |
| `OPERATOR_AUTH_TOKEN` | **operator plane — THE one human credential.** Username is always `operator`; this is the password for all seven operator zones, hashed at gateway start (§4). **The device also carries this value, baked into its bundle — read §4's rotation hazard before changing it.** |
| `INTERNAL_TOKEN` | internal service-to-service calls only; never passes through the gateway and a human never sends it. Replaces `STABBUR_AUTH_TOKEN` and `SMIA_AUTH_TOKEN`, which are **retired names** `bin/check-standards.sh` now fails on |
| `BACKUP_REPO_URL`, `BACKUP_SSH_KEY_PATH`, `BACKUP_INTERVAL_SECONDS` | §7 |

`BACKUP_REPO_URL` and `BACKUP_SSH_KEY_PATH` are `:?`-required by the `backup`
service, which means **the whole root stack refuses to render** if either is
unset — not just that one service. `.env.example`'s placeholders are non-empty,
so a copied file comes up; the backup service is then the only thing that
fails, and it fails loudly. `BACKUP_SSH_KEY_PATH` must point at an existing
**file** on the host: a bind mount of a path that does not exist makes Docker
create a directory there, and the container then cannot read a private key.

## 4. The operator gate

**There is nothing to configure here any more.** This section used to tell you
to run `caddy hash-password` by hand and put a single-quoted
`PHONEXA_AUTH_HASH` in `mjolnir/.env`. `unified-auth` 3.1-3.3 deleted that
value: `grind/entrypoint.sh` derives the bcrypt hash from `OPERATOR_TOKEN`
(the root `.env`'s `OPERATOR_AUTH_TOKEN`) at container start, cost 10, and
refuses to start the gateway if the derivation did not produce a 60-character
cost-10 hash.

What that bought:

- **One credential, every operator zone.** `basic_auth`, username fixed to
  `operator`, password = `OPERATOR_AUTH_TOKEN`, enforced in the gateway in
  front of `/mjolnir/*`, `/builder/*`, `/stabbur/*`, `/smia/*`, `/phonexa/*`,
  `/shadow/*` and `/adminer/*`. Adminer had never been gated before this.
- **Rotation is now real and is one step.** Change `OPERATOR_AUTH_TOKEN`,
  restart the gateway. Previously the hash did not follow the token, so the
  old password kept opening phonexa while the new one opened hub — and
  nothing said so.
- **The two pitfalls are gone with the value** (P35, P36): there is no
  `$`-containing value in a `.env` for compose to mangle, and no valueless
  compose key to resolve from the wrong project's `.env` under `include:`.
- **Still fail-closed.** The Caddyfile keeps a locked default — a real bcrypt
  hash of a random string generated once and discarded — so a bare
  `caddy run` with no environment rejects every operator request rather than
  serving eight zones open.


> **UPDATE 2026-11-14 — rotating `OPERATOR_AUTH_TOKEN` is now safe.**
> The device-sync gate reads its own `SYNC_TOKEN` variable, not
> `OPERATOR_TOKEN`, so changing the operator password no longer touches the
> phone. Rotate it, `docker compose up -d caddy`, and the bcrypt hash is
> re-derived at boot. Verified on the compiled config: with the operator
> token changed to an unrelated value, the sync gate still accepts exactly
> what the installed APK sends.
>
> What is still true: `SYNC_TOKEN` itself defaults to `OPERATOR_AUTH_TOKEN`'s
> value because that is what the field build has baked in. **Setting
> `SYNC_TOKEN` to something new without publishing a bundle that carries it
> will 302 the handset on every sync** — the value is baked at assemble time,
> not read from `config.json` (P48). If you ever want the device on a strong
> token, the order is: add the new value as a second accepted token in the
> Caddyfile, publish a bundle carrying it, confirm the handset activated it,
> then remove the old one. That sequence has no window where the phone is
> locked out.

### Rotating `OPERATOR_AUTH_TOKEN` — read this before you touch the value

Rotation is one step **for the operator plane** and a device operation
**for the phone**. Both are consequences of the same value.

| changing `OPERATOR_AUTH_TOKEN` | effect |
|---|---|
| all seven operator zones | new password takes effect on the next gateway restart. Nothing else to edit — no hash, no per-service `.env` |
| your browser | re-prompts. There is no logout button by design |
| **the phone's progress sync** | **BREAKS, silently, until a new bundle is published.** |

**The hazard, stated plainly.** The device's `SYNC_TOKEN` is not merely
*equal to* `OPERATOR_AUTH_TOKEN` — it is **baked into the JS bundle** at
assemble time (`patches/js/2080-progress-sync-shim.edited.js`, substituted by
`mjolnir/src/commands/assemble.js`). It is **NOT read from `config.json`**:
`docs/11-ota-contract.md` §5's escape hatch covers the **OTA channel's** URL
and token only, and no JS-side reader for `config.json` exists. So:

> **Rotating `OPERATOR_AUTH_TOKEN` requires assembling and publishing a NEW
> OTA BUNDLE carrying the new token, and confirming the handset took it.
> A `config.json` push does NOT fix it.** (P48; `unified-auth` 7.1 would give
> the device its own value and end this coupling — it is optional, device-
> coordinated, and not done.)

There is no error message for getting this wrong. The gateway answers the
device's sync with a `302` and the phone's progress silently stops being
backed up. Sequence it this way:

```sh
# 1. read what the handset actually carries, out of its live bundle
#    (the field bundle b000052 carries SYNC_TOKEN='changeme', 2026-11-14)
# 2. publish a bundle whose SYNC_TOKEN is the NEW value, and confirm the
#    device is running it
# 3. only then change OPERATOR_AUTH_TOKEN on the host and restart the gateway
```

If you are only cutting over to this stack and not rotating anything, the
check is the equality, not the sequence — see §8.0a.

The browser prompts once per session and there is no logout button — accepted
deliberately (`unified-auth/design.md`).

## 5. How to run it

### Everything (the deploy)

```sh
docker compose up -d --build      # from the repo root
docker compose ps
docker compose logs -f caddy
```

Twelve services: `caddy`, `mjolnir-postgres`, `mjolnir-hub`,
`mjolnir-builder`, `stabbur-postgres`, `stabbur-backend`, `smia-postgres`,
`smia-backend`, `phonexa-postgres`, `phonexa-backend`, `adminer`, `backup`.
The only publicly published ports in this mode are the gateway's 80, 443 and
443/udp, plus Adminer on **loopback** 8082. Nothing else publishes anything.

### One service and its dependencies

```sh
docker compose up -d stabbur-backend     # starts stabbur-postgres too
docker compose restart mjolnir-hub mjolnir-builder
docker compose logs -f smia-backend
```

`mjolnir-hub` and `mjolnir-builder` bind-mount the checkout, so `git pull` +
`restart` picks up source changes. Rebuild (`up -d --build`) only when a
`package.json` / `requirements.txt` changes.

### One project standalone, with loopback dev ports

Each project's own `compose.yaml` runs by itself, and its
`compose.override.yaml` publishes loopback ports so a native venv or `psql`
can connect. Compose auto-loads an override file **only** for the primary
compose file of the directory it is invoked in, which is why the unified stack
above publishes nothing — verified, and the reason there is no `dev` profile
(Compose has no per-port profile at all; see `design.md`).

```sh
cd stabbur && docker compose --env-file ../.env up -d
```

`--env-file ../.env` is needed because the shared values (the postgres
passwords, the auth tokens, `TUN_SITE_ADDRESS`) live in the root `.env` and a
project directory has no copy of them — that is the point of D151. Without it
you get blank-string warnings, default passwords, and for mjolnir a hard
`set TUN_SITE_ADDRESS in the root .env` refusal. The project's own `.env` is
still read for its own values either way.

| standalone command | published on loopback |
|---|---|
| `cd stabbur && docker compose --env-file ../.env up` | `5056` backend, `5434` postgres |
| `cd smia && docker compose --env-file ../.env up` | `5055` backend, `5433` postgres |
| `cd phonexa && docker compose --env-file ../.env up` | `5050` backend, `5432` postgres |
| `cd mjolnir && docker compose --env-file ../.env up` | nothing extra — but it does publish 80/443, so don't run it beside the root stack |

Standalone mode is for development. Do not run two of these at once against
the same volumes, and never run a project standalone on the production host
while the root stack is up: both reference the *same named volumes*
(`stabbur_stabbur-pg-data-17`, `phonexa_postgres_data`, …), so a second
Postgres would attach to a data directory another server already holds.

### Standards check

```sh
bash bin/check-standards.sh     # must exit 0
```

Eight checks over D150-D153: no key in two `.env.example`s, no retired or
derivable value typed anywhere, no `container_name`, no external network, no
`tun-shared` reference, restart policies present, nothing but the gateway
publishing publicly, bare-slug change ids, no CI.

## 6. What is reachable, and where

**Device plane** — static files off disk (D55), contract frozen
(`docs/11-ota-contract.md`; do not change these):

| route | auth |
|---|---|
| `/ota/*` | `Authorization: Bearer $OTA_TOKEN`, GET/HEAD only |
| `/blob/<sha256>` | none — the hash in the URL *is* the capability |
| `/audio-manifest/<buildId>.json` | none, immutable |

**Operator plane**, all on the one hostname, no second certificate:

Every one of these is gated in the gateway by Caddy `basic_auth` (§4) —
username `operator`, password `OPERATOR_AUTH_TOKEN` — before the request
reaches the service. The "then" column is what the service still does on top.
`unified-auth` section 4 replaced three different in-app implementations with
**one** shared check (`libs/pyservice/auth.py`, `libs/jsservice/auth.js`): the
gateway marker `X-Tun-Operator`, or `Bearer INTERNAL_TOKEN`, else 401. There
are no login pages left anywhere (D159).

| route | service | gateway | then |
|---|---|---|---|
| `/mjolnir`, `/mjolnir/*` | `mjolnir-hub:8000` | `basic_auth` | the shared check |
| `/builder`, `/builder/*` | `mjolnir-builder:8001` | `basic_auth` | the shared check |
| `/stabbur/*` | `stabbur-backend:5056` | `basic_auth` | the shared check |
| `/smia/*` | `smia-backend:5055` | `basic_auth` | the shared check |
| `/phonexa/*` | `phonexa-backend:5050` | `basic_auth` | the shared check (new — phonexa had none) |
| `/shadow/*` | `shadow-backend:5051` | `basic_auth` | the shared check (new — shadow had none) |
| `/adminer/*` | `adminer:8080` | `basic_auth` | Adminer's own cluster login |

A cross-origin **preflight** (`OPTIONS` with `Origin` and
`Access-Control-Request-Method`) is answered by the gateway with 204 *before*
`basic_auth`, because a preflight carries no credential by definition and a
401 there surfaces to the page as a CORS error nothing client-side can fix.
Any other `OPTIONS` is gated normally.

The gateway deletes any inbound `X-Tun-Operator` header on every route,
device plane included, and then SETS it after the credential check passes —
inside the same `route`, so the written order is the compiled order. That
header is the only thing every service trusts besides `INTERNAL_TOKEN`
(`libs/pyservice/auth.py`, `libs/jsservice/auth.js`), so a client must never
be able to mint it. Two things make that true and both are requirements: the
strip above, and the fact that **no service publishes a port outside the
loopback interface** (`bin/check-standards.sh` fails if one ever does).

`/mjolnir/userdata/*` sets the marker too, after validating the device's own
`Bearer` token. The device is unaffected: nothing it sends changed, only
which process reads it.

stabbur and smia serve their UI at the **prefix root** — `/stabbur/` and
`/smia/`, assets under `/stabbur/static/` and `/smia/static/`. The old `/ui`
paths are gone (404); D46's `/ui` convention is superseded. There is no token
box on either page any more: the operator authenticates once at the gateway
and the browser attaches that credential to every same-origin request,
`<audio src=...>` included.

### The one internal token

`INTERNAL_TOKEN` in the root `.env` is the only service-to-service credential
(builder → stabbur, stabbur → smia, shadow → smia, shadow → phonexa).
`STABBUR_AUTH_TOKEN` and `SMIA_AUTH_TOKEN` are **retired names** and
`bin/check-standards.sh` fails if either is typed into a `.env.example` again.
A human never sends this value.

### Adminer

`http://127.0.0.1:8082` (loopback only — reach it over an SSH tunnel:
`ssh -L 8082:127.0.0.1:8082 <host>`) or `https://<host>/adminer/` through the
gateway. One instance for all four databases; point its login screen at one of

| server | user | database |
|---|---|---|
| `mjolnir-postgres` | `mjolnir` | `postgres` |
| `stabbur-postgres` | `stabbur` | `stabbur` |
| `smia-postgres` | `smia` | `smia` |
| `phonexa-postgres` | `phonexa` | `phonexa` |

with that database's password from §3. phonexa's own development Adminer is
behind a `dev` profile and does not start here.

**`/adminer/` is gated now.** It used to be the one route with no auth at all
— a database-admin tool on the public origin behind nothing. `unified-auth`
3.1 put the same `basic_auth` gate in front of it that every other operator
zone has (`grind/caddy/Caddyfile`, `handle_path /adminer/*`). The loopback
`127.0.0.1:8082` mapping is unchanged and is not an exposure: it binds the
loopback interface, so only the host and an SSH tunnel can reach it.

### Verifying a deploy

```sh
docker compose ps                                   # all twelve Up (backup may be Up/healthy-less)
docker compose exec caddy getent hosts smia-backend     # resolves, no network config needed
docker compose exec mjolnir-builder getent hosts stabbur-backend
# every operator zone: 401 with no credential, served with it
for p in /mjolnir/ /builder/ /stabbur/ /smia/ /phonexa/ /shadow/ /adminer/; do
  curl -so /dev/null -w "$p %{http_code}\n" https://<host>$p                   # 401
  curl -so /dev/null -w "$p %{http_code}\n" -u operator:$OPERATOR_AUTH_TOKEN \
       https://<host>$p                                                        # 200
done
# a cross-origin preflight must be 2xx WITHOUT a credential (hover-translate)
curl -si -X OPTIONS -H 'Origin: https://example.com' \
     -H 'Access-Control-Request-Method: POST' \
     -H 'Access-Control-Request-Headers: authorization' \
     https://<host>/smia/translate | head -1                                   # 204
# the device plane must be untouched by any of it
curl -sI -H "Authorization: Bearer $OTA_TOKEN" https://<host>/ota/current.json  # 200
curl -sI https://<host>/ota/current.json                                       # 401
bash mjolnir/bin/ota-verify.sh    # must print 15 passed, 0 failed, 1 SKIPPED
                                  # (the skip is D53's https check under ALLOW_HTTP;
                                  #  16/0 means the assertion has been re-inverted)
```

`ota-verify.sh` is the P1 acceptance test and the only thing that proves the
unfixable parts of the device contract still hold (above all D49: the sha256
is identical with and without transport gzip). Re-run it after **any** Caddy
change. Caddy does not hot-reload — a `git pull` that touches
`mjolnir/caddy/Caddyfile` needs
`docker compose exec caddy caddy reload --config /etc/caddy/Caddyfile` or
`docker compose restart caddy`.

## 7. Backups

> **smia is deliberately NOT backed up** (operator decision, 2026-11-14).
> Every table it holds is a cache or an imported corpus that
> `smia/scripts/import_*.py` rebuilds on boot, so the recovery path is a
> re-import, not a restore.
>
> **The consequence worth knowing:** that makes `smia/providers/` the thing
> to keep safe, not the backup repo. Those archives are tracked in git for
> the sources that have one — and on production two do NOT:
> `providers/nbno/nb_uttale_leksika.zip` and all of `providers/leipzig/` are
> absent, so `nst_dialect` (8.2M rows), `nst_lexicon` (793K) and the Leipzig
> partitions of `corpus_sentence` cannot be re-imported from this repo as it
> stands. They are live on production today. A pre-cutover full dump is kept
> off-host as the one historical copy. If you want those tables to be
> genuinely rebuildable, re-fetch the two archives into `providers/`; until
> then "rebuildable" is true of smia's other 13 tables, not all 16.

The `backup` service dumps three of the four databases and mirrors two file
stores into the private git repo at `BACKUP_REPO_URL`. It connects over the
network with a real password; no Docker socket is mounted.

| in the backup repo | what it is |
|---|---|
| `mjolnir.sql` | mjolnir's database, minus the regenerable `job_logs` / `build_jobs` |
| `stabbur.sql` | stabbur's database |
| `phonexa.sql` | phonexa's database, **no table excluded** — every phonexa table is user data, including Shadowing media, segments, progress, users and settings |
| `blobs/` | stabbur's flat, content-addressed blob store |
| `phonexa-audio/` | phonexa's audio tree, mirrored at the same relative paths |

**smia is not backed up by this service.** Its own backup (excluding the
rebuildable lookup-cache tables) comes with `postgres-consolidation`. Until
then, dump it by hand — see §8.3, which you need anyway.

The three dumps are one all-or-nothing transaction: if any fails, none of the
committed `.sql` files is touched and no commit is made. Trigger a run:

```sh
docker compose run --rm -e RUN_ONCE=1 backup
```

**Shadowing needs no separate backup.** Its recordings are deliberately
ephemeral and never stored server-side; the database holds only fingerprints,
split points, progress and transcripts — so `phonexa.sql` *is* the Shadowing
backup. Don't "optimise" those tables out with an exclusion later.

**`phonexa-audio/` is copy-if-absent, and that has a known consequence.** A
file is copied only when its relative path is not already in the backup repo;
nothing is overwritten or deleted. Unlike stabbur's write-once,
content-addressed blobs, phonexa's audio files *can* be rewritten in place
(Formant Lab's sample trim, or re-recording under the same key). So an edited
sample keeps its **pre-edit** audio in the backup, and a sample deleted in
phonexa stays in the mirror. Accepted trade-off (D147) — the alternative
rewrites git history on every edit. To refresh one file on purpose:

```sh
docker compose exec backup rm /data/tun-backup/phonexa-audio/<rel/path.wav>
docker compose run --rm -e RUN_ONCE=1 backup
```

Also back up, outside the VPS: the root `.env` (losing `OTA_TOKEN` means
every installed device stops fetching) and `mjolnir/data/` (content-addressed,
so `rsync -a` is naturally incremental).

### Restoring phonexa

**Restore into an EMPTY database, and do _not_ run `alembic upgrade head`
first.** `phonexa.sql` is a full `pg_dump` — it carries its own `CREATE TABLE`
statements *and* the `alembic_version` row, so it rebuilds schema, data and
migration state in one pass. Pre-creating the schema makes the load fail
part-way (verified: `ERROR: relation "settings" already exists`, `psql` exit
3), which is worse than failing cleanly because earlier statements have
already applied.

```sh
# target must be empty — recreate the database if it is not
docker compose exec phonexa-postgres \
    psql -U phonexa -d postgres -c 'DROP DATABASE phonexa' -c 'CREATE DATABASE phonexa'
# load schema + data + alembic_version in one pass
docker compose exec -T phonexa-postgres \
    psql -v ON_ERROR_STOP=1 -U phonexa phonexa < phonexa.sql
```

`ON_ERROR_STOP=1` is not optional: without it `psql` reports success while
having skipped every failed statement. Afterwards `alembic upgrade head` is a
no-op if the backup was current, or applies only the migrations added since.

The audio mirror is restored by copying `phonexa-audio/` back into phonexa's
audio volume at the same relative paths — a plain file copy, not automated.

---

## 8. Production cutover runbook

**This section is for the operator and cannot be executed from this
repository.** `monorepo-merge`'s execution scope is deliberately repo-only:
nothing in the change touches live data or the TLS certificates. Tasks 0.2 and
0.3 are these steps. Do them in order, and do not skip §8.1 because the volume
names "look obvious".

### 8.0a BEFORE cutover — the device's sync token must equal `OPERATOR_AUTH_TOKEN`

`unified-auth` 2.1/2.2 gate `/mjolnir/userdata/*` on
`Bearer {$OPERATOR_TOKEN}`, which compose fills from `OPERATOR_AUTH_TOKEN`.
The phone's token is **baked into its JS bundle**, not read from
`config.json` (contract §5 covers the OTA channel only), so it cannot be
changed from here. The handset's live bundle `b000052` carries
`SYNC_TOKEN = 'changeme'` (read out of the on-device bundle, 2026-11-14).

On the VPS, before starting the new gateway:

```sh
grep '^OPERATOR_AUTH_TOKEN=' /path/to/tun/.env
```

If that value is not the one the device carries, the gateway will answer
every device sync with a `302` and sync dies in the field. Fix it by setting
`OPERATOR_AUTH_TOKEN` to the device's value, **not** by rotating the device
(that needs a publish — task 7.1).

### 8.0b Measured production facts (2026-11-14) — verify, do not rediscover

Recorded live from `contabo` during the restructure. Re-check each before
acting; if one has drifted, STOP and find out why.

**The live volumes, read from the RUNNING containers — and their decoys.**
§8.1 tells you to do this; this is the answer it gave. Dumping a decoy
yields a complete, plausible, STALE database with no error anywhere.

| data | LIVE volume | decoy also on the host |
|---|---|---|
| mjolnir db | `mjolnir_postgres_data` | — |
| stabbur db | `stabbur_stabbur-pg-data-17` | **`stabbur_stabbur-pg-data`** |
| smia db | `smia_smia-pg-data` | — |
| phonexa db | `phonexa_postgres_data` | — |
| TLS certs | `mjolnir_caddy_data` | **`tun_caddy_data`** |
| caddy cfg | `mjolnir_caddy_config` | **`tun_caddy_config`** |
| blobs | `stabbur_stabbur-blobs` | — |
| audio | `phonexa_audio_data` | **`phonexa_audio_dat`** (one char short) |
| OTA payload | bind `/root/mjolnir/data` → `/srv` | — |

**Row counts at cutover time** — the acceptance criterion for the restore:

```
mjolnir  2,093 (15 tables)    stabbur  2,551 ( 5 tables)
smia    14,802,377 (16 tbl)   phonexa  4,365 (11 tables)
```

smia is on **16.15** and is the only 16→17 upgrade. At 14.8M rows it is the
long pole; budget disk and time for it. A gzipped full dump already exists
at `/root/pre-cutover/smia-pre-cutover.sql.gz` (449 MB, `gzip -t` clean,
16/16 tables, trailer present — but its RESTORE is unproven; prove it into a
scratch 17 cluster before relying on it).

**🔴 The existing production backup is NOT a full fallback for mjolnir.**
Proven by restoring it, not by reading it: the committed `mjolnir.sql`
restores with exit 0 and **`build_jobs` and `job_logs` do not exist** in the
result, while `schema_migrations` still reports all 18 migrations applied —
so a service booting on that restore connects fine and then dies on
migration. Cause: `/root/tun/backup/entrypoint.sh:60-61` still uses
`--exclude-table=`, dropping the DEFINITION. The fix (`--exclude-table-data`)
is on this branch and has not been deployed there. That is P44 verbatim,
live. **Take your own dumps with no `--exclude` at all, and prove the
mjolnir one restores to all 15 tables before standing anything down.**
It remains a valid fallback for stabbur, phonexa, and 13 of mjolnir's 15.

**`OPERATOR_AUTH_TOKEN` is literally `changeme`**, and so is the device
bundle's `SYNC_TOKEN` — verified on both ends, so §8.0a's check PASSES as
things stand and the field device is safe. Do not "tidy" it during the
cutover: changing either half alone breaks device sync. (It also means the
public operator plane's password is `changeme` — rotating it is worth doing,
but it needs a bundle publish first, i.e. task 7.1.)

**The gateway needs a variable it does not have today.** `mjolnir-caddy`
currently carries only `PHONEXA_AUTH_HASH` and `OTA_TOKEN`
(`docker exec mjolnir-caddy printenv`). `grind/compose.yaml` requires
`OPERATOR_TOKEN: ${OPERATOR_AUTH_TOKEN:?...}`, so the root `.env` must define
`OPERATOR_AUTH_TOKEN` or the gateway refuses to start — loudly, which is
correct, but know it before you cut over.

**`/root/tun/tun-backup/` on the host is a STALE leftover clone** (Nov 3, no
`phonexa.sql`). The backup service's real repo is `/data/tun-backup` INSIDE
the container. Do not read the host copy and conclude backups are broken.

### 8.0 CRITICAL — a host that already pulled `afb81d39` cannot start at all

Commit `afb81d39` ("Archive phonexa-path-routing; sync unified-deployment
spec") clobbered the root `compose.yaml` with a 47-byte leftover probe:

```yaml
include:
  - b/compose.yaml
  - c/compose.yaml
```

`b/` does not exist. On any host that pulled that commit, `docker compose up`
— and `docker compose config`, `ps`, `logs`, everything — fails immediately
with an error naming a path nobody would recognise. The deployed stack keeps
serving only because its containers predate the pull.

**There is no fix other than pulling this branch** (or
`git checkout c08b0edc -- compose.yaml`, which is where the real 8,889-byte
file was recovered from). Check before you plan anything:

```sh
wc -c compose.yaml        # 47 = broken; a real file is several KB
git log --oneline -1
```

This hazard is independent of the merge; it just happens to be fixed by it.

### 8.1 Record the live volumes FROM THE RUNNING CONTAINERS — first, before anything

```sh
docker ps -q | xargs -n1 docker inspect \
    --format '{{.Name}} {{range .Mounts}}{{.Name}} {{end}}' | tee ~/live-volumes.txt
```

Save that output. Then, and only then, compare it with what the compose files
say.

**Why this and not `docker volume ls` or the compose files: two generations of
volumes coexist on at least one host.** Verified 2026-11-13:

| live-looking name | the other one beside it |
|---|---|
| `mjolnir_caddy_data` | `tun_caddy_data` |
| `mjolnir_postgres_data` | `tun_postgres_data` |
| `stabbur_stabbur-pg-data` | `tun_stabbur-pg-data` |
| `stabbur_stabbur-pg-data-17` | `stabbur_stabbur-pg-data` (the pre-PG17 data, kept on purpose, D-U2) |
| `phonexa_postgres_data` | `phonexa_pgdata` (PG16 data a postgres:17 image cannot start on) |

Something ran under a `tun` project name at some point and left a parallel set
behind. Every one of those volumes contains a **complete, plausible,
internally consistent database** — just an older one. Dumping the wrong one
produces a valid `.sql` file, no error, no warning, and a restore from it
silently loses everything since whenever that volume was last live. `docker
volume ls` cannot tell you which is which. The running container can, and only
it can.

Check `docker volume inspect <name>` timestamps as a second opinion if two
candidates look equally live, but the container's own mount list is the
authority.

### 8.2 Assert the certificate volume by name, after first boot

`mjolnir_caddy_data` holds the TLS certificates. The explicit `name:` on every
volume is what makes it survive the move from five Compose projects to one —
without it, `cd mjolnir && docker compose up` and the root `include:` would
create two different volumes. Those names are preserved verbatim, and this is
an assertion to run, not an assumption to trust:

```sh
docker inspect "$(docker compose ps -q caddy)" \
    --format '{{range .Mounts}}{{.Name}} -> {{.Destination}}{{"\n"}}{{end}}'
# must list   mjolnir_caddy_data -> /data
#             mjolnir_caddy_config -> /config
```

If caddy comes up on a *new* volume instead, it will cheerfully re-issue
certificates against Let's Encrypt's rate limits, and you may not get them
back for a week. Stop and fix the volume name before letting it run. Also
confirm the certificate is the same one as before, not a reissue:

```sh
echo | openssl s_client -connect <host>:443 -servername <host> 2>/dev/null \
    | openssl x509 -noout -dates -serial
```

And never `docker compose down -v`.

**And restore a dump AS THE SERVICE ROLE, never as the superuser** (P42):

```sh
# RIGHT — objects land owned by the role that will use them.
docker compose exec -T postgres psql -U stabbur -d stabbur < stabbur.sql

# WRONG — every table ends up owned by tunadmin, and stabbur then dies with
# "permission denied for table alembic_version" only once it migrates, long
# after a successful connection.
docker compose exec -T postgres psql -U tunadmin -d stabbur < stabbur.sql
```

**And never answer Compose's orphan warning with `--remove-orphans` during a
migration.** Once the per-service postgres services are removed from the
compose files, their still-running containers become orphans of the `tun`
project; `--remove-orphans` deletes exactly the containers holding the
pre-migration data.

The dumps are taken with `--no-owner` precisely so this works.
`postgres/init/bootstrap.sh` repairs ownership on every boot as a safety net,
but a database restored the wrong way stays broken until the next `up`.

### 8.3 Require a verified git-backup cycle, with a current dump per database

Do not begin the cutover without this. "The backup service is configured" is
not the same as "a backup ran and the files are in the repo".

```sh
docker compose run --rm -e RUN_ONCE=1 backup
docker compose exec backup sh -lc 'cd /data/tun-backup && git log -1 --stat && ls -l *.sql'
```

Then verify, against the backup repo clone — not against the service logs:

- `mjolnir.sql`, `stabbur.sql` and `phonexa.sql` all exist, are **non-empty**,
  and carry today's date in the commit;
- the commit was actually pushed to `BACKUP_REPO_URL`;
- `blobs/` and `phonexa-audio/` file counts look like the live stores'.

The dumps are atomic as a set — a failed run leaves the previous `.sql` files
untouched and makes no commit — so an old commit date means the run failed,
however healthy the container looks.

**smia is not in that cycle yet.** Dump it by hand:

```sh
docker compose exec smia-postgres \
    pg_dump -U smia --no-owner --no-privileges smia > ~/smia-$(date +%F).sql
```

Keep all four dumps off the VPS before you change anything.

### 8.4 Then, and only then, cut over

**First stand down the OLD per-repo stacks.** This step is not optional and was
missing from an earlier version of this runbook. Before the merge each project
ran as its own Compose project from its own sibling checkout, and those
containers still hold the named volumes the new project is about to mount. Two
Postgres processes on one data directory corrupts it. Verified on the
development host: `phonexa-postgres` was still running under project `phonexa`,
holding `phonexa_postgres_data`, long after the merge.

```sh
# For each sibling checkout that ever ran a stack. NOTE: no -v, ever (§8.2).
for p in mjolnir stabbur smia phonexa; do
  [ -d ~/"$p" ] && (cd ~/"$p" && docker compose down)
done
docker ps            # must list NOTHING holding a *_pg-data / *_postgres_data volume
docker compose ls    # must show no other project still up
```

Then cut over:

```sh
cd ~/tun                      # the one clone; see §1
git fetch && git checkout monorepo
wc -c compose.yaml            # sanity: not 47 bytes (§8.0)
cp .env.example .env.new && $EDITOR .env.new      # merge in the live values
# MJOLNIR_POSTGRES_PASSWORD must be the OLD mjolnir/.env POSTGRES_PASSWORD (§3)
mv .env.new .env
bash bin/check-standards.sh   # must exit 0. Exit 2 means a check could NOT be
                              # run — that is not a pass; fix it and re-run.
docker compose up -d --build
```

Then walk §6's verification list, re-run §8.2's volume assertion, and re-run
`mjolnir/bin/ota-verify.sh` (16/16). The bar for this change is "nothing
changed": every route answers exactly as it did before, on the same
certificate, out of the same volumes.

### 8.5 Rollback

This is a **branch**, so the code rollback is one command:

```sh
git checkout master
```

Three caveats, all load-bearing, and the first one means `master` is **not** a
working stack as it stands:

1. **`master`'s own root `compose.yaml` is the broken 47-byte file** (§8.0 —
   verified: `git show master:compose.yaml | wc -c` = 47). Rolling back to
   `master` therefore also means restoring the last good sibling-layout
   version:

   ```sh
   git checkout master
   git show c08b0edc:compose.yaml > compose.yaml     # 8,889 bytes, the real one
   ```

2. **The old layout needs the sibling checkouts to still exist.** That
   recovered file `include:`s `../mjolnir/compose.yaml`,
   `../stabbur/compose.yaml`, `../smia/compose.yml` and
   `../phonexa/compose.yaml`, and reads `../mjolnir/.env`. So it only works
   from a `tun/` that sits beside four separate clones. If you deleted them
   after the cutover, re-clone them from the archived remotes first. Keep them
   until you are sure.
3. **The old layout needs `tun-shared` back**, plus the five per-repo `.env`
   files with their duplicated values (`STABBUR_UPSTREAM`, the two copies of
   each postgres password, and the hand-carried `PHONEXA_AUTH_HASH` that
   `unified-auth` 3.3 deleted — rolling back to `master` means generating it
   again by hand):

   ```sh
   docker network create tun-shared     # ONLY when rolling back to master
   ```

Because of (1) and (2), the realistic rollback is "stop the new stack, start
the old sibling checkouts' own stacks" (`cd ../mjolnir && docker compose up -d`
and so on), which is what each of them does standalone anyway.

No volume is renamed, moved or deleted by the cutover, so rolling back does
not lose data. If you ever do need to roll back **after** a
`postgres-consolidation` (planned, not done), that is a restore, not a
checkout.

## 9. Changing what is deployed

All of it happens in this repository now. Edit, commit, then on the host:

```sh
git pull
docker compose up -d --build      # or: docker compose restart <service>
bash bin/check-standards.sh
```

Per-project internals are documented where they live: `mjolnir/DEPLOY.md`
(publishing a bundle, logic bundles, rollback, the OTA data layout),
`mjolnir/docs/findings.md`, and each project's own `docs/`. The ecosystem
design docs and the ADR log are in `docs/` — start at `docs/README.md` and
read `docs/07-decisions.md` before changing anything structural.
