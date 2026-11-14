## Context

Read in this order:

1. `tun/docs/13-operator-console-ux.md` — the UX direction this change
   implements, and the mockup it's built from. Read it in full before
   writing any page; it already resolved most of the shape questions.
2. `tun/docs/07-decisions.md`, **D93** specifically — the occurrence-level
   shipment log is the one genuinely new piece of data model in this change,
   and D93 explains exactly why a card-level column doesn't work.
3. The archived `p4-builder` change (`openspec/changes/archive/
   2026-10-25-p4-builder/`) — `pipeline.js`, `pendingOccurrences.js`,
   `mint.js` are what this change extends, not replaces. Read `tasks.md`
   §6.2 there for the drain/mint mechanics in full before touching them.
4. `tun/docs/09-open-questions.md` and D90 — locking and auth on the
   operator endpoints were explicitly declined *while they weren't exposed*.
   This change exposes them. D90's precondition changes; its conclusion
   should be revisited here, not silently carried forward.

## Goals / Non-Goals

**Goals:**
- Every page in `13-operator-console-ux.md`'s mockup, built against real
  data.
- A correct, queryable record of which build shipped which side of which
  card — the thing that was actually missing, not just unsurfaced.
- `hub`/`builder` genuinely deployable: images, compose entries, reachable
  routes.
- A bare but real auth check on both operator UIs, now that they're exposed.

**Non-Goals:**
- Changing `notes-schema`/`blob-storage`/anything in `stabbur` — this
  change only *links to* stabbur's UI, never calls its API from a new
  surface.
- Multi-operator concurrency/locking — D90's "single operator, low
  realistic concurrency" reasoning still holds; only its "not exposed yet"
  half changes here.
- The deployment unification itself (`include:`, sibling checkout, `tun`'s
  own compose file) — that's the parallel `tun` proposal. This change
  assumes `hub`/`builder` have a `Dockerfile` and a `compose.yaml` entry to
  land in, built here, but the top-level orchestration lives there.

## Decisions

### D-H1 — `occurrence_shipments` is append-only, written at the point of truth

```sql
CREATE TABLE occurrence_shipments (
  id          SERIAL PRIMARY KEY,
  card_id     TEXT NOT NULL,
  letter      TEXT NOT NULL,
  build_id    TEXT NOT NULL REFERENCES publications(build_id),
  shipped_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

Written in exactly two places, both already in `pipeline.js`:
- **Mint path** (`appendImmediateOccurrences`): right after `addOccurrence`
  for an immediate letter, insert `(cardId, letter, buildId)`.
- **Drain path** (`drainThenQueue`): right after `addOccurrence` for a
  drained letter, insert `(cardId, letter, buildId)`.

Both happen inside the same `runPublish` call that already knows the
`buildId` it's about to publish as (computed via `nextBuildId` before the
mint/drain loop runs, not after — a small reordering: today `nextBuildId` is
called near the end, after mint/drain; this change needs it known before, so
every shipment row can carry the id of the build it's actually shipping in).
**Not written speculatively** — if the run fails before `publish()` succeeds,
these rows would name a `build_id` that was never actually published. Two
options: write them only after `publish()` succeeds (requires buffering the
`(card, letter)` pairs through the whole function, same shape as the
existing `decksMinted` accumulator), or write them inline and accept that a
failed run leaves orphan rows naming a never-published build. **Buffer and
write after `publish()` succeeds** — matches how `publications` itself is
only written on success, and avoids ever representing "shipped" for
something that didn't ship.

### D-H2 — the forecast and batch-history pages are both downstream of one query shape

```
occurrencesForRun(pool, buildId | "forecast"):
  returns [{cardId, letter, deckCode, noteId, noteText, kind: "ship" | "queue"}]
