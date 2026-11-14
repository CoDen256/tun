# CLAUDE.md

## phonexa — part of the Tun ecosystem

This directory is the **phonetics lab**: IPA charts, Formant Lab, Shadowing,
the live mic tracker. It is not coupled to Mjølnir, and it still runs
standalone (`cd phonexa && docker compose up`).

Sibling projects — top-level directories of this one repository, not sibling
checkouts (D150): `docs/` (ecosystem design), `mjolnir/` (bundle tool, patches,
builder, hub, device sync), `stabbur/` (learning content), `smia/`
(linguistics), `backup/` (the git-backup
service). The root `CLAUDE.md` carries the ecosystem rules and the service
standard.

Two directories that do **not** exist yet and must not be referred to as if
they did: `grind/` (the gateway — today the gateway is `caddy`, configured by
`mjolnir/caddy/Caddyfile`) and `shadow/` (Shadowing, to be split out of this
project). Both are created by `zone-isolation`. Likewise `mjolnir-hub` is
**not** renamed `mjolnir-workbench` yet.

**Cross-repo design, decisions, pitfalls and the roadmap live in
`docs/` (at the repo root) — start at `README.md`, then `07-decisions.md`.**
Do not re-derive settled decisions.

See `phonexa/README.md` for phonexa itself (pages, abstractions, `docs/`).

Note: `/stream` and `js/realtime.js` are deliberately **frozen** — see the
project README.
