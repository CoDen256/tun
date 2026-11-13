## 0. Before you write any code

Read `design.md` in full, especially D-G1 (convention-based validation by
key suffix/name, not a bespoke branch per key), D-G2 (`BASE_VERSION` stays
auto-supplied, never operator-editable), and D-G3 (named flags removed
outright, no deprecated aliases). Read `src/commands/companion.js` in
full — the exact current behavior of `appendCompanion`/
`substituteBakedPlaceholdersInText`/`substituteBakedPlaceholders` is what
this generic mechanism must preserve the OUTCOME of (same error messages'
substance, same https-only/charset/integer rules), just reached generically
instead of via six hand-written branches.

## 1. Core substitution mechanism

- [x] 1.1 `src/commands/companion.js`: replace the six named placeholder
      constants/branches with one generic loop over a `placeholders` map,
      applying D-G1's three convention-based validation rules by key
      name/suffix.
- [x] 1.2 `appendCompanion`/`substituteBakedPlaceholders` accept
      `placeholders: {[key]: string}` instead of the six named params.
- [x] 1.3 Tests: a new, never-before-seen key substitutes correctly with no
      code change (prove genericness, not just that the old six still
      work); a `_URL`-suffixed key rejects non-https; `BUILD_ID`/
      `BASE_VERSION`/`PATCH_REV` keep their existing format checks; a
      placeholder present with no matching key still fails clearly.

## 2. assembleBundle integration

- [x] 2.1 `assembleBundle` takes a `placeholders` map param; computes
      `baseVersion` as today and merges `{ BASE_VERSION: baseVersion }`
      into the map before passing it down (D-G2), overriding any
      caller-supplied `BASE_VERSION`.
- [x] 2.2 Tests: a caller-supplied `BASE_VERSION` in the placeholder map is
      silently overridden by the real computed value, never used as-is.

## 3. CLI

- [x] 3.1 `bin/bundle-tool.js`: add repeatable `--set <key=value>` to both
      `companion` and `assemble`; remove every named placeholder flag
      (`--build-id`, `--base-version`, `--patch-rev`, `--sync-base-url`,
      `--sync-token`, `--audio-base-url`) outright.
- [x] 3.2 Tests: CLI invocation with multiple `--set` flags produces the
      expected placeholder map; a malformed `--set` (no `=`, or empty key)
      fails with a clear error.

## 4. HTTP routes (`/api/assemble`, `/mjolnir/ota/assemble-submit`)

- [x] 4.1 `src/commands/ui.js`'s `/api/assemble` and `hub/src/server.js`'s
      `/mjolnir/ota/assemble-submit` accept a `placeholders` object in the
      request body instead of named fields; thread it through to
      `assembleBundle`.
- [x] 4.2 Default-computation helpers (`defaultSyncBaseUrl`/
      `defaultAudioBaseUrl`, wherever they currently live) become
      "default values for the pre-filled key/value rows" rather than
      special-cased named-field defaults — exposed via whatever
      `GET .../assemble-defaults`-style route already serves them to the
      UI, now keyed generically.
- [x] 4.3 Tests: omitting a key from the request body that has a
      server-side default still resolves to that default, same as today's
      behavior for the named fields.

## 5. Workbench UI

- [x] 5.1 `src/ui-assets/index.html`/`app.js`: replace the Assemble tab's
      five fixed fields with a dynamic key/value list (add/remove row),
      pre-filled on load with `BUILD_ID` (blank), `PATCH_REV` (server's
      computed suggestion), `SYNC_BASE_URL`/`AUDIO_BASE_URL`/`SYNC_TOKEN`
      (server's existing defaults) — no `BASE_VERSION` row (D-G2).
- [x] 5.2 Tests/manual verification: removing a pre-filled row and
      assembling a bundle whose patches need that placeholder produces the
      same "missing value" error as typing nothing into the old named
      field did.

## 6. Sign-off

- [x] 6.1 Re-run every existing test touching companion/assemble
      placeholder substitution (search for `SYNC_BASE_URL`/`AUDIO_BASE_URL`/
      placeholder-related test names) — confirm they're updated to the new
      map-based API, not just deleted.
- [x] 6.2 If anything here contradicts or refines `design.md` during
      implementation, record it as an ADR amendment in
      `tun/docs/07-decisions.md`, per this project's established practice.
- [x] 6.3 **(Operator, outside this change)** Assemble a real bundle using
      the new `--set`/key-value UI with the full existing placeholder set
      (`BUILD_ID`, `PATCH_REV`, `SYNC_BASE_URL`, `SYNC_TOKEN`,
      `AUDIO_BASE_URL`) and confirm the resulting bundle behaves
      identically on-device to one assembled the old way.
