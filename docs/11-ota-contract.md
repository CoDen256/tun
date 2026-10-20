# The OTA contract (frozen at P2)

Everything in this file is parsed or enforced by **native code that ships once
and can never be fixed** (D04). It is the answer to Q11–Q16. Read it before
writing a line of smali; change it only before the APK is built.

Companion: `04-delivery.md` (why), this file (exactly what).

**Design rule used throughout:** when something can be expressed as *the
presence of a file whose name carries the value*, it is — not as a parsed,
mutable state blob. Directory listing is the truth (`04-delivery.md`). Native
parses exactly two JSON documents, both small, both failure-tolerant:
`current.json` and the optional `config.json`.

---

## 1. `current.json` — the wire contract (Q11)

```json
{
  "schema": 1,
  "buildId": "b000247",
  "url": "https://tun.example.net/ota/bundle/b000247.js",
  "sha256": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08",
  "size": 6003611,
  "label": "base 6.0.3 · logic 3 · data 247"
}
```

| field | read by native | rule |
|---|---|---|
| `buildId` | **yes** | Identity only, never ordered (D26). Native **must** validate `^[A-Za-z0-9._-]{1,64}$` and reject otherwise — it becomes part of a filename |
| `url` | **yes** | Absolute. Scheme **must** be `https` — native rejects anything else, including after redirects (D53) |
| `sha256` | **yes** | 64 lowercase hex chars, over the **uncompressed** bundle bytes |
| `size` | **yes** | Exact uncompressed byte count. Native rejects `size <= 0` or `size > 64 MiB` before downloading |
| `schema` | no | For the server and the JS side only. Native ignores it |
| `label` | no | Human display (D27). Never parsed by anything |

**Forward compatibility is additive only.** Native ignores every field it does
not know. The four native fields above keep these names and types forever; a
future change may only *add* fields. There is no schema-2 escape for native —
`schema` exists so the JS side and tooling can branch, not native.

Any parse failure, missing field, or failed validation ⇒ the refresh is
abandoned silently and retried next launch. Never a crash, never a partial
state write.

### Transport rules frozen into native

- **Native never sets `Accept-Encoding`.** `sha256`/`size` always describe the
  uncompressed bundle; letting the HTTP stack negotiate gzip transparently is
  the only arrangement where that stays true. (Caddy's `encode gzip` is fine;
  pre-compressed `.js.gz` served as `Content-Encoding: gzip` is fine. Serving a
  `.gz` as an opaque body is **not** — the hash would never match.)
- **Native never trusts `Content-Length`.** Measured against the real Caddy
  config (2026-10-20): when gzip is negotiated the bundle arrives
  `Transfer-Encoding: chunked` with *no* `Content-Length` header at all. So the
  64 MiB ceiling cannot be a header pre-check — native applies it to the `size`
  field of `current.json` *before* connecting, and then enforces it again while
  streaming, aborting the moment bytes written exceed `size`. A server that
  streams forever must not be able to fill the device's disk.
- Auth header: `Authorization: Bearer <token>` on `/ota/*`.
- Timeouts: connect 10 s, read 30 s, overall refresh wall-clock cap 120 s.
- Everything happens on a background thread. `getJSBundleFile()` performs **no
  network I/O** and returns in single-digit milliseconds.

---

## 2. On-device layout (Q12)

Base directory: `<context.getFilesDir()>/mjolnir-ota/`.

```
mjolnir-ota/
  config.json             optional escape hatch (§5) — read by native, writable by JS
  active                  one line: the buildId last handed to React Native
  pending                 one line: a verified buildId to activate next launch
  bundle-<buildId>.js     a bundle that passed full verification
  bundle-<buildId>.js.tmp in-flight download; swept, never addressable
  boot-ok-<buildId>       empty marker, written by JS (§4)
  attempt-<buildId>-1     empty markers; the count is the attempt count
  attempt-<buildId>-2
  bad-<buildId>           empty marker, quarantined; never auto-cleared
```

`active` and `pending` hold a single validated buildId token and are written
`.tmp` → rename. Unreadable or invalid ⇒ treated as absent (safe: falls back
one tier).

> ✅ **RESOLVED 2026-10-20, statically — no device needed (D56).**
> `FileSystemModule`'s module definition builds the constant as:
>
> ```smali
> Uri.fromFile(context.getFilesDir()).toString() + "/"     // smali_classes4/expo/modules/filesystem/FileSystemModule.smali:2784
> ```
>
> So `documentDirectory` **is** `getFilesDir()` — no `ExponentExperienceData/`
> nesting (that only applies to Expo Go, not a standalone build):
>
> ```
> JS     documentDirectory = "file:///data/user/0/com.lightblitzlearning.mjolnir/files/"
> native getFilesDir()     = "/data/user/0/com.lightblitzlearning.mjolnir/files"
> ```
>
> Native uses `getFilesDir()` directly. The only care needed is cosmetic: JS
> sees a `file://` scheme **and a trailing slash**, native sees a bare path.
> When both name the same file (`boot-ok-*`, `config.json`), strip the scheme
> and avoid doubling the separator.

### Selection order at launch

```
useDeveloperSupport            → null            (never interfere with Metro)
1. pending  buildId, if usable → that path, and PROMOTE
2. active   buildId, if usable → that path
3. newest-mtime bundle-<id>.js that has boot-ok-<id> and no bad-<id>
4. null                        → assets://index.android.bundle
```

*Usable* = `bundle-<id>.js` exists ∧ no `bad-<id>` ∧ passes the cheap
activation check (§3) ∧ not quarantined by the watchdog (§4).

