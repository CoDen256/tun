# The operator console: UX direction and the deployment it runs on

This documents a single design session (2026-10-25) that settled how the
whole ecosystem gets deployed and operated day to day, once more than one
service exists. It supersedes nothing — D74–D92 are all still correct — it's
the next layer: now that `p4-builder`/`p4-notes` are built, how do you
actually *run* this without typing shell commands, and what does "look at it
and know it's working" look like for each piece?

**Mockup** (static, no live data, built for sign-off before any of the
proposals below were written): https://claude.ai/code/artifact/8089939e-7648-4234-8537-c3dd2eb0d09c
— operator-only, not meant for public sharing. Read it alongside this doc —
the doc explains the *why*, the mockup shows the *what*.

## Deployment: one repository, one `docker compose up`

**Amended by D150 (2026-11-13).** The conclusion of this session — one
`git pull`, one `docker compose up`, `include:` as the composition mechanism,
one shared Adminer, `compose.yaml` as the canonical filename — all still
holds. What changed is that the three (then five) *sibling checkouts* it was
built on are gone: the ecosystem is one repository with each former repo as a
top-level directory. The original text is corrected in place below rather than
left readable as if it were still true.

```
tun/                 ← the ONLY thing ever `git pull`ed + `docker compose up`'d
  mjolnir/           ← a directory, not a sibling checkout; still runs standalone
  stabbur/           ← same
  smia/  phonexa/    ← same
```

- **One repository** (D150, giving D135 its design), not sibling checkouts,
  not submodules. *This reverses this session's "not a monorepo" sentence; the
  reasons are in D150 — five `git pull`s per deploy, configuration duplicated
  across five `.env` files, and one Claude Code session per repo.*
- **`include:` survives the merge, and is now in-repo.** The root
  `compose.yaml` uses Compose's native `include:` to pull in
  `./mjolnir/compose.yaml`, `./stabbur/compose.yaml`, `./smia/compose.yaml`
  and `./phonexa/compose.yaml` as one project. Each included file stays fully
  usable on its own (`cd mjolnir && docker compose up` still works for local
  dev) — `include:` only adds a second way to start them, it doesn't take away
  the first. That property is why `include:` was kept rather than flattened
  into a single root file.
- **The shared network no longer needs wiring at all.** This section used to
  describe "one shared network" as something `include:` gave us; in practice
  it took a `tun-shared` network declared `external: true` in four files plus
  a one-time `docker network create` on every host (D98/D104). One repository
  is one Compose project is one default network, so that apparatus is deleted
  outright: service-name DNS resolution across the include boundary now needs
  no configuration and no setup step.
- **Caddy stays in `mjolnir/`** — but no longer because "it is not a
  cross-service front door". It *is* one now: `/stabbur/*`, `/smia/*`,
  `/phonexa/*`, `/mjolnir`, `/builder` and `/adminer` are live routes, not the
  unused placeholders this session found (D119, D147, D149). It stays in
  `mjolnir/` only because moving it is the `zone-isolation` change's job,
  which relocates it to `grind/`. *(Done 2026-11-14, by `unified-auth` §1
  rather than `zone-isolation`: the gateway is `grind/caddy/Caddyfile` now.)*
- **Consistent naming**: every compose file is named `compose.yaml` (the
  modern canonical name). Done — `stabbur/docker-compose.yml` and, last,
  `smia/compose.yml` were both renamed.
- **One `adminer`**, defined in the root `compose.yaml`, pointed at every
  project's Postgres (`mjolnir-postgres`, `stabbur-postgres`,
  `smia-postgres`, `phonexa-postgres`) via Adminer's native server picker —
  not one Adminer container per database. Two refinements since: it is now
  published on `127.0.0.1:8082` only and never publicly (D152), while the
  gateway also routes `/adminer/*` to it — with **no** auth of its own, as
  the Caddyfile says explicitly: the operator token gates hub and builder,
  not this route, so reaching it still needs database credentials; and phonexa's own development
  Adminer sits behind a `dev` profile so this stays the only one that runs
  (D147). There are still four Postgres instances — one shared cluster of four
  databases is the planned `postgres-consolidation` change, not done.
  *(Both halves corrected 2026-11-14: `/adminer/*` is gated by the same
  `basic_auth` as every operator zone — `unified-auth` 3.1 closed what was an
  openly reachable database tool — and the four instances are ONE Postgres 17
  cluster of five databases, D155.)*

### What "no shell commands" actually requires

Two different things get called "setup," and only one of them is safe to run
automatically:

