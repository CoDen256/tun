# Design — backup-console

## 1. Why a second service and not HTTP in the existing container

The backup container holds the SSH deploy key with push access to the backup
repository (`/root/.ssh/id_backup`, mounted read-only, D-C3). Putting an HTTP
listener in that container puts a network-reachable surface in the one place
whose compromise means "an attacker can rewrite the backups".

It also breaks the health check. `backup`'s health check is deliberately *not*
liveness — it reads the `last-success` stamp, because "the process is up" was
precisely the predicate that reported green while nothing was backed up for
seven hours. A container running both a scheduler and a web server has two
different health questions and one exit code.

So: two services, one volume, **one writer**.

## 2. The single-writer rule, and how the button obeys it

The git clone at `/data/tun-backup` has exactly one writer: the scheduler loop
in `backup`. `backup-console` never runs `pg_dump`, never writes the clone,
never commits, never pushes. Two writers against one git working tree is a
race whose failure mode is a corrupt backup, which is the one thing this
service exists to prevent.

"Run now" is therefore a **request**, not an invocation:

1. The console writes a request marker to the shared state volume.
2. The loop notices it and runs **the same `run_backup` function the schedule
   calls**, with no flags and no variant behaviour.
3. The loop writes the run record and the captured log; the console reads them.

This is what makes the button trustworthy. A "Run now" that took its own code
path would be testing a path the schedule never uses — and the operator would
be using it precisely to check that the schedule works.

Consequence to design for: the loop spends almost all its time in
`sleep "$sleep_for"`. It must become interruptible (short sleeps that re-check,
or an equivalent), or a requested run waits up to 24 hours. The console must
show the request as *queued* until the loop picks it up, never as *running* —
claiming a run started when it has not is the failure shape this whole file
is written against.

## 3. Run records are files, and the reason is not convenience

`backup`'s entire job is dumping Postgres. The run that most needs to be
recorded is the one that failed **because Postgres was unreachable** — and a
Postgres-backed run log cannot record it. Writing the history of the backup
into the thing being backed up also means a restore rewrites the history of
its own restoration.

So: a run record per run on a state volume, plus that run's captured log text.
Retention is one of the three editable settings, so the volume cannot grow
without bound.

The record must distinguish the three real outcomes `entrypoint.sh` already
produces, which are not two:

| outcome | meaning |
|---|---|
| success, committed | dumps changed, commit and push both returned |
| success, no changes | dumps byte-identical; nothing committed. **Not a failure** |
| failed | any step returned non-zero; nothing committed this cycle |

And one more that is easy to lose: the **recovery** path, where a previous run
committed but failed to push and this run pushed it. `entrypoint.sh` logs
`pushed previously-committed backups` for exactly that case. It must not be
flattened into "no changes", because the operator needs to see that the remote
was stale and is now not.

## 4. Settings: runtime-stored, with `.env` as a first-boot default only

D151 forbids one configuration value existing in two files. The three editable
settings therefore live in exactly one authoritative place — a settings file on
the state volume — and `BACKUP_INTERVAL_SECONDS` / `BACKUP_RETRY_SECONDS`
become **seed values consulted only when no setting has been stored yet**.

What stays environment-only, and is shown read-only if shown at all:
`BACKUP_REPO_URL`, `BACKUP_SSH_KEY_PATH`, `POSTGRES_PASSWORD`. A UI that can
repoint the backup remote is a UI that can silently stop backing up.

**`healthcheck.sh` must read the stored interval, not the env var.** It
currently computes its limit as `INTERVAL + INTERVAL/4` from
`BACKUP_INTERVAL_SECONDS`. If the operator sets 6h in the UI while the env var
still says 24h, the check would allow an 30-hour-old stamp to read healthy.
The check's own comment says the grace is a fraction of the interval precisely
so that shortening the interval tightens the check — that property must
survive the move.

**Which settings are deliberately NOT editable:** the per-source include/
exclude toggles. The operator was offered them and declined. Turning a source
off is indistinguishable, afterwards, from a source that silently stopped
being backed up — the exact failure this service's design fights. Sources are
read-only facts on the page.

## 5. Zone wiring

`/backup/*` is an ordinary operator zone: a `handle` block importing the
existing `(operator_gate)` snippet, then `reverse_proxy` to `backup-console`.
No new credential and no new mechanism — one `OPERATOR_AUTH_TOKEN`, enforced
as `basic_auth` at the gateway, with the service running the shared
`libs/` check behind it (D159/D160).

Two registration steps are easy to forget and both are required:
`libs/jsservice/layout.js`'s `ZONES` (its own comment says "if you add a zone
here, add it to the status page too") and `grind/caddy/status/index.html`.

The Caddyfile's own warnings apply and are not optional reading: `handle`
blocks are sequenced together by Caddy regardless of written order, a bare
`reverse_proxy` does **not** slot into that sequence, and compiled route order
must be verified with `caddy adapt --adapter caddyfile` rather than by reading
the file top to bottom (P56).

## 6. Serving before migrating, with no database at all

`backup-console` has **no database**. Its data is the state volume and the git
clone. D157's "serve before you migrate" is satisfied trivially, but its
*spirit* still applies: an unreadable state volume or a missing clone must
degrade the page, not prevent boot. A console that will not start because
there has never been a successful backup is useless at exactly the moment it
is needed — which is the live state of `tun-backup-1` today.

## 7. The dev remote, and why it is part of this change

Verified live: in dev, `BACKUP_REPO_URL` is `git@github.com:example/tun-backup.git`
with a placeholder key, so the service fails to clone every hour and has never
completed a run. Every acceptance criterion about the run log, the commit
history, the health banner and (in `userdata-git-history`) the git-backed
timeline depends on a run that commits and pushes.

A local **bare repository** as the remote makes all of it real in dev: a real
clone, real commits, a real push, a real `git log`, no SSH and no network. It
must be a bare repo, not a plain directory — you cannot push to a non-bare
checkout's current branch.

This is also a standing-rule matter: verification in this workflow is framed
to catch false success, confirmed against a running system by an agent that
did not write the code. Without a reachable remote there is nothing to
confirm, and the package would ship to the VPS unverified.

## 8. Sizes the page will show, measured 2026-11-20

Real values, so the implementation is not calibrated against invented ones:

| source | current |
|---|---|
| `mjolnir.sql` | **44 MB** (42.4 MB of it one table — see `userdata-git-history`) |
| `stabbur.sql` | 1.1 MB |
| `phonexa.sql` | 692 KB |
| `shadow.sql` | 368 KB |
| `blobs/` | 12 MB |
| `phonexa-audio/` | 4.7 MB |
| repo `.git` | 106 MB across 88 commits |

`smia` is deliberately not in the backup set (operator decision 2026-11-14) and
the page should say so as a fact rather than omit it, so its absence reads as
intentional rather than as a source that disappeared.

## 9. Mockup

`mockups/backup-console.html`, accepted by the operator on the first pass.
It is the look-and-interaction reference; its numbers are sample data except
where they match §8. The three health states, the phase rail during a run, the
run-log and commit expanders, and the restore commands are all as accepted.
