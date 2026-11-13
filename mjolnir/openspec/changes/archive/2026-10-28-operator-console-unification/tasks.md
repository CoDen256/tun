## 0. Before you write any code

Read `design.md` in full, especially D-C1/D-C3 (the two confirmed bugs, with
exact file:line root causes already found — do not re-diagnose them) and
D-C9 (why this is an iframe shell over existing routes, not a process
merge). Read `tun/docs/03-data-model.md`'s projection-is-pure section before
touching `builder/src/projector.js`'s content-diff logic (D-C2) — projection
must stay a pure function of note input, the diff just compares its output.

## 1. Bug fix: forecast's pending-occurrence queue depth

- [x] 1.1 `builder/src/pipeline.js`'s `runForecast`: build `byDeck` from the
      union of `newlyEligibleByDeck.keys()` and `queueDepths.keys()` (D-C1),
      not only the former — a deck with `notes.length === 0` already falls
      through the existing per-note loop harmlessly.
- [x] 1.2 Tests: a deck with a nonzero `pending_occurrences` depth and zero
      newly-eligible notes this forecast call still appears in
      `forecast.byDeck` with its real depth.

## 2. Bug fix: workbench `patchesDir` resolution

- [x] 2.1 `hub/src/config.js`: add `workbenchPatchesDir`, read from
      `WORKBENCH_PATCHES_DIR`, defaulting to an absolute path anchored via
      `import.meta.url` (never `process.cwd()`), per D-C3.
- [x] 2.2 `hub/src/server.js`: confirm `createWorkbenchHandler` receives this
      resolved absolute path (no behavior change needed here beyond 2.1
      actually supplying a real value).
