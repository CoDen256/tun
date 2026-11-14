# Deploying mjolnir

> **Deployment, configuration and first boot are now the root
> [`../DEPLOY.md`](../DEPLOY.md).** mjolnir is a directory in the one `tun`
> repository (D150, superseding D37/D84), not a separate checkout: there is
> one clone, one root `.env`, one `docker compose up` from the root, and **no
> `docker network create tun-shared`** — one repository is one Compose
> project with one default network.
>
> This file keeps what is mjolnir's own and nowhere else: publishing a
> bundle, logic bundles, rollback, the OTA data layout, and what must be
> backed up. Where it used to describe the whole stack, it now points at the
> root file rather than repeating — and contradicting — it.
>
> **The gateway is NOT here any more.** `unified-auth` section 1 moved
> `caddy/` out of `mjolnir/` and into **`grind/`** (superseding D84's
> "mjolnir owns the only deployable Caddy"), and section 3 replaced the
> hand-made `PHONEXA_AUTH_HASH` with a hash the gateway derives from
> `OPERATOR_AUTH_TOKEN` at boot. **Everything about auth, the operator
> credential and its rotation is now the root [`../DEPLOY.md`](../DEPLOY.md)
> §4 — that file is authoritative and this one must not be used to configure
> a gate.** Paths spelled `caddy/Caddyfile` below are historical; the file
> lives at `grind/caddy/Caddyfile`.

> **Status: re-verified 2026-10-25, 16 passed / 0 failed**, on this
> `compose.yaml`/`caddy/Caddyfile` layout (D84 — which moved the deployable
> stack here from `tun`; previously verified 2026-10-20 under the old
> `tun`-owned layout). D150 has since made `tun` the one repository again,
> but these files did not move: the gateway and the OTA pipeline still live
> here and the root `compose.yaml` only `include:`s them. Re-run
> `bin/ota-verify.sh` after any Caddy change.
>
> **The DNS record must stay grey-clouded (DNS only), never proxied (D57).**
> A CDN in the body path re-encodes responses and breaks D49's sha256
> invariant, which the frozen native patch can never recover from; it also
> intercepts the ACME HTTP-01 challenge so no certificate can be issued.

One Contabo VPS, 8 GB / 100 GB (D35). Everything runs in one `docker compose`
stack. **Correction to this file's original claim** that the stack is
"defined entirely in this repo (D84, superseding D75/D81)" and that `tun`
"ships no deployable artifacts at all": D150 merged the six repositories into
`tun`, which owns the root `compose.yaml`, the shared Adminer and the `backup`
service. mjolnir still owns the **only** Caddy and the whole device-facing
path; it is no longer the whole deployment.

**Every device-facing path is a static file (D55)**, served by Caddy
directly off disk — `hub`/`builder` never sit in front of the bundle or
audio blobs. `docker compose up -d` at the repository root brings up the whole
ecosystem; mjolnir's share of it is `caddy`, `mjolnir-postgres`, and
`mjolnir-hub`'s/`mjolnir-builder`'s own HTTP servers (the operator console,
`hub-builder-operator-console`). No profiles — one command.

**No node on the VPS host itself.** `hub` and `builder` each ship their own
`Dockerfile` (node:22-alpine), bind-mounting this checkout so `git pull` +
a container restart picks up source changes without a rebuild.

---

## First deploy

**See [`../DEPLOY.md`](../DEPLOY.md) §2.** One clone of `tun`, one
`cp .env.example .env` at the root, `docker compose up -d --build` from the
root. Do not clone mjolnir on its own and do not create a `tun-shared`
network; neither exists any more.

What mjolnir needs from the configuration, all of it in the **root** `.env`
(§3 there), named here so the mapping is obvious:

