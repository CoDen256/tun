# Tun — Norwegian learning ecosystem

*Tun: the farmyard — the shared centre every building faces.*

**Start here.** This directory is the single source of truth for the cross-repo
ecosystem: **tun** (this repo) + **mjolnir** + **stabbur** + **smia** +
**phonexa** + **hover-translate**.
It is written to survive between sessions: if you remember nothing else,
read this file and `07-decisions.md`.

## Starting a session

Open Claude Code in **`/home/coden/dev/tun`** for design/architecture work, or
in **`/home/coden/dev/mjolnir`** when working on the bundle, patches or the hub.
Add the other repos as additional working directories as needed.

Opening line that works: *"Read tun/docs/README.md and 07-decisions.md, then
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

Mjølnir app internals (reverse-engineering findings) live in the **mjolnir**
repo as `docs/findings.md` — that is the authority on how the stock app behaves.

## Related repos

| Repo | Role |
|---|---|
| `tun` | deployment (compose, Caddy, backups), **these docs**, shared UI shell |
| `mjolnir` | `docs/findings.md`, tool, JS + native patches, apk pipeline, builder, hub |
| `stabbur` | captures, notes, enrichment, triage UI, audio blobs |
| `smia` | linguistics providers (inflect / ipa / tts / stt / translate) |
| `phonexa` | phonetics lab (existing) |
| `hover-translate` | capture client (existing fork) |

All six working copies live under `/home/coden/dev/`: `tun`, `mjolnir`,
`stabbur`, `smia`, `phonexa`, `hover-translate`. The APK build workspace at
`/home/coden/rev/mjolnir/` is disposable scratch, not a source repo.

## Status

**P1 live** — OTA path deployed on the Contabo VPS, `bin/ota-verify.sh` 16/16
(2026-10-20). **P2 next** — the one irreversible APK build; contract frozen in
`11-ota-contract.md`, Q11–Q17 all settled. No OpenSpec change is open yet;
`p2-native-ota` belongs in the `mjolnir` repo.
