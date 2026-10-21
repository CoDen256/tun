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

### Native-patch decisions — **RESOLVED 2026-10-20**

All six are settled in **`11-ota-contract.md`**, which is the authority. Do not
re-derive them; change them only before the APK is built.

| # | Question | Resolution |
|---|---|---|
| ~~Q11~~ | `current.json` contract | `{schema, buildId, url, sha256, size, label}`; native reads four, ignores unknowns, additive-only forever (D48, D49). §1 |
| ~~Q12~~ | On-device layout | `<filesDir>/mjolnir-ota/`; marker files carry their own values; 4-tier selection; GC on the background thread (D50, D54). §2 |
| ~~Q13~~ | Validity test | Two tests: size + sha256 + prefix after download, prefix + non-empty at every activation (D51). §3 |
| ~~Q14~~ | Watchdog semantics | Marker written before handing over the path; `boot-ok` wins forever; threshold 2; `bad-<id>` never auto-cleared; JS writes `boot-ok` 3 s after mount (D52). §4 |
| ~~Q15~~ | Config escape hatch | Mandatory. Consequence: JS can write it, so URL **and token** are rotatable by republishing (D39). §5 |
| ~~Q16~~ | Signature vs sha256 | sha256 over TLS affirmed; residual stated; `https` enforced everywhere as the free hedge (D47, D53). §6 |

**Q17 is RESOLVED (2026-10-20, statically — see the table below) and the native
patch is unblocked.** `documentDirectory` is built as
`Uri.fromFile(context.getFilesDir()).toString() + "/"`, so JS and native address
the same directory. No device verification is required.

## Needs a spike / verification

| # | Question | How to answer |
|---|---|---|
| Q06 | **Does a type (d) card actually behave as expected?** `A:"E"` + occurrence `N` only — front shows "Read out: …", flip reveals transcription and plays audio | 58 stock `E`-only cards exist. Find one, run it in the app, confirm, *before* building 500 of them |
| Q07 | **Cold-start parse time** of a bundle grown by several MB | Build a bundle padded with synthetic cards; measure launch time on the real phone. Gates P09 and therefore D03 |
| Q08 | **Does `drawNewCards` (mod 2110) correctly filter to `P === "N"` in all paths**, given the app ships unpatched (D68)? | Matters for P4: every custom card/occurrence needs `P:"N"` set deliberately (P22) or it is invisible to this filter on the real, unpatched branch |
| Q09 | **Exact `Stage` → interval mapping** | mod 2133 holds `GraduationStage` / `CFStage` (minutes) and `CF4` (ease-factor percentages). Tables are known; the exact transition logic in mod 2119 is not fully traced. Needed only to replicate scheduling in the phonexa dashboard |
| Q10 | **Norsk ordbank import size and shape** | Drives Q01 disk sizing and the `/inflect` schema |
| ~~Q17~~ | ~~`FileSystem.documentDirectory` vs `context.getFilesDir()`~~ | **RESOLVED 2026-10-20 statically (D56).** `FileSystemModule.smali:2784` builds it as `Uri.fromFile(context.getFilesDir()).toString() + "/"` — it *is* `getFilesDir()`, no `ExponentExperienceData/` nesting. Native uses `getFilesDir()` directly; mind only the `file://` scheme and trailing slash on the JS side. **No device verification needed; P2 is unblocked** |

## Deferred by decision (do not re-open casually)

- Linking recall progress to pronunciation progress (D14)
- Runtime/dynamic card fetching instead of bundle regeneration (D03)
- A new `P` deck category with UI patching (D21)
- Self-hosted Whisper (D17)
- Any new view inside the Mjølnir app (D13)
