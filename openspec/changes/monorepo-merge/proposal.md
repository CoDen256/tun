## Why

D135 (2026-11-08) reversed D42 and accepted a monorepo, but recorded only the
reversal: "repo layout, build/CI boundaries, and migration mechanics are an
open `/opsx:explore` + proposal, not decided here." This is that proposal.

The operator's stated pain, in their words: *"I have to deploy 5x each time and
they do belong together"*, *"configs are spread out and not of one standard"*,
and *"the problem is 6 claude code sessions"*.

Each of those is structural, not cosmetic:

- **Deploy.** Five sibling checkouts, five `git pull`s, `include:` across repo
  boundaries, and a `tun-shared` external network that must be created by hand
  before the first boot (D104 — a step D94/D98 claimed was unnecessary and
  which was never actually verified before being written down).
- **Config.** Five `.env` files in which the same secret is typed more than
  once: `STABBUR_AUTH_TOKEN` in two, `SMIA_AUTH_TOKEN` in three,
  `PHONEXA_POSTGRES_PASSWORD` in two. `mjolnir/.env.example` is now ~120 lines
  of prose explaining which value must be kept in sync with which other file,
  including two pitfalls (P35, P36) that exist *only* because of the split.
- **Sessions.** A change that spans repos spans sessions. The phonexa
  path-routing work (2026-11-12) touched three repos and took three.

This change merges the six repositories into one, with **no behaviour change
whatsoever**. Everything that works today works identically after it. The
splits, the auth rework and the database consolidation are deliberately three
*separate* changes stacked on top of this one, so that this one can be verified
by "nothing changed."

## What Changes

**Merge, preserving all history.** `git subtree`-style merge of all six repos
into `tun`, each at its own top-level directory, full history reachable
(~1.5 GB pack — accepted explicitly by the operator). The six old remotes
become archives.

**Tree.** Projects at the top level, not under `services/`:

```
tun/
  compose.yaml  .env  README.md  CLAUDE.md  DEPLOY.md  .dockerignore
  docs/  openspec/  libs/
  postgres/   grind/   mjolnir/   stabbur/   smia/   phonexa/
  hover-translate/   backup/
```

**`include:` is kept, the external network is not.** Each project keeps its own
`compose.yaml`; the root file `include:`s them. Verified empirically
(2026-11-13): nested `include:` works, and two projects including the *same*
shared fragment deduplicate rather than conflict. One repo means one Compose
project means one default network — so `tun-shared`, `external: true`, and the
one-time `docker network create` (D98/D104) are deleted outright, not
standardised.

**Config layering.** The invariant is *no value appears in two files*, which is
not the same as centralising:

| file | holds |
|---|---|
| `tun/.env` | values used by more than one project |
| `<project>/.env` | values used by exactly one project |

So `HF_TOKEN`/`DEEPL_TOKEN`/`ELEVENLABS_TOKEN` stay in `smia/.env`;
`AMO_API_*` stay in `hover-translate/.env`. Derived values
(`DATABASE_URL`, `*_BASE_URL`, `*_UPSTREAM`) are computed in compose and never
typed at all.

**Naming.** Directory name = compose service key = hostname = URL prefix.
No `container_name:` anywhere — Compose already namespaces as `tun-<key>-1`.

**Version and shape standard** across the three Flask services and the Node
services: restart policy, healthchecks, port-binding, test layout, dev shell.

**phonexa's CI is deleted** (operator instruction) — see the open question
below, which must be answered before this change is applied.

**All documentation updated**, including the ADR supersessions this forces.

## Capabilities

### New Capabilities
- `monorepo-layout`: the tree, `include:` composition, config layering, naming.
- `service-standard`: the per-service shape every project conforms to.

### Modified Capabilities
- `unified-deployment`: one clone instead of five; no external network; no
  one-time network-create step.

## Impact

- Every repository. No source file's *contents* change except compose files,
  `.env*`, Dockerfile paths, and documentation.
- `docs/07-decisions.md`: D37, D42, D84, D94, D98, D101, D104, D118, D119,
  D147 superseded or amended; D135 gains its design; P35/P36 retired with the
  config they describe.
- Six `CLAUDE.md` files become one root plus per-project ones.
- Build contexts move to the repo root (for `libs/`), which makes a strict
  root `.dockerignore` mandatory — the combined working tree is ~10 GB.

**Non-goals (each is its own change):**
- Database consolidation → `postgres-consolidation`
- Splitting hub/phonexa, degradation → `zone-isolation`
- The auth rework → `unified-auth`
- Any change to the device-facing contract. None. Not in this change.

## Decisions taken (2026-11-13, operator)

- **phonexa CI: deleted in full.** The workflow's GitHub Pages job goes with
  it and `https://coden256.github.io/phonexa/` stops being published. Accepted
  knowingly — phonexa is served at `/phonexa/` behind the operator gate.
- **Execution scope: this repository only.** The merge, all configuration, the
  splits and the documentation are implemented and verified locally under
  Docker. The production cutover (identifying live volumes, dump/restore, the
  shadowing table move, the device replay) is delivered as a runbook in
  `DEPLOY.md` for the operator to execute. Nothing in this change touches live
  data or the TLS certificates.
- **Git: a `monorepo` branch, not pushed.** `master` is untouched and no
  remote receives the ~1.5 GB until the operator chooses to push.
- **smia's `providers/` stays tracked in git.** `DEPLOY.md`'s and
  `compose.yaml`'s claim that it is gitignored and must be `rsync`ed is simply
  wrong and is deleted. A fresh clone therefore gives a working smia, instead
  of one whose every data-backed provider silently returns empty candidates
  (the failure D118 confirmed live).
- **smia's backup excludes its lookup-cache tables**, which are rebuildable
  from `providers/` and the import scripts, mirroring the existing `job_logs`
  exclusion. Everything else in smia is dumped.
- **OpenSpec change ids are bare slugs, not dated.** Forced by tooling, not
  taste: `openspec status --change` and `openspec instructions apply --change`
  reject any name that does not start with a letter, so the dated convention
  used by `tun`, `mjolnir` and `phonexa` cannot be driven by the CLI at all.
  The four changes of this effort were renamed accordingly. The pre-existing
  dated changes have the same defect and are renamed as part of task 4.8.