- [x] 2.3 `.env.example`/`DEPLOY.md`: document `WORKBENCH_PATCHES_DIR` as
      optional, with its default explained. `DEPLOY.md` done; `.env.example`
      could not be edited in this session (directory denied by this
      session's own permission settings) — add `WORKBENCH_PATCHES_DIR=`
      (optional) by hand next to `LOGIC_BUNDLE_DIR`.
- [x] 2.4 Tests: a patch saved through one entry point (simulating a
      locally-run CLI session) is visible through hub's embedded workbench
      in the same test run, proving the resolved directory is identical
      regardless of caller. No DB needed — these run for real, 3/3 passing.

## 3. Workbench: upload, catalogue, named-window reuse, download filename

- [x] 3.1 `src/commands/ui.js`: new `POST /api/sessions/upload` route — raw
      body (reuse the existing size-cap/`readBody` pattern), `X-Filename`
      header, stage to a temp file, call the existing `sessions.openByPath`
      (D-C4). No change to `openByPath` itself.
- [x] 3.2 `src/ui-assets/index.html` + `app.js`: drop-zone + file-input next
      to the existing path input; `file.arrayBuffer()` → `fetch` to the new
      route; on success, behaves exactly like opening by path (same
      `setActiveSession` call).
- [x] 3.3 `hub/src/server.js`: a catalogue view/section combining
      `listPublications()` and `listLogicBundles()`, each row linking to
      open that exact file in the workbench via the existing `?open=<path>`
      mechanism (D-C5) — reuse, don't reimplement, the pattern publish
      history's "inspect" link already established.
- [x] 3.4 `hub/src/server.js`: add the same "inspect" link to the
      logic-bundles table on `/mjolnir/ota` (today only publish history has
      one).
- [x] 3.5 Every "open in workbench" link (catalogue, publish-history
      inspect, logic-bundle inspect) switches from `<a target="_blank">` to
      `onclick` → `window.open(href, 'mjolnir-workbench')` (D-C6).
- [x] 3.6 `hub/src/server.js`'s download route: filename becomes
      `${buildId}${label ? '-' + slugify(label) : ''}.js` (D-C7); small local
      `slugify` helper, no new dependency.
- [x] 3.7 Tests: upload-to-session end to end (2/2 passing, no DB needed);
      catalogue page renders both tables with inspect links; download
      `Content-Disposition` filename incorporates the label. (Hub's DB-backed
      assertions are syntax-checked only in this sandbox — no local
      postgres; same caveat as the prior change.)

## 4. Forecast + publish history: existing-card content diff

- [x] 4.1 `builder/src/cardContent.js` (or a shared helper): given a note +
      its current `card_content` row, project the note and compare all four
      fields for equality (D-C2) — pure, no new schema. Implemented as
      `contentChanged(existing, projected)`.
- [x] 4.2 `builder/src/pipeline.js`'s `runForecast`: for every already-minted
      note still returned by stabbur, project and diff against
      `cardContent.getAll()`; collect `forecast.wouldUpdate` (`{cardId,
      deckCode, noteId}[]`).
- [x] 4.3 `builder/src/pipeline.js`'s `runPublish` regen loop: diff before
      each upsert (reuse the same comparison from 4.1); collect changed ids;
      replace/extend the existing `regenerate: refreshed content for N
      existing card(s)` log line with one naming how many of those N
      actually changed, and their ids.
- [x] 4.4 `builder/src/server.js`'s `renderForecastPage`: a panel listing
      `forecast.wouldUpdate` (card id, deck, note), distinct from the
      existing "would ship"/"would queue" panels.
- [x] 4.5 Tests: an edited already-minted note's card appears in
      `wouldUpdate`; an untouched already-minted note's card does not; a
      real publish's job log names exactly the cards that actually changed,
      not every already-minted card. Added to `pipeline.test.js`'s existing
      "editing an already-minted note" test (same sandbox DB caveat).

## 5. `card-preview`

- [x] 5.1 `hub/src/cardContent.js`/`hub/src/cards.js`: a read path returning
      the full `{N, E, X, A}` for one card id (today's `cardsList` only
      selects `n`/`e`). `cardContent.get()` already returned the full shape;
      added `cards.js`'s `getCardSlot()` for the audio sha + deck title.
- [x] 5.2 New hub route + page rendering the three faces (N/E/X) using the
      extracted stock stylesheet from D-C8 — hardcoded CSS constants, no
      computed/fetched theme. Standalone page (not wrapped in hub's own
      operator-console `renderShell`) so the stock styling isn't fighting
      hub's own theme.
- [x] 5.3 Flag whichever face matches `card_content.a` with a 🔊 badge; if
      `card_slots.audio_sha256` resolves to a file in the existing blob
      cache, serve it via a new `GET /mjolnir/cards/:cardId/audio` route and
      render a real `<audio controls>`; otherwise a static, non-interactive
      badge.
- [x] 5.4 `hub/src/server.js`'s Cards page: a "preview" link/action per card
      row, opening the new preview.
- [x] 5.5 Tests: preview renders all three faces with the right emphasis
      classes styled; the audio-bearing face is flagged; a card with no
      resolvable audio file shows the static badge; a card with a real blob
      on disk gets a working `<audio>` element and the exact bytes stream
      back (same sandbox DB caveat as elsewhere).

## 6. `operator-console-shell`

- [x] 6.1 `hub/src/layout.js` and `builder/src/layout.js`: `renderShell`
      gains an `embed` option — when true, render only the page's own
      `body`, skipping the `.top-bar`/`.rail` wrapper (D-C9).
- [x] 6.2 Every route that calls `renderShell` reads `embed=1` from its own
      query string and threads it through (minimal, mechanical change per
      route) — 4 hub page routes, 3 builder page routes.
- [x] 6.3 New hub route `GET /mjolnir/console`: one page, a top-level tab bar
      (Cards / Builder / OTA / Tools), four iframes pointed at
      `/mjolnir/cards?embed=1`, `/builder?embed=1`, `/mjolnir/ota?embed=1`,
      `/mjolnir/workbench/?embed=1`.
- [x] 6.4 Add a "← unified console" link from both services' own
      `layout.js` top-bars back to `/mjolnir/console`.
- [x] 6.5 Tests: `/mjolnir/console` loads with all four iframes present and
      pointed at the right `embed=1` URLs; an `embed=1` request to any
      existing page renders without its own top-bar/rail; a non-`embed`
      request to the same page is unchanged from today (hub + builder both
      covered; same sandbox DB caveat).
- [x] 6.6 `DEPLOY.md`: a note on the existing shared-`OPERATOR_AUTH_TOKEN`/
      shared-cookie behavior the unified shell relies on (D-C9's risk) — not
      a new requirement, just making an implicit dependency explicit for
      whoever edits `.env` later.

## 7. Sign-off

- [x] 7.1 Re-run every affected suite in full: `builder`, `hub`, the main
      repo's `test/unit` (workbench/ui tests) — confirm nothing else
      regressed. Main repo (`npm test`, no DB needed): **146/147 pass** (the
      one failure, `apply-rules-size-filter.test.js`, is pre-existing and
      unrelated — a Node-version `mock.module` incompatibility, confirmed
      untouched by this change). `hub`'s DB-independent suite
      (`config.test.js`, no DATABASE_URL needed): **3/3 pass**. Every
      DB-dependent suite (`hub`, `builder`) skips cleanly with no
      `DATABASE_URL` configured in this sandbox — run
      `DATABASE_URL=... npm test` in both before trusting those further.
      Full-repo `node --check` syntax sweep: clean.
- [ ] 7.2 Manually click through: forecast's new pending-queue and
      would-update panels; workbench upload + catalogue + repeated-inspect
      window reuse; a card preview; the unified console's four sections.
      **Not done in this session** — no running Postgres/browser in this
      sandbox; this is the operator's own manual verification pass against a
      real deployment.
- [x] 7.3 If anything here contradicts or refines `design.md`'s decisions
      during implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
      Nothing contradicted a recorded decision during implementation — no
      amendment needed. **Superseded by task 8 below, after real operator
      use of section 6: recorded as D109.**

## 8. Operator feedback round (post-implementation corrections)

Real use of sections 3/5/6 surfaced concrete problems — fixed directly,
not re-proposed, since each is a correction to already-landed work rather
than new scope.

- [x] 8.1 **D109 (supersedes D-C9): the iframe-based unified console is
      removed.** It doubled chrome and the workbench's own look read worse
      framed than linked to directly. Replaced with: `hub/src/layout.js`'s
      `NAV` gains a "Builder" group (Forecast & publish / Schedule / Run
      log) pointing at new hub routes (`/mjolnir/builder/forecast`,
      `/schedule`, `/logs`); `builder/src/server.js`'s three page bodies are
      factored into exported `buildForecastBody`/`buildScheduleBody`/
      `buildLogsBody` functions (pure markup builders, no `renderShell` call
      baked in); hub imports these directly alongside builder's read-only
      data functions (`runForecast`, `recentBuildJobs`, `getSchedule`,
      `jobLogLines`, `recentBatches`, `occurrencesForBuild`, `getActiveMeta`
      — same monorepo, same shared Postgres, D-P3) and wraps the result in
      hub's own `renderShell`. The `embed`/`isEmbed` mechanism, `/mjolnir/
      console`, `renderConsolePage`, and the "← unified console" nav links
      are all removed. hub's own `STYLE` gained the handful of builder-only
      classes (`.stat-row`, `.schedule-options`, `.radio-row`, `.timeline`/
      `.tl-*`, `.log-line`, `.json-toggle`) these bodies use, copied
      verbatim (same CSS variables, visually identical). The workbench nav
      link gains `target="_blank"` — explicitly fine to open in a new tab,
      per the operator.
- [x] 8.2 **`card-preview` moved inline and switched to the dark theme.**
      No longer a separate `/mjolnir/cards/:id/preview` page (removed, along
      with its route and `renderCardPreviewPage`) — now an expandable row
      under each card in the Cards table (`card-preview-toggle` button +
      hidden `card-preview-row`, one open at a time, closing any other via a
      small inline script). Faces stack vertically (`flex-direction:
      column`), not side-by-side. Colors switched to the stock app's DARK
      theme (`cardText #fff`, `headingAccent #3F8CFF`, background `#1B1D21`
      — not the light-theme `#16215B`/`#246BFD`/`#fff` from the first pass).
      `cardsList` (`hub/src/cards.js`) now also selects `x`, `a`, and
      `audio_sha256` so the inline preview needs no extra per-card query.
- [x] 8.3 **Workbench patches-dir confusion (not a code bug — a docs/
      diagnosability gap).** The operator set `WORKBENCH_PATCHES_DIR`/
      `LOGIC_BUNDLE_DIR` to host filesystem paths (e.g. `/root/mjolnir/
      patches/js`), which are invisible inside the container unless
      separately bind-mounted — the existing `.:/app` mount already covers
      the defaults (`/app/patches`, `/app/data/logic`) with zero
      configuration needed. Fixed: `DEPLOY.md` now explains this plainly and
      warns against host-path overrides; the Patches and Assemble tabs
      (`src/ui-assets/`) now display the server's own resolved absolute
      directory right above the list (new `GET /api/patches-dir` route in
      `src/commands/ui.js`), so an unexpectedly-empty list is immediately
      diagnosable instead of silently mysterious.
- [x] 8.4 **Upload: unreadable session name, no feedback during parse.**
      `createSessionStore`'s `openByPath` gains an optional `displayName`
      (the upload route now passes the operator's original, sanitized
      filename; the temp file's own on-disk name stays a short random
      string, never shown). `sessionSummary`/the session-bar UI prefer
      `displayName` when present. The upload handler now shows an explicit
      "Opening … this can take several seconds" status message and disables
      the dropzone/file-input while working, instead of appearing to freeze
      with zero feedback — a real numeric progress bar isn't honestly
      possible here (module parsing/exploding is synchronous, no streaming
      progress signal exists to report), so this is deliberately a status
      message, not a progress bar.
- [x] 8.5 **"No OTA bundles visible in workbench."** Added a fourth
      workbench tab, "Catalogue", listing every OTA build and logic bundle
      with one click to open each — fetched from a new `GET /mjolnir/
      catalogue.json` hub route (the workbench itself still has no database
      access, D108; this is hub-side data the embedded workbench's frontend
      fetches, not a backend dependency). Degrades to a plain "catalogue
      unavailable" message when the workbench runs standalone (no hub to
      fetch from). The existing human-readable `/mjolnir/catalogue` HTML
      page is unchanged and kept alongside this.
