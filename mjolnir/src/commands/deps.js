import { loadIndex } from "../parseBundle.js";

export function walk(cache, startId, direction, depth) {
  const field = direction === "deps" ? "deps" : "dependents";
  const visited = new Map(); // id -> depth at which first seen
  let frontier = [startId];
  visited.set(startId, 0);

  for (let d = 1; d <= depth; d++) {
    const next = [];
    for (const id of frontier) {
      const mod = cache.modules[id];
      if (!mod) continue;
      for (const neighbor of mod[field]) {
        if (!visited.has(neighbor)) {
          visited.set(neighbor, d);
          next.push(neighbor);
        }
      }
    }
    frontier = next;
    if (frontier.length === 0) break;
  }

  visited.delete(startId);
  return visited;
}

const MAX_PRINTED_PER_DEPTH = 40;

export function runDeps(bundlePath, id, direction, { depth = 1 } = {}) {
  const cache = loadIndex(bundlePath);
  const mod = cache.modules[id];
  if (!mod) {
    console.error(`module ${id} not found`);
    process.exitCode = 1;
    return;
  }

  const visited = walk(cache, Number(id), direction, depth);
  const label = direction === "deps" ? "depends on" : "is depended on by";

  console.log(
    `module ${id} (${direction === "deps" ? mod.deps.length : mod.dependents.length} direct) ` +
      `${label}, up to depth ${depth}:`
  );

  const byDepth = new Map();
  for (const [nid, d] of visited) {
    if (!byDepth.has(d)) byDepth.set(d, []);
    byDepth.get(d).push(nid);
  }

  for (const d of [...byDepth.keys()].sort((a, b) => a - b)) {
    const ids = byDepth.get(d).sort((a, b) => a - b);
    if (ids.length > MAX_PRINTED_PER_DEPTH) {
      const shown = ids.slice(0, MAX_PRINTED_PER_DEPTH);
      console.log(
        `  depth ${d}: ${shown.join(", ")}, ... and ${ids.length - shown.length} more ` +
          `(${ids.length} total; this is likely a widely-shared utility module)`
      );
    } else {
      console.log(`  depth ${d}: ${ids.join(", ")}`);
    }
  }

  if (visited.size === 0) console.log("  (none)");
}
