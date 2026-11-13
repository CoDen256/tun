# Tun — Norwegian learning ecosystem

*Tun: the farmyard — the shared centre every building faces.*

**Start here.** This directory is the single source of truth for the whole
ecosystem, which since D150 is **one repository** with each former repo as a
top-level directory: **mjolnir** + **stabbur** + **smia** + **phonexa** +
**shadow** + **hover-translate** + **grind** + **backup**.
It is written to survive between sessions: if you remember nothing else,
read this file and `07-decisions.md`.

## Starting a session

Open Claude Code **once, at the repository root** (`/home/coden/dev/tun`) — for
every kind of work. There is nothing to add as an extra working directory any
more, and no second session for a second repo: one root `CLAUDE.md` carries the
ecosystem rules and each project's own `CLAUDE.md` is loaded automatically when
you touch files in it (D150).

Opening line that works: *"Read docs/README.md and 07-decisions.md, then
<task>."*

Then: **`10-roadmap.md` → "Right now"** always holds the current next step.

## The one-sentence goal

Hover a sentence in Norwegian video → it becomes a spaced-repetition card with
real audio in the modded Mjølnir app, and everything in between is inspectable
and editable by you.

## Map of documents

| File | What's in it | Read when |
|---|---|---|
| `01-vision-and-scope.md` | The five modules, what each does, the primary loop | Orienting / onboarding |
| `02-services.md` | Service boundaries, deployment, hosting sizing | Designing or deploying anything |
| `03-data-model.md` | capture / note / deck / card types, projection, ID scheme | Touching content or the DB |
| `04-delivery.md` | OTA bundle fetch, audio cache, versioning, rollback | Working on the device pipeline |
| `05-sync.md` | Progress backup, the Firestore shim, restore | Working on progress data |
| `06-smia.md` | Linguistics service (inflect/ipa/tts/stt/translate) | Working on enrichment |
| `07-decisions.md` | **ADR log — every decision + why** | Always. Before changing a decision. |
| `08-pitfalls.md` | Known traps, with handling | Before implementing any phase |
| `09-open-questions.md` | Unresolved, with enough context to resume | When picking up again |
| `10-roadmap.md` | Phases, ordering, what to do first | Deciding what to work on |
| `12-p2-results.md` | what P2 built, tested and proved on device; bugs found; what is still unproven |
| `11-ota-contract.md` | **The frozen native contract** — wire format, on-device layout, validity, watchdog, escape hatch | Before writing any native patch code |
| `13-operator-console-ux.md` | Deployment unification (`include:`, one adminer), the operator UI direction for stabbur/hub/builder, the batches-are-occurrences-not-cards correction | Building any operator-facing UI, or the deploy/compose setup |

Mjølnir app internals (reverse-engineering findings) live in the **mjolnir**
repo as `docs/findings.md` — that is the authority on how the stock app behaves.

## Projects

Each is a top-level directory of this one repository (D150). Each owns its own
`compose.yaml`, which the root `compose.yaml` `include:`s — so every project
still runs standalone (`docker compose up <project>`) and all of them come up
together from one `docker compose up` at the root.

| Directory | Role |
|---|---|
| `docs/` | **these docs** — the ecosystem design layer |
| `grind/` | the gateway: TLS, routing, the operator gate, the status page |
| `mjolnir/` | `docs/findings.md`, tool, JS + native patches, apk pipeline, builder, workbench, device sync |
| `stabbur/` | captures, notes, enrichment, triage UI, audio blobs |
| `smia/` | linguistics providers (inflect / ipa / tts / stt / translate) |
| `phonexa/` | phonetics lab: vowels, consonants, formants, live speech |
| `shadow/` | shadowing: media, segments, transcription |
| `hover-translate/` | capture client (a browser extension — never deployed) |
| `postgres/` | the shared database cluster |
| `backup/` | the git-backup service |
| `libs/` | code shared across projects (auth, prefix handling, layout, bootstrap) |

One clone, no sibling checkouts. The APK build workspace at
`/home/coden/rev/mjolnir/` is still disposable scratch, not part of this repo.

`grind/`, `shadow/`, `postgres/` and `libs/` arrive with the `zone-isolation`,
`postgres-consolidation` and `unified-auth` changes; the rest exist now.

## Status

**P1–P3 are all done** (2026-10-20 → 2026-10-22). The server is live, the one
irreversible native OTA patch is installed and its whole acceptance gate is
proven on device, and the first content payoff shipped as a file with no APK
rebuild. See `12-p2-results.md` for the trace and **D73** for the closing
record; `mjolnir`'s `p2-native-ota` change is archived.

*(This block said "P2 next" until 2026-11-13 — three weeks after P2 actually
landed. `10-roadmap.md` → "Right now" is the authority on current state; this
is a summary of it, and when the two disagree the roadmap wins.)*

**In flight now:** the monorepo restructure — `monorepo-merge` (this layout),
then `postgres-consolidation`, `zone-isolation` and `unified-auth`. See
D150–D153.
