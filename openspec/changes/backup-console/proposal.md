## Why

The backup service is the only thing standing between this ecosystem and total
data loss, and it is the one service with **no way to look at it**. Today
`backup/` is a Dockerfile, a 408-line bash `entrypoint.sh` and a
`healthcheck.sh`. It has no HTTP, no port, no zone, no nav entry, no run
history, and its settings are environment variables. The only way to answer
"did last night's backup work?" is `docker compose logs backup` over SSH.

The backlog item: *"backup own ui with own logs hisotry and button for manual
backup and cron setup settings"*.

This is not cosmetic. `entrypoint.sh` and `healthcheck.sh` are both written
almost entirely as defences against one specific defect class — **the backup
reporting success while backing up nothing**. Their comments record it
happening live: a container "Up 7 hours" with an empty `/data`, a failed clone
that logged "committed and pushed", a truncated-then-committed empty `.sql`.
Every one of those defences produces a signal that **nothing displays**.
`healthcheck.sh` reads a `/data/last-success` stamp whose age is the single
most important fact about this service, and that fact is visible nowhere.

Measured while designing this change, on the operator's own machine:
`tun-backup-1` is `unhealthy`, has never completed a single run, and has been
failing to clone every hour since boot. It took a `docker logs` to find that
out.

## What Changes

- **A new service `backup-console`** in a new `backup/compose.yaml`, serving a
  new operator-plane zone `/backup/`. The existing `backup` service moves into
  that same file, which brings `backup` in line with "each project owns its
  `compose.yaml`; the root `include:`s them" — it is currently the only project
  declared directly in the root `compose.yaml` and the only one that cannot be
  run standalone.
- **The scheduler loop stays the only writer to the git clone.** The console
  never performs a backup. "Run now" writes a request; the loop picks it up and
  runs the identical end-to-end path the schedule runs. One code path, so the
  button cannot test something different from what the schedule does.
- **Run history becomes durable, as files on a state volume** — a record per
  run plus its full captured log. Deliberately not a Postgres table: this
  service's job is dumping Postgres, so the failure it most needs to record is
  "the database was unreachable", which a database-backed log cannot record.
  That is this ecosystem's signature failure shape, and storing the log in the
  thing being backed up would rebuild it.
- **Three settings become runtime-editable**: schedule interval, retry-after-
  failure interval, and run-log retention. Their `.env` variables become
  first-boot defaults only — never a second live copy of the value (D151).
- **The page shows what `healthcheck.sh` already knows**: last success and its
  age, next run, whether local commits are unpushed (the "remote is STALE"
  condition), per-source sizes and counts with per-run deltas, the backup
  repo's own commit history, and the documented restore path per source.
- **A dev-mode local bare-repo remote.** In dev, `BACKUP_REPO_URL` is a
  placeholder and the SSH key is a placeholder, so the service has never
  completed a run in dev and cannot. Without a reachable remote, nothing in
  this change or in `userdata-git-history` can be verified before it reaches
  the VPS. A local bare repo gives a real clone, real commits, a real push and
  a real `git log` with no SSH and no network.

## Capabilities

### New Capabilities
- `backup-console`: an operator-plane UI over the backup service — observing
  its run history and health, triggering a run, and editing its schedule,
  without a shell on the host.

### Modified Capabilities
- `git-backup`: gains requirements for durable run records, a request-driven
  manual run, runtime-stored settings, and a dev-testable remote. The dumping,
  mirroring and commit logic itself is unchanged by this change.
- `operator-auth`: `/backup/` is an eighth zone behind the one `operator_gate`
  snippet. No new credential, no new mechanism.

## Impact

- `backup/` — a new `compose.yaml` (taking over the root's `backup` service
  definition), a new console service, and `entrypoint.sh` gaining run-record
  writing, request-file polling and settings reads.
- `compose.yaml` (root) — the `backup` service block and the
  `backup-repo-clone` volume declaration move out into `backup/compose.yaml`,
  which the root `include:`s. The volume carries an explicit
  `name: tun_backup-repo-clone`, so moving its declaration cannot orphan the
  existing clone.
- `grind/caddy/Caddyfile` — a `/backup/*` handle importing `operator_gate`.
- `grind/caddy/status/index.html` and `libs/jsservice/layout.js` — `backup`
  joins the zone list in both (the layout file's own comment requires it).
- **Not touched**: the device plane in any form, the dump/mirror/commit logic's
  behaviour, `BACKUP_REPO_URL`, or the SSH key handling.

## Dependency

**This change ships before `userdata-git-history`**, which needs this service's
git-log endpoint and this page to exist. `ota-pull-tracking` is independent of
both.
