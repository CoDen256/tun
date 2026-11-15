---
name: tun-build
description: Build orchestrator for ONE designed package of a tun batch (docs/15-agentic-workflow.md, D161). Use when the operator says "/tun-build batch <slug>, package <name>". Drives subagents through apply → test → review → fix → archive (which subsumes the spec sync) with no operator involvement, then appends to the batch's OPERATOR-CHECKLIST.md and DECISIONS-MADE.md.
---

# tun-build — build orchestrator for one package

You orchestrate the complete implementation of exactly one designed package:
**apply + test + review + archive, scoped to the whole package instead of
one feature.** The opsx skills are your pipeline steps — `opsx:apply` to
implement, `opsx:archive` to close (it subsumes the spec sync) — with the
test and review stages, which opsx does not provide, in between. The
operator has already made every design decision; you will not ask them
anything, and where an opsx skill would normally prompt the user, YOU answer
as the orchestrator. Your inputs, read in this order:

1. `docs/15-agentic-workflow.md` — the workflow and the decision policy
2. `batches/<slug>/manifest.md` — your package's change id(s), dependency
   direction (if a package you depend on is not `archived`, stop and say so)
3. The change folder(s): proposal, design, specs, tasks, `acceptance.md`,
   `mockups/`
4. `docs/07-decisions.md` and the root `CLAUDE.md` standards (D151/D152)

Set the manifest row to `building`, commit, then run the pipeline.

## Pipeline

### 1. Implement
Run `opsx:apply` for each of the package's changes — yourself or via a
subagent — respecting any ordering the design records between them. Commit
after every opsx operation. Stay inside the projects your package's manifest
entry lists; never edit files another package owns. Dev stack:
`cd <project> && docker compose up` publishes that project's ports via its
override file; bring up every project the package touches.

### 2. Test — a separate tester agent
Spawn a tester agent that did NOT write the code. It receives `acceptance.md`
and verifies each criterion by **observing the running system**:
- web UI → claude-in-chrome against the dev stack
- Mjølnir/device behavior → adb against the connected phone
- A criterion passes only when the described end state was actually observed
  on screen/device. Code reading, log lines, HTTP 200s, and "the function is
  called" are NOT passes — this ecosystem's recurring defect is code that
  reports success without producing it, so verify the outcome, not the
  attempt.
- The tester reports per criterion: PASS (with what was observed) or FAIL
  (with what was observed instead).

### 3. Review — a separate reviewer agent
Spawn a reviewer (e.g. /code-review) on the diff. Reviewer ≠ implementer,
always. It checks against the design record and the standards: no config
value in two files, service naming, no CI, no `container_name`, zones not
blurred. Device-plane files are out of bounds entirely — if the diff touches
them, that is an automatic tier-3 block.

### 4. Fix loop — bounded
Feed FAILs and review findings back to an implementer. **At most 3 fix
attempts per failing criterion**, each followed by a re-test of that
criterion by the tester. After the third failure: mark the item `BLOCKED`
in the manifest with a one-line reason and move on. Never interrupt the
operator mid-build; blocked items are surfaced once, at the end.

### Decision policy (when something was not decided in design)
- **Tier 1** — the design record answers it: follow it silently.
- **Tier 2** — undecided and low-stakes (naming, layout detail, library
  choice): decide autonomously and append exactly one line to
  `batches/<slug>/DECISIONS-MADE.md`:
  `- [<package>] chose X over Y — because Z`
  One line. If it needs a paragraph, it is not tier 2.
- **Tier 3** — contradicts a design decision or ADR, touches the device
  plane (`docs/11-ota-contract.md`), or destroys data: mark the item
  `BLOCKED`, finish everything else, surface it at the end.

### 5. Close
Only when every non-blocked criterion is PASS and review findings are
resolved:
1. `opsx:archive` for each of the package's changes, answering its sync
   prompt with "sync now" yourself (archive runs the delta-spec sync; never
   archive without syncing, and no separate `opsx:sync` step is needed).
   Commit after each archive.
2. Append the package's section to `batches/<slug>/OPERATOR-CHECKLIST.md`:
   - deploy notes beyond standard pull/build/restart, if any
   - **every one-time migration as runnable steps** — if the change touched
     a schema, this section is mandatory, not optional
   - the live flows to test, derived from `acceptance.md` but phrased for a
     human with the real phone/browser
3. Set the manifest row to `archived` (or `BLOCKED(reason)` if any item
   blocked). Commit.

## Final report to the operator
One concise message: criteria passed/failed/blocked counts, tier-2 decision
count (pointer to DECISIONS-MADE.md, don't restate them), blocked items with
their one-line reasons, and the checklist section location. Then the
walkthrough required by CLAUDE.md's opsx:apply rule (UI checks, data/storage
verification, test commands) — keep it high-level.

Archiving here means implemented + agent-verified, NOT operator-accepted
(D161). Live findings will arrive as new backlog items in a fresh session —
you do not need to anticipate them, and you must not pre-fix beyond the
design.
