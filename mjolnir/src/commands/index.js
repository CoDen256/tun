import { buildAndCacheIndex } from "../parseBundle.js";

export function runIndex(bundlePath, { top = 10 } = {}) {
  const cache = buildAndCacheIndex(bundlePath);
  const modules = Object.entries(cache.modules).map(([id, m]) => ({
    id: Number(id),
    ...m,
  }));

  const minifiedCount = modules.filter((m) => m.looksMinified).length;
  const largest = [...modules].sort((a, b) => b.size - a.size).slice(0, top);

  console.log(`bundle: ${cache.bundlePath}`);
  console.log(`size: ${cache.bundleSize} bytes`);
  console.log(`modules: ${cache.moduleCount}`);
  console.log(`entry module id: ${cache.entryId}`);
  console.log(`prelude bytes (non-module code): ${cache.preludeByteCount}`);
  console.log(
    `likely-minified modules: ${minifiedCount} / ${modules.length} ` +
      `(${modules.length - minifiedCount} look pre-formatted / vendor-as-is)`
  );
  console.log(`\ntop ${top} largest modules (id: size bytes, #deps, #dependents):`);
  for (const m of largest) {
    console.log(
      `  ${m.id}: ${m.size}b, deps=${m.deps.length}, dependents=${m.dependents.length}` +
        (m.verboseName ? ` (${m.verboseName})` : "")
    );
  }
  console.log(`\ncache written alongside bundle (*.analysis.json)`);
}
