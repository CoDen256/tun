import { parse } from "@babel/parser";
import * as t from "@babel/types";
import { hashNode } from "./canonicalize.js";
import { canonicalizeFactoryBody, diffModuleFactories, serializeDiffEntries } from "./diff.js";
import { extractFactoryBody } from "./factory.js";
import { readModuleSource } from "./parseBundle.js";

function parseModuleFactory(bundlePath, mod) {
  const source = readModuleSource(bundlePath, mod);
  const ast = parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
  return extractFactoryBody(ast).factory;
}

// A module's canonicalized-content identity, independent of its id: the
// hash of its factory body's canonicalized statement list. Returns null for
// a module that fails to parse in isolation, rather than throwing — such a
// module simply never content-matches and falls through to added/removed.
function moduleContentHash(bundlePath, mod) {
  try {
    const factory = parseModuleFactory(bundlePath, mod);
    const canon = canonicalizeFactoryBody(factory);
    return hashNode(t.blockStatement(canon));
  } catch {
    return null;
  }
}

// Matches modules between two bundles: canonicalized content hash first
// (unchanged, regardless of id), then a unique `verboseName` match on both
// sides for the remainder (changed). Anything left over is added/removed —
// including an ambiguous or missing verboseName match, which is treated
// conservatively as added+removed rather than a guessed pairing.
export function compareSessions(aBundlePath, aCache, bBundlePath, bCache) {
  const aIds = Object.keys(aCache.modules).map(Number);
  const bIds = Object.keys(bCache.modules).map(Number);

  const aHash = new Map(aIds.map((id) => [id, moduleContentHash(aBundlePath, aCache.modules[id])]));
  const bHash = new Map(bIds.map((id) => [id, moduleContentHash(bBundlePath, bCache.modules[id])]));

  const bByHash = new Map();
  for (const id of bIds) {
    const h = bHash.get(id);
    if (h == null) continue;
    if (!bByHash.has(h)) bByHash.set(h, []);
    bByHash.get(h).push(id);
  }

  const matchedA = new Set();
  const matchedB = new Set();
  const unchanged = [];
  for (const aId of aIds) {
    const h = aHash.get(aId);
    if (h == null) continue;
    const queue = bByHash.get(h);
    if (queue && queue.length) {
      const bId = queue.shift();
      matchedA.add(aId);
      matchedB.add(bId);
      unchanged.push({ aId, bId });
    }
  }

  const aRemaining = aIds.filter((id) => !matchedA.has(id));
  const bRemaining = bIds.filter((id) => !matchedB.has(id));

  const aByVerbose = new Map();
  for (const id of aRemaining) {
    const vn = aCache.modules[id].verboseName;
    if (!vn) continue;
    if (!aByVerbose.has(vn)) aByVerbose.set(vn, []);
    aByVerbose.get(vn).push(id);
  }
  const bByVerbose = new Map();
  for (const id of bRemaining) {
    const vn = bCache.modules[id].verboseName;
    if (!vn) continue;
    if (!bByVerbose.has(vn)) bByVerbose.set(vn, []);
    bByVerbose.get(vn).push(id);
  }

  const changed = [];
  const matchedA2 = new Set();
  const matchedB2 = new Set();
  for (const [verboseName, aList] of aByVerbose) {
    const bList = bByVerbose.get(verboseName);
    if (aList.length === 1 && bList && bList.length === 1) {
      changed.push({ aId: aList[0], bId: bList[0], verboseName });
      matchedA2.add(aList[0]);
      matchedB2.add(bList[0]);
    }
  }

  return {
    unchanged,
    changed,
    added: bRemaining.filter((id) => !matchedB2.has(id)),
    removed: aRemaining.filter((id) => !matchedA2.has(id)),
  };
}

// Structural diff (unchanged/modified/added/removed statements, with
// nested children where the diff engine recognized a switch/Object.assign
// shape) between a changed pair's two sides, serialized for JSON transport.
export function diffChangedModule(aBundlePath, aMod, bBundlePath, bMod) {
  const aFactory = parseModuleFactory(aBundlePath, aMod);
  const bFactory = parseModuleFactory(bBundlePath, bMod);
  return serializeDiffEntries(diffModuleFactories(aFactory, bFactory));
}
