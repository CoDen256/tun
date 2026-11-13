import fs from "node:fs";
import { loadIndex } from "../parseBundle.js";

const CONTEXT_CHARS = 80;

export function runGrep(bundlePath, pattern, { regex = false, limit = 50 } = {}) {
  const cache = loadIndex(bundlePath);
  const source = fs.readFileSync(bundlePath, "utf8");

  const re = regex
    ? new RegExp(pattern, "g")
    : new RegExp(pattern.replace(/[.*+?^${}()|[\]\\]/g, "\\$&"), "g");

  let hits = 0;
  const ids = Object.keys(cache.modules)
    .map(Number)
    .sort((a, b) => a - b);

  outer: for (const id of ids) {
    const mod = cache.modules[id];
    const body = source.slice(mod.start, mod.end);
    re.lastIndex = 0;
    let match;
    while ((match = re.exec(body))) {
      const from = Math.max(0, match.index - CONTEXT_CHARS);
      const to = Math.min(body.length, match.index + match[0].length + CONTEXT_CHARS);
      const snippet = body.slice(from, to).replace(/\s+/g, " ");
      console.log(`module ${id}: ...${snippet}...`);
      hits++;
      if (hits >= limit) {
        console.log(`\n(stopped at limit=${limit}; refine the pattern or raise --limit)`);
        break outer;
      }
      if (re.lastIndex === match.index) re.lastIndex++; // avoid infinite loop on zero-width matches
    }
  }

  if (hits === 0) console.log(`no matches for ${JSON.stringify(pattern)}`);
  else console.log(`\n${hits} match(es) across modules`);
}
