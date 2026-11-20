# Acceptance criteria — userdata-git-history

Observable in **dev compose**, via claude-in-chrome for the UI and shell for the
database and the git clone. Requires `backup-console`'s dev local bare-repo
remote to be working.

**No criterion may assert a dump size or a size reduction.** The dev database
holds only test fixtures (measured 2026-11-20: 18 `userdata_history` rows,
104 kB, uids like `uid-console-1`); the 44 MB that motivates this change exists
only on the VPS. Assert mechanism. A criterion like "mjolnir.sql is under 2 MB"
would pass or fail for reasons unrelated to the work.

**Seed data is required before testing.** Several criteria need an account with
multiple syncs across several days and a card array large enough that a
single-field change is distinguishable in a diff. Create it by issuing PATCHes
against the sync endpoint — not by hand-writing rows — so the archive is tested
against documents the real write path produced.

## The export

1. After one backup run, `userdata/<uid>.json` exists in the backup repo clone,
   one file per uid present in the `userdata` table, and no other.
2. Its content, parsed as JSON, is **equal** to the `doc` column for that uid.
3. It is pretty-printed: more than one line, with one scalar per line, and the
   card array expanded one element per line.
4. Key order is **stable**: run the export twice against unchanged data and the
   two files are **byte-identical** (`cmp` reports no difference).
5. A second run against unchanged data commits nothing — `git log` gains no
   commit mentioning the export.
6. Change **one field of one card** via a sync PATCH, run, and
   `git diff HEAD~1 -- userdata/<uid>.json` shows a change confined to that
   field's line. Unrelated lines are not rewritten. This is the criterion that
   distinguishes this design from storing a blob.
7. Create a second account via a sync GET, run, and a second file appears while
   the first file is unchanged in that commit.
8. Nothing in the backup image was added to serialize the export — `jq` is still
   absent from the container.

## The run is still all-or-nothing

9. Make the export step fail (revoke the role's SELECT on `userdata`, or point
   it at a missing uid source) and run: the run is reported **failed**, no
   commit is made, and every previously committed file is byte-identical to
   before.
10. The failed run appears in `backup-console`'s run history with its log.

## The dump

11. After the change, `mjolnir.sql` contains **no** `COPY public.userdata` data
    block and **no** `COPY public.userdata_history` data block.
12. It still contains `CREATE TABLE public.userdata` and
    `CREATE TABLE public.userdata_history` — schema is kept, data is not.
13. Restoring the dump into a fresh database yields a complete working database
    in which both tables exist and are **empty**, and every other mjolnir table
    is complete.
14. `bin/check-standards.sh` passes, and the backup-source check recognises the
    account tables as covered by the export rather than reporting them as
    excluded-and-unsourced.
15. Adding a new `--exclude-table-data` for a table with no declared source
    still makes the backup-source check report a problem — the guard was not
    weakened to accommodate this change.

## Restore

16. The documented restore procedure, run against a database whose `userdata`
    table is empty, reproduces the account's document: the restored `doc` equals
    the archived file's JSON.
17. After that restore, a device sync `GET /mjolnir/userdata/<uid>` returns the
    restored document and **not** factory defaults, and the response carries no
    `_justCreated` field.
18. The restore procedure is shown on the `/backup/` page as copyable commands.

## Ordering (the one sequence that cannot be got wrong)

19. The commit that adds `--exclude-table-data=userdata` is **not earlier** than
    the commit that adds the export, and the sweep is **not earlier** than a
    demonstrated restore. Verify by reading `git log --oneline` for this change
    and confirming the order of those three commits.
20. At no commit in this change's history does the tree both exclude the account
    data from the dump and lack an export step.

## The sweep

21. With history rows older than the window present, running the sweep removes
    them and leaves rows inside the window untouched. Verify by inserting rows
    with backdated `at` values and counting before and after.
22. A row inside the window still carries its full document after the sweep.
23. The sweep removes only periods already represented in the committed archive:
    with the archive deliberately absent, a row older than the window is **not**
    deleted.
24. Running the sweep twice is idempotent — the second run deletes nothing and
    errors on nothing.

## The device contract is untouched

25. Capture `GET /mjolnir/userdata/<uid>` **before and after** the change for an
    existing account and compare: status code, every response header, and the
    response body are **byte-identical**.
26. Same byte-for-byte comparison for `PATCH` with a representative body,
    including that the six device-status fields are still stripped rather than
    merged.
27. Same for the three error shapes that must stay unparseable: a malformed uid
    returns 404 with an **empty** body; an unsupported method returns 405; and
    with Postgres stopped the endpoint returns 503 with an **empty** body.
28. `git diff` for this change touches no file under `mjolnir/sync/`,
    `mjolnir/patches/` or `mjolnir/base/`, and does not modify
    `docs/11-ota-contract.md`.

## The Sync page — two tiers

29. With syncs inside the window and archived versions older than it, the page
    shows **one chronological timeline** containing both.
30. Each entry's fidelity is identifiable **from the entry itself**, not only
    from a panel-level badge — per-sync entries and archived entries are
    visually distinct in more than one respect.
31. The boundary between the tiers is **labelled**, and states that older
    entries are one per backup run because the fine-grained rows were swept.
32. The panel carries **no** blanket claim that the whole timeline is daily, and
    no blanket claim that it is per-sync.
33. The archived tier's caveats — several syncs collapsing to one entry, a
    no-change period producing no entry, a changed-and-reverted value leaving no
    trace — are stated **in or adjacent to that tier**, not as a description of
    the whole panel.
34. Per-sync entries reuse the existing delta vocabulary: a session-completing
    sync reads as a completed session and shows the session-count transition and
    the card-count delta.
35. A per-sync entry whose change is also archived makes the relationship
    discoverable, and the same change is **not** rendered as two separate
    timeline events.
36. Opening a per-sync entry fetches and shows that row's full document.
37. Opening an archived entry fetches and shows that version's document and its
    diff against the preceding version.
38. The page's initial payload contains **no** full account document — confirm
    by searching the served HTML for a document-only field such as
    `accountCreationDate`.

## Independent degradation

39. With `backup-console` **stopped**, the Sync page still loads, all per-sync
    entries render in full, and only the archived region reports that it is
    unavailable. The page does not show a single page-wide error.
40. In that state the archived region names the failure and offers a retry, and
    the rest of the page — uid picker, progress snapshot, per-card table,
    current-document viewer — is fully usable.
41. For an account with **no archived version**, the per-sync tier renders and
    the archived region states that nothing is archived yet, distinct from the
    unreachable state.
42. For an account with **no syncs inside the window**, the archived tier
    renders and the recent region states the window is empty rather than
    appearing broken.
43. With Postgres stopped, the page degrades rather than failing to boot
    (D157), and does not claim the archive is missing when it is the database
    that is unavailable.

## Standards

44. `historyDeltas`, `summarizeDelta` and `historyDoc` still exist and are still
    used — this change retains them rather than deleting them.
45. The rest of the Sync page is unchanged: uid picker, progress snapshot,
    per-card progress table with its filters and paging, and the
    current-document viewer all behave as before.
46. The page renders correctly in both light and dark theme, and no table causes
    the page body to scroll horizontally.
47. The accepted mockup's Sync surface is reproduced: labelled horizon, per-row
    fidelity marking, the "same change, one tier down" expander, and the four
    states (both tiers / archive unreachable / nothing archived / no recent
    syncs).
