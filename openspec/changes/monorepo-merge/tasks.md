## 0. Before anything is moved

- [x] 0.1 **Answered** (operator, 2026-11-13): phonexa's CI is deleted in
      full, including its GitHub Pages job; `coden256.github.io/phonexa`
      stops being published. See proposal.md, Decisions taken.
- [ ] 0.2 **Runbook, not executable here** (scope: this repository only).
      `DEPLOY.md` must instruct the operator to record the live volume of
      every stateful service from the **running containers** before any
      cutover:
      `docker ps -q | xargs -n1 docker inspect --format '{{.Name}} {{range .Mounts}}{{.Name}} {{end}}'`
      Two generations of volumes exist on at least one host (design.md,
      Risks), and dumping the wrong one yields a complete, plausible, stale
      database with no error.
- [ ] 0.3 **Runbook, not executable here.** `DEPLOY.md` must require a
      verified git-backup cycle, with a current dump per database, before the
      cutover begins.
- [x] 0.4 **Answered** (operator, 2026-11-13): smia's `providers/` stays
      tracked in git. `DEPLOY.md`'s and `compose.yaml`'s contrary claim is
      wrong and is deleted in task 5.4/5.5.

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
- [ ] 4.7 Delete `phonexa/.github/` entirely (task 0.1 answered: the Pages
      site goes with it).
- [ ] 4.8 One OpenSpec change-id convention: **bare slugs**. Forced by
      tooling — `openspec status --change` and `openspec instructions apply
      --change` reject any name not starting with a letter, so dated ids
      cannot be driven by the CLI. Rename the pre-existing dated changes in
      `tun`, `mjolnir` and `phonexa` (including those under
      `changes/archive/`) and fix every cross-reference to them.

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
