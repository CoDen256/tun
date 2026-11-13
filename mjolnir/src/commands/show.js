import generatorPkg from "@babel/generator";
import { parse } from "@babel/parser";
import { loadIndex, readModuleSource } from "../parseBundle.js";

const generate = generatorPkg.default ?? generatorPkg;

export function runShow(bundlePath, id, { raw = false } = {}) {
  const cache = loadIndex(bundlePath);
  const mod = cache.modules[id];
  if (!mod) {
    console.error(`module ${id} not found (bundle has ${cache.moduleCount} modules)`);
    process.exitCode = 1;
    return;
  }

  const source = readModuleSource(bundlePath, mod);

  console.log(`// module ${id}${mod.verboseName ? ` (${mod.verboseName})` : ""}`);
  console.log(`// size: ${mod.size} bytes, looksMinified: ${mod.looksMinified}`);
  console.log(`// deps (${mod.deps.length}): ${mod.deps.join(", ") || "(none)"}`);
  console.log(
    `// dependents (${mod.dependents.length}): ${mod.dependents.join(", ") || "(none)"}`
  );
  console.log("");

  if (raw) {
    console.log(source);
    return;
  }

  try {
    const ast = parse(source, {
      sourceType: "script",
      allowReturnOutsideFunction: true,
    });
    const { code } = generate(ast, { comments: true, retainLines: false });
    console.log(code);
  } catch (err) {
    console.error(`(failed to re-parse/pretty-print module in isolation: ${err.message})`);
    console.log(source);
  }
}
