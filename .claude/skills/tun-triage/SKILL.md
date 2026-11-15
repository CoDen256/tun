---
name: tun-triage
description: Triage phase of the tun batch workflow (docs/15-agentic-workflow.md, D161). Use when the operator says "/tun-triage", asks to triage BACKLOG.md, or asks to open a batch. Groups Quick Log items verbatim into dependency-based packages and emits /tun-design prompts.
---

# tun-triage — sort the backlog, open batches

You maintain `BACKLOG.md` and open batches. You **never write code, never
design implementations, never judge feasibility** — sorting and dispatching
only. Read `docs/15-agentic-workflow.md` first; the design conversation
happens later, in `/tun-design`, not here.

## Backlog rules

- The operator dumps raw items into `## Quick Log (Manual Dump)` with tags:
  `[BUG]`, `[UX]`, `[REHAUL]`, `[IDEA]`, `[DEV]`.
- When asked to triage: move Quick Log items into
  `## Triage & Planned Packages`, then clear Quick Log back to empty — it is
  a dump for the next raw entries, not an archive.
- **Verbatim only.** Never reword, summarize, or "clean up" an item's text,
  and never drop its `[TAG]`. Messy or ambiguous wording stays exactly as the
  operator wrote it — the design session is where ambiguity gets resolved.
- Don't second-guess scope, feasibility, or conflicts with prior decisions.
  Ask the operator a clarifying question only when you genuinely cannot tell
  which package an item belongs to.
- Stamp the section header: `> Last triaged <today's date>.`

## Packages are dependency groups, not project folders

Group items by **what must change together**, not by which directory they
live in:

- Items that pull on the same feature or data flow belong in one package even
  when they span projects — e.g. a stabbur UI item whose real work is a smia
  endpoint, plus the smia parsing item it depends on, is ONE package.
- A package therefore lists the projects it touches; one project is the
  common case, several is normal, not an exception.
- **Isolation lives BETWEEN packages (D161):** two packages in the same batch
  must be independently implementable — no shared files, no hidden coupling —
  so their design and build sessions can run in parallel. If two packages
  genuinely depend on each other, keep them separate and record an explicit
  `A before B` line for the batch manifest; never merge them into one
  entangled package, and never split one dependency group just to keep a
  package single-project.

Layout under `## Triage & Planned Packages`: one `### <package name>`
heading per package (name it after what the items are actually about), a
`projects:` line listing the projects it touches, then the raw item lines.
Pick names from the items themselves; don't predefine a category list.

## Opening a batch

When the operator asks to open a batch from the triaged packages:

1. Pick a bare-slug batch name (D153 style, e.g. `builder-integrity`).
2. Create `batches/<slug>/manifest.md` per `batches/README.md`: the chosen
   packages with their items **verbatim** and their `projects:` lines, any
   `A before B` dependency lines, and a status table with every package
   `pending`.
3. Create `batches/<slug>/OPERATOR-CHECKLIST.md` and
   `batches/<slug>/DECISIONS-MADE.md`, each containing just `# <slug>`.
4. Remove the batched packages from `Triage & Planned Packages` — the
   manifest owns them now. Unbatched packages stay where they are.
5. Commit.

Then output one ready-to-copy prompt per package, each for a FRESH session:

---
### 📦 [Package Name]
> "/tun-design batch `<batch-slug>`, package `[Package Name]`"
---

Design sessions run in any order unless the manifest records a dependency
direction. Never dispatch `/tun-build` yourself — each design session ends by
telling the operator which build prompt is ready.
