# Open questions

Each carries enough context to resume cold.

## Needs a decision

| # | Question | Context / options |
|---|---|---|
| ~~Q01~~ | ~~Hosting plan~~ | **RESOLVED 2026-10-20: Contabo VPS, 8 GB RAM, 100 GB disk.** Comfortably above the 4 GB floor. Strato dropped |
| Q02 | **Interleave lag: fixed 11 or scaled?** | Decided: fixed 11, justified by the 5-per-pull block size. Revisit only if observed clustering is wrong in practice |
| Q03 | **Device heartbeat: piggyback or separate endpoint?** | Piggyback chosen (D31). Split into `POST /device/heartbeat` if the shim gets muddy |
| Q04 | **Does the content service get its own repo?** | Under discussion. Mjølnir is now a self-contained repo (tool+patches+builder+hub); content/smia either fold into phonexa (3 repos) or split out (4). See `02-services.md` |
| Q05 | **Cineby audio** — is the player DRM-protected? | Unknown. If not, it joins YouTube in the "real audio" tier; if yes, it joins Netflix in the TTS/Forvo tier |

### Native-patch decisions (must be settled BEFORE the one APK build)

| # | Question |
|---|---|
| Q11 | Exact `current.json` contract — native parses it forever. Minimum `{buildId, url, sha256, size}` |
| Q12 | On-device layout: bundle directory, naming, where attempt counters and `boot-ok` markers live |
| Q13 | Validity test: size + sha256 + magic prefix `var __BUNDLE_START_TIME__` — sufficient? |
| Q14 | Watchdog semantics: when does the attempt counter increment, when does it reset, threshold 2? |
| Q15 | **Config escape hatch (recommended mandatory):** native reads `ota-config.json` (url + token) from `documentDirectory` if present, else baked-in defaults. Without it a domain or token change means a reinstall |
| Q16 | Signature vs sha256-over-TLS for bundle validation. Hash is adequate for single-user; signing also covers a compromised server. Unfixable later |

## Needs a spike / verification

| # | Question | How to answer |
|---|---|---|
| Q06 | **Does a type (d) card actually behave as expected?** `A:"E"` + occurrence `N` only — front shows "Read out: …", flip reveals transcription and plays audio | 58 stock `E`-only cards exist. Find one, run it in the app, confirm, *before* building 500 of them |
| Q07 | **Cold-start parse time** of a bundle grown by several MB | Build a bundle padded with synthetic cards; measure launch time on the real phone. Gates P09 and therefore D03 |
| Q08 | **Does the paywall patch keep `drawNewCards` on the unfiltered branch** in all paths? | mod 2110 branches on a premium flag before slicing; verify the patched Redux state reaches it |
| Q09 | **Exact `Stage` → interval mapping** | mod 2133 holds `GraduationStage` / `CFStage` (minutes) and `CF4` (ease-factor percentages). Tables are known; the exact transition logic in mod 2119 is not fully traced. Needed only to replicate scheduling in the phonexa dashboard |
| Q10 | **Norsk ordbank import size and shape** | Drives Q01 disk sizing and the `/inflect` schema |

## Deferred by decision (do not re-open casually)

- Linking recall progress to pronunciation progress (D14)
- Runtime/dynamic card fetching instead of bundle regeneration (D03)
- A new `P` deck category with UI patching (D21)
- Self-hosted Whisper (D17)
- Any new view inside the Mjølnir app (D13)
