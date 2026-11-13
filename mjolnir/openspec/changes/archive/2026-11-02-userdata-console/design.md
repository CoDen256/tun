## Context

Read `tun/docs/05-sync.md`, `progress-sync-shim`'s `design.md` (D-S1
through D-S5), and `hub/migrations/013_userdata.sql` before changing
anything — this change extends already-shipped code, it doesn't revisit
`progress-sync-shim`'s own decisions (uid-keyed progress, server-side
exists-guarantee, the shim's REST mapping all stay exactly as shipped).

Confirmed directly in the shipped migration:

```sql
-- hub/migrations/013_userdata.sql
CREATE TABLE device_state (
  device_id         TEXT PRIMARY KEY,   -- ← this is the uid today (see its own comment)
  ...
);
```

The comment on that table says plainly: `device_id` is whatever id the
shim's `.doc(id)` is given — the real uid, not a per-device identifier. That
was fine for `userdata` (progress should follow the account), but
`device_state` is physically local to one handset. This change's schema
fix was found, not invented speculatively — it surfaced while laying out
the console mockup's two-selector design and realizing a uid-only key gives
the second selector nothing real to select between.

## Goals / Non-Goals

**Goals:**
- Give `device_state` a real per-device key without touching `userdata`'s
  already-shipped, already-correct uid-keying.
- A read-only console page, built exactly to the approved mockup, not a
  rough approximation of it.
- Show card identity consistently in the per-card table — one field,
  always, regardless of which side's progress the row represents.

**Non-Goals:**
- Any write/edit action on this page — matches the read-only operator
  console pattern already established (Cards, Publish history).
- Revisiting `progress-sync-shim`'s uid-keying for `userdata` itself —
  correct as shipped, out of scope here.
- A UI inside the Mjølnir app — this is a `hub` operator page, same
  surface as Cards/OTA/Builder, not a new device-facing screen (D13 doesn't
  apply to `hub`'s own console, same as it never has for the other pages).

## Decisions

### D-C1 — `device_state` keyed by a new, locally-generated device id; `uid` kept as a non-key column

```sql
ALTER TABLE device_state ADD COLUMN uid TEXT;
UPDATE device_state SET uid = device_id;  -- one-time backfill: every
                                            -- existing row's device_id was
                                            -- actually a uid (the pre-fix
                                            -- scheme) — this is a correction,
                                            -- not data loss
ALTER TABLE device_state ALTER COLUMN uid SET NOT NULL;
CREATE INDEX device_state_uid_idx ON device_state (uid);
```

`device_id` stays the primary key column (no rename — smaller diff against
shipped code), but its *meaning* changes going forward: every new row must
be keyed by a real per-device id, never a uid. `uid` is added so the
console can answer "every device this account has ever synced from."

**Alternative considered**: a composite `(uid, device_id)` key, allowing the
same locally-generated device id to theoretically appear under different
accounts (e.g. a factory-reset phone later signed into a different Google
account). Rejected: the console needs "one row per physical device,"
regardless of which account used it most recently — a composite key would
produce two rows for one phone across a sign-out/sign-in-as-someone-else
event, which is confusing to show and not a scenario this single-operator
project needs to handle (D90-style reasoning: real but narrow, not worth
the complexity now).

### D-C2 — The local device id is minted once, independent of the uid, by the existing startup module

`progress-sync-shim`'s `patches/js/progress-sync-restore-companion.js`
(shipped) already runs on every launch, before anything else. This change
adds one more small job to it: on first-ever launch (no local device-id
marker), generate a random id and persist it permanently — never
regenerated, never derived from or tied to the signed-in uid, survives a
sign-out/sign-in on the same physical device. Every piggybacked `PATCH`
after that includes it as `deviceId` in the body, alongside the existing
progress fields.

**Why not derive it from something already available** (e.g. a hash of
install time, or an Android install id)? Nothing else already surfaced in
this bundle's JS is guaranteed stable and unique per install without native
work; a freshly-generated random id costs nothing and needs no native
module beyond what `ExponentFileSystem`-backed storage already provides
(same mechanism the companion already uses for its restore-marker).

### D-C3 — The per-card table always shows `N`, never `E`

Confirmed against `03-data-model.md`'s type table: for every one of the
five note types, `N` is the prompt/identifying content (the word, the
phrase, the hard sentence, "Read out: ...", the grammar question) and `E`
is always the answer (translation, transcription, the Norwegian answer).
Showing whichever field matches the row's own occurrence letter (e.g. `E`'s
own text for an `E`-side row) would be actively misleading for some types —
a pronunciation card's `E` is a bare phonetic transcription, not something
that identifies the card on its own. `N` is shown in every row regardless
of that row's `Side` (occurrence letter), so a card's two occurrence rows
read as the same recognizable thing with different SRS state, not as two
unrelated-looking entries.

## Risks / Trade-offs

- **The backfill (`uid = device_id`) treats every pre-existing row as
  "this account's one device"** — harmless at this project's actual scale
  (shipped minutes before this change was written; unlikely to have
  accumulated real multi-device data yet), but called out explicitly so a
  future reader doesn't mistake it for a general-purpose migration pattern.
- **A device id with no matching `userdata` row is possible** (e.g. the
  restore companion ships before the uid is known, on a very first launch
  before sign-in) — the console's device selector should tolerate a device
  row whose `uid` is still null/pending, not assume it's always populated.

## Migration Plan

1. `device_state.uid` column + backfill + index — independently testable,
   no behavior change until task 2 starts sending `deviceId`.
2. Restore companion mints and sends `deviceId`; `hub`'s write path keys
   `device_state` by it.
3. Console page, built last, against the now-correct schema.

## Open Questions

- Should the console ever show devices with no `userdata.doc` reads
  recorded at all (e.g. OTA/audio activity with zero study sessions)? Lean
  toward yes — "this phone fetched a build but has never studied" is itself
  useful information, not noise to filter out.
