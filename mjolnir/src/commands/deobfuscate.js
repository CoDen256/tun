import fs from "node:fs";
import path from "node:path";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import traversePkg from "@babel/traverse";
import { canonicalize, hashNode, countNodes } from "../canonicalize.js";
import { rules } from "../rules/index.js";
import { runExplode } from "./explode.js";

const generate = generatorPkg.default ?? generatorPkg;
const traverse = traversePkg.default ?? traversePkg;

export function explodedDirFor(bundlePath) {
  return path.join(path.dirname(bundlePath), path.basename(bundlePath) + ".exploded");
}

// Exploding is a pure, idempotent derivation of the bundle's own current
// bytes (runExplode wipes and regenerates the whole directory every time —
// see explode.js) — there is no scenario where "no manifest yet" means
// anything other than "never exploded", so the first load auto-explodes
// instead of requiring a manual CLI step. Found live: a freshly deployed
// builder/hub stack has no .exploded sidecar for its bundle at all until
// someone runs `bundle-tool explode` by hand — nothing in the deploy path
// did this, so the very first publish attempt failed outright.
export function loadManifest(bundlePath) {
  const manifestPath = path.join(explodedDirFor(bundlePath), "manifest.json");
  if (!fs.existsSync(manifestPath)) {
    runExplode(bundlePath);
  }
  return JSON.parse(fs.readFileSync(manifestPath, "utf8"));
}

// Walks every CallExpression whose callee is an immediately-invoked
// FunctionExpression, comparing its canonicalized hash against every
// registered rule; replaces the first match in place. Returns the set of
// rules that fired, so their helper declarations can be emitted once.
export function applyRules(ast) {
  const usedRules = new Set();
  traverse(ast, {
    CallExpression(path) {
      const callee = path.node.callee;
      if (callee.type !== "FunctionExpression") return;

      const nodeCount = countNodes(callee);
      if (!rules.some((rule) => rule.matchesSize(nodeCount))) return;

      const hash = hashNode(canonicalize(callee));
      for (const rule of rules) {
        if (rule.match(hash)) {
          path.replaceWith(rule.replace(path.node));
          usedRules.add(rule);
          path.skip();
          break;
        }
      }
    },
  });
  return usedRules;
}

// Rewrites one module's source by applying every recognized deobfuscation
// rule, same as a single iteration of `runDeobfuscate`'s loop — factored out
// so the UI's Explorer/Editor views can deobfuscate a single module on
// demand without touching every other module in the bundle.
export function deobfuscateModuleSource(source) {
  const ast = parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
  const usedRules = applyRules(ast);

  let code = generate(ast, { comments: true, retainLines: false }).code;
  if (usedRules.size > 0) {
    const helperDecls = [...usedRules]
      .map((rule) => generate(rule.helperDeclaration, { comments: false }).code)
      .join("\n\n");
    code = `${helperDecls}\n\n${code}`;
  }
  return code;
}

export function runDeobfuscate(bundlePath) {
  const manifest = loadManifest(bundlePath);
  const explodedDir = explodedDirFor(bundlePath);
  const outDir = path.join(explodedDir, "deobfuscated");
  fs.rmSync(outDir, { recursive: true, force: true });
  fs.mkdirSync(outDir, { recursive: true });

  let deobfuscatedCount = 0;
  let skippedCount = 0;
  const entries = Object.entries(manifest);
  const total = entries.length;

  entries.forEach(([idStr, mod], index) => {
    if (mod.classification === "data") {
      skippedCount++;
      return;
    }

    const source = fs.readFileSync(path.join(explodedDir, mod.path), "utf8");
    console.log(
      `[${index + 1}/${total}] module ${idStr} (${Math.round(source.length / 1024)}KB)...`
    );
    const code = deobfuscateModuleSource(source);
    fs.writeFileSync(path.join(outDir, `${idStr}.js`), code);
    deobfuscatedCount++;
  });

  console.log(
    `deobfuscated ${deobfuscatedCount} logic modules to ${outDir} (skipped ${skippedCount} data modules)`
  );
}

// Path the Editor view writes a single module's deobfuscated source to —
// matches `runDeobfuscate`'s own per-module output path, so a module
// deobfuscated individually and one deobfuscated via the bulk command land
// in the same place.
export function deobfuscatedModulePath(bundlePath, moduleId) {
  return path.join(explodedDirFor(bundlePath), "deobfuscated", `${moduleId}.js`);
}

// Ensures a single module's deobfuscated file exists on disk, writing it
// (reusing `deobfuscateModuleSource`) only if it isn't already there —
// opening an already-edited module must never regenerate over the user's
// edit.
export function ensureModuleDeobfuscated(bundlePath, moduleId) {
  const outPath = deobfuscatedModulePath(bundlePath, moduleId);
  if (fs.existsSync(outPath)) return { path: outPath, created: false };

  const manifest = loadManifest(bundlePath);
  const mod = manifest[moduleId];
  if (!mod) throw new Error(`module ${moduleId} not found in manifest`);

  const source = fs.readFileSync(path.join(explodedDirFor(bundlePath), mod.path), "utf8");
  const code = mod.classification === "data" ? source : deobfuscateModuleSource(source);

  fs.mkdirSync(path.dirname(outPath), { recursive: true });
  fs.writeFileSync(outPath, code);
  return { path: outPath, created: true };
}