**Promote** = write `active` = that id, delete `pending`. The previous bundle
file stays on disk and remains tier 3.

Whenever a tier is skipped, native rewrites `active` to the id it actually
returned (or deletes `active` when falling through to the asset). The refresh
comparison must always reflect what is really loaded, otherwise a quarantined
build whose id still sits in `active` would compare equal to `current.buildId`
and the device would never fetch again.

### Garbage collection

On the background thread only, never on the startup path: delete every `.tmp`,
and every `bundle-*.js` outside {`active`, `pending`, the two newest bundles
carrying a `boot-ok` marker}, along with that build's markers.

---

## 3. Validity test (Q13)

Two different tests, deliberately:

| when | test | cost |
|---|---|---|
| **while downloading** | abort if bytes written exceed `size` | free |
| **after download**, before rename | exact `size` ∧ exact `sha256` ∧ prefix | one full pass over 6 MB, on a background thread |
| **at activation**, every launch | file length > 0 ∧ first 26 bytes are `var __BUNDLE_START_TIME__=` | one `read(26)` |

The magic prefix earns its place at *activation*, not at download, where
sha256 already subsumes it. Re-hashing 6 MB on every cold start is not
acceptable on the startup path, but a truncated or corrupted file must still
not be handed to React Native — the prefix check is the cheap proxy. Verified
against the real artifact: the bundle begins
`var __BUNDLE_START_TIME__=this.nativePerformanceNow?…`.

A download that fails any check: delete the `.tmp`, leave all state untouched,
retry next launch.

---

## 4. Watchdog semantics (Q14)

The anti-brick measure (P02, D08).

- **Increment:** native creates `attempt-<id>-<n+1>` immediately *before*
  returning that bundle's path — at the moment it commits to loading it.
  Separate files, so there is no read-modify-write of a counter in frozen code.
- **Reset:** never. `boot-ok-<id>` existing makes the attempt count irrelevant
  for that build, forever.
- **Threshold:** skip when `attempts ≥ 2` ∧ no `boot-ok-<id>`. You see at most
  two bad launches. On skip, write `bad-<id>` and fall to the next tier.
- **`bad-<id>` is never cleared automatically.** Recovery is publishing a new
  buildId, which costs nothing. Auto-clearing is retry logic in frozen code.

**JS side — when `boot-ok-<buildId>` is written:** after the root component has
mounted *and* a 3 s timer has elapsed. Covering the first render only would
miss crashes in early data access; a timer covers both with no app knowledge.

Accepted cost: killing the app twice within 3 s of launch falsely quarantines a
good bundle. The consequence is a fall back to the previous good bundle plus a
republish — not a brick. Quarantine state is reported in the sync heartbeat
(`04-delivery.md`), so it is visible from the laptop.

---

## 5. Config escape hatch (Q15 / D39) — mandatory

`<filesDir>/mjolnir-ota/config.json`:

```json
{ "url": "https://tun.example.net/ota/current.json", "token": "…" }
```

Native: if present, parseable, and `url` is `https` ⇒ use it; otherwise use the
baked-in defaults. Malformed content must fall back, never crash.

The consequence worth stating plainly: **a JS bundle can write this file.** So
long as one good bundle is live, the OTA URL *and the OTA token* are rotatable
by publishing — they are not frozen (see the correction to P23). The baked-in
pair is the bootstrap and the last resort, which is exactly the role it should
have.

---

## 6. Hash, not signature (Q16 / D47) — affirmed

sha256 over TLS. Signing is the one thing genuinely unavailable afterwards, so
state the residual honestly: **a compromised server can push an arbitrary
bundle, and nothing on the device would object.** Accepted — single user, own
VPS, and the device already trusts that server for its entire content set.

The one hedge that is free and *is* frozen: native requires `https` for the
baked-in URL, for the config-supplied URL, and after any redirect (D53). The
escape hatch must not be able to downgrade transport.

---

## 7. P1 — the server side

**P1 needs no application code.** Everything the device touches is a file
served by Caddy off disk; `hub` only ever *writes* those files, and does not
exist yet.

```
/ota/current.json          small JSON, Cache-Control: no-store, token-gated
/ota/bundle/<buildId>.js   immutable, gzip at the transport layer, token-gated
/ota/<buildId>/audio.json  manifest (P3 onward)
/blob/<sha256>             immutable, Cache-Control: immutable
```

- Token gate on `/ota/*`, **GET only** (P23).
- Rollback is rewriting `current.json` to name an older `buildId` — the device
  sees "different", fetches, and neither knows nor cares it is older (D26).
- Blobs stay ungated or share the gate; they are content-addressed and
  unguessable either way.

P1's acceptance test is `bin/ota-verify.sh` in the repo root: 16 assertions
covering the token gate, GET-only, the `current.json` field contract, the
no-store/immutable headers, and — the one that matters most — that the sha256
of the downloaded bytes is **identical with and without transport gzip**. If
that last one ever fails, native rejects every build and cannot be fixed.

Run it against the VPS immediately after deploying, and again after any Caddy
change. It passed end to end against the real `caddy:2-alpine` config on
2026-10-20 with the stock 6 MB bundle published as `b000001`.

---

## 8. What native is NOT allowed to do

The complete list of native responsibilities is: pick a bundle file, run the
cheap activation check, maintain the watchdog markers, and kick off a
background refresh. Explicitly **not** native's job, forever:

- comparing versions or ordering builds (D26)
- audio, in any form (D05, C9)
- retry/backoff policy beyond "try again next launch"
- any UI, prompt, or user-visible behaviour
- clearing quarantine, repairing state, or any self-healing cleverness
