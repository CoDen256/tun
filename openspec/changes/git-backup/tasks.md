## 0. Before you write any code

Read `design.md` in full, especially D-B1 (why this lives in `tun`, not
`builder` or `stabbur`) and D-B2/D-B6 (the no-encryption decision and the
one hard rule — secrets never enter this repo — that makes it safe). Read
`tun/compose.yaml`'s existing `adminer` service as the precedent for "one
container reaching both included databases by name."

## 1. The private backup repository

- [ ] 1.1 Create a new private GitHub repository for backup content only
      (operator action — not scripted).
- [ ] 1.2 Generate a repo-scoped SSH deploy key with write access (D-B6);
      add the public half to the repo's deploy keys.
- [ ] 1.3 Add the private key path/value and the repo's SSH URL to `tun`'s
      `.env` (gitignored, same convention every other secret in this repo
      already follows).

## 2. The backup service

- [ ] 2.1 New service in `tun/compose.yaml` (e.g. `git-backup`): a small
      image with `postgresql-client` (or the specific major version
      matching both Postgres instances — `mjolnir-postgres` is `postgres:17-
      alpine`, `stabbur-postgres` is `postgres:16`; confirm `pg_dump`'s
      compatibility range covers both, or install both client versions if
      not) plus `git` and `openssh-client`. Joins the default merged network
      (no extra config needed — same as `adminer`).
- [ ] 2.2 Mount: the deploy key (read-only, from `.env`/a file it
      references), a named volume for the backup repo's persistent working
      clone, and `stabbur`'s `stabbur-blobs` volume (read-only).
- [ ] 2.3 Entrypoint script:
      - clone the backup repo on first run if the working volume is empty;
        otherwise `git pull` to stay current (defensive — this container
        should be the only writer, but cheap to confirm).
      - `pg_dump` `mjolnir-postgres`'s `postgres` database → `mjolnir.sql`
        (overwrite).
      - `pg_dump` `stabbur-postgres`'s `stabbur` database → `stabbur.sql`
        (overwrite).
      - diff `stabbur-blobs`'s contents against `blobs/` in the working
        clone; copy over anything missing (D-B3) — never touch
        `mjolnir`'s own blob directory (D-B4, not even mounted).
      - `git add -A`; `git diff --cached --quiet` — if no changes, exit
        without committing (D-B7); otherwise commit (a timestamped
        message) and push.
- [ ] 2.4 Self-contained scheduling (D-B5): a sleep-loop or lightweight
      in-container cron running the above on a recurring interval (default
      daily — the Open Question in `design.md`, confirm with the operator
      before finalizing) — no host-level cron entry.
- [ ] 2.5 Tests/dry-run: confirm against a disposable test repo (not the
      real backup destination) that two consecutive runs with no DB changes
      produce zero commits; a run after a real DB change produces exactly
      one commit touching only the changed file(s); a new blob file appears
      added, an unchanged one is untouched; nothing from `mjolnir`'s own
      `data/blob/` ever appears in the test repo.

## 3. Sign-off

- [ ] 3.1 **(Operator)** First real run against the actual production
      databases — confirm the initial (large) commit succeeds and pushes;
      spot-check `mjolnir.sql`/`stabbur.sql` contain real data by restoring
      into a scratch Postgres and querying a known table.
- [ ] 3.2 **(Operator)** Confirm `.env`/the deploy key itself never appear
      anywhere in the backup repo's history (`git log --all --
      <possible-secret-filename>` style check, or simply confirm the
      backup repo's own `.gitignore`/working-directory layout never
      included the credentials directory to begin with).
- [ ] 3.3 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
