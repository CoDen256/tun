#!/usr/bin/env node
import { Command } from "commander";
import { runIndex } from "../src/commands/index.js";
import { runShow } from "../src/commands/show.js";
import { runGrep } from "../src/commands/grep.js";
import { runDeps } from "../src/commands/deps.js";
import { runExplode } from "../src/commands/explode.js";
import { runDeobfuscate } from "../src/commands/deobfuscate.js";
import { runCheck } from "../src/commands/check.js";
import { runDiff } from "../src/commands/diff.js";
import { runPatchback } from "../src/commands/patchback.js";
import { runCompanion } from "../src/commands/companion.js";
import { runUi } from "../src/commands/ui.js";
import { assembleBundle } from "../src/commands/assemble.js";
import { publish } from "../tool/src/otaPublish.js";

const program = new Command();

// generic-placeholder-substitution: `--set KEY=VALUE`, repeatable,
// accumulating into one placeholder map — replaces the old per-placeholder
// named flags (--build-id, --sync-base-url, etc.) entirely.
function collectSet(value, previous) {
  const idx = value.indexOf("=");
  if (idx === -1) {
    throw new Error(`--set must be KEY=VALUE, got "${value}"`);
  }
  const key = value.slice(0, idx).trim();
  if (!key) {
    throw new Error(`--set must have a non-empty KEY, got "${value}"`);
  }
  return { ...previous, [key]: value.slice(idx + 1) };
}

program
  .name("bundle-tool")
  .description("Analyze a Metro production bundle without ever dumping the whole file");

program
  .command("index <bundle>")
  .description("Parse the bundle and (re)build the module index cache")
  .option("--top <n>", "how many largest modules to list", "10")
  .action((bundle, opts) => runIndex(bundle, { top: Number(opts.top) }));

program
  .command("show <bundle> <id>")
  .description("Pretty-print a single module by id")
  .option("--raw", "print the original source instead of re-formatting", false)
  .action((bundle, id, opts) => runShow(bundle, Number(id), { raw: opts.raw }));

program
  .command("grep <bundle> <pattern>")
  .description("Search module source for a literal string or (with --regex) a pattern")
  .option("--regex", "treat <pattern> as a regular expression", false)
  .option("--limit <n>", "max matches to print", "50")
  .action((bundle, pattern, opts) =>
    runGrep(bundle, pattern, { regex: opts.regex, limit: Number(opts.limit) })
  );

program
  .command("deps <bundle> <id>")
  .description("List modules this module depends on")
  .option("--depth <n>", "how many hops to walk", "1")
  .action((bundle, id, opts) => runDeps(bundle, id, "deps", { depth: Number(opts.depth) }));

program
  .command("dependents <bundle> <id>")
  .description("List modules that depend on this module")
  .option("--depth <n>", "how many hops to walk", "1")
  .action((bundle, id, opts) =>
    runDeps(bundle, id, "dependents", { depth: Number(opts.depth) })
  );

program
  .command("explode <bundle>")
  .description("Write every module to its own file under <bundle>.exploded/, plus a manifest")
  .action((bundle) => runExplode(bundle));

program
  .command("deobfuscate <bundle>")
  .description("Rewrite recognized minified idioms in logic modules to readable named-helper form")
  .action((bundle) => runDeobfuscate(bundle));

program
  .command("check <baseline-file> <current-file>")
  .description("Verify a refactor-only edit preserved behavior by canonicalizing and comparing against a baseline")
  .action((baselineFile, currentFile) => runCheck(baselineFile, currentFile));

program
  .command("diff <baseline-file> <current-file>")
  .description("Report the semantic changes between a refactor-baseline module file and its current edited version")
  .action((baselineFile, currentFile) => runDiff(baselineFile, currentFile));

program
  .command("patch-back <bundle> <output-bundle> <patches...>")
  .description(
    "Apply one or more module patches (<module-id>=<baseline-file>:<current-file>) and write a reassembled bundle"
  )
  .action(async (bundle, outputBundle, patches) => {
    await runPatchback(bundle, patches, outputBundle);
  });

