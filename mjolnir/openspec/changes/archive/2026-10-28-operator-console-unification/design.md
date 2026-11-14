## Context

Three independent findings sessions (grep/read against the real code, not speculation) confirm every item in the proposal against exact file:line locations:

- `builder/src/pipeline.js`'s `runForecast` builds `byDeck` only inside its loop over `newlyEligibleByDeck` — `pendingQueueDepths(pool)` (which queries **every** deck with a nonzero `pending_occurrences` row, no filter) is looked up per newly-eligible deck, but a deck absent from `newlyEligibleByDeck` never gets a `byDeck` entry at all, so its real queue depth is computed and then thrown away before `renderForecastPage` ever sees it. Confirmed: no data loss, `pending_occurrences` rows are untouched — this is purely an aggregation bug.
- `hub/src/config.js` never reads a `workbenchPatchesDir`/`WORKBENCH_PATCHES_DIR` env var at all; `hub/src/server.js`'s `createWorkbenchHandler({ patchesDir: config.workbenchPatchesDir || "patches" })` therefore always falls through to the literal string `"patches"`, resolved against hub's own process `cwd` — not necessarily the repo root, and not necessarily the same directory a locally-run `bundle-tool` CLI resolves against.
- Hub and builder are two separate, separately-deployed containers (`caddy/Caddyfile`'s two distinct `handle` blocks, `/mjolnir/*` → `mjolnir-hub:8000`, `/builder/*` → `mjolnir-builder:8001`), each with a near-duplicate `layout.js` (D80's explicit reasoning: separate processes, so no shared chrome package). Both read `OPERATOR_AUTH_TOKEN` from the same `.env` via `env_file: .env` in `compose.yaml`, and both set/read the same `operator_token` cookie at `Path=/` — meaning a login on either service already authenticates the other, today, by accident of shared config rather than deliberate design. This is load-bearing for the unified shell (§D-C9) and is called out explicitly so a future config split doesn't silently break it.
- The real stock app's CSS (fonts, theme colors, emphasis-class mappings) was extracted directly from `base/smali.mjolnir.merged/assets/index.android.bundle` — not approximated. Exact values are in D-C8.
- `card_slots.audio_sha256` + the existing blob cache (`data/blob/<sha256>`, written by `builder/src/audioSnapshot.js`) means a card's actual audio bytes ARE reachable server-side — `card-preview` can offer a real `<audio>` player, not just a static icon.

## Goals / Non-Goals

**Goals:**
- Fix both confirmed bugs (forecast pending-occurrence omission, workbench patches-dir resolution) with the smallest change that removes the actual defect.
- Give the operator visibility into which existing cards a publish changes, not only new ones — predictively (forecast) and after the fact (that run's log).
- Make the workbench a complete, self-sufficient tool for inspecting anything the operator has ever published or assembled — upload, catalogue, no tab pileup, sane downloads.
- Present hub + builder + workbench as one page with clear sections, **without** merging their backend processes — D80's separate-deployable reasoning still holds; this is a presentation-layer change only.
- Style `card-preview` from the real app's own extracted values, not invented ones.

**Non-Goals:**
- Merging hub and builder into one HTTP service/process/container. Confirmed not required: the unified shell is achievable with iframes under one already-shared origin.
- A fully faithful on-device renderer (gesture-based reveal, SRS scheduling, native fonts bundled pixel-perfect). `card-preview` approximates Poppins with a close web-safe/Google-Fonts stack if the real font file isn't trivially embeddable — flagged as an open question, not blocking.
- Persisting a structured "which cards changed" history table. The forecast's prediction is computed live (cheap at this project's scale, consistent with "full pull every run" already being the accepted cost elsewhere); the actual run's result is a job-log line, reusing the existing `job_logs` audit mechanism (D-H4) rather than new schema.
- Changing `OPERATOR_AUTH_TOKEN`/cookie semantics. The unified shell relies on the existing shared-token behavior as-is; if hub/builder are ever given independently-different tokens, the shell's iframes would need per-service login — out of scope here, noted as a risk.

## Decisions

### D-C1 — Forecast's `byDeck` iterates the union of newly-eligible decks and queued decks

