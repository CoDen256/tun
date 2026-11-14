# The monorepo restructure — session handoff

**Written 2026-11-13.** Everything below lives on the **unpushed `monorepo`
branch**. `master` still has the pre-merge layout. Nothing has been pushed to
any remote.

Read this with `07-decisions.md` (D150–D158) and `08-pitfalls.md` (P41–P47).
Those are authoritative; this file is the map.

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
| `unified-auth` | **6/37** | gateway **moved** to `grind/` (done); operator auth collapsing to one credential (open) |

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

Section 1 is **done**: the gateway moved to `grind/`, and every device
response was byte-compared before and after — bodies and
HTTP/Cache-Control/Content-Type/Content-Length headers identical, 401 and 405
unchanged, `ota-verify` the same 15/0/1. `grind/entrypoint.sh` derives the
bcrypt hash from `OPERATOR_TOKEN` at boot, which retires P35 and P36.

**The constraint that dictates everything left.** The device's `SYNC_TOKEN` is
validated against `OPERATOR_AUTH_TOKEN` — the phone holds an operator
credential. So:

- rotating `OPERATOR_AUTH_TOKEN` **breaks device sync today**;
- switching the operator plane to `basic_auth` breaks the phone **unless
  `/mjolnir/userdata/*` is gated separately first**.

Hence the ordering in `unified-auth/tasks.md`, which is a gate and not a
preference:

```
section 2   gate /mjolnir/userdata/* at the gateway on the CURRENT token value
            → the device sees no change at all
section 3   only then, operator plane → basic_auth
section 7   optional, later: give SYNC_TOKEN its own value via config.json (D39)
```

Section 2's "before" capture is already taken (`scratchpad/ua-baseline/`):
GET 200 with `_justCreated`, re-read without it, PATCH 200 with the six status
fields stripped, PUT 405, no-token **302 (not 401)**. That 302 is deliberate —
`requireAuth` answers 401 only for paths containing `/api/`.

---

## 6. What was found by running things, not reading them

Seven new pitfalls, each a case where **the failure reported success**. This is
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

1. **`unified-auth` section 2** — gate `/mjolnir/userdata/*` at the gateway on
   the current token value, replay the captured baseline, and do not touch
   section 3 until it matches.
2. Sections 3–5 — `basic_auth`, one auth check per service from `libs/`, and
   move the service UIs from `/ui` to the prefix root (which also fixes a live
   401 on `https://coden256.dev/stabbur/`).
3. Section 7 is optional and device-coordinated. Leave it.
4. **Then the VPS runbook**, `DEPLOY.md` §8: record live volumes from running
   containers, verify a backup, stand down the old per-repo stacks, cut over.
5. Rotating `OPERATOR_AUTH_TOKEN` requires a `config.json` push until §7 is
   done. This is written into `DEPLOY.md`; do not forget it.
