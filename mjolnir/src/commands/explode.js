import generatorPkg from "@babel/generator";
import { parse } from "@babel/parser";
import fs from "node:fs";
import path from "node:path";
import { loadIndex, readModuleSource } from "../parseBundle.js";
import { classifyModule } from "../classify.js";

const generate = generatorPkg.default ?? generatorPkg;
const EXPLODED_SUFFIX = ".exploded";

function explodedDirFor(bundlePath) {
  return path.join(
    path.dirname(bundlePath),
    path.basename(bundlePath) + EXPLODED_SUFFIX
  );
}

export function runExplode(bundlePath, opts = {}) {
  const cache = loadIndex(bundlePath);
  const outDir = explodedDirFor(bundlePath);

  fs.rmSync(outDir, { recursive: true, force: true });
  fs.mkdirSync(outDir, { recursive: true });

  const manifest = {};
  let dataCount = 0;
  let logicCount = 0;

  for (const [idStr, mod] of Object.entries(cache.modules)) {
    const id = Number(idStr);
    const source = readModuleSource(bundlePath, mod);

    let code = source;
    let classification = "logic";
    try {
      const ast = parse(source, {
        sourceType: "script",
        allowReturnOutsideFunction: true,
      });
      const expr = ast.program.body[0].expression;
      const factoryNode = expr.arguments[0];
      classification = classifyModule(ast, factoryNode, mod.deps);
      code = generate(ast, { comments: true, retainLines: false }).code;
    } catch (err) {
      // fall back to raw source for this module only
    }

    if (classification === "data") dataCount++;
    else logicCount++;

    const relPath = `${id}.js`;
    fs.writeFileSync(path.join(outDir, relPath), code);

    manifest[id] = {
      path: relPath,
      start: mod.start,
      end: mod.end,
      factoryStart: mod.factoryStart,
      factoryEnd: mod.factoryEnd,
      deps: mod.deps,
      dependents: mod.dependents,
      classification,
    };
  }

  fs.writeFileSync(
    path.join(outDir, "manifest.json"),
    JSON.stringify(manifest, null, 2)
  );

  const moduleCount = Object.keys(cache.modules).length;
  console.log(`exploded ${moduleCount} modules to ${outDir}`);
  console.log(`data: ${dataCount}, logic: ${logicCount}`);
}