```

For a real/forecast run, `kind` comes from `splitOccurrences` (already
exists). For a past build, it's a straight read of `occurrence_shipments
WHERE build_id = $1` (`kind` is always `"ship"` there — queuing isn't a
shipment). One function, three callers: the forecast page, the "would
publish" preview, and a past-batch's expand-to-detail. Mirrors D-P5's
original "one implementation, multiple call sites" principle from
`p4-builder`'s own design — this change extends that pattern rather than
introducing a new one.

### D-H3 — scheduler config, minimal shape

```sql
CREATE TABLE builder_config (
  key    TEXT PRIMARY KEY,   -- 'schedule'
  value  JSONB NOT NULL      -- {"kind": "daily", "at": "02:00"}
                              -- | {"kind": "interval", "hours": 6}
                              -- | {"kind": "manual"}
);
```

Single row, single key, read by `clock.js` on every tick (cheap — one row,
no caching needed for a solo-operator scale). `clock.js`'s own interval
timer still runs every few minutes regardless; what changes is whether that
tick's check says "run now" based on the stored config instead of a
hardcoded constant.

### D-H4 — `job_logs`, not a real log shipper

```sql
CREATE TABLE job_logs (
  id              SERIAL PRIMARY KEY,
  build_job_id    INTEGER NOT NULL REFERENCES build_jobs(id),
  at              TIMESTAMPTZ NOT NULL DEFAULT now(),
  line            TEXT NOT NULL
);
```

`runPublish` takes an optional `log(line)` callback, called at each of its
existing narration points (pull, assign, mint, drain, regenerate, snapshot,
publish) — the exact same checkpoints `12-p2-results.md`-style narration
already uses in code comments, just now also persisted. `server.js` passes a
callback that inserts a row; the CLI/scheduled-run path can pass one that
also prints to stdout, so nothing is lost for an operator tailing a
container's logs directly.

### D-H5 — OTA console reuses the shared guards exactly, adds nothing new to them

The drag-drop submit handler in `hub/src/server.js` calls
`tool/src/otaPublish.js`'s existing exported functions directly (same import
`builder` already uses, per D76) — it does not reimplement buildId
validation, reuse detection, or the magic-prefix check. "Verification runs
automatically on drop" is simply calling those same checks before enabling
the Publish button, not a new verification pipeline.

### D-H6 — auth, revisited now that D90's precondition changes

D90 explicitly declined auth "because the endpoints are not yet wired into
Caddy." This change wires them. The minimal honest answer: a single shared
bearer token (same shape as `stabbur`'s/`smia`'s existing `auth.py` pattern —
D-N1), checked on every route except whatever the UI's own login/token-entry
page needs to be reachable unauthenticated. Not a new design — copying the
pattern already proven twice in this ecosystem.

## Risks / Trade-offs

- **Reordering `nextBuildId` to before the mint/drain loop** (D-H1) touches
  code with existing, passing tests (`pipeline.test.js`). → Re-run the full
  suite after the move; the function's own behavior doesn't change, only
  when it's called.
- **`occurrence_shipments` growing unboundedly** — every occurrence, forever,
  one row each. At this project's actual scale (thousands of cards, two
  occurrences each, over years) this is a few hundred thousand rows at most
  — not a real problem, not worth pre-optimizing.
- **The Cards page's per-side status query** (join `card_slots` →
  `occurrence_shipments` → `pending_occurrences` to know "shipped in X" vs
  "queued, N to go" per side) could get slow as the card count grows. →
  Index `occurrence_shipments(card_id)` and `pending_occurrences(card_id)`;
  revisit only if it's actually slow at real scale, not speculatively.
- **Exposing operator endpoints publicly for the first time** (D-H6) is the
  one genuinely new risk this change introduces that didn't exist before —
  get the auth check in before the Caddy routes go live, not after, even in
  a dev/staging pass.

## Migration Plan

1. `occurrence_shipments` + the `nextBuildId` reorder + the mint/drain write
   integration, with tests, before any UI work — this is the correctness
   fix, independent of anything visual.
2. `builder_config` + `clock.js`'s dynamic read, independently testable.
3. `job_logs` + the `log()` callback threading.
4. UI pages, built against the above once each is real: Cards, Batches,
   Schedule, Run log, OTA console — in roughly that order, since Cards and
   Batches are what actually needed the schema work.
5. `Dockerfile`s + `compose.yaml` entries + Caddy routes + the auth check,
   together, last — don't expose the routes before the auth check exists.

## Open Questions

- Should `job_logs` ever be pruned (keep last N jobs' logs), or is "grows
  forever, it's text, it's cheap" fine indefinitely for this scale? Lean
  toward no pruning until it's ever actually a problem.
- Does the bare shared-token auth from D-H6 need its own ADR, given it's a
  security-relevant decision reversing D90's stated precondition? Recommend
  yes — record it when implemented, not deferred.
