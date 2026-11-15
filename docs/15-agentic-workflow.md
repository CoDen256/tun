# The agentic batch workflow

How backlog items become deployed features with the operator involved at
exactly three points: **writing the backlog, designing packages, and accepting
the live result** (plus a five-minute read of `DECISIONS-MADE.md`). Everything
else is done by agents in separate, stateless sessions that hand off through
files on disk — any agent can be replaced mid-cycle without losing anything.

Decision record: **D161** in `docs/07-decisions.md`.

## The cycle

```
Quick Log ──► /tun-triage ──► /tun-design (per package, fresh session)
                                   │  writes change folders + acceptance criteria
                                   ▼
                              /tun-build (per package, fresh session, one agent)
                                   │  apply → test → review → archive(+sync)
                                   ▼
                              OPERATOR-CHECKLIST.md ──► operator deploys & tests live
                                                              │
                                                              ▼
                                                     findings → Quick Log (new cycle)
```

Each box is its **own session**. No session carries conversational context into
the next; the batch directory and the OpenSpec change folders are the only
handoff medium. This is deliberate: a fresh agent reading a bug report plus the
spec treats it as a clean problem, while the agent that built the feature
defends it.

## Phase 1 — Triage (`/tun-triage`)

The triage agent (`.claude/skills/tun-triage/`) groups Quick Log items
**verbatim** into packages. Packages are **dependency groups, not project
folders**: items that pull on the same feature or data flow belong together
even when they span projects, so a package lists the projects it touches and
spanning several is normal. Isolation lives *between* packages — two packages
in the same batch must be independently implementable (no shared files, no
hidden coupling) so their design and build sessions can run in parallel.
Where a dependency between packages is unavoidable it is recorded as an
explicit direction in the batch manifest (`A before B`), never as
entanglement.

Opening a batch creates `batches/<slug>/` from the template in
`batches/README.md`.

## Phase 2 — Design (`/tun-design <batch> <package>`), one fresh session per package

**Explore + propose, scoped to the package instead of one feature.** A
discussion between the operator and one agent about **one package only**,
conducted in the `opsx:explore` stance but under this phase's contract
(fixed item list, mandatory outputs, defined ending); settled items are
captured via `opsx:propose` — but only after the agent asks and the
operator agrees to lock the item in, never unprompted mid-discussion. Once
agreed, capture is immediate and not optional. The agent asks
about UI and big technical direction (data model, push vs pull, what to
drop) — never frameworks or code detail. Subagents produce HTML mockups
published as Artifacts for the operator to click through.

Non-negotiable outputs, written to disk **as each item is agreed** (on the
operator's explicit "lock it in", then immediately — not at the session's
end):

- An OpenSpec change (bare-slug id, D153) in the owning project's `openspec/`
  — proposal, design, specs, tasks, via the normal opsx flow.
- `acceptance.md` inside the change folder: **falsifiable, UI-observable
  acceptance criteria per item**, written while operator intent is fresh.
  "After clicking Publish, the strip shows a marker on newly-eligible staged
  cards" — not "publishing works". These criteria are the review contract for
  Phase 3; an item without criteria cannot be built.
- Chosen mockups copied into the change folder under `mockups/`.
- Dropped/deferred items marked in the batch manifest with one line of why.
- The manifest row for the package set to `designed`.

Design sign-off is the operator's last *required* involvement until deploy.

## Phase 3 — Build (`/tun-build <batch> <package>`), one fresh session per package

One orchestrator agent per package. The operator's entire prompt is:
*"batch X, package Y — go."* The orchestrator reads only the manifest and its
change folder, then drives subagents through:

1. **Implement** — `opsx:apply`, committing after every opsx operation.
2. **Test** — a *separate* tester agent verifies each criterion in
   `acceptance.md` by observing the running UI (claude-in-chrome) or device
   (adb), never by reading code or trusting logs. A criterion passes only when
   the described end state was actually observed.
3. **Review** — a *separate* reviewer agent checks the diff against the design
   and the standards (D151/D152). Reviewer ≠ implementer, always.
4. **Fix loop** — bounded: at most 3 fix attempts per failing criterion. On
   the third failure the item is marked `BLOCKED` in the manifest with a
   one-line reason, and the orchestrator moves on. Blocked items are surfaced
   to the operator at the end, never mid-flight.
5. **Close** — `opsx:archive` per change, the orchestrator answering its
   sync prompt with "sync now" (archive subsumes the delta-spec sync; never
   archive without syncing). Append to the batch's `OPERATOR-CHECKLIST.md`
   and `DECISIONS-MADE.md`, set the manifest row to `archived`.

### The decision policy (what the orchestrator does when something was not decided)

| tier | situation | action |
|---|---|---|
| 1 | design record answers it | follow it, silently |
| 2 | undecided, low-stakes (naming, layout detail, lib choice) | decide autonomously; **one line** in `DECISIONS-MADE.md` |
| 3 | contradicts a design decision or an ADR, touches the device plane (`docs/11`), or destroys data | mark the item `BLOCKED`, finish the rest, surface at the end |

The operator is never interrupted mid-build. Tier 2 keeps guesses visible;
tier 3 keeps them harmless.

## What "archived" means here (D161)

Archiving a change means **implemented, agent-verified against the written
acceptance criteria, specs synced** — it does *not* mean operator-accepted.
Agents cannot test the live system (VPS, real TLS, real phone, prod
migrations), so operator acceptance is necessarily later and tracked by the
batch, not the change:

- `OPERATOR-CHECKLIST.md` is the artifact that survives archiving: deploy
  steps, **every one-time migration spelled out**, and the specific flows to
  test live per change.
- Live findings go into Quick Log as new items → new changes in the next
  cycle. A fix is never done by reopening the session that built the feature.
- **Operator feedback outranks specs.** If live testing shows an archived spec
  describes the wrong behavior, the fix change amends the spec — it never
  patches code around a spec treated as gospel.

## Phase 4 — Operator

Push to master, pull on the VPS, rebuild and restart containers, run
`OPERATOR-CHECKLIST.md` top to bottom, skim `DECISIONS-MADE.md` (it is kept to
one line per decision precisely so this takes minutes), test UI/UX and the
live phone. Every finding → Quick Log. Cycle restarts.

## Standing rules for every agent in this workflow

- **Device plane is frozen** (`docs/11-ota-contract.md`). A task that seems to
  require touching it is a wrong task → tier 3, `BLOCKED`.
- Read `docs/07-decisions.md` before proposing; never re-derive settled
  decisions.
- One package per session; stay within the projects your package's manifest
  entry lists, and never edit files another package owns.
- Every phase writes its state to disk before the session ends; a session
  that dies mid-phase must be resumable from the batch dir alone.
- Verification is framed to catch false success: criteria are observable end
  states, confirmed by looking at the UI/device, by an agent that did not
  write the code.
