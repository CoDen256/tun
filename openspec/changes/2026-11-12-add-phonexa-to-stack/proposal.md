## Why

`tun`'s unified stack brings up mjolnir, stabbur and smia, but not phonexa — so the phonetics lab still needs its own separate deploy, and it is the one service whose data (formant samples, tokens, Shadowing progress, recorded audio) is **not** protected by the git-backup service. The sibling `phonexa` change `deployable-in-tun` makes phonexa includable; this change actually includes it and extends backups to cover its database and audio.

## What Changes

- `compose.yaml`: add `../phonexa/docker-compose.yml` to `include:`; update the header comment (four stacks).
- Backup service, `compose.yaml` side: `depends_on` `phonexa-postgres` (healthy); mount the `phonexa-audio-data` volume read-only at `/phonexa-audio`; pass `PHONEXA_POSTGRES_PASSWORD` (default `phonexa`).
- Backup service, `backup/entrypoint.sh`: dump `phonexa-postgres` to `phonexa.sql` with the same flags and atomic `.tmp` → rename discipline as the other dumps (a failure in **any** of the three dumps leaves all three committed files untouched); **no table is excluded**, so Shadowing media/segments/progress, users and settings are all in the dump. Mirror phonexa's audio tree into `phonexa-audio/` in the backup repo.
- phonexa audio backup follows stabbur's rule: **copy a file only if it is absent** from the backup repo. Unlike stabbur's flat, content-addressed blobs, phonexa's audio is a nested tree (`lang/<lang>/ingested/<name>.wav`) whose files can be rewritten in place (sample trim), so an edited sample's backup copy goes **stale until deleted from the repo** — accepted by decision, documented.
- `.env.example`: `PHONEXA_POSTGRES_PASSWORD`, with the same "must match phonexa's own compose" warning that exists for stabbur's password.
- `DEPLOY.md`: layout (five repos incl. phonexa, `git clone phonexa`), `cp phonexa/.env.example phonexa/.env`, what comes up, how to log into the shared Adminer with `phonexa-postgres`, the subdomain/DNS/auth steps (owned by the `mjolnir` change), restore notes for `phonexa.sql` and the audio mirror.
- Docs: new ADR rows in `docs/07-decisions.md` (D147 phonexa joins the stack, own PG 17 database, subdomain routing, audio-in-git with accepted staleness, Shadowing included in backup; D148 phonexa operator gate is Caddy `basic_auth` on the operator token's hash), `docs/02-services.md` (phonexa now deployed, subdomain not `/phonexa` path), pitfalls row if the checks surface one.

**Non-goals:**
- No seeding of phonexa data (the data isn't on the deploy host yet; a later, separate step).
- No smia backup — not requested; noted as an observation in design.
- No new backup mechanism, no schedule change, no Docker-socket access.
- No Caddy/auth work (that is `mjolnir`'s `phonexa-site-block`).

## Capabilities

### New Capabilities
- None.

### Modified Capabilities
- `unified-deployment`: the unified stack includes phonexa; the shared database-exploration tool reaches `phonexa-postgres`.
- `git-backup`: phonexa's database (including Shadowing data) and audio tree are backed up; the backup service connects to `phonexa-postgres` over the network.

## Impact

- `compose.yaml`, `backup/entrypoint.sh` (Dockerfile unchanged — `postgresql-client-17` already covers it), `.env.example`, `DEPLOY.md`, `docs/02-services.md`, `docs/07-decisions.md`.
- Requires `phonexa`'s `deployable-in-tun` (service names, volume keys, PG 17) to land first, and a sibling `phonexa` checkout on the VPS.
- Backup repo grows by phonexa's audio over time and gains `phonexa.sql` and `phonexa-audio/` on the next run; an empty audio volume just logs the existing "source volume is empty" warning.