| key | why mjolnir needs it |
|---|---|
| `TUN_SITE_ADDRESS` | Caddy's site block. Bare hostname ⇒ automatic HTTPS; `:8080` for local plain HTTP |
| `TUN_PUBLIC_BASE` | the browser-facing base hub builds links from |
| `OTA_TOKEN` | the device plane's bearer token on `/ota/*` |
| `MJOLNIR_POSTGRES_PASSWORD` | **renamed** from this file's old `POSTGRES_PASSWORD` — one key per database (see the data hazard in root §3), required, no default |
| `OPERATOR_AUTH_TOKEN` | ~~hub's and builder's own login (D-H6)~~ — **superseded by D159/D160.** hub and builder have no login of their own any more; this is the single operator-plane credential, enforced by `basic_auth` in the gateway (`grind/`) for all seven operator zones. hub and builder only check the gateway's `X-Tun-Operator` marker. Still required: see root `DEPLOY.md` §4, including the rotation hazard |
| `INTERNAL_TOKEN` | builder's and hub's outbound calls into stabbur's API. ~~`STABBUR_AUTH_TOKEN`~~ is a **retired name** (D159) |

**`STABBUR_UPSTREAM`, `STABBUR_BASE_URL` and `STABBUR_UI_BASE` are gone from
every `.env` and must not be re-added** (D151). They are derived in
`compose.yaml` now:

- `STABBUR_BASE_URL: http://stabbur-backend:5056` — the in-container fetch
  (`pullNotes`/`pullGrammarRules`). D100's live failure was setting this to a
  public `https://` URL, which made every scheduled run fail; it can no longer
  be set wrong because it is not set by hand at all.
- `STABBUR_UI_BASE` is **gone entirely** (unified-auth 5.4). It was the one
  browser-facing value, used only for the Cards page's "open note" link a
  human clicks, and it could only ever be `$TUN_PUBLIC_BASE/stabbur/ui` — a
  path that stopped existing when stabbur's UI moved to its prefix root.
  `hub/src/config.js` now derives `$TUN_PUBLIC_BASE/stabbur/` itself.
- `INTERNAL_TOKEN` replaces `STABBUR_AUTH_TOKEN` on builder → stabbur and hub
  → stabbur. One value for every service-to-service leg in the stack.
- `grind/caddy/Caddyfile` names `stabbur-backend`, `smia-backend` and
  `phonexa-backend` directly. The four documented `STABBUR_UPSTREAM` options
  existed only because a bare service name resolved across two stacks solely
  via the `tun-shared` external network (D98/D104). One Compose project means
  the name always resolves.

mjolnir's own `.env` (`mjolnir/.env`, optional) holds only what nothing else
uses: `SOURCE_LANG` and the local-only `ALLOW_HTTP` / `ALLOW_NO_COMPANION`.
Never set either of the last two on the VPS. (`PHONEXA_AUTH_HASH` used to be
listed here; `unified-auth` 3.2/3.3 **deleted the value outright** — nothing
types, quotes or carries a bcrypt hash any more.)

**Point DNS at the box before starting Caddy** — an A record (and AAAA if you
have v6) for that hostname. Caddy obtains the certificate on first start by
answering a challenge on port 80, so DNS must already resolve and ports 80 and
443 must be open in the Contabo firewall.

### ~~The `/phonexa` gate~~ — SUPERSEDED, do not follow the steps below

> **This whole section described a procedure that no longer exists, and
> following it now produces a value nothing reads.** `unified-auth` sections
> 1 and 3 moved the gateway to `grind/` and deleted `PHONEXA_AUTH_HASH`
> entirely. There is **no hash to generate, nothing to single-quote, and no
> `mjolnir/.env` key** — `grind/entrypoint.sh` derives a cost-10 bcrypt hash
> from `OPERATOR_TOKEN` at container start and refuses to boot if the
> derivation did not land. phonexa is also no longer special: the same
> `(operator_gate)` snippet gates all **seven** operator zones
> (`/mjolnir/*`, `/builder/*`, `/stabbur/*`, `/smia/*`, `/phonexa/*`,
> `/shadow/*`, `/adminer/*`), and phonexa gained an application-level check
> of its own as well (D159).
>
> **Authority: root [`../DEPLOY.md`](../DEPLOY.md) §4**, which also carries
> the rotation hazard this section got wrong — see below.

What is still true, and is the only reason to read this section at all:

