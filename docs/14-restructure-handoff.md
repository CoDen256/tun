# The monorepo restructure — session handoff (CLOSED 2026-11-14)

> **This handoff is closed.** The cutover ran 2026-11-14 (§9), all five
> OpenSpec changes are archived (§10), the `monorepo` branch was merged to
> `master`, and the pre-cutover volumes §3 and §9 call "retained" were
> retired later that same day after gated verification (§10, "6.7"). Read it
> as the historical record of the restructure; the pitfalls (P41–P68) and the
> "rules that exist because they were violated" (§7) are still live lessons.
> Sections below speak in the present tense of their writing moment.

**Written 2026-11-13.** Everything below lived on the then-unpushed
`monorepo` branch.

Read this with `07-decisions.md` (D150–D160) and `08-pitfalls.md` (P41–P50).
Those are authoritative; this file is the map.

**Updated 2026-11-14**, when `unified-auth` sections 1–5 and 8 landed, and
again when §9 (the cutover) and §10 (the close) were appended.

---

## 1. What this was

D135 (2026-11-08) reversed D42 and accepted a monorepo but recorded only the
reversal: *"repo layout, build/CI boundaries, and migration mechanics are an
open `/opsx:explore` + proposal, not decided here."* This is that work.

The operator's stated pain, verbatim: *"I have to deploy 5x each time and they
do belong together"*, *"configs are spread out and not of one standard"*, and
*"the problem is 6 claude code sessions"*.

Designed as **four sequenced OpenSpec changes**, each independently
deployable, in `openspec/changes/`:

| change | state | what it does |
|---|---|---|
| `monorepo-merge` | **40/45** | six repos → one. No behaviour change; the bar was "nothing changed" |
| `postgres-consolidation` | **35/38** | five Postgres clusters → one, five databases |
| `zone-isolation` | **35/37** | the two service splits, serve-before-migrate, the status page |
| `unified-auth` | **34/37** | sections 1–5 and 8 **done**: the gateway moved to `grind/`, the device-sync carve-out is gated and proven on a real handset, the operator plane is one `basic_auth` credential across seven zones, three auth implementations collapsed into `libs/`, and the service UIs moved to their prefix roots. Open: 6.1/6.2 (hover-translate, needs the extension) and 7.1 (optional, device-coordinated) |

Every remaining open task is annotated in its own `tasks.md` with *why* it is
open. They fall into exactly two buckets: **needs the VPS** or **needs the
phone**. Nothing is open because it was forgotten.

---

## 2. Operator decisions already made — do not re-litigate

| decision | where |
|---|---|
| Execution scoped to **this repository**; the production cutover is a runbook in `DEPLOY.md` §8 | `monorepo-merge/proposal.md` |
| The merge lands on an **unpushed `monorepo` branch**; `master` untouched | same |
| **phonexa's CI deleted in full**, Pages site included (`coden256.github.io/phonexa` stops being published) | same |
| **smia's `providers/` stays tracked in git** (3,858 files) so a clone gives a working smia | same |
| **One Postgres cluster** (option B), five databases, separate `.sql` dumps per service | `postgres-consolidation` |
| **`hover-translate` is NOT in the monorepo** — fork, standalone, never deployed | **D154** |
| Projects at the top level, `backup/` beside them (no `services/`, no `ops/`) | D150 |
| Config layered: shared → root `.env`, single-project → that project's `.env` | **D151** |
| `basic_auth` in the gateway, **not** a `vakt` service — auth must add no failure point | `unified-auth/design.md` |
| No logout button; the browser prompt is accepted | same |
| OpenSpec change ids are **bare slugs** — forced by tooling, the CLI rejects dated names | **D153** |

---

## 3. What is actually running right now

Eleven containers under project `tun`, on the consolidated cluster, with real
restored data. **Local runs need `-f compose.yaml -f compose.dev.yaml`** —
this host is rootless Docker and cannot bind port 80.

```
gateway   http://localhost:8080          postgres  127.0.0.1:5439
operator  Bearer testoperator  /  Cookie: operator_token=testoperator
gated     /phonexa/ and /shadow/ need  -u operator:testoperator
roles     tunadmin / testcluster ;  service roles testcluster_<db>
```

Row counts (the acceptance criterion for any later migration):

```
mjolnir  1,630   stabbur 16,593   smia 2,703,146   phonexa 3,610   shadow 2,742
```

