# Acceptance criteria — backup-console

Every criterion below is observable in **dev compose**, with claude-in-chrome
for the UI and shell for the state volume. None of them require the VPS, a real
remote, a real TLS certificate or a real phone.

**Mandatory precondition for most of this change: the dev local bare-repo
remote (criteria 1–3) must work first.** Without it the backup service cannot
complete a run in dev, and criteria 4 onward have nothing to observe. If the
dev remote cannot be made to work, that is a BLOCKED item — do not substitute
reading code for observing a run.

**A note on sizes.** The dev database holds only test fixtures (measured
2026-11-20: 18 `userdata_history` rows, 104 kB; uids like `uid-console-1`).
No criterion may assert a dump size or a size reduction, because the 44 MB
that motivates this work exists only on the VPS. Assert mechanism, never
magnitude.

## The dev remote

1. With the dev configuration applied, `docker compose up` brings up `backup`
   and it **clones successfully** — `docker compose logs backup` contains no
   `FATAL clone` line, and `/data/tun-backup/.git` exists inside the container.
2. A full run completes end to end in dev: the log shows a dump line for each
   of `mjolnir`, `stabbur`, `phonexa`, `shadow`, then `committed and pushed`.
3. `git log` in the bare remote shows that run's commit, so the push really
   reached the remote rather than only the local clone.

## The zone and the shell

4. Navigating to `/backup/` without the operator credential does not return
   the page; with the credential it returns the console.
5. `curl -H 'X-Tun-Operator: 1'` against `/backup/` without the operator
   credential does **not** reach the console — the forged marker is stripped.
6. The top-bar zone switcher on the `/backup/` page lists `backup` as the
   current zone alongside the existing zones, and the status page also lists
   `backup`.
7. The page renders correctly in both light and dark theme, with the same theme
   toggle the other consoles have.

## Health banner

8. Before any run has completed (delete the success stamp and reload), the
   banner states that **no backup has ever completed**, and shows neither a
   zero age nor a timestamp implying success.
9. After a successful run, the banner shows the last success with its age, and
   the next run due time derived from the schedule interval in force.
10. After a failed run (break the Postgres password in the backup service's
    environment and let a run fail), the banner's primary state is the
    **failure**, shows when the retry is due, and does **not** present an
    earlier success as the current state.
11. Commit a change in the clone by hand and make the push fail (point the
    remote at a non-existent path), then run: the banner reports the remote as
    **stale** and states the number of unpushed commits.
12. In each of the three states above, the state is distinguishable without
    reading text — by colour, icon or border — matching the accepted mockup.

## Run now

13. Clicking **Run now** causes the backup service's own process to perform the
    run: `docker compose logs backup` shows the run, and the console process's
    logs show no `pg_dump`, `git commit` or `git push`.
14. Between clicking and the loop picking the request up, the page reports the
    run as **queued** — never as running or complete.
15. While the run is in progress the page reports progress, and the button
    cannot be used to start a second concurrent run.
16. When the run finishes, it appears in run history with its outcome, and the
    health banner updates to reflect it without a manual reload or with an
    explicit refresh affordance.
17. A manually triggered run and a scheduled run produce run records of the
    same shape, distinguishable only by how they were triggered. Verify by
    setting the interval to 60s, letting a scheduled run happen, and comparing
    the two records.

## Run history

18. Each run record shows start time, duration, outcome and what changed.
19. Expanding a run shows that run's **full captured log text**, and for a
    failed run that text includes the failure message the service logged.
20. A run that fails **because Postgres is unreachable** (stop the postgres
    container, trigger a run) is recorded with its failure and its log, and is
    visible on the page. This is the criterion the file-based store exists for.
21. Three outcomes are visibly distinct on the page: committed, succeeded with
    no changes, and failed. Produce "no changes" by running twice with no
    intervening data change.
22. A push-recovery run — a run that pushes what a previous run committed but
    failed to push — is shown as having recovered the stale remote, and **not**
    as a run that made no changes. Produce it by failing a push, then fixing
    the remote and running again.
23. Setting retention to a small number and running more times than that leaves
    only that many records on the state volume, and the retention in force is
    stated on the page.

## Settings

24. The page exposes exactly three editable settings — schedule interval,
    retry-after-failure interval, run-log retention — and no others.
25. Saving a new schedule interval changes the next run's due time on the page,
    with no container restart and no file edited by hand.
26. Restarting both services leaves the saved values in force; the environment
    variable does **not** override a stored value.
27. With a stored interval that differs from `BACKUP_INTERVAL_SECONDS`, the
    container health check judges staleness against the **stored** value:
    set the stored interval to 60s, let the stamp age past 75s, and
    `docker inspect` reports the container unhealthy even though the env var
    still says 86400.
28. Starting with an empty state volume, the environment variables are used as
    the initial values and the page shows them as the current settings.
29. The repository URL, SSH key path and database password are not editable
    anywhere on the page.

## Sources

30. Each of the four databases and both file mirrors appears with its current
    size or file count and its change since the previous run.
31. There is **no control anywhere on the page** that excludes a source from
    the backup set.
32. `smia` is shown as deliberately excluded, rather than omitted.
33. With a non-empty mirror in the clone and an emptied source, the page
    presents the condition as a fault needing attention, matching the backup
    service's own refusal to commit.

## Commit history and restore

34. Commit history lists the backup repository's commits newest first, each
    expandable to the files that commit changed. Verify the shas against
    `git log` in the clone.
35. The restore section shows a procedure per source as copyable commands.

## Degradation and standards

36. With the state volume empty and the repository not cloned, the console
    still **serves the page** and reports both conditions — it does not fail to
    boot or return an error page.
37. With the `backup` service stopped entirely, the console still serves the
    page and reports that it cannot determine the service's state.
38. `bin/check-standards.sh` passes, including that `backup-console` has its
    own health check and that no host port is published by the root stack.
39. `cd backup && docker compose up` brings the project up standalone.
40. After moving the volume declaration into `backup/compose.yaml`, the
    pre-existing clone is still used: `docker volume ls` shows
    `tun_backup-repo-clone` and no second clone volume was created.
41. No file under `mjolnir/sync/`, `mjolnir/patches/`, `mjolnir/base/` or
    `docs/11-ota-contract.md` is modified by this change. A diff of the change
    confirms it.
42. The accepted mockup's layout and interaction are reproduced: health banner
    above the run control, the phase indication during a run, run history and
    commit history as expandable rows, sources read-only, settings as three
    fields, restore commands last.