- [x] 8.6 Tests updated for all of the above: `hub/test/hub.test.js`'s
      server test rewritten (inline preview assertions replacing the old
      `/preview`-page assertions; `/mjolnir/console` now asserted 404;
      `/mjolnir/builder/forecast|schedule|logs` asserted; `/mjolnir/
      catalogue.json` asserted); `builder/test/server.test.js`'s embed test
      removed; `test/unit/ui.test.js` gained `displayName` and `/api/
      patches-dir` tests (4/4 passing for real, no DB needed). Full main-repo
      suite re-run: 149/150 (one pre-existing, unrelated failure). Full
      `node --check` sweep: clean.

## 9. Second operator feedback round: card-preview borders, readable logic filenames, patches/companions split (D110)

- [x] 9.1 **Card-preview faces get a white, rounded border.**
      `hub/src/server.js`'s `.card-preview-face` CSS rule gains
      `border: 2px solid #fff; border-radius: 14px;` (was borderless,
      `border-radius: 10px`), per direct request.
- [x] 9.2 **Logic bundle filenames are human-readable, not a bare sha256
      (supersedes the filename shape introduced by D107 — content-addressing
      itself is unchanged, only the name).** `hub/src/ota.js`'s
      `writeLogicBundleFile` now builds `<baseVersion>-patch<patchRev>-
      <label>-<sha10>.js` (slugified via new `hub/src/slug.js`), sha kept
      only as a 10-char disambiguating suffix, not the whole name. Both
      `submitBundle` and `forcePublish` call sites pass through
      `baseVersion`/`patchRev`/`label`. `hub/test/hub.test.js` asserts the
      new shape with a regex.
