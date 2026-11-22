# Design — userdata-git-history

## 1. What was measured, and what it rules out

Measured against the committed backup and the running stack on 2026-11-20:

- `mjolnir.sql` is 44 MB; `userdata_history`'s COPY block is **42.4 MB across
  82 rows**, averaging **517 KB per row**. Every other dump combined is ~2 MB.
- The backup repo's `.git` is **106 MB across 88 commits**.
- `userdata` itself is one row per uid and does not grow.

So the problem is not "the backup is big". It is that **one table re-commits a
full copy of one document, daily, forever**. Any fix that leaves
`userdata_history`'s data in the dump is not a fix.

It also rules out a measurement-based acceptance criterion in dev: the dev
database holds only test fixtures (18 rows, 104 kB, uids like
`uid-console-1`). The 44 MB exists only on the VPS. Criteria must assert
mechanism, never size.

## 2. Why the backup service is the exporter

Three candidates were weighed; two are wrong for concrete reasons.

**`mjolnir-sync` writing the file on each PATCH** puts a filesystem write in
the **device-plane request path**, which `docs/11-ota-contract.md` freezes.
Rejected on sight, and recorded here so the reason survives.

**hub exporting on a schedule** needs a scheduler added to hub, a volume shared
between two projects, and a second writer to coordinate with the backup run —
and if the export and the commit are done by different processes they can
disagree about what was archived.

**The backup service** already connects to Postgres with a derived password,
already has `psql` (verified at `/usr/bin/psql`), and already owns the git
clone and the commit. The export becomes one step in the run that commits it,
so the file and the commit cannot drift apart. One writer, no new process, and
nothing in the device path.

## 3. Serialization: `jsonb_pretty`, verified not assumed

The earlier proposal reached for `jq -S --indent 2`. Two things make
`jsonb_pretty` better, both checked rather than argued:

1. **`jq` is not in the backup image.** Confirmed: only `psql` and `git` are
   present. Adding a dependency to the container that holds the SSH deploy key
   is a cost worth avoiding.
2. **`jsonb_pretty` is already deterministic.** Run live:

   ```
   SELECT jsonb_pretty('{"zebra":1,"apple":2,"b":[1,2],"Mid":{"z":1,"a":2}}'::jsonb);
   {
       "b": [ 1, 2 ],
       "Mid": { "a": 2, "z": 1 },
       "apple": 2,
       "zebra": 1
   }
   ```

   Keys come out in jsonb's **stored** order — by length, then bytewise —
   recursively, and arrays expand one element per line.

Note precisely what this is and is not: it is **stable**, not **alphabetical**.
Stability is the property git needs. Anyone "fixing" the order to alphabetical
later would rewrite every line of every file and produce one enormous diff for
no gain.

The consequence that makes this design work: `totalCards` is an array of card
objects, so it expands one field per line. Changing one card's `Stage` changes
**one line**. That is what turns git into a usable change tracker rather than a
store of opaque half-megabyte blobs.

## 4. The two tiers, and the horizon between them

The operator reversed himself here, deliberately, and both halves of the
reversal are load-bearing:

1. Shown that `userdata_history` feeds a working per-PATCH timeline, he chose
   to **drop the table outright** and let git be the only history.
2. Shown the daily-only replacement, he reversed that and kept a **short
   Postgres tail**.

The result is better than either pure option, because the two tiers answer
different questions:

| tier | source | resolution | answers |
|---|---|---|---|
| recent | `userdata_history`, swept to 48h | per-PATCH | "what did the phone just do?" |
| archive | git history of `userdata/<uid>.json` | one entry per backup run | "how has progress moved over weeks?" |

**The horizon must be explicit in the UI.** A timeline that silently changes
resolution partway down is a lie about the data. The accepted mockup draws a
labelled divider, marks each tier's fidelity on the rows themselves (not only
in a badge), and scopes the caveats — same-day merging, no-change days
producing no entry, a changed-and-reverted value leaving no trace — to the
archive tier, where they are true, instead of stating them of the whole panel.

**Independent degradation is the point of separating them.** The recent tier is
a local Postgres read; the archive tier is a cross-service call to
`backup-console`. When the archive is unreachable the recent tier must keep
rendering — D157's "serve before you migrate" posture applied to a panel.

`historyDeltas`, `summarizeDelta` and `historyDoc` are **kept**. Their
vocabulary ("Session completed", `completedSessions 41 → 42`, `totalCards +3`)
is reused by both tiers so the two read as one timeline.

## 5. Ordering: the archive must exist before the exclusion

This is the one sequence in the change that cannot be got wrong.

Once `userdata`'s data leaves the dump, restoring `mjolnir.sql` yields an empty
`userdata` table, and the only copy of the operator's learning progress is the
committed export. Therefore:

1. The export is written and **committed**, and
2. a restore from the export is **demonstrated to reproduce the document**,

before `--exclude-table-data=userdata` lands, and before the sweep deletes a
single history row. Any other order opens a window in which nothing holds the
progress.

The sweep is the irreversible half. A dropped history row is gone; an
un-excluded dump is merely large.

## 6. The exclusion checker

`bin/_check_backup_sources.py` exists because an excluded table whose source
does not exist is backed by nothing — a trap discovered once by running an
import rather than reading a table list. Excluding `userdata` creates a table
whose source is neither a repository file nor a cache, but **the backup repo's
own export**. That is a genuinely new category and must be **asserted** in the
checker, not left to be rediscovered. The point of that file is that a fourth
sourceless exclusion cannot appear silently the way the first three did.

## 7. What the device sees: nothing

No file under `mjolnir/sync/`, `mjolnir/patches/` or `mjolnir/base/` changes.
The PATCH contract, its status codes, its empty-body error discipline (P46) and
its `_justCreated` behaviour (D-S4) are all untouched. What changes is how long
the resulting rows are retained and where the long-term copy lives — both
strictly behind the API.

The acceptance criteria carry an explicit byte-for-byte comparison of a
device-facing response before and after, so this is verified rather than
asserted.

## 8. The 48-hour window

48 hours is a design value, chosen so that "what did the phone do yesterday
evening" is always answerable at full fidelity, with the table bounded at
roughly a day's syncs plus margin (~16 PATCHes/day observed, so ~30 rows,
~15 MB in Postgres and **zero** in git). It is not an operator-tuned setting in
this change; if it needs tuning later that is a backlog item, not a hidden knob.

## 9. Mockup

`mockups/device-pulls.html`, Sync page surface — accepted after one iteration
(the first version was daily-only, which the reversal in §4 invalidated). The
labelled horizon, per-row fidelity marking, the "same change, one tier down"
expander and the four degradation states are all as accepted.