- **phonexa is mounted at `/phonexa`**, prefix stripped, `X-Forwarded-Prefix`
  telling it what the prefix was. No DNS record and no second certificate
  (D149, superseding D148's subdomain).
- **Mind the trailing slash.** `/phonexa` redirects to `/phonexa/` and you
  should let it: phonexa's pages link their assets relatively, so a URL
  without the slash resolves them against the site root and 404s against the
  catch-all — a blank page whose errors point at the wrong service (P37).
- **Shared origin was accepted deliberately** as the cost of dropping the
  subdomain. The specific worry recorded here was hub's `Path=/` session
  cookie; **that cookie is gone** with hub's login (D159). One `basic_auth`
  credential now covers the whole origin, which is the design rather than an
  accepted cost (D160).
- **What you see in the browser** is the operating system's native basic-auth
  prompt — `operator` plus the operator token — not a login page. That is
  true of every operator zone now, not just phonexa.

Two corrections worth keeping, because the failures were real:

- ~~"`PHONEXA_AUTH_HASH` is **not** derived from `OPERATOR_AUTH_TOKEN`
  automatically. If you rotate that token, regenerate the hash in the same
  change."~~ **No longer true — rotation is one value.** The live hazard is
  the opposite one and it is on the device, not the gateway: the phone's
  `SYNC_TOKEN` is baked into its JS bundle, so rotating `OPERATOR_AUTH_TOKEN`
  needs a **bundle publish**, not a `config.json` push (**P48**, root
  `DEPLOY.md` §4).
- The bcrypt-hash quoting traps (**P35**, **P36**) are retired *here* because
  the hash is gone, not because compose changed. A `$`-containing value in a
  `.env` is still mangled by compose, and a compose *valueless* key under
  `include:` still resolves from the wrong `.env`. Both still apply to any
  future value of that shape.

## Publish build #1 and prove the path

Run from the **repository root** (that is where `docker compose` lives now):

```sh
# Copy the stock bundle over from the laptop first, e.g.
#   scp ~/dev/tun/mjolnir/index.android.bundle vps:~/tun/mjolnir/

docker compose exec -e ALLOW_NO_COMPANION=1 mjolnir-hub \
  bin/ota-publish.sh index.android.bundle b000001 "base 6.0.3 · logic 0 · data 0 (stock)"

mjolnir/bin/ota-verify.sh   # bash + curl only — runs fine directly on the host
```

The `exec` path is still `bin/ota-publish.sh`, unprefixed: `mjolnir-hub`
bind-mounts **this directory** at `/app`, not the repository root. Only paths
typed on the host gained the `mjolnir/` prefix.

(`mjolnir-hub` bind-mounts the whole repo at `/app` and has node — no
separate node-runtime container needed, unlike before `hub-builder-
operator-console` shipped.)

`ota-publish.sh` refuses a bundle with no boot-ok companion, and refuses one
whose baked `BUILD_ID` differs from the id you publish under — both would be
quarantined on the device's third launch, silently. `ALLOW_NO_COMPANION=1`
overrides the first, and is only correct for a bundle no patched device will
ever fetch.

`ota-verify.sh` must print **16 passed, 0 failed**. It is the P1 acceptance
test and it checks the things that are unfixable once the APK ships — above
all that the sha256 is identical with and without transport gzip (D49). Re-run
it after any Caddy change.

## Logic bundles — the base+patch bundle `builder` builds onto

`builder` has no config of its own naming a bundle file anymore (`BUNDLE_PATH`
is gone — D-L4): every run reads whichever `logic_bundles` row is `active`
and rebuilds the deck/card data onto it fresh. **A fresh deployment has zero
logic bundles and zero active one** — `builder` refuses to publish until the
operator has submitted and activated at least one, via
`https://<host>/mjolnir/ota`:

1. Drop an assembled base+patch bundle (e.g. produced by bundle-workbench's
   "Assemble" action, or any bundle with the boot-ok companion appended —
   see `bundle-tool companion`/`bundle-tool assemble`). If it has
   `base_version`/`patch_rev` baked in (D-L1), they're read automatically;
   otherwise you're prompted to type them.
2. Click **activate** on the row you just created.
3. `builder`'s next run (scheduled or "publish now") now builds onto it.

This is a **one-time bootstrap step for a fresh deployment** — every
subsequent base/patch change is the same two clicks (submit, activate),
independent of any Docker restart.

Logic bundle files live under `LOGIC_BUNDLE_DIR` (defaults to
`<DATA_DIR>/logic`), content-addressed by sha256.

The bundle-workbench tool embedded at `/mjolnir/workbench` reads/writes its
stored patches under `WORKBENCH_PATCHES_DIR`, which defaults to the repo's
own `patches/` directory.

**Leave both unset unless you have a specific reason not to.** `compose.yaml`
already bind-mounts the ENTIRE repo into each container (`.:/app`) — `data/`
and `patches/` are already part of that same mount, exactly like `DATA_DIR`
itself (`/app/data`) already is. The defaults resolve to `/app/data/logic`
and `/app/patches` respectively, both already inside that mount, with no
extra configuration needed. **Do not set these to a path on your host
machine** (e.g. `/root/mjolnir/patches/js`) — a container only sees its own
filesystem plus whatever's explicitly bind-mounted into it; a bare host path
set as an env var does not magically become visible inside the container.
Concretely, this breaks two different ways depending on which var:
- `WORKBENCH_PATCHES_DIR` pointed at a nonexistent-in-container path: the
  Patches/Assemble tabs silently show zero patches — `listPatches` treats a
  missing directory as "empty," not an error. The Patches and Assemble tabs
  both display the exact resolved absolute path they're reading from, right
  above the list, specifically so this is diagnosable rather than a silent
  "it's just empty."
- `LOGIC_BUNDLE_DIR` pointed the same way: writes still "succeed" (`fs.
  mkdirSync(..., {recursive:true})` happily creates a new, empty directory
  at that literal path **inside the container's own filesystem**), but
  nothing lands where you think it does, and it's lost the moment the
  container is recreated — a silent data-loss trap, not a loud failure.

If you genuinely need patches or logic bundles stored outside the repo's own
tree, the correct fix is a real additional bind mount in `compose.yaml`
(same pattern as `DATA_DIR`'s own volume), not an env var pointing at a path
the container can't see.

## Publishing and rolling back

The normal path is now the browser: `https://<host>/mjolnir/ota` — drag-drop
a bundle, edit its label, submit. It calls the exact same guard functions
(`tool/src/otaPublish.js`, D-H5) as the CLI below, nothing duplicated.

The CLI stays available for scripting/CI or if the UI is unreachable:

```sh
docker compose exec mjolnir-hub bin/ota-publish.sh <bundle> <buildId> "<label>"   # publish
docker compose exec mjolnir-hub bin/ota-publish.sh <older-bundle> b000001 "..."   # roll back
```

Rollback is just repointing `current.json` at a buildId whose bundle is still
on disk — the OTA console's Publish history page also has a one-click
"set as current" action for this. The device compares identity, never
ordering (D26) — it fetches the older build without knowing or caring that
it is older.

The publish script refuses to: reuse a buildId for different bytes (a device
that already has that id would keep the stale bundle forever), accept a
buildId outside `^[A-Za-z0-9._-]{1,64}$`, accept a file that does not begin
`var __BUNDLE_START_TIME__=`, or publish over plain http. `builder` (P4)
enforces the exact same guards in-process, via `tool/src/otaPublish.js` — the
CLI is a thin wrapper over the same module (D76/D-P2).

## Layout on the box

```
tun/                   the one clone (root compose.yaml, root .env, docs/)
  mjolnir/
  .env                 mjolnir-only values — SOURCE_LANG (no auth hash; D159/D160).
                       The shared secrets are in the ROOT .env; back that up
  compose.yaml         include:d by the root compose.yaml
  hub/Dockerfile        hub's own HTTP server + the node runtime bin/ota-publish.sh runs in
  builder/Dockerfile    builder's own HTTP server (publish scheduling, forecast)
  (caddy/Caddyfile MOVED to grind/caddy/Caddyfile — unified-auth 1.1)
  bin/ota-publish.sh
  bin/ota-verify.sh
  tool/src/otaPublish.js
  data/                gitignored; served read-only into the container at /srv
    ota/current.json
    ota/bundle/<buildId>.js
    ota/<buildId>/audio.json
    blob/<sha256>
    logic/<sha256>.js   operator-submitted base+patch bundles (D-L1) — one is "active"
```

## Backups (P24)

Two things, and the second is the one that gets forgotten:

1. The **root** `.env` (and `mjolnir/.env`, if you set the phonexa hash) —
   losing `OTA_TOKEN` means a device running the baked-in bootstrap token can
   no longer fetch. Keep it somewhere outside the VPS.
2. `data/` — blobs are content-addressed, so `rsync -a` is naturally
   incremental and never rewrites an existing file.

The `caddy_data` volume — Docker volume name **`mjolnir_caddy_data`**, set
explicitly so it is the same volume whether the stack is started from here or
from the repository root — holds the TLS certificates. Losing it is survivable
(Caddy re-issues) but counts against Let's Encrypt rate limits, so avoid
`docker compose down -v`.

3. `pg_dump` of the `mjolnir-postgres` service's `postgres` database — this is
   hub's and builder's entire ledger (decks, card_slots, card_content,
   publications, logic_bundles, pending_occurrences, occurrence_shipments,
   builder_config, **userdata, userdata_history** — progress-sync-shim's
   tables, added after this list was first written). Losing it without a
   backup means hub's bookkeeping no longer agrees with what's actually
   on-device, with no way to reconcile — and `builder` has no bundle to
   build onto until a `logic_bundles` row is re-submitted (see above).
   `job_logs`/`build_jobs` are deliberately excluded from the backup itself
   (pure run-history bookkeeping, no FK tie to anything that matters — see
   D-B4b); `device_state` no longer exists at all (dropped entirely, D126).

**This is no longer manual.** The root `backup` compose service (the
`compose-backup-service` change, superseding `git-backup`'s original host
script + `cron` entry) automates all three — plus the equivalent for
`stabbur`'s and `phonexa`'s own Postgres and file stores, which had no backup
story of any kind before it — as one more service in the root
`compose.yaml`: `docker compose up` and nothing else, no host-level step.
It reads mjolnir's password as `MJOLNIR_POSTGRES_PASSWORD` from the root
`.env`. smia is **not** backed up yet; that comes with the planned
`postgres-consolidation`. See `../DEPLOY.md` §7, `../backup/entrypoint.sh`
and `../openspec/changes/archive/2026-11-04-compose-backup-service/design.md`
for the full reasoning (notably: no encryption, by informed choice — the data is
personal learning content, not credentials; no Docker socket mount —
connects over the network with a real password instead).

## Operational notes

- **Caddy does not hot-reload its Caddyfile on its own.** A `git pull` that
  changes `grind/caddy/Caddyfile` needs either `docker compose exec caddy caddy
  reload --config /etc/caddy/Caddyfile` or `docker compose restart caddy` —
  otherwise the old config keeps running (requests silently fall through to
  the catch-all 404 instead of reaching the new route).
- Caddy serves `data/` **read-only**. Publishing writes from the host, so a
  compromised Caddy cannot alter what the device fetches.
- `mjolnir-postgres` is deliberately not published to the host at all (no
  `compose.override.yaml` here, unlike stabbur/smia/phonexa); only sibling
  containers reach it — now by service name on the one default network, with
  no network configuration (D150).
- `mjolnir-hub`/`mjolnir-builder` bind-mount **this directory** (not the
  repository root) at `/app`, rather than copying it in — a
  `git pull` plus `docker compose restart mjolnir-hub mjolnir-builder` picks
  up source changes; only rebuild (`docker compose up -d --build`) when
  either package's `package.json`/`package-lock.json` changes. Their **build
  context is the repository root** (`context: ..`, `dockerfile:
  mjolnir/hub/Dockerfile`) so a later change can `COPY` from a shared
  `libs/`; the root `.dockerignore` is what keeps that context at ~31 MB
  instead of ~10 GB, and it must never be edited without re-checking every
  Dockerfile's `COPY` sources.
- `TUN_SITE_ADDRESS=:8080` runs the same config over plain HTTP for local
  testing. `ALLOW_HTTP=1` lets the scripts work against it. Never set either on
  the VPS.