- [x] 9.3 **REPLACE-style patches vs. APPEND-style companions are now a
      first-class distinction in bundle-tool itself (D110), not just an
      undocumented filesystem split.** New `src/companions.js` (`listCompanions`)
      reads `<patchesDir>/js`, listing standalone `.js` scripts and excluding
      `.baseline.js`/`.edited.js` pair halves (those belong to the raw
      patchback mechanism, targeted by module id via the CLI, never
      companions). `assembleBundle` (`src/commands/assemble.js`) takes
      `companionFiles` (an ordered array, fail-fast resolved up front same as
      patches) instead of a single `companionFile`; returns
      `appliedCompanions` alongside `appliedPatches`. `src/commands/ui.js`
      gained `GET /api/companions`; `bin/bundle-tool.js`'s `assemble` command
      takes `--companions <files>` (comma-separated) instead of
      `--companion <file>`, and prints both `patches (replace)` and
      `companions (append)` lines. The Assemble tab's UI
      (`src/ui-assets/index.html`/`app.js`) gained a second ordered
      available/selected picker, mirroring the existing patches picker,
      auto-preselecting `boot-ok-companion` the first time it loads (nearly
      every real assembly needs it) — the old single `assemble-companion`
      text input is gone. The Patches tab gained an empty-state note
      (`patches-empty-note`, shown only when the JSON store is genuinely
      empty) explaining the REPLACE/APPEND split and pointing to the
      Assemble tab for companions, since an operator seeing an empty list
      has no other way to discover this distinction exists.
