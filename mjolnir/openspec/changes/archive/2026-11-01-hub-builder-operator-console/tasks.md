## 0. Before you write any code — read this first

1. `tun/docs/13-operator-console-ux.md` **in full**, and the mockup it links
   to. Every page below is specified there; this task list implements it, it
   does not redesign it.
2. `tun/docs/07-decisions.md` **D93** — the occurrence-shipment-log design
   and exactly why it's per-occurrence, not per-card. Read this before
   touching `pipeline.js`.
3. The archived `p4-builder` change's `tasks.md` §6.2 — the mint/drain
   mechanics this change extends. Do not re-derive them.
4. `design.md` D-H1 through D-H6 in this change, in order — each names a
   real alternative that was considered and rejected; read the rejection
   before reaching for the rejected option yourself.

This change exposes operator endpoints publicly for the first time (D-H6).
Do not uncomment the Caddy routes in task 7 until the auth check in that same
task actually works — verify it, don't assume it.

## 1. `occurrence_shipments`

- [x] 1.1 Migration: `occurrence_shipments(id, card_id, letter, build_id,
      shipped_at)`, FK to `publications.build_id`.
- [x] 1.2 Reorder `runPublish`: compute `buildId` (via `nextBuildId`) before
      the mint/drain loop, not after. Confirm no other logic depended on the
      old ordering.
- [x] 1.3 Buffer `(cardId, letter)` pairs as they ship — both in
      `appendImmediateOccurrences`'s call sites and in `drainThenQueue`'s
      drain step — and write them to `occurrence_shipments` only after
      `publish()` succeeds, per D-H1. Do not write them inline during the
      mint/drain loop itself.
- [x] 1.4 Tests: a successful run records one shipment row per shipped
      occurrence, correctly tagged `A` or `E`; a run that fails after minting
      but before publish leaves zero shipment rows; a card minted in build X
      whose `E` drains in build Y has two shipment rows naming two different
      builds.

## 2. Cards browser

- [x] 2.1 `occurrencesForCard` / `cardsList` query layer: per card, join
      `card_slots` → `occurrence_shipments` (shipped sides + build) →
      `pending_occurrences` (queued sides + remaining) into one per-side
      status structure (D-H2's shared query shape).
- [x] 2.2 `hub/src/server.js`: `/hub/cards` page — search, deck filter,
      group-by-deck toggle, per-side status badges, link to the note's
      stabbur URL (construct client-side from the note id hub already has in
      its minted-note ledger — no new stabbur endpoint needed), link to
      grammar rule for `type=grammar` cards.
- [x] 2.3 Index `occurrence_shipments(card_id)` and
      `pending_occurrences(card_id)` for this query's sake.
- [x] 2.4 Tests: a card with one shipped + one pending side renders both
      independently; filtering by "a side pending" matches only such cards;
      stabbur being unreachable degrades only the note link, not the list.

## 3. Batch history

- [x] 3.1 `occurrencesForRun(pool, buildId | "forecast")` per D-H2 — the one
      function both the forecast and past-batch views call.
- [x] 3.2 `builder/src/pipeline.js`'s `runForecast`: rebuild its output
      around this function, split into "would ship" / "would queue" (per
      the modified `builder-pipeline` spec in this change).
- [x] 3.3 `builder/src/server.js`: rebuild the Forecast page's "card by
      card" section into the two-list shape; add the "Past batches"
      expandable panel underneath, reading `occurrencesForRun` with a real
      `buildId`.
- [x] 3.4 Tests: the modified forecast spec's two scenarios; a past batch
      with mixed new-mint and drained-queue occurrences shows both kinds,
      correctly attributed.

## 4. Scheduler config

- [x] 4.1 Migration: `builder_config(key TEXT PRIMARY KEY, value JSONB)`.
- [x] 4.2 `builder/src/clock.js`: read `builder_config`'s `schedule` key on
      every tick instead of a hardcoded interval; implement all three kinds
      (`daily`, `interval`, `manual`).
- [x] 4.3 `builder/src/server.js`: `/builder/schedule` page — radio group per
      the mockup, save writes `builder_config`.
- [x] 4.4 Tests: changing the config takes effect on the next tick with no
      restart; `manual` never triggers a run regardless of elapsed time.

## 5. Run log

- [x] 5.1 Migration: `job_logs(id, build_job_id, at, line)`.
- [x] 5.2 Thread an optional `log(line)` callback through `runPublish`'s
      existing checkpoints (pull, assign, mint, drain, regenerate, snapshot,
      publish). `server.js`'s callback inserts a row; a CLI/scheduled-run
      caller's callback can also print to stdout.
- [x] 5.3 `builder/src/server.js`: a job's detail view renders its
      `job_logs` rows in order.
- [x] 5.4 Test: a failed run's log shows every checkpoint reached before the
      failure, not just a terminal error line.

## 6. OTA console

- [x] 6.1 `hub/src/server.js`: `/hub/ota` page — drag-drop upload, prefilled
      editable label, calling `tool/src/otaPublish.js`'s existing guard
      functions directly (D-H5) — no new verification logic.
- [x] 6.2 Build-history table: set-current, edit label, delete — each a
      thin handler over `publications`/`ota-publish-module`'s existing
      functions.
- [x] 6.3 "Inspect" link on each build, pointed at `bundle-tool ui`
      (bundle-workbench) rather than a new inspector.
- [x] 6.4 Tests: submitting an invalid bundle (bad magic prefix, charset
      violation, reuse-with-different-bytes) is rejected with the same
      messages the CLI already produces; set-as-current correctly repoints
      `current.json`.

## 7. Deployable for real

- [x] 7.1 `hub/Dockerfile`, `builder/Dockerfile` — Node runtime, matching
      `D92`'s existing `mjolnir-node` container's base image for
      consistency.
- [x] 7.2 Add both as services in `compose.yaml` (coordinate with the
      parallel `tun` deployment-unification proposal on exact service
      naming, since that proposal's `include:` will pull this file in
      verbatim).
- [x] 7.3 **Auth check first**: implement the D-H6 shared-bearer-token
      middleware on both `hub`'s and `builder`'s operator routes, copying
      `stabbur`'s/`smia`'s existing `auth.py` pattern's shape (D-N1) — a
      Node equivalent, same behavior.
- [x] 7.4 **Only after 7.3 is verified working**: uncomment the
      `/mjolnir/*` and `/builder/*` `reverse_proxy` blocks in
      `caddy/Caddyfile`.
- [x] 7.5 Record the D-H6 auth decision as its own ADR in
      `tun/docs/07-decisions.md`, per design.md's Open Questions — this is a
      security-relevant reversal of D90's stated precondition, not a quiet
      implementation detail.

## 8. Integration and sign-off

- [x] 8.1 Full regression pass: `pipeline.test.js`, `eligibility.test.js`,
      `projector.test.js` after the §1 reordering and the modified forecast
      shape.
- [x] 8.2 End-to-end: publish a real batch, confirm it appears correctly in
      Cards, in the Forecast's past-batches, and that a subsequent drain (a
      later publish) correctly attributes the drained `E` to the *later*
      build, not the original mint build.
- [x] 8.3 Deploy against `mjolnir`'s own standalone `compose.yaml` first;
      re-verify against `tun`'s unified compose once that proposal lands.
- [x] 8.4 Record any real divergence found during implementation as an ADR
      amendment in `tun/docs/07-decisions.md` — this project's established
      practice (D65, D71, D72, D86, D89), not optional.
