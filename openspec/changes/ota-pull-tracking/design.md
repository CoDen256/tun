## Context

`/ota/*` is served off disk by the gateway: `handle /ota/* { ... root * /srv;
file_server }`, token-gated and GET-only, with no process and no database in the
path. That property is load-bearing (D158, `docs/11-ota-contract.md`) — studying
must not depend on hub, builder or Postgres being up.

Nothing records that a bundle was fetched. `device_state` tried to learn it from
the device and was dropped in `015_drop_device_state.sql` because the client half
was never built: the table sat permanently empty. Re-attempting that approach
means a JS patch, an assembled bundle, a publish, and then waiting for the phone
to pull the very build that teaches it to report — the data starts at zero and
nothing historical is recoverable.

The gateway, meanwhile, has seen every one of those downloads already and thrown
the information away: its only logger writes `format console` to stdout.

## Goals / Non-Goals

**Goals:**
- Know which published build was downloaded, and when, with no device work.
- Keep the record after the gateway's log file rolls away.
- Show it where it is useful, without pretending it is something it is not.

**Non-Goals:**
- Knowing what is *active* on the handset. That needs the device to report, it
  is the thing that was already declined, and this change must not quietly grow
  into it. The boot watchdog (D08) can quarantine a perfectly downloaded bundle;
  a download is evidence of a download.
- Device or account identity. The OTA token is shared and the gateway sees an
  address. No row here is per-device, and the UI must not imply otherwise.
- Tracking `current.json` polls, `/blob/*` or `/audio-manifest/*`. Deliberately
  scoped out: the ask was which bundle was pulled and when.
- Touching `/mjolnir/builder/*`. The Builder UI rehaul package owns those files
  in this same batch.

## Decisions

### Caddy writes one subset to its own file — VERIFIED, not assumed

This is the load-bearing technical claim, so it was tested live against
`caddy:2-alpine` **v2.11.7** (the image the stack actually runs) rather than
reasoned from documentation. The working construction:

```
	log otapulls {
		output file /var/log/ota/pulls.log
		format json
	}
	log site {
		output stdout
		format console
	}

	handle /ota/bundle/* {
		log_name otapulls
		...
	}
```

Measured: three requests (`/ota/bundle/b000247.js`, `/ota/current.json`,
`/stabbur/`) produced exactly **one** line in `pulls.log` — the bundle — and
**two** `handled request` lines on stdout. That is the required behaviour.

**Two traps were found doing this, and both are silent:**

1. **The LAST-declared named logger becomes the site's default logger.**
   Confirmed by reading `default_logger_name` out of the adapted JSON for both
   orderings:

   | declaration order | `srv0.logs.default_logger_name` |
   |---|---|
   | `otapulls` first, `site` second | `site` ✅ |
   | `site` first, `otapulls` second | `otapulls` ❌ |

   In the wrong order, **every request in the entire stack** — all seven zones —
   is written to the OTA pull log and the console log goes completely dark. The
   first probe did exactly this: all three test requests landed in `pulls.log`
   and stdout received nothing. Nothing errors; the gateway starts and serves
   normally. So `otapulls` MUST be declared before the general site logger, and
   the ordering needs a comment saying why, in the file, next to the blocks.

2. **`default` is a reserved logger name.** `log default { ... }` alongside a
   second named logger fails at startup with *"when both include and exclude are
   populated, each element must be a superspace or subspace of one in the
   other"* — the container exits 1 after printing "adapted config to JSON", which
   looks like a successful start if you only read the first four log lines. The
   general logger must be given some other name.

Re-verify both with `caddy adapt --adapter caddyfile` and a live request, never
by reading the file top to bottom — the same rule this Caddyfile already states
about compiled route order (P56).

### Scoping by `handle`, not by matcher on the log block

`log_name` sits inside the existing `handle /ota/*` block, matched to
`/ota/bundle/*`. It adds a `vars` handler to the route, not a check to the
response path: no I/O happens before the file is served, and Caddy's logging is
post-response. The `/ota/*` block keeps its `root` + `file_server` shape exactly
— the token gate, the GET-only gate, both `Cache-Control` headers and the
absence of `precompressed` (D49) are untouched.

### Log file: a volume the gateway writes and hub reads read-only

A named volume mounted writable at the gateway and **read-only** into hub.
Read-only is the point: the ingester must not be able to truncate, rotate or
delete the gateway's log, and a bug in hub must not be able to affect the device
plane's host filesystem.