- [x] 9.4 Tests: `test/unit/companions.test.js` (new, 3/3 — exclusion of
      pair members, missing-directory, real `patches/js/` fixture);
      `test/unit/assemble.test.js` extended (multiple companions applied in
      order, unknown companion file aborts before output is touched);
      `test/unit/ui.test.js` extended (`GET /api/companions`, multi-companion
      assemble via the API). Full suite re-run: 154/155 (same one
      pre-existing, unrelated `mock.module` failure as section 8). Full
      `node --check` sweep: clean. D110 recorded in `tun/docs/07-decisions.md`.

## 10. Third patch-like mechanism: raw patch-back pairs (D111)

D110 (section 9) correctly explained why the Patches tab's JSON store was
empty, but incorrectly assumed every non-JSON file under `patches/js` was a
companion — missing that `2176-my-account-build-id.baseline.js`/`.edited.js`
is a third, real, REPLACE-style mechanism (patch-back pairs, module-id
addressed) that was still completely invisible to bundle-tool.

- [x] 10.1 New `src/patchbackPairs.js`: `listPatchbackPairs(dir)` finds
      complete `<id>-name.baseline.js`/`.edited.js` pairs (a lone half is
      skipped, not an error), parsing the leading module id from the
      filename; `loadPatchbackPair(dir, name)` throws a clear error for an
      unknown name or one with no parseable module id.
- [x] 10.2 `assembleBundle` (`src/commands/assemble.js`) gained
      `patchbackPairNames`/`patchbackDir` (defaulting to `<patchesDir>/js`,
      same convention as companions): each pair is resolved up front
      (fail-fast, same "no partial output on failure" guarantee as patches/
      companions) and applied via `computePatchedModuleSource` — the exact
      same reconciliation core `src/patches.js`'s JSON patches use, just
      located by the pair's own module id instead of a content locator.
      Returns `appliedPatchbackPairs` alongside `appliedPatches`/
      `appliedCompanions`.
- [x] 10.3 `src/commands/ui.js` gained `GET /api/patchback-pairs` (listing)
      and `POST /api/patchback-pairs/:name/preview`/`/apply` (mirroring the
      existing JSON-patch preview/apply routes exactly, against an open
      session). `/api/assemble` passes `patchbackPairNames`/`patchbackDir`
      through.
- [x] 10.4 `bin/bundle-tool.js`'s `assemble` command gained
      `--patchback-pairs <names>` (comma-separated); prints
      `patch-back pairs (replace)` alongside the existing `patches (replace,
      JSON)`/`companions (append)` lines.
- [x] 10.5 UI: the Patches tab (`src/ui-assets/index.html`) now shows two
      separate lists — "Saved patches" (JSON store) and "Patch-back pairs"
      (module-id addressed) — sharing one preview/apply panel
      (`app.js`'s `previewPatchByName(kind, name)` now takes a kind so the
      same panel can hit either `/api/patches/...` or
      `/api/patchback-pairs/...`). The Assemble tab gained a third ordered
      picker ("Patch-back pairs to apply, in order"), reusing the same
      `renderOrderedPicker` helper as the patches/companions pickers.
- [x] 10.6 Tests: `test/unit/patchbackPairs.test.js` (new, 5/5 — pair
      discovery, missing directory, unknown name, no-module-id name, and
      the real repo's own `2176-my-account-build-id` fixture);
      `test/unit/assemble.test.js` extended (a synthetic pair applied
      end-to-end, unknown pair name aborts before output is touched);
      `test/unit/ui.test.js` extended (list/preview/apply routes, assemble
      with a pair alongside patches/companions). Full suite re-run: 165/166
      (same one pre-existing, unrelated `mock.module` failure). Full
      `node --check` sweep: clean. D111 recorded in
      `tun/docs/07-decisions.md`; `patches/README.md` updated to describe
      all three mechanisms.
- [x] 10.7 Companions gained a read-only preview in the Patches tab too, so
      all three mechanisms are inspectable from one place: new
      `GET /api/companions/:name/source` (`src/commands/ui.js`) returns the
      companion's raw, unsubstituted source (no bundle/session to diff
      against — companions add code, they don't modify any existing
      module). The Patches tab's shared preview panel now branches on a
      third `previewPatchByName` kind, `"companion"` — renders the raw
      source in a `<pre>` instead of the diff view, hides "Apply to active
      session" (substituting a companion's placeholders needs buildId/
      baseVersion/patchRev, only available in the Assemble tab's own
      flow), and needs no active session at all to preview. Tests:
      `test/unit/ui.test.js` gained 2 cases (source returned with
      placeholders intact; unknown name errors clearly). Full suite
      re-run: 167/168 (same pre-existing failure).

