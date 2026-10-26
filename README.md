# tun

*Tun: the farmyard — the shared centre every building faces.*

The deployment and documentation root for a Norwegian learning ecosystem.
**This repo is the entry point. Start at [`docs/README.md`](docs/README.md).**

## What lives here

```
docs/            cross-repo design, decisions (ADRs), pitfalls, open questions, roadmap
ui/              shared header/nav shell              (not written yet)
compose.yaml     include:s mjolnir's and stabbur's own compose files (D94)
```

**`caddy/Caddyfile`, `bin/ota-publish.sh`/`ota-verify.sh`, and `DEPLOY.md`
still live in `mjolnir` only** — D84's "no deployable artifacts in `tun`"
covered those too, but D94 superseded that specifically to let this repo's
own `compose.yaml` `include:` `mjolnir`'s and `stabbur`'s compose files into
one merged project, once `stabbur` also needed deploying. Each included
repo's compose file stays fully usable standalone; this one only
additionally composes them.

## Sibling repos

| repo | owns |
|---|---|
| **mjolnir** | everything that knows the Mjølnir bundle format or talks to the device: bundle tool, JS patches, native patch, APK pipeline, builder, hub |
| **stabbur** | learning content: captures, notes, enrichment, triage UI, audio blobs |
| **smia** | linguistics providers: inflect / ipa / tts / stt / translate |
| **phonexa** | phonetics lab (existing) |
| **hover-translate** | capture client (existing fork) |

All six repos now exist under `/home/coden/dev/`. `stabbur` and `smia` are
scaffolded but not implemented.

## Status

**P1 and P2 are done.** The device fetches its JS bundle over the air: the OTA
endpoint is live on the VPS (`mjolnir/bin/ota-verify.sh` 16/16 as of the
pre-D84 layout — owed a re-run after D84's move), and the one-time native
patch is built, signed, installed and **proven on device** — `asset` →
`pending` → `active` → `active` across four launches, with no false quarantine.
See [`docs/12-p2-results.md`](docs/12-p2-results.md) for exactly what was tested
and what remains unproven.

**From here, every change is a file on the server.** Next is the first real
payoff: shipping a small UI patch (the running `buildId` on the "My account"
screen, D68) over the air with no APK rebuild.

See [`docs/10-roadmap.md`](docs/10-roadmap.md) for what to do next, and
[`docs/07-decisions.md`](docs/07-decisions.md) before changing any decision.
