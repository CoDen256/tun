## 0. Before anything is moved

- [ ] 0.1 Resolve the **blocking** question in `proposal.md`: deleting
      phonexa's workflow also takes down `https://coden256.github.io/phonexa/`
      (verified live, 200). Keep the Pages job, or accept the site going away.
- [ ] 0.2 On the VPS, record the live volume set from the **running
      containers**, not the compose files:
      `docker ps -q | xargs -n1 docker inspect --format '{{.Name}} {{range .Mounts}}{{.Name}} {{end}}'`
      Write the result into `DEPLOY.md`. Two generations of volumes exist on at
      least one host (design.md, Risks) and every later change depends on
      knowing which is live.
- [ ] 0.3 Verify a full backup run completed and that `tun-backup` holds a
      current `mjolnir.sql`, `stabbur.sql`, `phonexa.sql`.
- [ ] 0.4 Settle whether smia's `providers/` is genuinely tracked (it is —
      3,858 files) and update `DEPLOY.md`'s contrary claim, or gitignore it and
      keep the out-of-band copy. Decide before the merge, not after.

## 1. Merge

- [ ] 1.1 Merge each repo into `tun` at its own top-level prefix, full history:
      `git remote add -f <r> <url>` →
      `git merge -s ours --no-commit --allow-unrelated-histories <r>/<branch>` →
      `git read-tree --prefix=<r>/ -u <r>/<branch>` → commit.
      Order: mjolnir, stabbur, smia, phonexa, hover-translate.
- [ ] 1.2 phonexa is on `main`; every other repo on `master`. Merge onto
      `master` and retire `main`.
- [ ] 1.3 Move `tun`'s own `docs/`, `openspec/`, `compose.yaml`, `DEPLOY.md`,
      `README.md` to the root; move `tun/backup/` to `backup/`.
- [ ] 1.4 `git log --follow` spot-check on one file per merged repo.
- [ ] 1.5 Confirm pack size is in the expected range (~1.5 GB) and that no
      history was rewritten (`git rev-parse` a known old SHA per repo).
- [ ] 1.6 Delete `mjolnir`'s 7 tracked `node_modules/` files; extend
      `.gitignore`.

## 2. Compose composition

- [ ] 2.1 Root `compose.yaml` `include:`s each project's own `compose.yaml`.
- [ ] 2.2 Rename `smia/compose.yml` → `smia/compose.yaml` (the last holdout of
      the convention D147 already recorded).
- [ ] 2.3 Delete the `tun-shared` network from all four project compose files
      and the root; delete `external: true`; delete every reference to
      `docker network create tun-shared` from `DEPLOY.md` and `.env.example`.
- [ ] 2.4 **Preserve every explicit volume `name:` verbatim**, especially
      `mjolnir_caddy_data` (TLS certificates — re-issuing hits Let's Encrypt
      rate limits). Assert after first boot that the running caddy container
      mounts the same volume name as before.
- [ ] 2.5 Move build contexts to the repo root
      (`context: ..`, `dockerfile: <project>/Dockerfile`).
- [ ] 2.6 Write the root `.dockerignore`; confirm the build context sent to the
      daemon is megabytes, not gigabytes.
- [ ] 2.7 `docker compose config --services` from the root lists every service;
      `docker compose -f <project>/compose.yaml config --services` works for
      each project standalone.

## 3. Config layering

- [ ] 3.1 Root `.env.example`: only values used by more than one project.
- [ ] 3.2 Per-project `.env.example`: only values used by exactly that project
      (`smia`: HF/DeepL/ElevenLabs; `hover-translate`: AMO_*; `mjolnir`:
      ALLOW_HTTP, ALLOW_NO_COMPANION, SOURCE_LANG; `phonexa`: AUDIO_BACKEND).
- [ ] 3.3 Derive `DATABASE_URL` in compose from `POSTGRES_PASSWORD`; delete
      every `*_UPSTREAM` and `*_BASE_URL` that a service name now resolves.
- [ ] 3.4 Assert the invariant mechanically: no key appears in two `.env*`
      files. Add it as a check, not a convention.
- [ ] 3.5 Delete the ~120 lines of sync-hazard prose from
      `mjolnir/.env.example` that the invariant makes obsolete.

## 4. Naming and the service standard

- [ ] 4.1 Service keys: `grind`, `postgres`, `adminer`, `backup`,
      `mjolnir-workbench`, `mjolnir-builder`, `mjolnir-sync`,
      `stabbur-backend`, `smia-backend`, `phonexa-backend`, `shadow-backend`.
      (The last three of those arrive in `zone-isolation`; reserve the names.)
- [ ] 4.2 Delete every `container_name:`.
- [ ] 4.3 `restart: unless-stopped` on every long-running service (stabbur and
      smia lack it).
- [ ] 4.4 Backend healthchecks everywhere (only phonexa has one).
- [ ] 4.5 All host port publishing bound to `127.0.0.1` and moved behind the
      `dev` profile (stabbur and smia currently bind `0.0.0.0`).
- [ ] 4.6 `pytest.ini` + `tests/` in all three Flask services; rename
      phonexa's `test/` and give it a `pytest.ini`.
- [ ] 4.7 Delete `phonexa/.github/` — **only after task 0.1 is answered**.
- [ ] 4.8 One OpenSpec change-id convention across all projects; currently
      split 3/3 between dated and bare slugs.

## 5. Documentation

- [ ] 5.1 `docs/07-decisions.md`: D135 gains its design; mark superseded or
      amend D37, D42, D84, D94, D98, D101, D104, D118, D119, D147. Supersede,
      never delete (CLAUDE.md convention).
- [ ] 5.2 Retire P35 and P36 along with the config split that caused them.
- [ ] 5.3 `docs/README.md`: repo map, "six working copies under /home/coden/dev".
- [ ] 5.4 `DEPLOY.md`: one clone, no sibling layout, no network-create step.
- [ ] 5.5 `docs/02-services.md`, `docs/13-operator-console-ux.md`: both are
      written around `include:` across repos and one Adminer.
- [ ] 5.6 Root `CLAUDE.md` + per-project `CLAUDE.md`; `mjolnir/docs/findings.md`
      stays where it is.
- [ ] 5.7 Grep the whole tree for `/home/coden/dev/<repo>` and for
      `../<repo>/` path references and fix them.

## 6. Verification — the bar is "nothing changed"

- [ ] 6.1 `bin/ota-verify.sh` passes 16/16, as at P1.
- [ ] 6.2 `/ota/current.json` with a valid bearer returns the same bytes as
      before the merge; without one, 401.
- [ ] 6.3 `/stabbur/ui`, `/smia/ui`, `/mjolnir`, `/builder`, `/phonexa/` all
      respond exactly as they did before (200, 200, 302→login, 302→login, 401).
- [ ] 6.4 Caddy is serving on the **same** TLS certificate — not a reissued one.
- [ ] 6.5 Each project still comes up standalone from its own directory.
- [ ] 6.6 A git-backup run completes and commits all expected files.