- **Migrations** (building/updating a database's tables) run automatically,
  always, on every container boot — check which steps haven't been applied
  yet, apply exactly those. A fresh database becomes ready with zero manual
  steps; pulling newer code with new migrations applies the new steps on the
  next restart.
- **Seeding** (putting starting rows into those tables) splits in two:
  - **Fixed catalog data** — the 10 decks (`C20`–`C29`) — auto-seeds, every
    boot, because it's idempotent ("make sure these 10 rows exist" is always
    harmless to re-run).
  - **Sample/test content** — `stabbur`'s `scripts/seed_p4_notes.py` — stays
    a manual, deliberate, explicitly-invoked script, never run automatically
    against a real database. Auto-seeding test fixtures into production data
    would be a real content bug, not a convenience.

## stabbur: from "create/find by id" to a real authoring tool

```
Notes          list, filtered by status/type, sorted, click straight through
  └ detail/edit   every field, audio player + trim, raw-JSON toggle, delete
                  (tombstone if ever `ready`, hard-delete if still `draft`)
Grammar rules  list, sorted by use count, click straight through
  └ detail/edit   "used by N notes" reverse lookup; delete blocked while in use
+ New note       PoS picker reshapes the inflection fields live — no blank
                 JSON to fill in by hand
+ New grammar rule
```

**Audio trim** is a draggable two-handle range over a waveform, not numeric
millisecond fields — "listen to it and see the trim" wants to actually be
seen.

**Hard boundary, re-confirmed by the first mockup draft getting it wrong**:
stabbur's note detail must never show anything about whether Mjølnir picked
the note up, how it was used, or what card it became. D44's one-directional
pull has no exceptions for operator convenience — that information lives
entirely on the `hub` side (see Cards, below), which is free to *link into*
stabbur's note-edit page, since a hyperlink the operator's browser follows is
not a service dependency.

## `hub` + `builder`: the operator cockpit

Kept as two separate UIs, per D80 — the forecast is `builder`'s own live
computation, the history is `hub`'s own stored record, and merging them
would mean one duplicating the other's logic. They're cross-linked instead.

```
builder                                    hub
  Forecast & publish                         Cards
  Schedule (now UI-configurable)             Submit bundle (OTA)
  Run log                                    Publish history
```

### The central correction this session made: batches are occurrences, not cards

The first mockup draft showed "cards in this batch" and "cards that shipped
in build X." That's wrong, and not just cosmetically: **a card's two sides
can ship in two different, far-apart batches.** A word/expression card's `A`
ships the moment it's minted; its `E` is queued and ships only once 11 other
occurrences have landed in that deck — which could be the same run, or
twelve runs later (`03-data-model.md`'s cross-batch queue, D91). So the
correct unit everywhere in this UI is **(card, side)**, not **card**:

- The **forecast** shows two lists: occurrences shipping *this* run (new
  `A`'s, plus any `E`'s whose queue just drained — both belong to this
  batch) and occurrences newly *queued* this run (ship in some future batch,
  not this one).
- **Past batches** (under Forecast) shows the same shape, historically:
  which `(card, side)` pairs shipped in a given build.
- The **Cards** page — the full entity browser, stabbur's Notes list's
  counterpart — shows each card's full occurrence set with **per-side**
  status: shipped (and in which build) or still queued (and how far out).

### The schema gap this surfaces, precisely

Not a card-level `card_slots.minted_in_build_id` column, which was this
session's first (insufficient) attempt at the fix. The real requirement is a
**per-occurrence shipment log**:

```sql
occurrence_shipments(card_id, letter, build_id, shipped_at)
```

Written once per occurrence, at the moment it actually ships (mint-time for
an immediate letter, drain-time for a queued one). This is strictly
necessary, not a nice-to-have: today, `drainPendingOccurrences` **hard-deletes**
a `pending_occurrences` row the instant it drains — there is no record left,
anywhere, of which build shipped that side. Without this table, "past
batches" and "Cards page occurrence status" cannot be built on the current
schema at all, for either side of any card.

### Scheduling becomes UI-configurable — a real architecture change, not just a form

Today's nightly clock is presumably a fixed interval in `builder`'s code.
Making it operator-editable means the schedule has to live in the database
(a small `builder_config` table) and `clock.js` has to read it dynamically.
Small, but real — not something that falls out of adding an HTML form.

### Builder logs

No log aggregation exists today beyond stdout. A `job_logs` table keyed by
`build_job_id`, written during a run and rendered under each job, is the
right-sized answer for a single-operator project — not a real log shipper.

### OTA lives inside `hub`'s UI, not as a fourth thing

`hub` already owns `publications` and already serves `current.json` — OTA
submission (drag-drop a bundle, prefilled editable label, verification run
in place on drop, build history with set-current/delete/edit-label, and a
link into bundle-workbench for inspecting a bundle's actual contents rather
than building a second inspector from scratch) is a page inside `hub`, under
its own "OTA" nav group, not a separate service.
