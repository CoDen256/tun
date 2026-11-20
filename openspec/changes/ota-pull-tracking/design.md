# Design — ota-pull-tracking

## 1. The gateway is the only observation point, and why that is settled

`/ota/*` is a `handle` block containing a token gate, a GET-only gate, two
`Cache-Control` headers, `root * /srv` and `file_server`. No process, no
database, no application code. The device plane is frozen
(`docs/11-ota-contract.md`): there is an APK in the field that cannot be rolled
back.

The alternative — the device reporting what it has — **was already built and
removed**. D126 is unusually valuable here because it records a failure of
exactly the design one would otherwise propose: `device_state` was correctly
implemented, correctly tested, and permanently empty, because the client never
attached the fields and the server's write path early-returned when they were
absent. The lesson is not "the implementation was bad" but "a design that
depends on the frozen device reporting something new cannot be delivered".

So pulls are observed where they are already visible: in the gateway's own
access log. Logging is **post-response** and adds no I/O before the file is
served.

## 2. Two traps, verified live, both silent

Checked against `caddy:2-alpine` v2.11.7 by adapting the config and issuing
real requests — not by reading documentation.

**Trap 1 — the LAST-declared named logger becomes the site default.**
Read out of `srv0.logs.default_logger_name` in the adapted JSON:

| declaration order | `default_logger_name` |
|---|---|
| the OTA logger first, the general site logger second | the site logger ✅ |
| the site logger first, the OTA logger second | the OTA logger ❌ |

In the wrong order **every request in all seven zones** is written to the OTA
pull log and stdout goes completely dark. Nothing errors; the gateway starts
and serves normally. The first probe did exactly this. The OTA logger must
therefore be declared **before** the general site logger, with a comment in the
file saying why.

**Trap 2 — `default` is a reserved logger name.** `log default { … }` alongside
a second named logger fails at startup with *"when both include and exclude are
populated, each element must be a superspace or subspace of one in the other"*,
and the container **exits 1 after printing "adapted config to JSON"** — which
looks like a successful boot if you read only the first few lines. The general
logger must be given some other name.

Re-verify both with `caddy adapt --adapter caddyfile` plus a live request, never
by reading the file top to bottom. That is the same rule this Caddyfile already
states about compiled route order, after it was wrong by five routes (P56).

## 3. Scoping by the existing handle block

The log-name directive sits **inside** the existing `handle /ota/*` block. It
adds a variable-setting handler to the route, not a check on the response path.
The block keeps its shape exactly: the token gate, the GET-only gate, both
`Cache-Control` headers, and the deliberate absence of `precompressed` (D49
requires transport-level gzip only, so the body the native code hashes is always
the uncompressed bundle).

Nothing in the response changes. The acceptance criteria carry a byte-for-byte
comparison of a device-facing response before and after, so this is verified
rather than asserted.

## 4. The two event kinds mean different things

| kind | path | volume | what it proves |
|---|---|---|---|
| bundle download | `/ota/bundle/*` | low | this build's bytes were served |
| `current.json` poll | `/ota/current.json` | high | a device was alive and checking |

Keeping both was the operator's decision, and the poll stream is valuable for
one specific reason: it is the **only liveness signal left** after `device_state`
was dropped. But polls outnumber pulls by a large factor, so the design
constraint is that **the noisy kind must not drown the meaningful one**. Hence:
bundle rows dominate visually, consecutive successful polls collapse into one
expandable row, and **non-200 outcomes never collapse** — a 401 scan or a 404
for a deleted build must stay visible.

## 5. What the record cannot know, and must therefore not imply

Three limits, all of which must be visible in the UI rather than discovered:

1. **No device identity.** The gateway sees a source IP. The OTA token is
   shared, so there is no account, uid or handset on these rows. A home
   connection also means one IP dominates and may change.
2. **A download is not an activation.** The native boot watchdog (D08) can
   quarantine a bundle that was fetched perfectly. "Pulled" must never be
   rendered as "running on the phone".
3. **A poll carries no build id.** The log records a request, not a body, so a
   poll says a device checked — not what it decided.

## 6. The log file is a transport; the table is the record

A named volume, writable by the gateway and mounted **read-only** into hub.
Caddy rotates the log, so the file is not a durable record. Ingest must be
**idempotent** — a dedup key over the event's identifying fields — so that
re-reading the whole file inserts nothing twice, and so the table survives
rotation and container restarts.

Ingest lives in hub because the pull data is about build ids that only hub
knows, and hub already owns the `mjolnir` schema and its migrations (one service
owns each database's schema; hub's migrate holds an advisory lock across the
run, after a second instance raced itself — P58).

`ota_pulls` keys on `build_id` alone. That is a permanent primary key frozen by
the OTA contract, so it is insulated from anything the versioning work changed
about human labels; the label is rendered as a secondary line read from
`publications`.

## 7. Why Logic bundles gets no columns

A pull is recorded against a **published** `buildId`. A `logic_bundles` row is a
build *input* that the device never fetches. Adding the columns there would put
a permanently blank cell next to something that is not pullable, and a blank
"times pulled" reads as "never pulled". The columns go on Publish history,
where every row is a thing the device could actually have taken.

## 8. Never-pulled is two different states

The distinction the mockup makes, and the reason it matters:

- **Current and never fetched** — published, still current, no pull. This is a
  *problem*: the operator published and the phone has not taken it. Flagged
  prominently.
- **Superseded before it could be** — published, then replaced minutes later. A
  zero here is *expected* and means nothing. Rendered quietly.

Collapsing these into one "never pulled" state would train the operator to
ignore the one that matters.

## 9. Retention

`ota_pulls` is small — a year of bundle pulls plus polls is on the order of a
few megabytes — so it is dumped with the rest of the `mjolnir` database rather
than excluded. If polls ever make it large, that is a backlog item; it should
not be pre-emptively excluded, because an excluded table with no source is the
trap `bin/_check_backup_sources.py` exists to catch.

## 10. Mockup

`mockups/device-pulls.html`, Pulls and Publish history surfaces — accepted by
the operator on the first pass, including the argument in §7. (The file's third
surface belongs to `userdata-git-history`; it is kept whole so the shared
chrome stays one reference.)
