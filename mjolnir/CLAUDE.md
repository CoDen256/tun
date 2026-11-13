# CLAUDE.md

## mjolnir — part of the Tun ecosystem

This directory owns **everything that knows the Mjølnir bundle format or talks
to the device**: the bundle tool, the JS patch set, the native patch source, the
APK rebuild pipeline, the builder, and the device-facing hub.

Since **D150** mjolnir is not its own repository: it is the `mjolnir/` directory
of the one `tun` repo. Sibling *directories* of the same repo — not sibling
checkouts — are `docs/` (deployment + ecosystem docs), `stabbur/` (learning
content), `smia/` (linguistics), `phonexa/` (phonetics lab),
and `backup/` (the git-backup service). `hover-translate` is an EXTERNAL
client in its own repository, not a directory here (D154).
The root `CLAUDE.md` carries the ecosystem rules and the service standard.

**Cross-repo design, decisions, pitfalls and the roadmap live in
`docs/` (at the repo root) — start at `README.md`, then `07-decisions.md`.**
Do not re-derive settled decisions.

**Mjølnir app internals (reverse-engineering record): `docs/findings.md`.**
It has **two** appended correction sections and both supersede the body —
always read them before trusting §2 or §6:

- "Corrections and additional findings (2026-10-20)" (C1–C12), bundle-derived.
- "Corrections from real device data (2026-11-07)" (R1–R10), derived from a
  real 4,510-occurrence synced account. R1–R3 overturn §6's reading of
  `Time`, `Stage` and (against C2) `CF`; R4–R5 pin down the auto-park and
  auto-tag rules §6 left untraced.

`openspec/` holds specs for the bundle tool itself.

## Note on naming

The directory is `mjolnir`, but the npm package and the CLI binary
(`bin/bundle-tool.js`) are still called `bundle-tool`, as was the GitHub remote
this directory was merged in from (D150). That is deliberate — the tool keeps
its own name; only the repo was regrouped.


## OpenSpec / Opsx Workflow Rules

- **Post-Operation Commit:** Always create a Git commit after running any `opsx` operation.
- **Walkthrough Requirement for `opsx:apply`:** After executing `opsx:apply`, provide a concise, step-by-step walkthrough covering:
  - **UI / Visual Checks:** What key elements or changes to look for in the user interface (high-level, not overly detailed).
  - **Data / Storage Verification:** Where to poke around outside of the codebase (e.g., database tables, local storage, API endpoints, logs).
  - **Testing & Checkout:** Key terminal commands to run and specific UI flows/interactions to manually test.