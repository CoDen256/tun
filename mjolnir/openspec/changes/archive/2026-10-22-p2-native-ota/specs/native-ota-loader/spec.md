## ADDED Requirements

> Source of truth: `tun/docs/11-ota-contract.md` §1–§6, §8 (frozen). Every
> requirement below restates a frozen clause; it does not introduce new
> behavior. Decision refs in parentheses point at `tun/docs/07-decisions.md`.

### Requirement: Handler registration and launch-path contract

The native patch SHALL register exactly one `ReactNativeHostHandler` by
extending `ExpoModulesPackageList$LazyHolder`'s package array from 5 to 6
entries. Only `getJSBundleFile(Z)Ljava/lang/String;` SHALL carry a real body;
all other handler methods SHALL remain the interface defaults. `getJSBundleFile`
SHALL perform **no** network I/O, SHALL NOT block on any download, and SHALL
return within single-digit milliseconds (D04, findings §4).

#### Scenario: Handler is first in the lazy chain and returns a path
- **WHEN** `ReactNativeHostWrapperBase.getJSBundleFile()` maps over
  `reactNativeHostHandlers`
- **THEN** the new handler is consulted and its non-null return is taken as the
  bundle path (first non-null wins)

#### Scenario: Developer support is never interfered with
- **WHEN** `getJSBundleFile(useDeveloperSupport=true)` is called
- **THEN** it returns `null` immediately so Metro / dev reload is untouched

#### Scenario: No ANR risk on the launch path
- **WHEN** the OTA server is slow or unreachable at launch
- **THEN** `getJSBundleFile` still returns in single-digit ms, because the
  refresh runs only on a background thread and the launch path reads local
  files only

### Requirement: Launch-path bundle selection order

At launch, after the dev-support short-circuit, the handler SHALL select a
bundle in this order and return the first usable result: (1) the `pending`
buildId — and on selecting it, **promote** (write `active`, delete `pending`);
(2) the `active` buildId; (3) the newest-mtime `bundle-<id>.js` that has a
`boot-ok-<id>` marker and no `bad-<id>`; (4) `null`, falling back to
`assets://index.android.bundle`. A buildId is *usable* only when
`bundle-<id>.js` exists, no `bad-<id>` exists, it passes the activation check,
and it is not watchdog-quarantined (§2).

#### Scenario: Pending is promoted on first use
- **WHEN** a usable `pending` buildId exists at launch
- **THEN** its bundle path is returned, `active` is written to that id, and
  `pending` is deleted

#### Scenario: Fall-through to the embedded asset
- **WHEN** no pending, active, or boot-ok'd bundle is usable
- **THEN** the handler returns `null` and React Native loads the baked-in asset

