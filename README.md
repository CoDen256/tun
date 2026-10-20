# tun

*Tun: the farmyard — the shared centre every building faces.*

The deployment and documentation root for a Norwegian learning ecosystem.
**This repo is the entry point. Start at [`docs/README.md`](docs/README.md).**

## What lives here

```
docs/            cross-repo design, decisions (ADRs), pitfalls, open questions, roadmap
compose.yaml     the whole stack                      (not written yet)
Caddyfile        TLS, path routing, static serving    (not written yet)
ui/              shared header/nav shell              (not written yet)
scripts/         backups                              (not written yet)
```

## Sibling repos

| repo | owns |
|---|---|
| **mjolnir** | everything that knows the Mjølnir bundle format or talks to the device: bundle tool, JS patches, native patch, APK pipeline, builder, hub |
| **stabbur** | learning content: captures, items, enrichment, triage UI, audio blobs |
| **smia** | linguistics providers: inflect / ipa / tts / stt / translate |
| **phonexa** | phonetics lab (existing) |
| **hover-translate** | capture client (existing fork) |

`stabbur` and `smia` do not exist yet.

## Status

Design phase. Nothing deployed. See [`docs/10-roadmap.md`](docs/10-roadmap.md)
for what to do next, and [`docs/07-decisions.md`](docs/07-decisions.md) before
changing any decision.