## 11. Assemble tab: no base folder/output path when embedded, submits a logic bundle directly (D112)

Two operator reports: "no bundle found at base/smali.mjolnir.merged/
assets/index.android.bundle" even though it genuinely exists (root cause:
a relative path typed into the Assemble tab resolved against hub's own
`process.cwd()`, `/app/hub` per its Dockerfile's `WORKDIR`, not the repo
root `/app`); and a request to drop the output-bundle-path/base-folder
fields entirely, submitting straight to the logic bundles store instead,
with the same optional label/patch-rev fields the existing OTA "submit
bundle" form already has.

- [x] 11.1 `hub/src/config.js` gained `baseFolderDir`
      (`BASE_FOLDER_DIR` env override, defaulting REPO_ROOT-anchored to
      `base/smali.mjolnir.merged` — same anchoring pattern as
      `workbenchPatchesDir`/`logicBundleDir`), fixing the cwd-vs-REPO_ROOT
      bug directly: the embedded Assemble tab never asks for a base folder
      at all now, so there's no client-typed relative path left to get
      wrong.
- [x] 11.2 `hub/src/ota.js` gained `assembleDefaults({baseFolderDir})` (read-
      only: the base folder's own `base_version` plus the next global
      `patch_rev`, for the UI to show before the operator hits "Assemble")
      and `assembleAndSubmit({...})` — assembles via `src/commands/
      assemble.js`'s `assembleBundle` against a throwaway temp path (same
      shape as `forcePublish`'s own temp-file-then-cleanup pattern), then
      submits the bytes via the existing `submitBundle` directly, no
      intermediate output file the operator has to separately upload.
      `patchRev` auto-resolves via `logicBundles.nextPatchRev()` if not
      given; `label` auto-generates as `<baseVersion>-patch<patchRev>` if
      not given — both matching the user's "optional, auto" ask exactly.
      Companions' `BUILD_ID` placeholder gets a fixed `"unassigned"` value
      at this stage (cosmetic until actual publish re-stamps it for real,
      D105).
- [x] 11.3 `hub/src/server.js` gained `GET /mjolnir/ota/assemble-defaults`
      and `POST /mjolnir/ota/assemble-submit`, both gated by the same
      operator-auth check every other `/mjolnir/*` route already has.
- [x] 11.4 UI (`src/ui-assets/index.html`/`app.js`): the Assemble tab now
      probes `GET /mjolnir/ota/assemble-defaults` on load to detect
      "running embedded in hub" (200) vs. "standalone bundle-tool, no
      database, D108" (anything else — same degrade-gracefully pattern the
      Catalogue tab already uses for `/mjolnir/catalogue.json`). Embedded:
      shows only a "Label" field (patch rev stays, now optional/auto-
      hinted), hides base folder/output path/build id entirely, submits via
      the new hub routes. Standalone: unchanged original flow. The patches/
      patch-back-pairs/companions pickers are identical in both modes —
      only the final submit step and its required fields differ.
- [x] 11.5 Running `hub/test/hub.test.js` for the first time this session
      against a REAL database (a throwaway Postgres db on the already-
      running `mjolnir-postgres` container — previously always `test.skip`
      since no `DATABASE_URL` had ever been configured in the sandbox)
      surfaced 3 unrelated, already-latent bugs, fixed alongside this:
      `writeLogicBundleFile` (D110) slugified `base_version`, turning every
      dot into a dash (`"1.5.12"` -> `"1-5-12"`) — fixed with a new
      `versionSlug` (`hub/src/slug.js`) that preserves dots, used only for
      `base_version`, not the free-text `label` (still `slugify`); a stale
      test still called the standalone `/mjolnir/cards/:id/preview` route
      removed when card-preview moved inline (task 8.2), never updated
      when that landed; a test read the same `fetch` Response body twice.
      New tests: `assembleDefaults`/`assembleAndSubmit` direct-call cases
      plus an end-to-end HTTP case for both new routes. Full hub suite
      (22 tests) verified passing against the real database, then the
      throwaway test database dropped. Full bundle-tool suite re-run:
      167/168 (same pre-existing, unrelated failure). D112 recorded in
      `tun/docs/07-decisions.md`.
