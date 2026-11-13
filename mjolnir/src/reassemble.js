import fs from "node:fs";

// Byte-copies every module not in `patches` from its original offsets in
// `original`, splicing in the already-re-minified patched modules in their
// place. The prelude (before the first module) and trailer (the __r(...)
// entry call and anything after the last module) are untouched since they
// fall outside every manifest entry's [start, end) range.
export function reassembleBundleFromBuffer(original, manifest, patches) {
  const patchByModuleId = new Map(patches.map((p) => [String(p.moduleId), p.newSource]));

  const entries = Object.entries(manifest)
    .map(([id, mod]) => ({ id, ...mod }))
    .sort((a, b) => a.start - b.start);

  const chunks = [];
  let cursor = 0;

  for (const mod of entries) {
    if (mod.start > cursor) {
      chunks.push(original.subarray(cursor, mod.start));
    }
    const patch = patchByModuleId.get(mod.id);
    chunks.push(
      patch !== undefined ? Buffer.from(patch, "utf8") : original.subarray(mod.start, mod.end)
    );
    cursor = mod.end;
  }

  if (cursor < original.length) {
    chunks.push(original.subarray(cursor));
  }

  return Buffer.concat(chunks);
}

// File-path convenience wrapper — reads the file once, delegates to the
// in-memory version above. assemble-performance-fix: `assembleBundle`
// calls `reassembleBundleFromBuffer` directly, on a buffer it already
// holds, instead of going through this file-reading path once per patch.
export function reassembleBundle(bundlePath, manifest, patches) {
  return reassembleBundleFromBuffer(fs.readFileSync(bundlePath), manifest, patches);
}
