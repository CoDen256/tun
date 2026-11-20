# Tasks — backup-console

## 1. Make a backup run possible in dev (do this first — everything else is unverifiable without it)
- [x] 1.1 Add a dev configuration in which the backup remote is a **local bare**
      git repository (not a plain checkout — you cannot push to a non-bare
      repo's current branch). No SSH, no network.
- [x] 1.2 Confirm live: clone succeeds, a full run dumps all four databases,
      commits, and pushes; `git log` in the bare remote shows the commit.
- [x] 1.3 Document the dev remote where an operator will find it, and keep the
      production path (real URL + deploy key) untouched.

## 2. Move the backup project onto its own compose file
- [x] 2.1 Create `backup/compose.yaml` holding the existing `backup` service
      definition verbatim, plus the `backup-repo-clone` volume declaration
      (keep its explicit `name: tun_backup-repo-clone` — this is what stops the
      existing clone being orphaned).
- [x] 2.2 Remove both from the root `compose.yaml` and `include:` the new file.
- [x] 2.3 Verify `cd backup && docker compose up` works standalone, and that
      the root stack still resolves the shared volumes referenced from other
      projects' compose files.

## 3. State volume: run records and settings
- [x] 3.1 Add a state volume shared by `backup` and `backup-console` — writable
      by the scheduler, and readable by the console.
- [x] 3.2 Have `entrypoint.sh` write one durable record per run (start,
      duration, outcome, what changed) plus that run's full captured log.
- [x] 3.3 Record the four distinct outcomes, not two: committed; succeeded with
      no changes; failed; and **pushed a previously-committed backup** (the
      recovery path `entrypoint.sh` already logs). Do not flatten recovery into
      "no changes".
- [x] 3.4 Capture the log of a run that fails because Postgres is unreachable —
      this is the case the file-based store exists for; verify it by stopping
      the postgres container.
- [x] 3.5 Implement retention pruning of records and logs.

## 4. Settings, stored in exactly one place
- [x] 4.1 Store schedule interval, retry interval and run-log retention on the
      state volume as the single authoritative location.
- [x] 4.2 Make the environment variables **seed values only** — consulted when
      nothing is stored, never overriding a stored value (D151).
- [x] 4.3 Make `healthcheck.sh` judge staleness against the **stored** interval,
      preserving its existing property that the grace is a fraction of the
      interval so shortening the interval tightens the check.
- [x] 4.4 Do not add any setting beyond the three. In particular, add no
      control that excludes a source from the backup set.

## 5. The manual run, with the loop as the only writer
- [ ] 5.1 Have the console write a run **request** to the state volume; it must
      never dump, commit or push.
- [x] 5.2 Make the scheduler's sleep interruptible so a request is picked up
      promptly rather than up to a full interval later.
- [x] 5.3 Have the request run `run_backup` unchanged — no flags, no variant
      behaviour, no extra or skipped step.
- [ ] 5.4 Report the request as **queued** until the loop actually begins, and
      prevent a second concurrent run.

## 6. The console service
- [ ] 6.1 Add the `backup-console` service to `backup/compose.yaml`:
      `restart: unless-stopped`, its own health check, no published host port
      in the unified stack.
- [ ] 6.2 Apply the one shared operator check from `libs/` — the
      gateway-verified marker or the internal token. No new credential.
- [ ] 6.3 Serve the page when the state volume is empty, when no run has ever
      completed, when the clone is absent, and when the `backup` service is
      stopped. Report each condition; never fail to boot.

## 7. The page
- [ ] 7.1 Build to `mockups/backup-console.html` — the accepted
      look-and-interaction reference.
- [ ] 7.2 Health banner: last success + age, next run, unpushed-commit count,
      and the health verdict. All three states visually distinct by more than
      text.
- [ ] 7.3 Run now, with queued / in-progress / result states and the phase
      indication.
- [ ] 7.4 Run history: expandable rows revealing each run's full log, wide
      content scrolling in its own container.
- [ ] 7.5 Sources: read-only, with per-run deltas, the empty-source-non-empty-
      mirror fault, and `smia` shown as deliberately excluded.
- [ ] 7.6 Settings: three fields with save feedback; credentials and remote
      read-only.
- [ ] 7.7 Commit history: expandable to each commit's changed files.
- [ ] 7.8 Restore instructions as copyable commands per source.
- [ ] 7.9 Both themes, no horizontal body scroll.

## 8. Zone wiring
- [ ] 8.1 Add a `/backup/*` `handle` block to `grind/caddy/Caddyfile` importing
      the existing `(operator_gate)` snippet, then reverse-proxying the console.
      It must be a `handle` block, not a bare `reverse_proxy` — read that
      file's own warning about why.
- [ ] 8.2 Verify compiled route order with
      `caddy adapt --adapter caddyfile`, never by reading the file top to
      bottom (P56).
- [ ] 8.3 Register `backup` in `libs/jsservice/layout.js`'s `ZONES` **and** in
      `grind/caddy/status/index.html` — the layout file's own comment requires
      both.

## 9. Verification
- [ ] 9.1 Walk `acceptance.md` top to bottom against the running stack.
- [ ] 9.2 Confirm the diff touches no file under `mjolnir/sync/`,
      `mjolnir/patches/`, `mjolnir/base/`, and does not modify
      `docs/11-ota-contract.md`.
- [ ] 9.3 `bin/check-standards.sh` passes.
- [ ] 9.4 Add an ADR row to `docs/07-decisions.md` for the backup console zone
      and the runtime-settings-over-env decision.
