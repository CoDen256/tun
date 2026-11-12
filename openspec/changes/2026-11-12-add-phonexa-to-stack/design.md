## Context

`tun/compose.yaml` merges the siblings' compose files with `include:` and adds a shared Adminer and a `backup` service. `backup/entrypoint.sh` dumps `mjolnir-postgres` and `stabbur-postgres` with `pg_dump` (network + password, no Docker socket), renames `.tmp` → final only after **both** succeed, copies stabbur's flat blob volume with a per-file "copy if absent" loop (D129: `cp -rn` is unreliable), commits and pushes. The image has exactly one client, `postgresql-client-17`.

phonexa (after `deployable-in-tun`) provides `phonexa-postgres` (PG 17), `phonexa-backend`, and the volume key `phonexa-audio-data`. Its audio is a nested tree keyed by `lang/<lang>/ingested/<slug>.wav`, where `<slug>` is user-derived text (spaces, non-ASCII possible), and Formant Lab's sample trim rewrites a file in place.

## Goals / Non-Goals

**Goals:** phonexa starts from `tun`'s `docker compose up`; its DB and audio are backed up by the existing mechanism; Shadowing data included.
**Non-Goals:** seeding, smia backup, new schedule/mechanism, Caddy/auth.

## Decisions

### 1. Include phonexa's own compose file, unchanged by `tun`
Same pattern as smia: one more `include:` line. Env values for phonexa come from `phonexa/.env` (its own `.env.example`), like the others.

### 2. A third dump in the same all-or-nothing transaction
`phonexa-postgres` is dumped with the same flags (`--restrict-key`, `--no-owner`, `--no-privileges`, `--no-tablespaces`) and **no** `--exclude-table`: unlike mjolnir's disposable `job_logs`/`build_jobs`, every phonexa table is user data — including `shadowing_media`, `shadowing_segments`, `users`, `settings`. Dumps still go to `*.sql.tmp` and are renamed only after all three succeed; the failure branch removes all three temp files. The file is `phonexa.sql`, overwritten each run, history in git (existing requirement). `pg_dump` 17 against a 17 server — no version gap, which is why phonexa moves to 17 rather than the backup image adding a second client.

### 3. Audio mirror: per-file loop, copy-if-absent, recursive
Same philosophy as stabbur's loop but the tree is nested and the names are arbitrary, so:

```
 find /phonexa-audio -type f -print0 | while IFS= read -r -d '' f; do
     rel=${f#/phonexa-audio/}; dest="$BACKUP_REPO/phonexa-audio/$rel"
     [ -e "$dest" ] || { mkdir -p "$(dirname "$dest")"; cp "$f" "$dest"; copied++; }
 done
```
`-print0`/`read -d ''` keeps spaces and non-ASCII safe. Not `cp -rn` (D129, and its exit status changed across coreutils versions) and not `rsync` (not in the image; adding it for a copy-if-absent policy buys nothing). Counts are logged like stabbur's.

### 4. Staleness accepted, and what that means concretely
Copy-if-absent never overwrites. A sample trimmed after its first backup keeps the **pre-trim** audio in the backup repo; a recorded sample re-recorded under the same key likewise. This was an explicit decision (the alternative, overwrite-if-different, would also rewrite history for every edit). Mitigation documented in DEPLOY.md: to refresh one file, delete it from the backup repo clone and let the next run copy the current one. Deleted samples are likewise never removed from the mirror.

### 5. Shadowing "backup" needs no special handling
`ShadowingMedia` stores only a client fingerprint and `ShadowingSegment` stores split points, progress and transcripts; no Shadowing audio exists server-side (recordings are deliberately ephemeral). The whole-database dump therefore *is* the Shadowing backup. Stated as a requirement so nobody later "optimizes" it out with a table exclusion.

### 6. Password plumbing
`PHONEXA_POSTGRES_PASSWORD` in `tun/.env` (default `phonexa`), documented beside `STABBUR_POSTGRES_PASSWORD` with the same drift warning. The backup service needs it passed explicitly because phonexa's compose reads it from phonexa's own `.env`.

### 7. ADRs
Two new rows: D147 (inclusion + PG 17 + subdomain + audio-in-git/staleness) and D148 (operator gate = Caddy `basic_auth` on the hash of `OPERATOR_AUTH_TOKEN`, because that token is enforced inside hub/builder application code, not at Caddy, and phonexa has no auth code and a frozen `/stream`). D84's note that mjolnir owns the Caddyfile is why the routing change is in that repo.

## Risks / Trade-offs

- **Backup repo growth / git hygiene.** Audio in git grows monotonically (no deletions). → Same trade-off stabbur already accepted; Shadowing audio is not stored server-side so only vowel/Formant Lab samples count (small).
- **Stale audio in backup** (see §4) → accepted, documented.
- **Password drift** between `tun/.env` and `phonexa/.env` → documented warning; a failed dump aborts the whole run loudly (all-or-nothing) instead of silently skipping phonexa.
- **One more all-or-nothing member.** A phonexa outage now blocks mjolnir/stabbur backups too (existing design: any failed dump aborts the run). `depends_on: service_healthy` reduces the race at startup; a phonexa DB that stays down blocks backups until fixed. → Accepted; consistent with current behavior, and noisier is safer than silently partial.
- **Observation, not in scope:** smia's Postgres is not in the backup set. Worth deciding separately whether its cache/state is rebuildable.

## Migration Plan

1. Land `phonexa/deployable-in-tun`, then this change.
2. On the VPS: clone `phonexa`, `cp phonexa/.env.example phonexa/.env`, set `PHONEXA_POSTGRES_PASSWORD` in both `.env`s, `docker compose up -d --build`.
3. Trigger `docker compose run --rm -e RUN_ONCE=1 backup`; confirm `phonexa.sql` and (once audio exists) `phonexa-audio/` appear.
4. Rollback: remove the include and backup lines; backed-up files stay in the repo history.

## Open Questions

- None blocking. (Restore procedure for `phonexa-audio/` → volume is documented, not automated.)
