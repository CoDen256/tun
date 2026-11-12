## 1. Compose

- [ ] 1.1 Add `../phonexa/docker-compose.yml` to `include:` in `compose.yaml`; update the header comment (four stacks, `phonexa` checkout requirement, no `providers/`-style extra data needed)
- [ ] 1.2 Backup service: `depends_on` `phonexa-postgres` (`service_healthy`)
- [ ] 1.3 Backup service: mount `phonexa-audio-data:/phonexa-audio:ro` (key from phonexa's compose; confirm it resolves through `include:` without redeclaring it, as `stabbur-blobs` does)
- [ ] 1.4 Backup service: pass `PHONEXA_POSTGRES_PASSWORD: ${PHONEXA_POSTGRES_PASSWORD:-phonexa}`
- [ ] 1.5 Update the Adminer comment: login servers now include `phonexa-postgres`

## 2. Backup entrypoint

- [ ] 2.1 `backup/entrypoint.sh`: add the `phonexa` dump (`-h phonexa-postgres -U phonexa`, same flags, no `--exclude-table`) to `phonexa.sql.tmp`; extend every failure branch to remove all three `.tmp` files; rename all three only after all succeed
- [ ] 2.2 Require `PHONEXA_POSTGRES_PASSWORD` at startup (same `: "${…:?…}"` pattern as the others)
- [ ] 2.3 Add the audio mirror: `find … -print0` + `read -d ''` loop, copy-if-absent, `mkdir -p` parent, log source/before/after/new counts and the empty-source warning; no `cp -rn`, no deletes
- [ ] 2.4 Update the file's header comment (three databases, two blob-like stores)
- [ ] 2.5 Confirm the `Dockerfile` needs no change (client 17 already covers PG 17)

## 3. Docs and config

- [ ] 3.1 `.env.example`: `PHONEXA_POSTGRES_PASSWORD` with the must-match-`phonexa/.env` warning
- [ ] 3.2 `DEPLOY.md`: layout + clone, `cp phonexa/.env.example phonexa/.env`, what comes up, Adminer login server, pointer to the mjolnir change for DNS/subdomain/auth, backup contents, restore notes (`psql < phonexa.sql` after migrations; audio mirror → volume), the stale-audio refresh trick
- [ ] 3.3 `docs/02-services.md`: phonexa now deployed; routed by subdomain rather than `/phonexa`; drop "if deployed" wording where it applies
- [ ] 3.4 `docs/07-decisions.md`: add D147 and D148 as designed; annotate (not delete) any line made stale
- [ ] 3.5 Check `docs/08-pitfalls.md` for anything to add (e.g. include-merged volume keys)

## 4. Verification

- [ ] 4.1 `docker compose config` from `tun` with all five checkouts: no service-name or volume-key collision; `phonexa-*` present, `phonexa-adminer` absent
- [ ] 4.2 `docker compose up -d`: `phonexa-backend` healthy, schema present
- [ ] 4.3 `docker compose run --rm -e RUN_ONCE=1 backup`: `phonexa.sql` appears, committed and pushed; run again with no changes → "no changes", no commit
- [ ] 4.4 Put a nested file with spaces and a non-ASCII name into the audio volume: it appears under `phonexa-audio/` at the same path; modify it afterwards: backup copy unchanged
- [ ] 4.5 Stop `phonexa-postgres`, run the backup once: it fails loudly and `mjolnir.sql`/`stabbur.sql`/`phonexa.sql` in the repo are untouched
- [ ] 4.6 Restore check: load `phonexa.sql` into a scratch PG 17 after `alembic upgrade head`; row counts match, including `shadowing_segments`
- [ ] 4.7 Shared Adminer at `/adminer` can open `phonexa-postgres`
