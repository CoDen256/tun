# CLAUDE.md

## tun — the Norwegian learning ecosystem root

This repo holds the deployment (compose, Caddy, backups), the shared UI shell,
and **all cross-repo design documentation**.

**Start at `docs/README.md`. Read `docs/07-decisions.md` before proposing
anything — do not re-derive settled decisions.**

Sibling repos (all under `/home/coden/dev/`):

| repo | owns |
|---|---|
| `mjolnir` | bundle tool, JS + native patches, APK pipeline, builder, device hub, `docs/findings.md` |
| `stabbur` | learning content: captures, items, enrichment, triage UI, audio blobs *(not created yet)* |
| `smia` | linguistics: inflect / ipa / tts / stt / translate *(not created yet)* |
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
