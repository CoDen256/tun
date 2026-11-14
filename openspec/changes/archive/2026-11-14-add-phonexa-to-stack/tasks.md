> **Annotation, 2026-11-13 (D150/D151 — `monorepo-merge`).** This change is
> implemented and its outcome stands: phonexa is in the unified stack and its
> database and audio tree are in the backup set. Three *mechanism* statements
> below are now false and are corrected here rather than rewritten, per the
> documentation convention:
>
> - **`../phonexa/docker-compose.yml` / "five repos" / "a sibling `phonexa`
>   checkout on the VPS".** There are no sibling checkouts. phonexa is the
>   `phonexa/` directory of this one repository and the include is
>   `./phonexa/compose.yaml`. No `git clone phonexa`, no fifth checkout.
> - **`tun-shared` / `docker network create`.** Gone. One repository is one
>   Compose project is one default network.
> - **`PHONEXA_POSTGRES_PASSWORD` "must match phonexa's own `.env`" and "the
>   backup service needs it passed explicitly because phonexa's compose reads
>   it from phonexa's own `.env`".** The drift hazard this describes no longer
>   exists: the key is defined **only** in the repository-root `.env` (D151) and
>   read from there by both `phonexa/compose.yaml` and the backup service.
>   `phonexa/.env` holds only `AUDIO_BACKEND`.
>
> Also note: `backup/entrypoint.sh` now reads mjolnir's password as
> `MJOLNIR_POSTGRES_PASSWORD`, not `POSTGRES_PASSWORD`.

## 1. Compose

- [x] 1.1 Add `../phonexa/docker-compose.yml` to `include:` in `compose.yaml`; update the header comment (four stacks, `phonexa` checkout requirement, no `providers/`-style extra data needed)
- [x] 1.2 Backup service: `depends_on` `phonexa-postgres` (`service_healthy`)
- [x] 1.3 Backup service: mount `phonexa-audio-data:/phonexa-audio:ro` (key from phonexa's compose; confirm it resolves through `include:` without redeclaring it, as `stabbur-blobs` does)
- [x] 1.4 Backup service: pass `PHONEXA_POSTGRES_PASSWORD: ${PHONEXA_POSTGRES_PASSWORD:-phonexa}`
- [x] 1.5 Update the Adminer comment: login servers now include `phonexa-postgres`

## 2. Backup entrypoint

- [x] 2.1 `backup/entrypoint.sh`: add the `phonexa` dump (`-h phonexa-postgres -U phonexa`, same flags, no `--exclude-table`) to `phonexa.sql.tmp`; extend every failure branch to remove all three `.tmp` files; rename all three only after all succeed
- [x] 2.2 Require `PHONEXA_POSTGRES_PASSWORD` at startup (same `: "${…:?…}"` pattern as the others)
- [x] 2.3 Add the audio mirror: `find … -print0` + `read -d ''` loop, copy-if-absent, `mkdir -p` parent, log source/before/after/new counts and the empty-source warning; no `cp -rn`, no deletes
- [x] 2.4 Update the file's header comment (three databases, two blob-like stores)
- [x] 2.5 Confirm the `Dockerfile` needs no change (client 17 already covers PG 17)

## 3. Docs and config

- [x] 3.1 `.env.example`: `PHONEXA_POSTGRES_PASSWORD` with the must-match-`phonexa/.env` warning
- [x] 3.2 `DEPLOY.md`: layout + clone, `cp phonexa/.env.example phonexa/.env`, what comes up, Adminer login server, pointer to the mjolnir change for DNS/subdomain/auth, backup contents, restore notes (`psql < phonexa.sql` after migrations; audio mirror → volume), the stale-audio refresh trick
- [x] 3.3 `docs/02-services.md`: phonexa now deployed; routed by subdomain rather than `/phonexa`; drop "if deployed" wording where it applies
- [x] 3.4 `docs/07-decisions.md`: add D147 and D148 as designed; annotate (not delete) any line made stale
- [x] 3.5 Check `docs/08-pitfalls.md` for anything to add (e.g. include-merged volume keys)

## 4. Verification

- [x] 4.1 `docker compose config` from `tun` with all five checkouts: no service-name or volume-key collision; `phonexa-*` present, `phonexa-adminer` absent
- [x] 4.2 **DONE on the VPS, 2026-11-14** - the unified stack it needed now
      exists and is deployed. `docker compose ps` reports `phonexa-backend
      healthy`, the schema is present (11 tables, 4,365 rows, restored and
      verified exactly against the pre-cutover dump), and `/phonexa/` answers
      401 unauthenticated / 200 with the operator credential.
      ORIGINAL NOTE: `docker compose up -d`: `phonexa-backend` healthy, schema present — **NOT RUN.** This needs the whole unified stack up, which on the dev host means building phonexa's and mjolnir's images and binding :80/:443 against the operator's real `.env`; left for the VPS deploy. Everything it would have exercised at the config level is covered by 4.1. **Blocker to check first:** the existing local volumes are named `phonexa_pgdata` / `phonexa_audio_data`, while the renamed compose declares `phonexa-postgres-data` / `phonexa-audio-data` — bringing the stack up creates fresh empty volumes instead of reusing the existing data. That migration belongs to phonexa's own `deployable-in-tun` change, not this one.
- [x] 4.3 `docker compose run --rm -e RUN_ONCE=1 backup`: `phonexa.sql` appears, committed and pushed; run again with no changes → "no changes", no commit
- [x] 4.4 Put a nested file with spaces and a non-ASCII name into the audio volume: it appears under `phonexa-audio/` at the same path; modify it afterwards: backup copy unchanged
- [x] 4.5 Stop `phonexa-postgres`, run the backup once: it fails loudly and `mjolnir.sql`/`stabbur.sql`/`phonexa.sql` in the repo are untouched
- [x] 4.6 Restore check — **done, and it corrected the design.** Loading `phonexa.sql` *after* `alembic upgrade head` does NOT work: the dump is a full `pg_dump` carrying its own DDL, so the load fails part-way (`ERROR: relation "settings" already exists`, `psql` exit 3). The correct procedure is to load into an **empty** database with no migration run first — schema, data and `alembic_version` all come from the dump. Verified that way: all four seeded tables' row counts match the source and the `shadowing_segments` → `shadowing_media` FK join yields zero orphans. Spec scenario, `DEPLOY.md` and `design.md` all corrected.
- [x] 4.7 Shared Adminer can open `phonexa-postgres` — verified by driving the Adminer image's own login form over a shared network: it authenticates as `phonexa` and lists `users`, `settings`, `shadowing_media`, `shadowing_segments`. (Done against an isolated harness rather than the live `/adminer` route, which needs the full stack — see 4.2.)