**Retained deliberately, never to be removed by automation:**
`mjolnir_postgres_data`, `stabbur_stabbur-pg-data-17`, `smia_smia-pg-data`
(the pre-consolidation volumes, containers stopped), and the
`shadowing_media`/`shadowing_segments` copies still in the `phonexa` database.
They are the only rollback that does not involve the dumps.

---

## 4. The three zones (the spine of the whole design)

1. **Device plane** — `/ota/*`, `/blob/*`, `/audio-manifest/*` served off disk
   by the gateway with no process and no database in the path (D55), plus
   `/mjolnir/userdata/*` served by `mjolnir-sync`, its own process (D158).
   A frozen contract with an APK in the field that cannot be rolled back.
2. **Operator plane** — everything a human opens. One credential, enforced in
   the gateway.
3. **Internal** — service-to-service, never through the gateway.

**Proven, not assumed:** with the entire database cluster stopped, the device
gate still passes everything it can assert. With every application service
stopped, `/ota/*` still serves.

---

## 5. Where `unified-auth` stands, and the one hard constraint

Sections 1–5 are **done**. The gateway moved to `grind/` and every device
response was byte-compared before and after — bodies and
HTTP/Cache-Control/Content-Type/Content-Length headers identical, 401 and 405
unchanged, `ota-verify` the same 15/0/1. `grind/entrypoint.sh` derives the
bcrypt hash from `OPERATOR_TOKEN` at boot at cost 10, which retires P35 and
P36. `/mjolnir/userdata/*` is gated at the gateway in its own `handle` block
(compiled route index 6, ahead of the operator plane — and note that compiled
order is **not** file order: Caddy re-sorts `handle` blocks by matcher
specificity, which moves `/ota/*` from first in the file to index 9), proven
with a real GET+PATCH round trip from the handset. All seven operator zones
sit behind one `basic_auth`; `PHONEXA_AUTH_HASH` is deleted; the three
per-service auth modules are one shared check in `libs/` (D159, D160).

Three things were found by running it, all of the house's usual shape — the
failure reported success. **P48**: the device's `SYNC_TOKEN` is baked into the
JS bundle and is NOT read from `config.json`, so rotation needs a bundle
publish. **P49**: `handle_errors` was serving the full 7 KB status page, every
zone enumerated, to clients with no credential at all. **P50**: hub checked
auth twice, and deleting the module left the copy inside the
`/mjolnir/workbench` branch as the only gate — which returns first, so the
embedded workbench was open while the rest of the console correctly 401'd.
Section 5 also fixed a live defect: `https://coden256.dev/stabbur/` answered
401 even with a correct credential, because stabbur had no route at `/`.

**The constraint that dictates everything left.** The device's `SYNC_TOKEN` is
validated against `OPERATOR_AUTH_TOKEN` — the phone holds an operator
credential. So:

- rotating `OPERATOR_AUTH_TOKEN` **breaks device sync today**, and fixing it
  needs a **new OTA bundle publish** — the token is baked into the JS bundle
  and `config.json` cannot carry it (**P48**, verified 2026-11-14; this file
  previously said a `config.json` push, which was wrong);
- switching the operator plane to `basic_auth` breaks the phone **unless
  `/mjolnir/userdata/*` is gated separately first** — done, section 2.

Hence the ordering in `unified-auth/tasks.md`, which is a gate and not a
preference:

```
section 2   gate /mjolnir/userdata/* at the gateway on the CURRENT token value
            → the device sees no change at all
section 3   only then, operator plane → basic_auth           [done]
section 7   optional, later: give SYNC_TOKEN its own value — which needs an
            ASSEMBLE + PUBLISH, not a config.json push (P48)
```

Section 2's "before" capture was originally taken in `scratchpad/ua-baseline/`
— **a directory that is not in the tree and never was**, so the evidence for
the most dangerous change in the repo was not reproducible by anyone, its
author included. Replaced 2026-11-14 by a committed, regenerable capture:

```
docs/baselines/device-plane.txt     the capture, committed
bin/device-baseline.sh              regenerates it; diff before/after a
                                    gateway change, a zero diff is the proof
```

