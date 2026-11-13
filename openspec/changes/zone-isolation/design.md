## Context

"Working separately" turned out to mean three different things, which need
three different mechanisms. Sorting the operator's requirements by which one
applies is what made the scope small:

```
 A  BLAST RADIUS     a crash, OOM, hung thread or bad deploy in X
                     must not stop Y                     → container boundary
 B  DEGRADATION      X's feature needs Y's data; with Y down X must lose
                     the feature, not the page           → code
 C  DEPLOY GRANULARITY  rebuild X without touching Y     → compose
```

| requirement | kind | status before this change |
|---|---|---|
| builder down → OTA still serves | A | already holds — gateway serves files, no process |
| workbench down → sync still receives | A | **fails** — one process |
| smia down → stabbur drops suggestions only | B | holds — `SmiaUnavailableError`, no retry |
| stabbur down → smia fine | A | holds — no such dependency exists |
| stabbur down → hover-translate translates | B | holds — separate clients |
| stabbur down → workbench fine | B | holds — "stabbur unreachable tolerance" |
| phonexa sub-domains isolated | A+B | **fails** — one process, one database |
| pg down → workbench shows no catalogue | B | **fails** — no console at all |

Only two process splits fall out. Everything else is already isolated or is a
degradation concern in code.

## Decision — split by domain, not by cost

An earlier draft proposed splitting phonexa along a CPU line: a stable CRUD core
versus the heavy analysis endpoints (`/analyze-praat`, `/stream`, parselmouth).
The operator overrode it with a domain line — vowels versus shadowing — and the
schema says the operator is right.

The domain line is where the data already divides: zero foreign keys cross it,
and the two halves are already in two files importing two disjoint model sets.
The CPU line would have cut straight through `samples` and
`sample_analyses`, requiring either a shared database between the halves or a
distributed write path, for a benefit that process isolation largely delivers
anyway once the two hang-prone subprocesses (yt-dlp, ffmpeg) leave with shadow.

Formant Lab and live speech stay with phonexa: same domain, same `samples` and
`sample_analyses` tables.

## Decision — the one cross-domain FK is dropped, not worked around

`shadowing_media.user_id → users.id` is the only edge between the two halves.
D42's standing rule — separate logical databases per service, no cross-service
foreign keys — already prescribes the answer: `users` and `settings` stay with
phonexa, `shadow` holds a plain integer.

Degradation: with phonexa down, shadow cannot resolve profile *names* but
continues to work against the current profile id. Named here so it is a decision
rather than a surprise.

## Decision — shadow mounts no volume, because there is no audio to store

**Corrected 2026-11-13.** This section originally said shadow would store audio
by calling phonexa's storage API, and reasoned about "one owner of the audio
tree, one backup path". Independent review checked the premise against the code
and it was wrong.

Shadowing recordings are never persisted server-side. `shadowing.py` never
calls `get_audio_store`, never receives audio bytes, and `ShadowingMedia`
deliberately holds no storage key; the browser keeps the file locally through
the File System Access API. phonexa's audio tree holds VOWEL SAMPLES — a
different domain shadow never reads or writes.

So the operator's direction, *"it just should be able to call to phonexa to
store it"*, is satisfied trivially rather than by an API call: shadow mounts no
volume at all, and `shadow/tests/test_zone_boundary.py` asserts it.

The coupling that IS real lives over HTTP in `shadow/phonexa_client.py` alone:
`users` and `settings` (phonexa owns the profile table), and `/analyze-praat`
for pitch comparison, since parselmouth belongs with the vowel domain.
Degradation: with phonexa down shadow cannot list or create profiles and cannot
run a pitch comparison; everything else, playback of existing segments
included, is unaffected — because none of it was ever stored on a server.

## Decision — serve first, migrate behind a flag

```js
// hub/bin/server.js today
const ran = await migrate();        // throws if Postgres is down
const deckCount = await seedDecks();
createServer(pool, config).listen(port);   // never reached
```

Inverted: `listen()` immediately; `migrate()` and `seedDecks()` in the
background with retry; a `dbReady` flag every page consults. The same shape
goes into `libs/` for the Python services, replacing three different
"migrate then serve" implementations (two `scripts.bootstrap` CMDs and
phonexa's `docker-entrypoint.sh`).

This deliberately gives up "a running service always has a current schema."
Pages must therefore treat `dbReady` as a real state rather than assuming it,
and a service that is serving but not ready must say so in its health check so
it is visibly degraded rather than quietly wrong.

## Decision — a status page that cannot itself fail

Independent processes, one console. Shared layout in `libs/` renders the same
navigation in all three mjolnir containers; since navigation is links, each item
works regardless of which container rendered the page.

But a dead zone still yields a gateway 502 with no navigation at all. So the
gateway serves a static status page on any 502: which zones are up, which is
not, links to the live ones. Static HTML inside the gateway, no process behind
it, nothing to fall over.

## The resulting dependency graph

| zone | hard dependencies | degrades when |
|---|---|---|
| ota | gateway, filesystem | — |
| mjolnir-sync | gateway, database | — |
| mjolnir-workbench | gateway | db → no catalogue/cards/decks/device, no publish; stabbur → no note links |
| mjolnir-builder | database, stabbur | gateway → **only its UI**; builds continue |
| stabbur | gateway, database | smia → no suggestions |
| smia | gateway, database | providers data → empty candidates |
| phonexa | gateway, database | — |
| shadow | gateway, database | smia → no transcription; phonexa → no ingest, no profile names |
| hover-translate | gateway | smia → no translation; stabbur → no capture |

Two shared dependencies remain — the gateway and the database cluster — and one
zone, `ota`, depends on neither.

## Risks

**The hub split touches the device path.** `mjolnir-sync` must validate exactly
the credential hub validates today and return byte-identical responses,
including the `_justCreated` field the restore companion depends on (D-S4) and
the status-field stripping that protects the synced document from older builds.
A device in the field cannot be rolled back as easily as a container.

**Container count and ordering.** `mjolnir-sync` and `mjolnir-workbench` share
the `mjolnir` database; exactly one of them may own migrations. Workbench owns
them; sync waits on readiness and never migrates. Two processes racing the same
migration table is a real failure mode and is prevented by assignment, not by
locking.

**The shadowing table move is a data migration** and should run in the same
window as `postgres-consolidation` rather than as a separate event.

**`libs/` reverses part of D46** ("vendored CSS, not a package"). The reason
D46 chose vendoring was cross-repo coupling, which no longer exists. Recorded as
an amendment with its rationale, not silently.

## Alternatives considered

- **Split phonexa by CPU cost.** Rejected above; cuts through shared tables.
- **Leave sync inside hub and accept brief interruptions.** Defensible for a
  single phone that retries — but hub is the most frequently deployed service in
  the stack and the device path is the one with no rollback.
- **Give shadow its own audio volume.** Moot, not rejected: shadow stores no
  audio at all, so there is no volume to give it. The original reasoning
  ("two owners of one audio tree means two backup paths") assumed a premise
  that checking the code disproved — see the corrected decision above.
