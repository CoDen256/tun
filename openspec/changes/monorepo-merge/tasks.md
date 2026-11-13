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

- [x] 1.1 Merge each repo into `tun` at its own top-level prefix, full history:
      `git remote add -f <r> <url>` →
      `git merge -s ours --no-commit --allow-unrelated-histories <r>/<branch>` →
      `git read-tree --prefix=<r>/ -u <r>/<branch>` → commit.
      Order: mjolnir, stabbur, smia, phonexa, hover-translate — the last of
      which was then **removed again** by dropping its merge commit (D154);
      see task 1.7.
- [x] 1.2 phonexa merged from `main` onto this `master`-descended branch; the
      monorepo has no `main`. Retiring phonexa's own remote `main` is outside
      this repository's edit scope and belongs to the runbook.
- [x] 1.3 `tun`'s own `docs/`, `openspec/`, `compose.yaml`, `DEPLOY.md`,
      `README.md` and `backup/` are already at the root — `tun` was the merge
      base, so no move was required.
- [x] 1.4 History-traversal spot-check per merged repo. **Verified
      2026-11-13, and the limits are real:** `git blame HEAD -- <new/path>`
      attributes lines to the pre-merge commits (confirmed: stabbur/auth.py →
      `c36bc2aa0 auth.py`), `git log --full-history -- <old-path>` lists the
      pre-merge commits, and every former head and root commit is an ancestor
      of HEAD. `git log --follow` and default-simplified `git log -- <path>`
      do **not** traverse a `read-tree --prefix` graft — unavoidable without
      rewriting SHAs, which design.md rejects. Documented rather than
      papered over.
