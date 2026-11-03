## Why

`git-backup`'s host script (`bin/backup.sh` + a host `crontab` entry) works
— verified against real production data, including the two bugs it found
and fixed live (D129 empty blobs, D130 nondeterministic dumps). But it
requires manual host-level setup (editing root's crontab by hand) that
doesn't fit this project's "`docker compose up` and don't think about it"
operating model for everything else in the unified stack. This change
replaces the delivery mechanism only — the backup logic itself (which
tables to exclude, the `--restrict-key` fix, incremental blob sync) carries
forward unchanged — with a real compose service: one more entry in `tun
/compose.yaml`, joining the same network every other cross-repo service
already uses, with its own internal schedule. No host script, no crontab,
no manual mount to remember.

Depends on `postgres-17-upgrade` (`stabbur`) landing first: with both
Postgres instances on the same major version, this service needs exactly
one `pg_dump` client, not two version-specific binaries.

## What Changes

- **New `backup` service in `tun/compose.yaml`**, built from a small new
  `tun/backup/Dockerfile` (Debian + a single `postgresql-client-17` +
  `git` + `openssh-client`).
- **Connects over the network, not `docker exec`**: `pg_dump -h
  mjolnir-postgres ...` / `-h stabbur-postgres ...` with real passwords
  (read from each repo's own `.env` via `env_file:` — no new secrets, the
  passwords already exist), the same way every other service in this stack
  already reaches Postgres. No Docker socket mount — a deliberate
  improvement over the "same script, inside a container" alternative
  considered and rejected (see `design.md`), which would have required
  socket access equivalent to full host control.
- **`stabbur-blobs` mounted directly as a compose volume** (confirmed
  during exploration: a service in the *including* file can reference a
  volume declared with an explicit `name:` in an *included* file directly,
  with zero extra wiring — verified live with a throwaway two-file
  `include:` test before relying on it). No throwaway `docker run` needed
  for the blob sync anymore.
- **The backup repo clone lives in a named volume**, not a host bind-mount
  — cloned by the container itself on first boot.
- **Git push credential: one mounted SSH private key file**, not the whole
  `~/.ssh` directory and not a fresh deploy key — the narrower middle
  ground between "reuse everything already trusted on this box" and
  "provision a whole new credential."
- **Scheduling is internal to the container** (a sleep loop), not a host
  `crontab` entry — the thing this whole change exists to remove.
- `bin/backup.sh` and the documented host `crontab` line are retired —
  their logic moves into the container's entrypoint script, not
  duplicated alongside it.

## Capabilities

### New Capabilities
<!-- None — this modifies how the existing git-backup capability is
     delivered, not what it guarantees. -->

### Modified Capabilities
- `git-backup`: the backup mechanism moves from a host script + `cron`
  entry to a compose service with internal scheduling; the connection
  method moves from `docker exec`/`docker run` to direct network
  connections with password auth; the credential changes from "whatever
  the host's git already trusts" to one explicitly mounted key file.

## Impact

- `tun/backup/Dockerfile` — new.
- `tun/backup/entrypoint.sh` — new (the dump/sync/commit logic, carried
  over from `bin/backup.sh` with the connection method changed).
- `tun/compose.yaml` — new `backup` service, new named volume for the
  repo clone.
- `tun/.env.example` — new vars: the backup repo's SSH URL, the mounted
  key's host path, the schedule interval.
- `bin/backup.sh` — removed.
- `mjolnir/DEPLOY.md`'s "Backups (P24)" section — updated to point at the
  compose service instead of the host script/crontab.
- Depends on `stabbur`'s `postgres-17-upgrade` landing first.