Caddy's `output file` rolls by default. The builder sets `roll_size`,
`roll_keep` and `roll_keep_for` explicitly rather than inheriting defaults,
because the whole durability argument depends on knowing how much history the
file is guaranteed to hold between ingests.

**A full or unwritable volume must not break bundle serving.** Caddy's logging
is not in the response path, so this holds by construction — but it is in the
spec as a scenario because it is the thing that would make this change
unacceptable, and it must be observed, not assumed.

### `ota_pulls`: the table is the record, the log is transport

```
CREATE TABLE ota_pulls (
  id         SERIAL PRIMARY KEY,
  build_id   TEXT NOT NULL,
  at         TIMESTAMPTZ NOT NULL,
  remote_ip  TEXT NOT NULL,
  status     INTEGER NOT NULL,
  bytes      BIGINT NOT NULL,
  UNIQUE (at, build_id, remote_ip)
);
```

The unique constraint is what makes ingestion idempotent: ingest re-reads
whatever the log currently holds and inserts `ON CONFLICT DO NOTHING`. No
byte-offset bookkeeping, nothing to corrupt, and nothing to get wrong across a
rotation — the expensive-but-correct option, chosen because the volume is a
handful of rows per week.

`build_id` is **not** a foreign key to `publications`. A pull can legitimately
name a build id that no `publications` row has (a build deleted from the
console, or a request for a path that was never a real build), and a foreign key
would turn that into an ingest failure instead of a row the operator can see.
The display LEFT JOINs.

`at` comes from Caddy's `ts`, which is a float epoch — the ingester converts it;
it must not store the raw float, or every comparison in the UI becomes a
conversion.

`build_id` is parsed out of the request URI (`/ota/bundle/<buildId>.js`) and
MUST be validated against the contract's own `^[A-Za-z0-9._-]{1,64}$` (D48). A
URI that does not match is a skipped, counted line — not a row.

### Ingestion trigger: on page load, with a floor

Ingest runs when the Pulls page is requested, skipped if it ran within the last
minute. No scheduler, no background loop, and the data is current exactly when
someone is looking at it. The read is bounded by the roll size, and `ON
CONFLICT DO NOTHING` makes the repeat cost a few index probes.

If the log file is missing entirely — a fresh stack, or the volume not yet
mounted — that is a **state the page reports**, not an error it throws. "No
pull log found" and "no pulls recorded" are different sentences and the page
must not collapse them.

### UI: a dedicated page, not a panel on Sync

`/mjolnir/device/pulls`, a third item in the Device rail group. The deciding
argument is that **everything on the Sync page is account-scoped** — it opens
with a uid selector that governs every panel — and pull data has no account
dimension at all. A pulls panel on that page has to carry a disclaimer that it
ignores the selector directly above it, which is a sign the data does not belong
there. The dedicated page also has room for the never-pulled rows and the
failed-download entries, which are the two things most worth seeing.

### Insulation from the versioning rethink

The Builder UI rehaul package builds first and changes how bundle/data versions
are labelled, adding build time. This change stores and joins on `build_id`
only — a permanent primary key, filename-validated, frozen by D26/D48 — and
reads the human label from `publications` for display as a secondary line. The
label can change shape freely; no stored row and no join is affected.

### "Never pulled" vs "pulled before we were looking"

Recording starts the day this ships. Every build published before that has no
rows and would render identically to a build the phone genuinely ignored — a
false statement made confidently, which is the exact defect class this
ecosystem keeps producing. The page must either distinguish the two (the
earliest ingested record's timestamp is the boundary: no record can exist
before it) or state plainly that no data exists before that point.

## Risks / Trade-offs

- **Downloads, not activations.** The central limitation. A bundle can be
  downloaded and then quarantined by the boot watchdog, and this view will
  happily show a pull for a build that never ran. Mitigated only by saying so
  in the UI. If the operator later wants activation truth, that is the declined
  device-reporting work, as a separate change.
- **An address is not a device.** With one handset this is nearly a distinction
  without a difference, right up until the operator `curl`s a bundle from a
  laptop and it appears as a pull. The log records the address; the UI must not
  translate that into a device.
- **The gateway Caddyfile is the highest-blast-radius file in the stack.** A
  mistake in the logger ordering silently disables all gateway logging; a
  mistake in the `handle` block could affect the device plane. Hence the two
  verified traps above, and an acceptance criterion that diffs a real bundle
  response byte for byte.
- **Log loss between ingests is real.** If more bundle downloads occur between
  two ingests than the roll settings retain, records are lost with nothing
  reporting it. At one device and one bundle per publish this is not a plausible
  volume, but the roll settings must be set explicitly so the bound is known
  rather than inherited.
