# CLAUDE.md

## smia — part of the Tun ecosystem

The **linguistics** service: `POST /inflections`, `/ipa`, `/tts`, `/stt`,
`/translations`, `/examples`; UI at the prefix root `/smia/`.

**Cross-repo design, decisions, pitfalls and the roadmap live in
`docs/` (at the repo root) — start at `README.md`, then `07-decisions.md`.**
**Full service design — API shapes, provider catalog, cache semantics:
`docs/06-smia.md`. That file is canonical; do not restate its tables here or
in the project README.**

### Hard boundaries (D16, D45, D-S1)

- **Depends on nothing.** It is a leaf service. hover-translate calls it
  directly; stabbur calls it; neither is a dependency of smia.
- **Stateless with respect to canonical storage.** `/tts` returns bytes. The
  private cache keyed on `(kind, provider, sha256(input))` is an optimisation,
  not a store of record — stabbur owns canonical audio.
- **The caller names exactly one provider per call** — no chains, no
  fallback, no fan-out (D-S1; the old "declarative provider chains" model is
  gone). `GET /providers` is the live catalog.
- **`/inflections` returns candidates, never one answer.** Norwegian surface
  forms are ambiguous (`skinner` = verb or noun plural); triage picks.
- Always record **which provider answered**; quality varies a lot — a
  required top-level `provider` field on every response.


## OpenSpec / Opsx Workflow Rules

- **Post-Operation Commit:** Always create a Git commit after running any `opsx` operation.
- **Walkthrough Requirement for `opsx:apply`:** After executing `opsx:apply`, provide a concise, step-by-step walkthrough covering:
  - **UI / Visual Checks:** What key elements or changes to look for in the user interface (high-level, not overly detailed).
  - **Data / Storage Verification:** Where to poke around outside of the codebase (e.g., database tables, local storage, API endpoints, logs).
  - **Testing & Checkout:** Key terminal commands to run and specific UI flows/interactions to manually test.