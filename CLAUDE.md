# CLAUDE.md

## tun — the Norwegian learning ecosystem root

This repo holds the shared UI shell and **all cross-repo design
documentation**. It now also holds a `compose.yaml` of its own (D94,
superseding D84's "no deployable artifacts here" for exactly this case):
Compose's native `include:` merges `mjolnir`'s and `stabbur`'s own compose
files into one project, so a deploy is one `git pull` (across sibling
checkouts) + one `docker compose up` from here instead of two separate
stacks. Caddy config and the OTA scripts still live in `mjolnir` only — this
repo's `compose.yaml` composes them, it doesn't duplicate them.

**Start at `docs/README.md`. Read `docs/07-decisions.md` before proposing
anything — do not re-derive settled decisions.**

Sibling repos (all under `/home/coden/dev/`):

| repo | owns |
|---|---|
| `mjolnir` | bundle tool, JS + native patches, APK pipeline, builder, device hub, `docs/findings.md` |
| `stabbur` | learning content: captures, notes, enrichment, triage UI, audio blobs |
| `smia` | linguistics: inflect / ipa / tts / stt / translate |
| `phonexa` | phonetics lab |
| `hover-translate` | capture client |

Mjølnir app internals live in `mjolnir/docs/findings.md`, not here.

## Documentation conventions

- A cross-cutting decision gets an ADR row in `docs/07-decisions.md`, with its
  rationale. Superseded decisions are **marked**, never deleted.
- Corrected findings are annotated in place so a stale claim cannot be read
  without its correction.
- OpenSpec is per-repo and implementation-scoped. There is deliberately **no**
  OpenSpec root here — `docs/` is the ecosystem-level spec layer.
