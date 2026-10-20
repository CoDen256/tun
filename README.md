# tun

*Tun: the farmyard — the shared centre every building faces.*

The deployment and documentation root for a Norwegian learning ecosystem.
**This repo is the entry point. Start at [`docs/README.md`](docs/README.md).**

## What lives here

```
docs/            cross-repo design, decisions (ADRs), pitfalls, open questions, roadmap
compose.yaml     the whole stack — P1 runs caddy alone; the rest join as written
caddy/Caddyfile  TLS, path routing, static serving of bundles and blobs
bin/             ota-publish.sh (publish + rollback), ota-verify.sh (P1 acceptance test)
DEPLOY.md        how to stand it up on the VPS
data/            gitignored: current.json, bundles, blobs
ui/              shared header/nav shell              (not written yet)
```

## Sibling repos

| repo | owns |
|---|---|
| **mjolnir** | everything that knows the Mjølnir bundle format or talks to the device: bundle tool, JS patches, native patch, APK pipeline, builder, hub |
| **stabbur** | learning content: captures, items, enrichment, triage UI, audio blobs |
| **smia** | linguistics providers: inflect / ipa / tts / stt / translate |
| **phonexa** | phonetics lab (existing) |
| **hover-translate** | capture client (existing fork) |

All six repos now exist under `/home/coden/dev/`. `stabbur` and `smia` are
scaffolded but not implemented.

## Status

**P1 is built and proven locally, not yet deployed.** The stack and the OTA
path pass end to end against the real `caddy:2-alpine` image — 16 assertions,
including the one that would otherwise be discovered too late: the bundle's
sha256 is identical with and without transport gzip (D49). What remains is
provisioning the VPS, pointing DNS, and running [`DEPLOY.md`](DEPLOY.md).

The P2 native contract is frozen on paper in
[`docs/11-ota-contract.md`](docs/11-ota-contract.md). One verification, **Q17**,
blocks writing it.

See [`docs/10-roadmap.md`](docs/10-roadmap.md) for what to do next, and
[`docs/07-decisions.md`](docs/07-decisions.md) before changing any decision.