#### Scenario: active is rewritten to what was actually returned (D54)
- **WHEN** a tier is skipped (e.g. `active`'s id is quarantined) and a different
  bundle — or the asset — is returned
- **THEN** native rewrites `active` to the id it actually returned, or deletes
  `active` when it fell through to the asset, so the next refresh comparison
  reflects what is really loaded

### Requirement: current.json wire contract parsing

Native SHALL read only `buildId`, `url`, `sha256`, and `size` from
`current.json` and SHALL ignore every other field including `schema` and
`label` (D48). It SHALL validate `buildId` against `^[A-Za-z0-9._-]{1,64}$`,
`url` as absolute with scheme exactly `https`, `sha256` as 64 lowercase hex
characters, and `size` as an integer with `0 < size ≤ 64 MiB`. Any parse
failure, missing native field, or failed validation SHALL abandon the refresh
silently and retry next launch — never a crash, never a partial state write.

#### Scenario: Unknown fields are ignored (forward compatibility)
- **WHEN** `current.json` contains fields native does not know
- **THEN** native reads the four known fields and ignores the rest

#### Scenario: Invalid buildId is rejected before use as a filename
- **WHEN** `buildId` does not match `^[A-Za-z0-9._-]{1,64}$`
- **THEN** the refresh is abandoned and no file named from it is created

#### Scenario: Non-https url is rejected
- **WHEN** `url`'s scheme is anything other than `https`
- **THEN** the refresh is abandoned

#### Scenario: Oversize or non-positive size is rejected before connecting
- **WHEN** `size <= 0` or `size > 64 MiB`
- **THEN** native rejects it before opening any connection

### Requirement: Download transport invariants

The background download SHALL NOT set `Accept-Encoding` (D49), so `sha256`/
`size` always describe the uncompressed bytes. It SHALL NOT trust
`Content-Length`; instead it SHALL enforce the 64 MiB ceiling against the `size`
field before connecting, and SHALL abort the moment bytes written exceed `size`
while streaming. It SHALL require `https` on the initial URL and after any
redirect (D53). It SHALL send `Authorization: Bearer <token>`. Timeouts SHALL be
connect 10 s, read 30 s, overall refresh wall-clock 120 s. The download and all
verification SHALL run on a background thread.

#### Scenario: Transparent gzip keeps the hash stable
- **WHEN** Caddy negotiates gzip and streams the body chunked with no
  `Content-Length`
- **THEN** native writes the decoded bytes, caps them against `size`, and the
  sha256 of what it writes equals the published `sha256`

#### Scenario: A server that streams forever cannot fill the disk
- **WHEN** the response body exceeds `size` bytes
- **THEN** native aborts the download, deletes the `.tmp`, and leaves all state
  untouched

#### Scenario: Redirect to http is refused
- **WHEN** the server responds with a redirect to a non-https location
- **THEN** native abandons the download

### Requirement: Dual validity tests

Native SHALL verify a downloaded bundle, before renaming it into place, by exact
`size`, exact `sha256`, and the magic prefix (D51). At every activation on the
launch path, native SHALL instead run the cheap test only: file length `> 0` and
the first 26 bytes equal `var __BUNDLE_START_TIME__=`. It SHALL NOT re-hash on
the cold-start path. A download failing any post-download check SHALL have its
`.tmp` deleted with all other state left untouched, retried next launch.

#### Scenario: Post-download verification
- **WHEN** a `.tmp` finishes downloading
- **THEN** native checks exact size, then sha256, then the magic prefix, and
  only on all three passing does it rename `.tmp` → `bundle-<id>.js`

#### Scenario: Cheap activation check on every launch
- **WHEN** a bundle is selected at launch
- **THEN** native reads its first 26 bytes, confirms the magic prefix and
  non-empty length, and does not re-hash the 6 MB file

#### Scenario: Truncated file never reaches React Native
- **WHEN** a selected bundle is empty or its first 26 bytes are not the prefix
- **THEN** native treats it as unusable and falls to the next tier

### Requirement: On-device marker-file layout

State SHALL live under `<context.getFilesDir()>/mjolnir-ota/` (D56) as marker
files whose names carry the value — `active`, `pending`, `bundle-<id>.js`,
`bundle-<id>.js.tmp`, `boot-ok-<id>`, `attempt-<id>-N`, `bad-<id>`, and
`config.json` (D50). `active` and `pending` SHALL hold a single validated
buildId token, written `.tmp` → rename; unreadable or invalid content SHALL be
treated as absent (safe fall-back one tier). Native SHALL NOT maintain any
read-modify-write counter or mutable parsed state blob in frozen code.

#### Scenario: Atomic single-token writes
- **WHEN** native sets `active` or `pending`
- **THEN** it writes a `.tmp` and renames it over the target

#### Scenario: Corrupt token is treated as absent
- **WHEN** `active` or `pending` is unreadable or not a valid buildId
- **THEN** native behaves as if the file were absent and falls back one tier

#### Scenario: Path addressing matches JS (D56)
- **WHEN** native and JS name the same marker (`boot-ok-*`, `config.json`)
- **THEN** native uses the bare `getFilesDir()` path (no `file://` scheme, no
  doubled separator) while JS uses `documentDirectory`'s `file://` + trailing
  slash form — both resolving to the same file

### Requirement: Garbage collection

On the background thread only — never on the startup path — native SHALL delete
every `.tmp`, and every `bundle-*.js` outside the set {`active`, `pending`, the
two newest bundles carrying a `boot-ok` marker}, together with that build's
markers.

#### Scenario: Stale bundles are swept off the hot path
- **WHEN** the background thread runs GC
- **THEN** `.tmp` files and old bundles outside the keep-set are deleted, and
  no deletion happens on the launch/selection path

### Requirement: Config escape hatch

Native SHALL read `<filesDir>/mjolnir-ota/config.json` `{url, token}` if
present, parseable, and `url` is `https`, using it in place of the baked-in
defaults (D39). Malformed or non-https content SHALL fall back to the baked-in
pair and SHALL NOT crash. The baked-in URL and token are the bootstrap and last
resort.

#### Scenario: Valid config overrides baked-in defaults
- **WHEN** `config.json` has an https `url` and a `token`
- **THEN** native uses them for the refresh

#### Scenario: Malformed config falls back silently
- **WHEN** `config.json` is unparseable or its `url` is not https
- **THEN** native uses the baked-in url/token and does not crash

### Requirement: Hash-not-signature trust model

Native SHALL trust downloaded bundles on `sha256` over TLS, not on any signature
(D47). It SHALL enforce `https` on the baked-in URL, the config-supplied URL,
and after any redirect (D53) as the one frozen, free hedge. It SHALL NOT
implement bundle signature verification.

#### Scenario: Integrity rests on sha256 + TLS
- **WHEN** a bundle's bytes hash to the published `sha256` over an https
  transport
- **THEN** native accepts it, with no signature check

### Requirement: Native is forbidden from self-healing and ordering

Native SHALL NOT compare versions or order builds (D26); SHALL NOT handle audio
in any form (D05); SHALL NOT implement retry/backoff beyond "try again next
launch"; SHALL NOT present any UI, prompt, or user-visible behavior; and SHALL
NOT clear quarantine, repair state, or perform any self-healing cleanup (§8).

#### Scenario: A different buildId triggers a fetch regardless of age
- **WHEN** `current.json`'s `buildId` differs from the loaded build's id
- **THEN** native fetches it without comparing which is newer (rollback works by
  naming an older id)

#### Scenario: No native retry policy
- **WHEN** a refresh fails for any reason
- **THEN** native simply tries again at the next launch, with no in-process
  backoff or retry loop

### Requirement: Boot watchdog (anti-brick)

Immediately before returning a bundle's path, native SHALL create
`attempt-<id>-<n+1>` (separate files, no read-modify-write) (D52). It SHALL
treat `boot-ok-<id>` as making the attempt count irrelevant for that build
forever, and SHALL NOT reset attempt state otherwise. When `attempts ≥ 2` and no
`boot-ok-<id>` exists, native SHALL skip that bundle, write `bad-<id>`, and fall
to the next tier. `bad-<id>` SHALL NEVER be cleared automatically.

#### Scenario: A bundle that crashes at startup is quarantined after two tries
- **WHEN** a bundle has `attempt-<id>-1` and `attempt-<id>-2` and no
  `boot-ok-<id>`
- **THEN** on the next launch native writes `bad-<id>`, skips it, and selects
  the next tier

#### Scenario: boot-ok makes attempts moot forever
- **WHEN** `boot-ok-<id>` exists for a build
- **THEN** native ignores that build's attempt count on every future launch

#### Scenario: Quarantine is permanent until a new publish
- **WHEN** `bad-<id>` exists
- **THEN** native never auto-clears it; recovery is publishing a new buildId
