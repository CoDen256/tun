# CLAUDE.md

## phonexa — part of the Tun ecosystem

This repo is the **phonetics lab** and stays standalone: IPA charts, Formant
Lab, Shadowing, the live mic tracker. It is not coupled to Mjølnir.

Sibling projects (top-level directories of this one repository, D150):
`docs/` (ecosystem design), `grind/` (the gateway), `mjolnir/` (bundle tool,
patches, builder, workbench, device sync), `stabbur/` (learning content),
`smia/` (linguistics), `shadow/` (shadowing — split out of this project by
`zone-isolation`), `hover-translate/` (capture client). The root `CLAUDE.md`
carries the ecosystem rules and the service standard.

**Cross-repo design, decisions, pitfalls and the roadmap live in
`docs/` (at the repo root) — start at `README.md`, then `07-decisions.md`.**
Do not re-derive settled decisions.

See `README.md` in this repo for phonexa itself (pages, abstractions, docs/).

Note: `/stream` and `js/realtime.js` are deliberately **frozen** — see the
project README.
