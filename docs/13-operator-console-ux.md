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

## Deployment: three repos, one `docker compose up`

```
~/tun/        ← the ONLY thing ever `git pull`ed + `docker compose up`'d
~/mjolnir/    ← sibling checkout, unchanged, still runs standalone
~/stabbur/    ← sibling checkout, unchanged, still runs standalone
```

- **Sibling checkout**, not submodules, not a monorepo. Three `git clone`s
  at the same filesystem level.
- **`tun/compose.yaml`** uses Compose's native `include:` to pull in
  `../mjolnir/compose.yaml` and `../stabbur/compose.yaml` as one merged
  project (one shared network — service-name DNS resolution works across
  the include boundary with no extra wiring). Each included file stays
  fully usable on its own (`cd mjolnir && docker compose up` still works
  for local dev) — `include:` only adds a second way to start them, it
  doesn't take away the first.
- **Caddy stays in `mjolnir`.** It is not a cross-service front door today —
  it only serves `/ota/*` and `/blob/*`, and the `/stabbur`/`/smia`/`/phonexa`
  routes in its Caddyfile are unused placeholders, not a live thing worth
  moving for. Revisit only once a second service actually needs routing
  through it.
- **Consistent naming**: every compose file is named `compose.yaml` (the
  modern canonical name). `stabbur/docker-compose.yml` gets renamed to match
  `mjolnir`'s existing `compose.yaml`.
- **One `adminer`**, at the top level in `tun`'s compose file, pointed at
  both Postgres instances (`mjolnir`'s hub DB, `stabbur`'s DB) via Adminer's
  native server picker — not one Adminer container per database.

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
