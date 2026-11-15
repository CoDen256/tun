# CLAUDE.md

## phonexa — part of the Tun ecosystem

This directory is the **phonetics lab**: IPA charts, Formant Lab, Shadowing,
the live mic tracker. It is not coupled to Mjølnir, and it still runs
standalone (`cd phonexa && docker compose up`).

Sibling projects — top-level directories of this one repository, not sibling
checkouts (D150): `docs/` (ecosystem design), `grind/` (the gateway),
`mjolnir/` (bundle tool, patches, builder, hub, device sync), `stabbur/`
(learning content), `smia/` (linguistics), `shadow/` (Shadowing — **split out
of this project** by `zone-isolation`: its media, segments and transcription
now live there, not here), `postgres/` (the shared cluster), `libs/` (shared
code), `backup/` (the git-backup service). The root `CLAUDE.md` carries the
ecosystem rules and the service standard.

`mjolnir-hub` is still **not** renamed `mjolnir-workbench` — that rename is
deferred (it must change the compose key and the gateway upstream together).

**Cross-repo design, decisions, pitfalls and the roadmap live in
`docs/` (at the repo root) — start at `README.md`, then `07-decisions.md`.**
Do not re-derive settled decisions.

See `phonexa/README.md` for phonexa itself (pages, abstractions, `docs/`).

Note: `/stream` and `js/realtime.js` are deliberately **frozen** — see the
project README.
