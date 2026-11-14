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
  const sourceLang = process.env.SOURCE_LANG || "no";
  if (!publicBase) throw new Error("TUN_PUBLIC_BASE is required (passed through to the publish module)");
  // unified-auth 5.4: STABBUR_UI_BASE is DELETED. It was a configured value
  // that could only ever be `$TUN_PUBLIC_BASE/stabbur/ui`, and `/stabbur/ui`
  // stopped existing in 5.1 — stabbur's UI is at the prefix root now. D151:
  // derivable, so it is derived here and typed nowhere.
  const stabburUiBase = `${publicBase.replace(/\/$/, "")}/stabbur/`;
  // unified-auth 4.6: ONE internal token for every service-to-service call,
  // replacing STABBUR_AUTH_TOKEN and SMIA_AUTH_TOKEN. It is also what this
  // service accepts from a caller that is not the gateway
  // (libs/jsservice/auth.js) — the gateway's verified `X-Tun-Operator`
  // marker is the other way in, and needs no value at all.
  const internalToken = process.env.INTERNAL_TOKEN;
  // NOT the gate any more (unified-auth 4.2 deleted hub's own login). This
  // is the DEVICE token: the bundle tool bakes it into an APK as SYNC_TOKEN
  // at assemble time (`assembleDefaults`), and until section 7.1 gives
  // SYNC_TOKEN a value of its own it is the same string the gateway checks
  // on /mjolnir/userdata/*. Rotating it still requires a config.json push.
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
    internalToken,
    logicBundleDir,
    workbenchPatchesDir,
    baseFolderDir,
    stabburBaseUrl,
    sourceLang,
  };
}