```js
const deckCodes = new Set([...newlyEligibleByDeck.keys(), ...queueDepths.keys()]);
for (const deckCode of deckCodes) {
  const notes = newlyEligibleByDeck.get(deckCode) || [];
  ... // existing per-deck computation, now also runs for decks with notes.length === 0
}
```
The per-deck mint-id-prediction loop already handles `notes.length === 0` gracefully (its own `for (const note of notes)` loop simply doesn't execute) — no new branch needed, just a wider iteration set.

### D-C2 — "Would-update"/"did-update" cards: plain string-equality diff, no new schema

A card's projected `{N,E,X,A}` is a pure function of its note + the projector code (`project(note, opts)`, confirmed stateless). So "did this card's content change" is exactly: project it, compare the four fields against the existing `card_content` row, string-equal or not — no fuzzy diffing needed.

- **Forecast** (predictive): for every already-minted note still returned by stabbur (the same set `runPublish`'s regen loop already walks), project it and compare against `cardContent.getAll()`'s existing row. Collect `{cardId, deckCode, noteId}` for every mismatch into `forecast.wouldUpdate`. This is the one real new cost: forecast today never calls `project()` for already-minted notes at all. Accepted per this project's existing "full pull is cheap at this scale" posture (03-data-model.md) — same notes are already pulled either way, just not yet projected.
- **Actual run**: `runPublish`'s existing regen loop already re-projects and upserts every already-minted card unconditionally. Add one comparison (fetch the existing row via a single `cardContent.getAll()` call up front, same pattern `replay.js` already uses) immediately before the upsert; collect changed ids; log `regenerate: N of M existing card(s) actually changed content: <ids>` (replacing/extending the current "refreshed content for N" line) via the existing `log(buildJobId, ...)` mechanism — visible on `/builder/logs`, no new table.
- **Alternative considered**: store a content hash column on `card_slots` to make "did it change" a cheap indexed comparison instead of a full projection. **Rejected**: at this project's scale (thousands of cards, not millions), projecting + string-comparing every already-minted note on every forecast call is cheap, and a hash column is one more place content could drift from truth if the projector ever changes without a backfill.

### D-C3 — Workbench's `patchesDir` is absolute and cwd-independent

`hub/src/config.js` gains:
```js
const workbenchPatchesDir = process.env.WORKBENCH_PATCHES_DIR
  || path.resolve(REPO_ROOT, "patches");  // REPO_ROOT anchored via import.meta.url, never process.cwd()
```
`REPO_ROOT` is computed once from `hub/src/config.js`'s own module location (`path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..", "..")`), matching the existing pattern `src/commands/deobfuscate.js`'s `explodedDirFor`/`ASSETS_DIR` already uses for the same reason (never trust `cwd` inside a long-lived service). The CLI's own `--patches-dir` default (`bin/bundle-tool.js`) is left as the literal `"patches"` string — a human invoking the CLI interactively already controls their own cwd, and changing that default's meaning would be its own (undesired) behavior change for existing CLI users. Only hub's embedded instantiation changes.

### D-C4 — Workbench upload: raw-bytes POST, staged to a temp file, then the existing `openByPath` path

New route `POST /api/sessions/upload` (added to `src/commands/ui.js`'s own route table, not hub-specific — the CLI's standalone `bundle-tool ui` gets this for free too). Body: raw bytes (same `readBody`/size-cap pattern hub's own `/mjolnir/ota/*` routes already use); `X-Filename` header names the upload for the staged file's basename. Handler: write to `path.join(os.tmpdir(), `bundle-tool-upload-${timestamp}-${sanitizedFilename}`)`, then call the exact same `sessions.openByPath(tempPath)` every path-based open already uses — zero duplicated session logic. The temp file is intentionally never cleaned up automatically (mirrors how an operator-typed path is never "cleaned up" either — the session just keeps pointing at it); a stale-temp-file sweep is explicitly out of scope, left as an open question.

Frontend: a drop-zone + file-input pair (same interaction pattern hub's own OTA submit page already established — `dragover`/`drop`/`change` handlers, `file.arrayBuffer()`, `fetch(..., {body: bytes})`) added to `src/ui-assets/index.html`'s session bar, wired in `app.js` next to `openBundlePath`.

### D-C5 — Catalogue: a hub-rendered list, not a workbench-side DB client

The workbench (`src/commands/ui.js`) has no database access by design (D108, from the prior change — kept database-free deliberately). So the catalogue of "every OTA build + every logic bundle" is rendered by **hub** (which already has `listPublications`/`listLogicBundles`), not fetched by the workbench itself. Each row's "open in workbench" link reuses the exact `?open=<path>` mechanism already built for publish-history's "inspect" link — the catalogue is really just that same link pattern applied to logic bundles too (which currently have none) plus a dedicated page listing both side by side, rather than scattered one per existing page.

### D-C6 — Named-window reuse for every "open in workbench" link

Every such link (catalogue, publish-history inspect, logic-bundle inspect) switches from `<a target="_blank">` to an `onclick` calling `window.open(href, 'mjolnir-workbench')`. A named target reuses/focuses an already-open tab with that name and navigates it to the new URL — which, being a real top-level navigation to a new `?open=` URL, re-runs `init()`/`openFromQueryParam()` fresh in that same tab, so the new bundle actually gets selected immediately. No session-list polling needed (considered and rejected: polling adds a timer/interaction-state concern for a problem a named window already solves for free).

### D-C7 — Download filename: label-derived when present

`Content-Disposition: attachment; filename="${buildId}${label ? '-' + slugify(label) : ''}.js"`, where `slugify` lowercases, replaces whitespace/non-filename-safe characters with `-`, and truncates to a reasonable length (~40 chars) — small, local, no new dependency.

### D-C8 — `card-preview`'s styling: real extracted stock values, **dark theme** (revised)

Hardcoded stylesheet (not computed/fetched — these are fixed constants extracted once from the real bundle, not expected to change). **Revised after operator feedback** from the light-theme values originally shipped (`#16215B`/`#246BFD`/`#fff` background) to the stock app's own DARK theme instead — the operator specifically preferred the device's actual dark look over the lighter approximation:
```css
.card-preview-face { font-family: 'Poppins', sans-serif; color: #fff; background: #1B1D21; text-align: center; }
.card-preview-face b { font-family: 'Poppins', sans-serif; font-weight: 700; color: #3F8CFF; }
.card-preview-face .teal { color: #00A4BF; }
.card-preview-face .red { color: red; }
.card-preview-face .green { color: #5DD8D0; }
.card-preview-face .left { text-align: left; }
.card-preview-face i, .card-preview-face .italic { font-style: italic; }
```
Still one fixed theme, not a toggle matching the device's own light/dark setting — same reasoning as before (a preview's job is "does this look right," not full fidelity to every device setting), just the other fixed choice.

**Also revised: inline, not a separate page.** Rather than a standalone `/mjolnir/cards/:id/preview` route, the preview is an expandable row directly under the card's own row in the Cards table — one toggle button per card, exclusive (opening one closes any other already open), **faces stacked vertically** (`flex-direction: column`, not side-by-side) per the operator's explicit preference. `cardsList` (`hub/src/cards.js`) now selects `x`/`a`/`audio_sha256` alongside `n`/`e` so the inline preview needs no extra per-card round trip — the whole Cards page already has everything it needs in one query.

Three faces are rendered: N, E, X (the actual three content fields every card type has, per `docs/findings.md` and `tun/docs/03-data-model.md`) — not one face per occurrence letter, since occurrences are a *quiz-presentation* concept (which side shows first) while N/E/X are the *content* concept; showing all three content faces is strictly more informative for "does this look right" than showing only the occurrence set's faces. Whichever face's letter matches `card_content.a` gets a 🔊 badge; if `card_slots.audio_sha256` resolves to a real file in the blob cache (`data/blob/<sha>`), that badge is an actual `<audio controls src="...">` element via a new `GET /mjolnir/cards/:cardId/audio` streaming route (same existing-file-streaming pattern the OTA download route already established); otherwise a plain static 🔊 glyph with no player.

### D-C9 — ~~Unified shell: one new hub-rendered page, iframes over existing routes, `embed=1` bypass~~ **SUPERSEDED by D109 (tun/docs/07-decisions.md)**

Reversed one build after shipping, per direct operator feedback: doubled chrome, and the embedded workbench's own light theme read worse nested inside hub's dark shell than linked to directly. Replaced with hub directly importing and rendering builder's page bodies (`buildForecastBody`/`buildScheduleBody`/`buildLogsBody`, exported from `builder/src/server.js`) in hub's own shell — same monorepo, same shared Postgres, no iframe, no `embed` flag, no `/mjolnir/console`. The section below is kept for the historical record of what was tried and why it didn't work, not as the current design.

New route `GET /mjolnir/console` (hub) renders one page: a top-level tab bar (Cards / Builder / OTA / Tools) over four `<iframe>`s pointed at `/mjolnir/cards?embed=1`, `/builder?embed=1`, `/mjolnir/ota?embed=1`, `/mjolnir/workbench/?embed=1` respectively. `renderShell` (both `hub/src/layout.js` and `builder/src/layout.js`) gains an `embed` flag: when true, skip the `.top-bar`/`.rail` wrapper entirely and render just the page's own `body` — removing the doubled chrome an iframe-in-a-shell would otherwise show. The workbench's own chrome (tabs for Explorer/Compare/Editor/Patches/Assemble) is left as-is inside the Tools iframe — it's a tabbed app, not a top-bar+rail duplicate, so nested tabs read fine without a special embed mode there.

**Why iframes, not a client-side fetch-and-inject shell** (the alternative explored): fetch-and-inject would need every inline `<script>` across both services' pages (hub's OTA page alone has ~150 lines of inline JS) re-executed after `innerHTML` assignment, which is fragile and a much bigger surface to get right for marginal UX gain (no iframe scrollbar/sizing quirks) over same-origin iframes, which inherit cookies/auth for free and require zero changes to any existing page's own JS.

**Why not merge hub+builder into one process** (the alternative explored): confirmed both are deliberately separate deployables (D80) with their own `config.js`/auth/route tables; merging would be the highest-risk option here for a UI-presentation ask, and contradicts the project's stated deployment model for no behavioral gain this proposal actually needs.

`/mjolnir/console` becomes the new recommended front door (linked from both services' own `layout.js` top-bars as "← unified console"); the individual pages (`/mjolnir`, `/mjolnir/cards`, `/builder`, `/mjolnir/ota`, `/mjolnir/workbench/`) all keep working exactly as today, both for existing bookmarks and because the iframes need them to keep working standalone.

## Risks / Trade-offs

- **Forecast's new `wouldUpdate` projection pass adds real per-call cost** (one `project()` call per already-minted note, every forecast request). → Accepted per D-C2's reasoning; revisit only if real-scale measurement shows it's actually slow, consistent with how this project already treats "full pull every run."
- **Shared-cookie cross-service auth (D-C9) is implicit, not enforced.** If hub and builder are ever configured with different `OPERATOR_AUTH_TOKEN` values, the unified shell's iframes would each need their own login, breaking the one-shell illusion silently. → Documented explicitly in this design and in a `DEPLOY.md` note (task), not code-enforced (enforcing it would mean one service reading the other's config, a bigger coupling than this proposal wants).
- **Temp files from workbench uploads are never swept.** → Acceptable at this project's operator-facing, low-volume scale (same as today's `.ota-submit-*.tmp` pattern in `hub/src/ota.js`, which is also never proactively swept, only cleaned up in its own `finally` block on the happy path); flagged as an open question below rather than solved here.
- **`card-preview`'s font approximation.** Poppins may not be bundled/available in every operator's browser. → Falls back to the browser's default sans-serif; visually close enough for "does this look right," not pixel-perfect — explicitly a non-goal.

## Migration Plan

No schema changes. Sequencing:
1. The two bug fixes (D-C1, D-C3) — independent, no dependencies, ship first.
2. `card-preview` (D-C8) and the workbench improvements (D-C4/C5/C6/C7) — independent of each other and of (1).
3. The forecast/history content-diff (D-C2) — depends on nothing above but is the most involved single item; do it on its own.
4. The unified shell (D-C9) — last, since it only *frames* pages that must already work standalone; doing it last means every section it embeds is already correct.

## Open Questions

- Should uploaded-bundle temp files ever be swept (a TTL, a max-count eviction)? Leaning toward: not now, revisit if disk usage ever actually becomes a problem (D-C4's reasoning).
- Does `card-preview` need a dark-mode palette to match the device's own dark theme, or is light-only sufficient for "does this look right"? Leaning toward: light-only now (D-C8), add dark later only if an operator actually asks.
- Is Poppins realistically embeddable (self-hosted `.ttf`, confirmed present in the repo under the base APK's `assets/fonts/`) worth bundling into hub's static assets for pixel-fidelity, or is a web-safe fallback good enough? Leaning toward: ship the fallback first, embed the real font only if the approximation turns out to look meaningfully wrong in practice.