program
  .command("companion <bundle> <output-bundle> <companion-file>")
  .description(
    "Append a redeployable JS companion (e.g. patches/js/boot-ok-companion.js) after the bundle entry; no module bytes change"
  )
  .option(
    "--set <key=value>",
    "bake __MJOLNIR_<KEY>__ as <value> wherever it appears in the companion's source (repeatable, e.g. --set BUILD_ID=b000123 --set SYNC_BASE_URL=https://example.test)",
    collectSet,
    {}
  )
  .action(async (bundle, outputBundle, companionFile, opts) => {
    runCompanion(bundle, outputBundle, companionFile, { placeholders: opts.set });
  });

program
  .command("ui")
  .description("Start the bundle-workbench app server (open bundles by path from within the UI)")
  .option("--port <n>", "port to listen on (0 = pick any free port)", "0")
  .option("--patches-dir <dir>", "directory to read/write patch files, relative to CWD", "patches")
  .option("--editor-cmd <cmd>", "shell command template to open a module file, {path} substituted", "code {path}")
  .action((opts) =>
    runUi({ port: Number(opts.port), patchesDir: opts.patchesDir, editorCmd: opts.editorCmd })
  );

program
  .command("assemble <base-folder> <output-bundle>")
  .description(
    "Apply one or more stored patches (in order) against a base APK folder's own bundle, stamp base_version/patch_rev/buildId, write one output bundle. Never touches the base folder."
  )
  .option("--patches <names>", "comma-separated, ordered REPLACE patch names to apply (src/patches.js store — modifies an existing module's factory body in place)", "")
  .option("--patches-dir <dir>", "directory to read patch files from, relative to CWD", "patches")
  .option("--patchback-pairs <names>", "comma-separated, ordered REPLACE patch-back pair names to apply (raw <id>-name.baseline.js/.edited.js files under <patches-dir>/js, e.g. 2176-my-account-build-id — D111)", "")
  .option("--companions <files>", "comma-separated, ordered companion files to APPEND (e.g. patches/js/boot-ok-companion.js,patches/js/config-rotate.js — new top-level code, touches zero existing module bytes)", "")
  .option(
    "--set <key=value>",
    "bake __MJOLNIR_<KEY>__ as <value> wherever it appears in any patch/companion (repeatable, e.g. --set BUILD_ID=b000123 --set PATCH_REV=4 --set SYNC_BASE_URL=https://example.test). BASE_VERSION is always read from the base folder's own apktool.yml — any --set BASE_VERSION=... is ignored.",
    collectSet,
    {}
  )
  .action(async (baseFolder, outputBundle, opts) => {
    const patchNames = opts.patches ? opts.patches.split(",").map((s) => s.trim()).filter(Boolean) : [];
    const patchbackPairNames = opts.patchbackPairs
      ? opts.patchbackPairs.split(",").map((s) => s.trim()).filter(Boolean)
      : [];
    const companionFiles = opts.companions ? opts.companions.split(",").map((s) => s.trim()).filter(Boolean) : [];
    const result = await assembleBundle({
      baseFolderPath: baseFolder,
      patchNames,
      patchesDir: opts.patchesDir,
      patchbackPairNames,
      outputPath: outputBundle,
      companionFiles,
      placeholders: opts.set,
    });
    console.log(`assembled ${outputBundle}`);
    console.log(`  base_version  ${result.baseVersion}`);
    console.log(`  patch_rev     ${result.placeholders.PATCH_REV ?? "(not baked — no --set PATCH_REV=... given)"}`);
    console.log(`  patches (replace, JSON)      ${result.appliedPatches.join(", ") || "(none)"}`);
    console.log(`  patch-back pairs (replace)   ${result.appliedPatchbackPairs.join(", ") || "(none)"}`);
    console.log(`  companions (append)          ${result.appliedCompanions.join(", ") || "(none)"}`);
  });

program
  .command("ota-publish <bundle> <buildId> [label]")
  .description(
    "Publish a bundle as an OTA build: writes data/ota/bundle/<buildId>.js and repoints data/ota/current.json"
  )
  .option("--data-dir <dir>", "directory containing ota/ and blob/", "data")
  .action((bundle, buildId, label, opts) => {
    const result = publish(bundle, buildId, label, { dataDir: opts.dataDir });
    console.log(`published ${result.buildId}`);
    console.log(`  size   ${result.size}`);
    console.log(`  sha256 ${result.sha256}`);
    console.log(`  url    ${result.url}`);
    if (result.reused) console.log("  (bundle already present and identical — republished current.json only)");
  });

program.parseAsync(process.argv);
