import path from "node:path";
import { fileURLToPath } from "node:url";

// Anchored to this module's own location, never `process.cwd()` — a
// long-lived service's working directory is a deployment detail (docker
// WORKDIR, systemd unit, whatever), not something a stored-data default
// should depend on. `hub/src/config.js` -> repo root is two levels up.
const REPO_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..", "..");

// Centralized env reading, mirroring builder/src/config.js's pattern.
export function loadConfig() {
  const dataDir = process.env.DATA_DIR || "../data";
  const publicBase = process.env.TUN_PUBLIC_BASE;
  const stabburUiBase = process.env.STABBUR_UI_BASE;
  // D-L1: operator-submitted base+patch bundles are stored here, immutable
  // once written. `BUNDLE_PATH` is gone entirely — there is no more single
  // mutable working file for hub to read card content from; that now lives
  // in `card_content` (D-L3), queried directly (hub/src/cards.js).
  const logicBundleDir = process.env.LOGIC_BUNDLE_DIR || path.join(dataDir, "logic");
  // D-C3: previously silently always `"patches"` (this field didn't even
  // exist) resolved against hub's own `cwd` — a different directory than
  // wherever a locally-run `bundle-tool` CLI session saved patches to.
  // Absolute and cwd-independent by default; still overridable for a
  // deployment that genuinely wants patches somewhere else.
  const workbenchPatchesDir = process.env.WORKBENCH_PATCHES_DIR || path.join(REPO_ROOT, "patches");
  // The one base APK folder this repo ever assembles against — absolute
  // and REPO_ROOT-anchored for the exact same reason `workbenchPatchesDir`
  // is: a relative "base/smali.mjolnir.merged" typed into the Assemble
  // tab resolved against hub's own `process.cwd()` (`/app/hub`, per its
  // Dockerfile's `WORKDIR`), not the repo root (`/app`) the operator
  // actually meant — "no bundle found" even though the folder genuinely
  // exists. The embedded workbench's Assemble tab no longer asks for this
  // at all (`ota.js`'s `assembleAndSubmit`) — there is only ever one base
  // folder, this one.
  const baseFolderDir = process.env.BASE_FOLDER_DIR || path.join(REPO_ROOT, "base", "smali.mjolnir.merged");
  // D109: hub's "Builder" nav pages call `runForecast` directly (same
  // monorepo, same shared Postgres, D-P3) rather than proxying to builder's
  // own process — this needs the exact same stabbur credentials builder
  // itself requires. Optional here (unlike builder/src/config.js, which
  // requires them): hub has plenty of its own pages that work fine without
  // them, so a misconfigured/absent value degrades just the three Builder
  // pages, not hub's whole boot.
  const stabburBaseUrl = process.env.STABBUR_BASE_URL;
  const stabburAuthToken = process.env.STABBUR_AUTH_TOKEN;
  const sourceLang = process.env.SOURCE_LANG || "no";
  if (!publicBase) throw new Error("TUN_PUBLIC_BASE is required (passed through to the publish module)");
  // D-H6: not required — unset disables the operator-auth gate entirely
  // (local/dev ergonomics). Task 7.4's ordering constraint is the real
  // guard: the Caddy routes must never be uncommented for a deploy that
  // left this unset.
  const operatorAuthToken = process.env.OPERATOR_AUTH_TOKEN;
  // Not required: without it, the Cards page's "open note" link just can't
  // be built — the list itself still renders fully from hub's own data
  // (cards-browser spec: "stabbur unreachable" tolerance extends to this
  // too, by the same logic: the ledger is always the source of truth for
  // *which* cards exist).
  return {
    dataDir,
    publicBase,
    stabburUiBase,
    operatorAuthToken,
    logicBundleDir,
    workbenchPatchesDir,
    baseFolderDir,
    stabburBaseUrl,
    stabburAuthToken,
    sourceLang,
  };
}
