## Context

Today (`src/commands/companion.js`): six named placeholders
(`BUILD_ID_PLACEHOLDER`, `BASE_VERSION_PLACEHOLDER`, `PATCH_REV_PLACEHOLDER`,
`SYNC_BASE_URL_PLACEHOLDER`, `SYNC_TOKEN_PLACEHOLDER`,
`AUDIO_BASE_URL_PLACEHOLDER`), each with its own constant, its own
presence-check branch in `appendCompanion` and
`substituteBakedPlaceholdersInText`, and inconsistent validation (shared
charset regex for build id/base version, bespoke integer check for patch
rev, no check at all for sync token, a shared https-only regex for the two
URLs). Adding one more placeholder requires a matching change in
`companion.js`, `assemble.js`, `bin/bundle-tool.js`, `ui.js`, `server.js`,
and the UI's HTML/JS — confirmed by tracing exactly what changed each time
a new one was added (D115 for sync, D120 for audio).

## Goals / Non-Goals

**Goals:**
- One new placeholder (e.g. for `boot-companion-label-data-version`) should
  require zero changes to `companion.js`/`assemble.js`/`bin/bundle-tool.js`
  — just a new key in whatever map the caller already builds.
- Keep the one validation guarantee that's actually security-relevant: a
  `_URL`-suffixed key must be `https://` (D53's transport-downgrade
  protection must not quietly disappear).
- The workbench UI stays usable without re-typing values every time —
  pre-filled defaults for the keys this project already relies on.

**Non-Goals:**
- Not adding a plugin/schema system for placeholder validation beyond the
  three simple rules below — if a future placeholder needs genuinely novel
  validation, that's a future change, not something this generic mechanism
  needs to anticipate.

## Decisions

### D-G1 — One generic map, convention-based validation by key suffix/name

`appendCompanion`/`substituteBakedPlaceholders` accept `placeholders: {
[key]: string }`. For each key present in the companion/bundle source as
`__MJOLNIR_<KEY>__`:
- if `key` ends in `_URL`: require `https://` (reuses the existing
  `SYNC_BASE_URL_RE`-style check, renamed to apply generically).
- if `key === 'BUILD_ID'` or `key === 'BASE_VERSION'`: require the existing
  charset (`/^[A-Za-z0-9._-]{1,64}$/`).
- if `key === 'PATCH_REV'`: require a non-negative integer (as a string;
  parsed and re-stringified).
- otherwise: any non-empty string is accepted as-is.

A placeholder present in source with no matching key in the map is still
an error (same "contains X but no value was given" failure as today) —
that part of the contract doesn't change, only how values get supplied.

### D-G2 — `BASE_VERSION` stays auto-supplied, not operator-editable

`assembleBundle` already computes `baseVersion` via `readBaseVersion
(baseFolderPath)` — this doesn't change. `assembleBundle` merges
`{ BASE_VERSION: baseVersion }` into whatever `placeholders` map the
caller supplied, overriding any `BASE_VERSION` key the caller might have
mistakenly included, before passing it down to `appendCompanion`/
`substituteBakedPlaceholders`. The workbench's key/value editor does not
show a `BASE_VERSION` row at all — it was never operator-typed before and
shouldn't become so now.

### D-G3 — CLI: repeatable `--set KEY=VALUE`

Both `bundle-tool companion`/`assemble` gain `--set <key=value>`
(repeatable, accumulating into one object — Commander's `collect`
pattern). Every existing named flag (`--build-id`, `--sync-base-url`,
etc.) is removed outright, not kept as a deprecated alias — this project's
own established preference (confirmed this session) is a clean break over
carrying dead/duplicate paths forward.

### D-G4 — Workbench: dynamic key/value editor, pre-filled with known defaults

Replace the Assemble tab's five fixed fields with one dynamic list (add
row / remove row), pre-populated on load with rows for `BUILD_ID` (blank),
`PATCH_REV` (pre-filled with the server's computed next-patch-rev
suggestion, same as today's hint), `SYNC_BASE_URL`/`AUDIO_BASE_URL`
(pre-filled with the server's `TUN_PUBLIC_BASE`-derived defaults, same as
today), `SYNC_TOKEN` (pre-filled with the server's `OPERATOR_AUTH_TOKEN` if
configured, same as today — still a password-style input). These rows are
ordinary, editable/removable entries, not specially pinned — an operator
who deletes the `SYNC_TOKEN` row and the current bundle's patches need it
gets the same "placeholder present but no value" error as any other
missing key.

## Risks / Trade-offs

- **Losing the per-field UI labels/hints** (e.g. "Sync base URL" with its
  own blank-means-default hint text) in favor of a generic key/value list
  → mitigated by pre-filling the known rows with the same hint text shown
  as a placeholder/tooltip on those specific pre-filled rows, not lost
  entirely — but a brand-new, never-seen-before key has no such hint,
  which is an acceptable trade-off for the flexibility gained.
- **Removing named CLI flags outright is a breaking change** for any
  existing script/muscle-memory using `--build-id`/`--sync-base-url`/etc.
  → accepted per the operator's explicit choice; this project is
  single-operator scale, not a published CLI with external users to avoid
  breaking.