- [x] 1.5 Verified **at the merge commit** (`ea89db37`'s parent chain): every
      former head and root commit is an ancestor of HEAD with unchanged SHAs,
      and per-repo tracked-file counts matched the pre-merge baseline exactly
      (35732 / 238 / 4082 / 521). Counts at HEAD are intentionally LOWER —
      task 4.9 deleted ~9 duplicated `.claude/` files per project, 4.6 renamed
      phonexa's test directory, and `mjolnir/hub/.env.example` was deleted as
      a D151 violation. An earlier wording stated the match in the present
      tense, which independent review correctly refuted.
- [x] 1.6 **Corrected — nothing to delete.** The 7 matches were a bad grep:
      they are decompiled APK resources whose *filenames* contain
      "node_modules" (React Native LogBox/navigation PNGs) inside
      `mjolnir/base/smali.mjolnir.merged/res/`, not a tracked dependency tree.
      That directory is the stock APK base, the input to the one irreversible
      build (D04), and deleting from it would corrupt it. No repo tracks a
      real `node_modules/`; verified across all five.

- [x] 1.7 **`hover-translate` removed again (D154, operator direction).** It was
      merged in task 1.1 and then excised, by dropping its merge commit on the
      unpushed branch rather than by `git rm` — a `git rm` leaves the merge in
      history, so a clone would still download all ~52 MiB and `git log` would
      still show the fork's 152 commits, which is exactly what the operator did
      not want. Also removed the five merge remotes afterwards: their
      remote-tracking refs pinned the objects and the pack did not shrink until
      they were gone. Result: 391.87 MiB → 339.86 MiB, 858 → 708 commits, and
      the history now has exactly one author. Its references inside `smia`,
      `stabbur` and `mjolnir` are unchanged and still correct — it remains an
      external client of the ecosystem.

## 2. Compose composition

- [x] 2.1 Root `compose.yaml` `include:`s each project's own `compose.yaml`.
      **The real root file had to be recovered first:** at HEAD it was 47 bytes
      of leftover probe (`include: [b/compose.yaml, c/compose.yaml]`), committed
      by an earlier session in `afb81d39` along with a stray tracked
      `c/compose.yaml`. All four fragment agents independently reported it.
      Restored from `c08b0edc` (8,889 bytes) and rewritten; `c/` deleted.
- [x] 2.2 Renamed `smia/compose.yml` → `smia/compose.yaml` (the last holdout of
      the convention D147 already recorded).
- [x] 2.3 Deleted the `tun-shared` network from all four project compose files
      and the root; delete `external: true`; delete every reference to
      `docker network create tun-shared` from `DEPLOY.md` and `.env.example`.
- [x] 2.4 **Preserved every explicit volume `name:` verbatim** — asserted
      against the rendered config, all nine present including
      `mjolnir_caddy_data`., especially
      `mjolnir_caddy_data` (TLS certificates — re-issuing hits Let's Encrypt
      rate limits). Assert after first boot that the running caddy container
      mounts the same volume name as before.
- [x] 2.5 Moved build contexts to the repo root
      (`context: ..`, `dockerfile: <project>/Dockerfile`).
- [x] 2.6 Root `.dockerignore` written **from the actual COPY lines of all six
      Dockerfiles**, not from a guess — the draft in this change's own proposal
      would have broken phonexa, which copies `lang/` (Dockerfile:32) into the
      image. Context: 31.3 MB / 880 files, down from ~940 MB / 41,678.
      Proved by really building the COPY stage of all five images against the
      root context (busybox harness): stabbur, smia, phonexa, mjolnir-hub,
      mjolnir-builder all OK.
- [x] 2.7 Verified. Root lists all 12 services; each of the four projects
      composes standalone **as `docker compose --env-file ../.env ...`**, which
      is what `DEPLOY.md` documents. The bare `cd <project> && docker compose
      up` promised by some compose-file comments does NOT work for mjolnir:
      Compose reads the root `.env` only when invoked at the root, so its
      `${VAR:?}` guards fail. Comments corrected; the guards are deliberately
      kept loud rather than defaulted. Plus the property this change exists for:
      `cd stabbur && docker compose up` publishes loopback ports for a native
      venv, while the root stack publishes **nothing** but the gateway.

## 3. Config layering

- [x] 3.1 Root `.env.example`: only values used by more than one project.
- [x] 3.2 Per-project `.env.example`: only values used by exactly that project
      (`smia`: HF/DeepL/ElevenLabs; `mjolnir`:
      ALLOW_HTTP, ALLOW_NO_COMPANION, SOURCE_LANG; `phonexa`: AUDIO_BACKEND).
- [x] 3.3 Every `DATABASE_URL` derived in compose; every `*_UPSTREAM` and
      `*_BASE_URL` deleted. **Corrected from one shared `POSTGRES_PASSWORD` to
      four per-database keys** — see the data hazard in design.md.
- [x] 3.4 `bin/check-standards.sh` — eight checks covering D150/D151/D152/D153:
      no key in two `.env.example` files, no retired or derivable value typed
      anywhere, no `container_name`, no `external:` network, no `tun-shared`
      outside comments, restart policies present, nothing but the gateway
      publishing publicly, bare-slug change ids, no CI. All pass.
- [x] 3.5 Deleted. `mjolnir/.env.example` keeps only mjolnir-local values.

## 4. Naming and the service standard

- [x] 4.1 Service keys conform: `adminer`, `backup`, `mjolnir-postgres`,
      `mjolnir-hub`, `mjolnir-builder`, `caddy`, `stabbur-postgres`,
      `stabbur-backend`, `smia-postgres`, `smia-backend`, `phonexa-postgres`,
      `phonexa-backend`. `mjolnir-hub` is **not** renamed to
      `mjolnir-workbench` here — that rename comes with the split in
      `zone-isolation`, which must change the service key and the gateway's
      `/mjolnir` upstream together. `grind`, `postgres` and `shadow-backend`
      are reserved for the later changes.
- [x] 4.2 Deleted every `container_name:`.
- [x] 4.3 `restart: unless-stopped` on every long-running service.
- [x] 4.4 Backend healthchecks everywhere. All four backends now carry the
      same four-key shape as phonexa's reference (interval/timeout/retries/
      start_period). The *predicate* could not be uniform, because every one
      of these services authenticates every route:
      `stabbur-backend` -> `GET /ui` (auth.py exempts `/ui`, `/ui/*`,
      `/blob/*`, `/api/enrich/tts/preview/*`; stabbur has **no** /health or
      /ping at all), `smia-backend` -> `GET /ui` and deliberately **not**
      `/health`, which app.py defines but auth.py does **not** exempt — an
      unauthenticated probe of it 401s and `urlopen` raises on any non-2xx,
      so that healthcheck could never have passed (verified empirically).
      `mjolnir-hub`/`mjolnir-builder` have no unauthenticated route at all
      (`/mjolnir/login` and `/builder/login` only exist while
      OPERATOR_AUTH_TOKEN is set), so theirs is a **liveness** probe: a node
      one-liner that exits 0 on *any* HTTP status (200/302/401/404 all prove
      the process is up and routing) and 1 only on refusal/hang — tested
      against a local server for all five cases. Probes are python-urllib in
      the Flask images and node in the node images; no curl, since hub's
      image has none. smia's `start_period` is the one non-uniform value
      (180s): its bootstrap.py imports ~9M provider rows before it execs
      app.py. Nothing `depends_on` any backend (`backup` depends on the
      three *postgres* healthchecks), so none of this can block the stack.
