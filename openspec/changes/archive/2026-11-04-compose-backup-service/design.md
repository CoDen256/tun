## Context

Read `openspec/changes/git-backup/design.md` in full — this change
revises D-B1/D-B5/D-B6 again (they were already revised once, from "new
container + deploy key" to "host script + existing SSH identity," when the
operator had already cloned the repo on the host; now revised back toward
a container, but a *better-shaped* one than the original design, informed
by what the host-script version actually proved out). Read `tun/docs/
07-decisions.md` D129/D130 — the backup logic itself (table exclusions,
`--restrict-key`, the per-file blob-copy loop) is being carried over
unchanged into the new entrypoint, not re-derived.

Confirmed directly, before writing any code:
- `postgresql-client-16` and `postgresql-client-17` coexist cleanly on
  Debian via the PGDG apt repo (tested live) — the fallback if
  `postgres-17-upgrade` is ever deferred, though this design assumes it
  lands first and only needs one client version.
- A service defined in the *including* compose file can reference a named
  volume declared (with an explicit `name:`) in an *included* file
  directly — tested live with a disposable two-file `include:` setup
  (a `writer` service in file A, a `reader` service in file B that
  `include`s A, both referencing the same volume key with no extra
  declaration in B) — confirmed the exact mechanism this design relies on
  for mounting `stabbur-blobs` directly, not assumed from documentation.
- `stabbur-backend`'s password is hardcoded directly in `stabbur/compose
  .yaml` (`POSTGRES_PASSWORD: stabbur`), not read from an env file at all
  — a pre-existing fact about that repo, not something this change
  introduces. `mjolnir`'s own password is a real `.env`-sourced secret
  (`POSTGRES_PASSWORD`).

## Goals / Non-Goals

**Goals:**
- `docker compose up` in `tun` is the entire setup — no host crontab, no
  manual mount to remember, matching how every other cross-repo concern in
  this stack already works.
- No Docker socket mount — avoid a privilege class (container-controls-
  host-Docker) the host-script-in-a-container alternative would have
  required.
- Carry the backup *logic* over unchanged — this is a delivery-mechanism
  change, not a re-litigation of what gets backed up or how often.

**Non-Goals:**
- Revisiting what tables/data get backed up (D-B3/D-B4/D-B4b from
  `git-backup` stand unchanged).
- Supporting a mixed-Postgres-version stack elegantly — depends on
  `postgres-17-upgrade` precisely to avoid needing to.
- A web UI or any observability surface for backup status — `docker
  compose logs backup` remains the only way to check, same as before.

## Decisions

### D-C1 — Network connection with password auth, not `docker exec`

`docker exec`'s appeal was free peer-trust authentication (no password
needed) by running *as* the target container. Moving to a real compose
service means the backup container is a *different* container, reaching
Postgres over the network like every other service here already does —
which needs a real password. Not a new secret: `env_file:
[../mjolnir/.env]` reads mjolnir's already-existing `POSTGRES_PASSWORD`
directly; stabbur's password, since it's hardcoded in `stabbur/compose
.yaml` rather than env-file-driven, is set explicitly in `tun`'s own
`.env` to match that same hardcoded value (`stabbur`) — documented clearly
so the two don't silently drift if `stabbur`'s compose file ever changes
it.

### D-C2 — `stabbur-blobs` mounted directly, no throwaway container

Confirmed via the live `include:` test above: the `backup` service in
`tun/compose.yaml` lists `stabbur-blobs:/stabbur-blobs:ro` in its own
`volumes:` the same way it would for a volume declared in its *own* file —
no extra declaration needed. This replaces the host-script version's
`docker run --rm alpine ...` throwaway-container step entirely; the backup
container already has both paths (the blob volume and its own repo clone)
mounted, so the per-file copy loop (D-B3) runs as a plain step in the same
entrypoint script, no nested `docker run`.

### D-C3 — One mounted SSH key file, not a fresh deploy key and not `~/.ssh` wholesale

Three options considered:
1. Mount the operator's entire `~/.ssh` directory — simplest, but gives
   the container read access to every key the host trusts, not just the
   one needed for `tun-backup`.
2. A fresh, repo-scoped GitHub deploy key — most narrowly scoped, but a
   new credential to generate and register, for a repo that already has a
   working key.
3. **Chosen**: mount just the one private key file (and `known_hosts`)
   already used for `tun-backup`, nothing else from `~/.ssh`. Reuses what
   already works (no new GitHub setup), without widening the container's
   reach to every other key on the host.

### D-C4 — The repo clone lives in a named volume, cloned by the container itself

The host-script version relied on the operator having already cloned
`tun-backup` by hand. The compose-native version clones it itself on first
boot if the named volume is empty (same "create on first touch" shape
already familiar from this project's own `GET` auto-create pattern
elsewhere) — so standing this up is `docker compose up`, full stop, not
"also remember to clone this one specific thing on the host first."

### D-C5 — Scheduling is an internal sleep loop

Same shape as `git-backup`'s original (pre-host-script) design intent —
appropriate again now that this is a real long-lived service rather than
something reusing a host clone. `BACKUP_INTERVAL_SECONDS` (default
`86400`) read from `tun`'s own `.env`.

## Risks / Trade-offs

- **The container restarting loses only the sleep timer, never data** —
  the repo clone persists in its named volume; a restart just re-runs the
  loop from a fresh `git pull` + the next scheduled dump.
- **`env_file` pointing at sibling repos' `.env` files** (`../mjolnir/.env`)
  is a path-shaped dependency on the sibling-checkout layout this whole
  stack already assumes (D94) — not a new assumption, just one more place
  that relies on it.
- **No Docker socket, but still network-reachable Postgres with a real
  password** — a compromised backup container could read (not write,
  given read-only mounts where possible) more than a host-cron script
  running as root technically needs to touch, but meaningfully less than
  one with Docker socket access would have.

## Migration Plan

1. Confirm `postgres-17-upgrade` has landed (single Postgres client
   version needed).
2. Build `tun/backup/Dockerfile` + entrypoint, carrying over `bin/
   backup.sh`'s logic (table exclusions, `--restrict-key`, per-file blob
   loop) verbatim where the connection method doesn't change it.
3. Add the compose service + named volume + `.env` additions.
4. First real run: confirm the container clones the repo, dumps both
   databases, syncs blobs, commits — compare against the host-script
   version's last known-good commit to confirm no regression.
5. Remove `bin/backup.sh`, the documented crontab line, and update
   `mjolnir/DEPLOY.md`'s Backups section to point at the compose service.

## Open Questions

- None outstanding — `postgres-17-upgrade` resolves the one real
  prerequisite this design had.
