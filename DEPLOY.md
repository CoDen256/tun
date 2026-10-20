# Deploying tun

> **Status: deployed and verified on the VPS, 2026-10-20** — `bin/ota-verify.sh`
> printed 16 passed, 0 failed against the live host. Re-run it after any Caddy
> or DNS change.
>
> **The DNS record must stay grey-clouded (DNS only), never proxied (D57).**
> A CDN in the body path re-encodes responses and breaks D49's sha256
> invariant, which the frozen native patch can never recover from; it also
> intercepts the ACME HTTP-01 challenge so no certificate can be issued.

One Contabo VPS, 8 GB / 100 GB (D35). Everything runs in one `docker compose`
stack.

**P1 ships only Caddy.** Every device-facing path is a static file (D55) —
there is no application code yet, and none is needed to prove the OTA path.
Postgres sits behind a compose profile until P4; the other services are listed
in `compose.yaml` as comments and get added as they are written.

---

## First deploy

On the VPS, as a non-root user in the `docker` group:

```sh
# 1. Docker (Debian/Ubuntu)
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker "$USER"       # log out and back in

# 2. The repo
git clone <your-remote>/tun.git && cd tun

# 3. Config
cp .env.example .env
openssl rand -hex 32                  # paste as OTA_TOKEN
$EDITOR .env                          # set TUN_SITE_ADDRESS + TUN_PUBLIC_BASE
```

`.env` is gitignored. It must contain, at minimum:

```sh
TUN_SITE_ADDRESS=tun.example.net      # bare hostname => automatic HTTPS
TUN_PUBLIC_BASE=https://tun.example.net
OTA_TOKEN=<the 64 hex chars you just generated>
```

**Point DNS at the box before starting Caddy** — an A record (and AAAA if you
have v6) for that hostname. Caddy obtains the certificate on first start by
answering a challenge on port 80, so DNS must already resolve and ports 80 and
443 must be open in the Contabo firewall.

```sh
docker compose up -d
docker compose logs -f caddy          # watch the certificate get issued
```

## Publish build #1 and prove the path

```sh
# Copy the stock bundle over from the laptop first, e.g.
#   scp ~/dev/mjolnir/index.android.bundle vps:~/tun/

bin/ota-publish.sh index.android.bundle b000001 "base 6.0.3 · logic 0 · data 0 (stock)"
bin/ota-verify.sh
```

`ota-publish.sh` refuses a bundle with no boot-ok companion, and refuses one
whose baked `BUILD_ID` differs from the id you publish under — both would be
quarantined on the device's third launch, silently. `ALLOW_NO_COMPANION=1`
overrides the first, and is only correct for a bundle no patched device will
ever fetch.

`ota-verify.sh` must print **16 passed, 0 failed**. It is the P1 acceptance
test and it checks the things that are unfixable once the APK ships — above
all that the sha256 is identical with and without transport gzip (D49). Re-run
it after any Caddy change.

## Publishing and rolling back

```sh
bin/ota-publish.sh <bundle> <buildId> "<label>"   # publish
bin/ota-publish.sh <older-bundle> b000001 "..."   # roll back
```

Rollback is just repointing `current.json` at a buildId whose bundle is still
on disk. The device compares identity, never ordering (D26) — it fetches the
older build without knowing or caring that it is older.

The publish script refuses to: reuse a buildId for different bytes (a device
that already has that id would keep the stale bundle forever), accept a
buildId outside `^[A-Za-z0-9._-]{1,64}$`, accept a file that does not begin
`var __BUNDLE_START_TIME__=`, or publish over plain http.

## Layout on the box

```
tun/
  .env                 secrets — gitignored, back this up separately
  compose.yaml
  caddy/Caddyfile
  data/                gitignored; served read-only into the container at /srv
    ota/current.json
    ota/bundle/<buildId>.js
    ota/<buildId>/audio.json      (P3 onward)
    blob/<sha256>                 (P3 onward)
```

## Backups (P24)

Two things, and the second is the one that gets forgotten:

1. `.env` — losing `OTA_TOKEN` means a device running the baked-in bootstrap
   token can no longer fetch. Keep it somewhere outside the VPS.
2. `data/` — blobs are content-addressed, so `rsync -a` is naturally
   incremental and never rewrites an existing file.

The `caddy_data` volume holds the TLS certificates. Losing it is survivable
(Caddy re-issues) but counts against Let's Encrypt rate limits, so avoid
`docker compose down -v`.

From P4, add `pg_dump` of the per-service databases.

## Operational notes

- `docker compose up -d` after a `git pull` picks up Caddyfile changes; use
  `docker compose restart caddy` if only `.env` changed.
- Caddy serves `data/` **read-only**. Publishing writes from the host, so a
  compromised Caddy cannot alter what the device fetches.
- Postgres is deliberately not published to the host; only sibling containers
  reach it. Start it with `docker compose --profile db up -d` when P4 needs it.
- `TUN_SITE_ADDRESS=:8080` runs the same config over plain HTTP for local
  testing. `ALLOW_HTTP=1` lets the scripts work against it. Never set either on
  the VPS.