- [x] 4.5 All host port publishing bound to `127.0.0.1`. Service ports moved
      into per-project `compose.override.yaml`; **two Adminer ports are
      deliberately NOT in override files** — the root's `adminer` publishes
      `127.0.0.1:8082` from `compose.yaml` because it is an operator tool that
      must be reachable in the unified stack, and `phonexa-adminer` publishes
      `127.0.0.1:8081` from its own fragment behind a `dev` profile. Both are
      loopback-only, so the production-safety property holds; the claim that
      *all* ports live in override files did not, and independent review
      refuted it. **A `dev` profile is impossible** —
      Compose has no per-port profile; see design.md's correction. The override
      mechanism is strictly better and was verified empirically.
- [x] 4.6 One test layout per language. `phonexa/test/` -> `phonexa/tests/`
      (plain `mv`, 8.2 MB of .wav resources and references carried along),
      plus `phonexa/pytest.ini` byte-identical to stabbur's and smia's
      (`testpaths = tests`). Fixed the path references the rename broke:
      `REFERENCES_DIR` was spelled `TESTS_DIR.parent / 'test' / 'references'`,
      which after the rename resolved to a directory that no longer exists —
      every `load_reference()` would have silently returned None ("nothing
      recorded yet") instead of comparing. Also the `test/resources/*.wav`
      case paths, the docstrings, and `phonexa/docs/arch-detailed.md`'s
      `python test/server_tests.py` commands. Four recorded reference JSONs
      still carry `"audio": "test/..."` in their `meta`; left alone on
      purpose — that is provenance of a past recording, not a live path, and
      it is never compared.
      **Collection status** (`pytest -q --collect-only`): stabbur 520 tests,
      clean. smia 265 tests; the only errors are three modules needing
      `rich`, which is in smia/requirements-dev.txt — environment, not
      layout. phonexa imports cleanly but collects **zero** tests: both of
      its files are script-style (`server_tests.py` doesn't match
      `test_*.py`; `test_consonants_api.py` has a `main()` and its own
      `check()`, no `test_` functions, and needs a seeded live database).
      pytest.ini therefore sets the convention there rather than enabling a
      suite — converting those scripts is not in this change. Verified in a
      throwaway venv; no project venv exists on this host.
      mjolnir stays on node:test (`mjolnir/test/{unit,e2e}` driven by
      package.json's `npm test`) — deliberately untouched, it is not Python.
- [x] 4.7 Deleted `phonexa/.github/` entirely. `coden256.github.io/phonexa`
      stops being published, as the operator accepted.
- [x] 4.9 **Found during the merge, not foreseen in the proposal:** each
      sub-repo carried its own `.claude/` with a byte-identical copy of the
      same five openspec skills and five opsx commands. In one repository
      Claude Code registers each as a *directory-scoped* skill, so the merge
      produced 20 duplicate registrations (`mjolnir:openspec-apply-change`,
      `stabbur:openspec-apply-change`, …) of skills the root already provides
      unscoped. The root `.claude/` is a strict superset (it also has
      `system-overseer-architect` and `settings.local.json`). Verified
      identical with `diff -rq` and `cmp`, then deleted all four per-project
      `.claude/` directories — 40 files, zero loss. This is the tooling half
      of the "6 claude code sessions" problem.

- [x] 4.8 One OpenSpec change-id convention for **ACTIVE** changes: bare
      slugs. Four renamed. **Archived changes keep their dated names** (41 of
      them across tun, mjolnir and phonexa) — that is D153's decision, not an
      omission: they are historical record, are not addressable by
      `openspec --change` either way, and renaming them would break every
      document citing them. An earlier wording of this task said "including
      those under `changes/archive/`", which contradicted D153 and was
      refuted by review. Original text: Forced by
      tooling — `openspec status --change` and `openspec instructions apply
      --change` reject any name not starting with a letter, so dated ids
      cannot be driven by the CLI. Rename the pre-existing dated changes in
      `tun`, `mjolnir` and `phonexa` (including those under
      `changes/archive/`) and fix every cross-reference to them.

## 5. Documentation

- [x] 5.1 `docs/07-decisions.md`: D135 gains its design; mark superseded or
      amend D37, D42, D84, D94, D98, D101, D104, D118, D119, D147. Supersede,
      never delete (CLAUDE.md convention).
- [x] 5.2 **Done more precisely than asked.** P35/P36 are not blanket-retired:
      each row now says WHICH HALF died. Gone is the cross-repo hand-carrying
      of a hash between two `.env` files (what D151 retires). **Surviving and
      explicitly kept:** Caddy's set-but-empty variable never falling back to a
      `{$VAR:default}`, and compose mangling a `$`-containing value unless it is
      single-quoted. Both still apply — `include:` is still used and
      `PHONEXA_AUTH_HASH` is still a `$`-containing value in a `.env`.
- [x] 5.3 `docs/README.md`: repo map replaced by a project table; the
      session-opening instructions now say one root, no extra working
      directories. Also fixed a three-week-stale Status block that still said
      "P2 next" when `10-roadmap.md` and `12-p2-results.md` both record P1-P3
      as done on 2026-10-22.
- [x] 5.4 `DEPLOY.md` rewritten (653 lines) as the real runbook: one clone, no
      sibling layout, no network creation, no `rsync` of smia's providers, the
      four per-database passwords with the data hazard spelled out, and a §8
      production-cutover section. `mjolnir/DEPLOY.md` corrected in place rather
      than reduced to a pointer — it still uniquely owns publishing, logic
      bundles, rollback and the OTA data layout.
- [x] 5.5 `docs/02-services.md`, `docs/13-operator-console-ux.md`: both were
      written around `include:` across repos and one Adminer.
- [x] 5.6 Root `CLAUDE.md` + per-project `CLAUDE.md`; `mjolnir/docs/findings.md`
      stays where it is.
- [x] 5.7 Done — 18 files. Two were real defects, not stale prose:
      `stabbur/scripts/seed_p4_notes.py` hardcoded
      `/home/coden/dev/phonexa/lang/no/audio`, which no longer exists, so every
      seeded note would have carried a dead audio path; and
      `mjolnir/.env.example` still named the root key `POSTGRES_PASSWORD`, the
      exact mismatch that broke `backup/entrypoint.sh`. Archived changes left
      untouched by rule; ~45 `tun/docs/...`-style citations left alone
      deliberately (they are repo-qualified references that still resolve).
      Original wording: grep the whole tree for `/home/coden/dev/<repo>` and for
      `../<repo>/` path references and fix them.

## 6. Verification — the bar is "nothing changed"

- [x] 6.1 `bin/ota-verify.sh` runs and passes everything it can prove
      locally, with the **gateway as the only running container** — no
      database, no application service.
      **Independent review refuted the stronger claim this task first made**
      ("16 passed, 0 failed — P1 path proven"), and it was right:
      - Eight of the sixteen assertions are self-fulfilling against a synthetic
        payload, because the harness authors both `current.json` and the
        bundle: buildId, buildId charset, sha256-is-hex, size, sha256-matches,
        byte-count-matches and magic-prefix test only that the gateway does not
        corrupt bytes — never that the publisher writes correct metadata.
      - Worse, the D53 check was **inverted**: with `ALLOW_HTTP=1` it reported
        `PASS url is http`, so the production-critical "url MUST be https"
        assertion contributed a pass while recording its opposite. **Fixed in
        the script**: that branch is now a `SKIP` that does not increment the
        pass count, and the summary says "NOT a full proof" whenever anything
        was skipped. The documented command now honestly reports
        `15 passed, 1 FAILED` against a local http url.
      - The script only ever requests `/ota/*`. It never touches `/blob/*` or
        `/audio-manifest/*`, never asserts the `immutable` headers, and never
        checks for `precompressed` — so it evidences one of the three device
        routes, not all three. Review verified the other two by hand
        (including planting a sibling `.gz` to prove no `precompressed`).
      What IS proven: the token gate (401/401/200/405), `no-store` on
      current.json, and the three gzip/Content-Length properties of D49 — all
      gateway properties. Note the D49 chunked check only holds above Caddy's
      response-buffer threshold: a small or compressible test bundle fails it
      spuriously (observed at 73 B and 74 kB, passing at 2 MB incompressible).
- [ ] 6.2 **Runbook (needs the real payload, which is gitignored and lives on
      the VPS).** What IS proven locally: the three device `handle` blocks are
      byte-identical to pre-merge by per-block sha256
      (ota=7ee6c1ac1065c75d, blob=d299b0b1ebe3e702, audio=e13f06b360d4cfa7),
      the compiled Caddy route order puts them at indices 5-7 ahead of every
      operator route and the catch-all, and `/srv` resolves to `mjolnir/data`.
      Original: `/ota/current.json` with a valid bearer returns the same bytes as
      before the merge; without one, 401.
- [x] 6.3 Verified in a real boot: `/stabbur/ui` 200, `/smia/ui` 200,
      `/mjolnir` 302 to its login, `/builder` 302, `/phonexa/` 401 (fail-closed
      by design), `/adminer` 308 then 200, `/` 404 body "mjolnir",
      `/ota/current.json` 401 without a token and 404 **not 401** with one.
      Degradation held: stabbur down -> only `/stabbur/ui` 502; smia down ->
      only `/smia/ui` 502; device routes unaffected throughout. Original:
      respond exactly as they did before (200, 200, 302→login, 302→login, 401).
- [ ] 6.4 **Runbook (no TLS locally — this host is rootless Docker and the
      local mode is plain HTTP on 8080).** Proven locally instead: the volume
      `mjolnir_caddy_data` keeps its exact name in the rendered config and
      survived every harness run. `DEPLOY.md` §8.2 carries the post-boot
      certificate assertion. Original: Caddy serves the **same** certificate.
- [x] 6.5 Verified for all four (with `--env-file ../.env`, see 2.7), and the
      dev-port property with it:
      standalone publishes loopback ports (stabbur 5056/5434, smia 5055/5433,
      phonexa 5050/5432) while the root stack publishes only the gateway.
- [ ] 6.6 **Runbook (needs the operator's real deploy key).** Proven locally:
      all four variables `backup/entrypoint.sh` requires are present in the
      rendered config, and the clone-failure path now aborts with exit 1 and a
      diagnostic instead of logging "committed and pushed" — smoke-tested in a
      throwaway container. A full successful cycle must be run on the VPS per
      `DEPLOY.md` §8.3. Original: a git-backup run completes and commits all
      expected files.