It covers the whole device plane, not just sync: `/ota/*` (401 / wrong-token
401 / 200 `no-store` / POST 405 **with the guard's own body**), the immutable
bundle headers, `/audio-manifest/*`, `/blob/<sha>`, and `/mjolnir/userdata/*`
— GET 200 with `_justCreated`, re-read without it, PATCH 200 with the six
status fields stripped, PUT 405, `%ff` **404 with an empty body** (P46), and
no-token **302 (not 401)**. That 302 is deliberate — `requireAuth` answers 401
only for paths containing `/api/`.

Two things it fixed by existing. The six stripped fields are
`deviceId`/`activeBuildId`/`pendingBuildId`/`audioCached`/`audioTotal`/
`lastFetchError` (from `mjolnir/sync/src/server.js`) — the first draft of the
probe guessed a *different* six and the capture showed every one of them
merged straight into the document. And its own header filter dropped every
HTTP status line, which the first generated file made obvious. It is
falsifiable: deleting the `@not_read` guard from the Caddyfile produces a
two-line diff (`body: method not allowed` → `body: <empty>`), restored by
putting the guard back. Volatile headers, timestamps and the uid are
normalised, and **no token is ever written into the file**.

---

## 6. What was found by running things, not reading them

Twelve new pitfalls, each a case where **the failure reported success**. This is
the recurring defect class here; expect the next one to look the same.

| | what |
|---|---|
| **P41** | `docker compose down -v` removes every volume the PROJECT **declares**, not the ones its containers mount. A harness that redirected only the volumes it used destroyed two real databases. |
| **P42** | Restoring a dump **as the superuser** leaves objects owned by it; the service then fails on migration *after* connecting fine. Restore **as the service role**. |
| **P43** | A `volumes:` key with only comments under it makes `docker compose config` **panic** with a Go stack trace naming no file. |
| **P44** | The mjolnir backup used `--exclude-table`, dropping the table **definition**, while `schema_migrations` still claimed those migrations ran. Right size, committed daily, **never restorable to a working state**. |
| **P45** | Readiness as a high-water mark: a service that lost its database kept reporting ready and leaked a 500. The same outage answered 503 or 500 by boot order alone. |
| **P46** | A JSON error body on the device path is **parsed as a document**. The shim calls `res.json()` with no status check — a 503 with a body resolved and handed mod 2080 `{error:…}` as userdata. Empty body now. |
| **P47** | Readiness detected only **reactively** is readiness nobody sees. A low-traffic service reported healthy straight through an outage. Now polls every 15s, and probes key on the status code. |
| **P48** | The device's `SYNC_TOKEN` is **baked into the JS bundle**, not read from `config.json` — D39's escape hatch is the OTA channel's. Two facts each written down in a different file and nowhere together, so the conclusion was invisible for as long as it existed. Rotation needs a publish. |
| **P49** | A site-wide `handle_errors` caught `basic_auth`'s 401 and served the **full status page** to unauthenticated clients — and rendered a wrong password as "this zone is not responding". Scope by status code, empty body; `WWW-Authenticate` survives. |
| **P50** | An auth check written **twice** can be half-removed, and the half that stays is the one that returns first. hub's workbench branch was left open by deleting the other copy. One check above every branch. |
| **P51** | A probe that reads an `immutable` route through a caching client is **unfalsifiable for as long as the `max-age`**. The handset check passed with **both radios off** — okhttp served `/audio-manifest/*` from its cache — and its header claimed to prove a token on a route that is deliberately unauthenticated. Probe from a client you control; say what a probe cannot prove. |
| **P52** | A verification script that follows a URL **out of the payload** verifies whatever the payload names, not the host under test. Six assertions, D49 among them, described `current.json`'s `url`. Also: the environment silently discarded in favour of `.env`, and a `405` assertion that could not detect its own deletion. |

Also fixed: both OTA scripts sourced a `.env` the restructure deleted, so the
documented device-acceptance command aborted before its first check;
`ota-verify` counted an **inverted** D53 assertion as a pass under
`ALLOW_HTTP=1`; and `check-standards.sh` was **fail-open** on its most
security-relevant check.

---

## 7. How to work on this

```sh
bash bin/check-standards.sh      # 0 = verified, 1 = violation, 2 = COULD NOT verify
openspec validate --changes      # all five must pass
openspec instructions apply --change unified-auth --json
docker compose -f compose.yaml -f compose.dev.yaml up -d
```

**Rules that exist because they were violated:**

- Never `-v` on a `down` that resolves the root compose file (P41).
- A verification harness must redirect **every volume in the rendered config**,
  asserted before starting anything — not the ones you remembered.
- Evidence must be the thing itself: a **restore**, not a dump file; a
  **query**, not the script that should have run; a **compiled** route order,
  not the file's line order; a real stop/start, not a claim about degradation.
- Never return a parseable body on a device-facing path (P46).
- `--exclude-table-data`, never `--exclude-table` (P44).

**Adversarial review earned its place.** Four independent reviewers refuted 23
of 65 claims, including a device risk introduced by the very fix meant to
improve safety (P46) and a migration that would have destroyed the shadow-split
rollback on the next deploy. Frame reviewers to *refute specific claims*, not
to "check the work".

---

## 8. Next steps, in order

*(Rewritten 2026-11-14. Sections 1–5 and 8 of `unified-auth` are done and the
2.5 device gate is cleared — 2.4 ran on the real handset.)*

1. **`unified-auth` 6.1/6.2 — hover-translate.** It still holds `smiaToken`
   and `stabburToken`; it needs one `operatorToken` sent to one origin.
   Blocked on the extension, which is **not in this repository** (D154), so it
   is a separate checkout and a browser. Until it is done the extension's
   capture and translation calls are the one client that cannot authenticate.
2. **The VPS runbook**, `DEPLOY.md` §8: record live volumes from running
   containers, verify a backup, stand down the old per-repo stacks, cut over.
   Read **§8.0a first** — the device's baked `SYNC_TOKEN` must equal the
   host's `OPERATOR_AUTH_TOKEN` at cutover, and the check is one `grep`.
3. **Do not rotate `OPERATOR_AUTH_TOKEN` casually.** It is the operator
   password *and* the phone's sync credential, and the phone's copy can only
   be changed by assembling and publishing a new bundle (**P48**). Root
   `DEPLOY.md` §4 carries the sequence.
4. Section 7 is optional and device-coordinated. Leave it.
5. The three remaining open tasks in `monorepo-merge`,
   `postgres-consolidation` and `zone-isolation` are all "needs the VPS" or
   "needs the phone"; each is annotated in its own `tasks.md`.

---

## 9. The cutover happened — 2026-11-14, production is the monorepo

Executed on `contabo` on operator instruction. Production now runs the
monorepo stack from `/root/tun` on the `monorepo` branch (`989f1c2d`).

### What is running

Eleven services, all healthy: `caddy` (as `grind`'s Caddyfile), `postgres`
(ONE cluster, five databases), `mjolnir-sync`, `mjolnir-hub`,
`mjolnir-builder`, `stabbur-backend`, `smia-backend`, `phonexa-backend`,
`shadow-backend`, `adminer`, `backup`.

### Proven, not assumed

```
ota-verify https://coden256.dev     16 passed, 0 failed - P1 path proven
                                    (16/16 over real TLS, incl. D49 gzip-sha256,
                                     which only runs on https)
/ota/current.json + real token      200, the live descriptor, cache-control: no-store
  sha256 ee240508...b411dd          IDENTICAL to the bundle on the handset
/ota/bundle/b000052.js  HEAD        200
handset, cache-busted, device shell 401 / 200 / 200 on ota / manifest / blob
TLS certificate                     notBefore Oct 26 - the ORIGINAL, not a reissue
seven operator zones                401 without a credential, 200 with
adminer                             401 - it was openly reachable before
```

Restore acceptance, per table and against the dump (not against an earlier
estimate):

```
mjolnir   15/15 tables, EXACT MATCH on every one, incl. build_jobs 55
          and job_logs 448 - the two that production's OWN backup had lost
stabbur   5 tables, 2,551 rows - exact
phonexa   11 tables, 4,365 rows - exact
smia      16 tables, 14,799,624 rows, restore exit 0, zero errors (16 -> 17)
shadow    created empty by design
```

### P44 is fixed in production

The new daily backup's `mjolnir.sql` has **15** `CREATE TABLE`, not 13. No
`--exclude-table=` remains anywhere. Five dumps are committed and pushed.

### 🔴 One data-safety finding, pre-existing, NOT fixed — operator decision

Production smia holds **~9 million rows the daily backup does not contain
and nothing can rebuild**:

```
nst_dialect       8,191,396 rows      corpus_sentence  3,023,040 rows
nst_lexicon         792,936 rows
```

`nst_dialect` and `nst_lexicon` are on `--exclude-table-data`, so the daily
`smia.sql` carries **zero** of their rows (verified: `grep -c "^COPY
public.nst_dialect"` → 0). The rationale for excluding them is that they are
rebuildable from `providers/` — and on production they are not:

```
providers/nbno/     nb_uttale_tillegg.zip, ordbank  (nb_uttale_leksika.zip ABSENT)
providers/leipzig/  EMPTY
```

So the only copy of those 9M rows is the pre-cutover dump:
`/root/pre-cutover/smia.sql.gz` (449 MB) and an off-host copy at
`~/tun-cutover-dumps/smia.sql.gz`. **Do not delete either** until this is
decided. The choice is the operator's: back those tables up daily (hundreds
of MB into a git commit), re-fetch the provider archives so the rebuild
claim becomes true, or accept them as disposable cache.

### Rollback

Nothing was destroyed. `docker compose stop` only; no `down`, never `-v`
(P41). All four pre-cutover volumes are retained and intact
(`mjolnir_postgres_data`, `stabbur_stabbur-pg-data-17`, `smia_smia-pg-data`,
`phonexa_postgres_data`), the old sibling checkouts are untouched at
`/root/{mjolnir,stabbur,smia,phonexa}`, `/root/mjolnir/data` still holds the
original 684 MB OTA payload (it was copied, not moved), and the old
per-instance database passwords are preserved in
`/root/pre-cutover/tun.env.backup`.

### Two things the cutover taught, worth keeping

1. **`docker compose up -d` silently reuses a stale image.** stabbur's image
   on the VPS was five days old; it ran the pre-merge auth, so `/_health`
   401'd and the container sat `unhealthy` with no error naming the cause.
   phonexa's had no `/_health` route at all (404). **`docker compose build`
   is a required cutover step, not an optimisation.** Recorded as P65.
2. **A long remote step must be detached.** `ssh … 'sh dump-all.sh'` was
   killed by the client timeout partway through, after it had already
   printed `ok` for two of four databases — so phonexa was never dumped and
   the output looked like progress. The same failure-reports-success shape as
   P41-P52, this time in my own harness. Verify artefacts file by file, never
   by reading a script's stdout.

---

## 10. Closed — 2026-11-14

All five OpenSpec changes are **archived**; `openspec list` reports no active
changes. `openspec validate --specs` → 9 passed, 0 failed.

```
openspec/changes/archive/2026-11-14-monorepo-merge
                         2026-11-14-postgres-consolidation
                         2026-11-14-zone-isolation
                         2026-11-14-unified-auth
                         2026-11-14-add-phonexa-to-stack
```

Archived with `--skip-specs` because the main specs were already synced by
hand to their newest state. That was not a convenience: replaying
`add-phonexa-to-stack`'s deltas at this point would have **regressed**
`unified-deployment` back to its sibling-checkout wording.

### The last three things, and why they were safe

**7.1 — the device credential.** Done by decoupling the VARIABLE, not the
value. The sync gate reads `{$SYNC_TOKEN}`, wired as
`${SYNC_TOKEN:-${OPERATOR_AUTH_TOKEN}}`, so an unset value keeps accepting
exactly what the installed APK sends. Proven on the compiled config:

```
OPERATOR_TOKEN=changeme                             -> sync accepts ['changeme']
OPERATOR_TOKEN=a-brand-new-rotated-operator-password -> sync accepts ['changeme']
```

The operator password is now rotatable on its own — the hazard P48 recorded
is gone — at zero device risk. **Still open by choice:** the device carries
the weak literal `changeme`. Changing that needs an assemble-and-publish to
the handset; the zero-downtime order is beside the matcher and in DEPLOY.md.

**6.7 — the old volumes.** Retired, 4.2 GB reclaimed, after three gates: the
new cluster had served production for hours, four dumps exist off-host, and
the *current* daily backup was RESTORED and compared per table. Four of the
eight removed were DEPLOY.md 8.0b's decoys, so the dump-the-wrong-volume
hazard is gone with them. The six live volumes were untouched — the script
refused to remove anything a container mounts.

**The backup now prunes a departed dump.** Removing smia from `DATABASES`
left a committed `smia.sql` behind: dated, plausible, and reading as a
current backup of a database nothing dumps any more. Same
failure-reports-success shape as P41–P68. The repo now holds exactly
`mjolnir.sql`, `stabbur.sql`, `phonexa.sql`, `shadow.sql`.

### Follow-ups, none blocking

| | |
|---|---|
| device token | `changeme` → a strong value; needs a bundle publish |
| operator password | now safely rotatable; still `changeme` until you rotate it |
| smia providers | two archives absent (`nb_uttale_leksika.zip`, `leipzig/`), so 9M rows are live but not re-importable from this repo |
| hub/builder tests | nondeterministic against one shared database; `hub/test/userdata.test.js` asserts a route that moved to `mjolnir-sync` |
| phonexa Pages | `coden256.github.io/phonexa` stops being published (CI deleted as instructed) |
