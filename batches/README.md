# Batches

One directory per batch of the agentic workflow (`docs/15-agentic-workflow.md`,
D161). A batch is the unit the operator deploys and accepts; it outlives the
OpenSpec changes it contains, which get archived before operator acceptance.

Directory name: a bare slug, same convention as change ids (D153), e.g.
`builder-integrity/`, `stabbur-editing/`.

## Files in a batch directory

### `manifest.md`
Created by `/tun-triage` when the batch is opened; updated by every phase.
Holds:

- the package list — each package names the projects it touches (packages
  are dependency groups and may span several), its backlog items
  **verbatim**, and its OpenSpec change id(s) once designed
- the dependency direction between packages, if any (`A before B`); absence of
  a line means parallel-safe
- a status table, one row per package:
  `pending → designed → building → archived → BLOCKED(reason)`
- dropped/deferred items, one line of why each

### `OPERATOR-CHECKLIST.md`
Appended by each `/tun-build` session as its package archives. This is the
artifact that survives archiving — the operator runs it top to bottom after
deploying. Per package:

- deploy notes beyond the standard pull/build/restart, if any
- **every one-time migration, spelled out as runnable steps**
- the flows to test live, copied from the change's `acceptance.md` but
  phrased for a human with the real phone/browser

### `DECISIONS-MADE.md`
Tier-2 autonomous decisions (see the decision policy in `docs/15`). **One
line per decision**, strictly:

```
- [package] chose X over Y — because Z
```

Kept terse on purpose: the operator reads this in minutes alongside the
checklist. Anything that needs a paragraph was not tier 2.

## What does NOT live here

Design records, specs, tasks, acceptance criteria and mockups live in the
owning project's `openspec/changes/<id>/` (root `openspec/` for
cross-cutting) — the batch dir only points at them and carries what must
outlive their archiving.
