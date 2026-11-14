> **Annotation, 2026-11-13 (D150/D151/D152 — `monorepo-merge`).** This change
> is implemented and its outcome stands: phonexa composes cleanly alongside the
> other projects, publishes nothing publicly, and migrates its own schema on
> boot. Four *mechanism* statements below are now false and are corrected here
> rather than rewritten, per the documentation convention:
>
> - **`docker-compose.yml`** is now `phonexa/compose.yaml` (renamed with the
>   rest of the convention; smia's was the last holdout).
> - **"Join the backend to the `tun-shared` external network"** — `tun-shared`,
>   every `external: true`, and the one-time `docker network create` step are
>   deleted. One repository is one Compose project is one default network, so
>   `phonexa-backend` resolves by service key with no network configuration.
>   `include:` is still kept, so the flat-namespace / first-wins hazard this
>   change's `phonexa-` prefixes exist for is still live.
> - **"sibling" repos / "`tun`'s backup service"** — there are no siblings:
>   `mjolnir/`, `stabbur/`, `smia/`, `backup/` and `phonexa/` are directories of
>   one repository, and the backup service is `backup/` at its root.
> - **`PHONEXA_POSTGRES_PASSWORD` "documented in a new `.env.example`" with a
>   drift risk against `tun/.env.example`** — the key lives in the
>   **repository-root** `.env` and nowhere else (D151), so the drift hazard is
>   gone. `phonexa/.env.example` keeps only `AUDIO_BACKEND`. The default is
>   still the literal `phonexa`, because Postgres applies a password only when
>   initialising a fresh data directory and the existing
>   `phonexa_postgres_data` volume carries that literal.
>
> Host port publishing moved to `phonexa/compose.override.yaml`; the 5432
> collision this change worried about cannot happen in the unified stack,
> which publishes no database port at all.

## 1. Compose rewrite

- [x] 1.1 Rename services to `phonexa-postgres` / `phonexa-backend`; set `container_name` and `restart: unless-stopped`
- [x] 1.2 Switch the database image to `postgres:17-alpine`; drive its password from `PHONEXA_POSTGRES_PASSWORD` (default `phonexa`) and use it in the backend's `DATABASE_URL`
- [x] 1.3 Move Adminer to `phonexa-adminer` under `profiles: ["dev"]`, bound to `127.0.0.1:8081`
- [x] 1.4 Bind published ports to loopback (`127.0.0.1:5050`, `127.0.0.1:5432`); grep `mjolnir`, `stabbur`, `smia` compose files for a host-port collision on 5432 and move to 5434 if one exists (mjolnir publishes none, smia uses 5433; **stabbur's compose is not checked out on this machine — re-check when it is**)
- [x] 1.5 Declare volumes with unique keys (`phonexa-postgres-data`, `phonexa-audio-data` — `include:` merges volume keys too, and `tun`'s backup service references `phonexa-audio-data` directly) and explicit names `phonexa_postgres_data` / `phonexa_audio_data`
- [x] 1.6 Join the backend to `tun-shared` (`external: true`) alongside `default`, with the same explanatory comment style as smia's compose file
- [x] 1.7 Add a backend healthcheck using python/urllib against `/ping`

## 2. Schema bootstrap

- [x] 2.1 Add `scripts/docker-entrypoint.sh` (`alembic upgrade head`, then `exec python formanter.py`), executable, `set -euo pipefail`
- [x] 2.2 Update the `Dockerfile` to copy it and use it as the entrypoint (scripts/ is already copied)
- [x] 2.3 Confirm `alembic/env.py` picks up `DATABASE_URL` from the container environment (it imports `db.session.DATABASE_URL`)

## 3. Docs and config

- [x] 3.1 Add `.env.example` documenting `PHONEXA_POSTGRES_PASSWORD`
- [x] 3.2 Update `README.md` "Running it": new service names, `--profile dev` for Adminer, automatic migrations, the PG 16 → 17 local-volume note (the export → import steps were deliberately left out of the note — importing is out of scope for this pass)
- [ ] 3.3 Note in the README that seeding is manual (`scripts/import_db_from_json.py`, destructive) and not part of start-up — **skipped on purpose: concerns importing**

## 4. Verification

- [x] 4.1 `docker compose config` standalone is valid; `docker compose --profile dev config` includes `phonexa-adminer`, the default does not
- [ ] 4.2 Fresh `docker compose up -d`: tables exist (`\dt` in `phonexa-postgres`), `/ping` returns 200, healthcheck goes healthy — **needs a Docker daemon (none on this machine)**
- [ ] 4.3 Restart the backend: migrations are a no-op, no data loss — **needs a Docker daemon**
- [x] 4.4 Include the file from a scratch parent compose together with the sibling services: no collision, all services present (checked with mjolnir + smia + phonexa; stabbur not checked out here)
- [ ] 4.5 `ss -ltn` / `docker compose port` shows 5050/5432 only on `127.0.0.1` — **rendered config shows `127.0.0.1` binds; live check needs a Docker daemon**
- [ ] 4.6 `/stream` still connects from the browser mic tracker; `git diff --stat -- js/realtime.js formanter.py` is empty — **diff check is repeated at the end of `stt-via-smia` (which edits `formanter.py`); live mic check needs a running stack**
- [ ] 4.7 Existing local `phonexa_audio_data` volume is picked up by the new compose file (a previously saved sample still plays) — **needs a Docker daemon**
