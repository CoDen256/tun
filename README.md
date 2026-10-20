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

**P1 is live.** The device-facing OTA path is deployed on the Contabo VPS and
verified end to end — `bin/ota-verify.sh` prints **16 passed, 0 failed** against
the live host (2026-10-20), including the assertion that would otherwise be
discovered too late: the bundle's sha256 is identical with and without transport
gzip (D49). The hostname is DNS-only, never proxied (D57) — a CDN in the body
path would break that invariant permanently.

**P2 is unblocked and is the next step.** Its contract is frozen in
[`docs/11-ota-contract.md`](docs/11-ota-contract.md); Q11–Q17 are all settled.
It is the only irreversible step in the project.

See [`docs/10-roadmap.md`](docs/10-roadmap.md) for what to do next, and
[`docs/07-decisions.md`](docs/07-decisions.md) before changing any decision.
