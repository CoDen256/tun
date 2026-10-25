## 0. Before you write any code — read this first

- `tun/docs/07-decisions.md` **D94** — the decision this implements, and
  specifically why it doesn't reopen D81 (the rejected cross-repo
  file-reference design) despite both touching multiple repos.
- `design.md` D-T1 through D-T4 in this change — each names an alternative
  that was considered and rejected (submodules, a setup script, a
  configurable sibling path). Don't reach for any of them.
- **Confirm on disk before assuming anything's missing**: `stabbur` already
  auto-migrates (`scripts/bootstrap.py`). Don't duplicate that work here —
  this change only needs `mjolnir`'s equivalent to exist, which is a task in
  the `hub-builder-operator-console` proposal (`mjolnir` repo), not this one.

This is `tun`'s first-ever shipped code — there is no existing compose file
or Caddyfile in this repo to be careful around (D84 fully moved them to
`mjolnir`). Nothing here is a migration of existing config, it's new.

## 1. Top-level compose

- [ ] 1.1 `tun/compose.yaml`: `include: [../mjolnir/compose.yaml,
      ../stabbur/compose.yaml]`, per D-T1/D-T2.
- [ ] 1.2 Confirm the target VPS's Compose version supports `include:`
      (v2.20+) before relying on it; document the floor in task 4.
- [ ] 1.3 Verify cross-file service-name resolution works: bring the unified
      stack up, confirm a container from one included file can reach a
      service name defined in the other (e.g. ping `stabbur` from inside
      `mjolnir`'s network, once both are up).

## 2. Adminer

- [ ] 2.1 Add `adminer` to `tun/compose.yaml`, per D-T3 — one container, no
      per-database instance.
- [ ] 2.2 Verify connecting to both `mjolnir`'s hub Postgres and `stabbur`'s
      Postgres from the same running Adminer instance, via its login-screen
      server field.

## 3. Naming consistency

- [ ] 3.1 Rename `stabbur/docker-compose.yml` → `compose.yaml` (D-T4) — in
      the `stabbur` repo; coordinate so this doesn't collide with concurrent
      work on `notes-grammar-ui` there.
- [ ] 3.2 Confirm `stabbur`'s own `docker compose up` still works unchanged
      after the rename (same file, new name — no content change).

## 4. Documentation

- [ ] 4.1 `tun/DEPLOY.md` (first one this repo has had): sibling-checkout
      layout, the three `git clone` commands, Compose version requirement,
      first-boot walkthrough (`docker compose up`, what to expect, how to
      reach Adminer).
- [ ] 4.2 Note explicitly in `DEPLOY.md`: this file brings up `mjolnir`'s and
      `stabbur`'s services as defined in *their own* compose files — changes
      to what gets deployed happen in those repos, not here.

## 5. Integration and sign-off

- [ ] 5.1 Full fresh-checkout test: delete local copies, re-clone all three
      repos as siblings, `docker compose up` in `tun`, confirm everything
      that's supposed to start does.
- [ ] 5.2 Once `hub-builder-operator-console` (mjolnir repo) actually adds
      `hub`/`builder` services with their own `Dockerfile`s: re-run 5.1,
      confirm they come up correctly through the `include:`, their Caddy
      routes work, and they auto-migrate on first boot.
- [ ] 5.3 Record any real divergence from `design.md` found during
      implementation as an ADR amendment in `tun/docs/07-decisions.md` —
      this project's established practice, and especially relevant here
      since this is the first time `tun` itself has shipped code rather than
      only docs.
