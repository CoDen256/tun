import fs from "node:fs";
import path from "node:path";

// D-L7: `base_version` is genuinely base-folder metadata, not present
// anywhere in the bundle's own bytes — confirmed (`base/smali.mjolnir
// .merged/apktool.yml` has `versionInfo.versionName: 1.5.12` today). A full
// YAML parser is overkill for reading one nested scalar out of a file
// apktool itself generates in a stable shape; this reads just the
// `versionInfo:` block's `versionName:` line.
export function readBaseVersion(baseFolderPath) {
  const ymlPath = path.join(baseFolderPath, "apktool.yml");
  const text = fs.readFileSync(ymlPath, "utf8");

  const versionInfoMatch = text.match(/^versionInfo:\n((?:[ \t]+.*\n?)*)/m);
  if (!versionInfoMatch) {
    throw new Error(`no "versionInfo:" block found in ${ymlPath}`);
  }
  const nameMatch = versionInfoMatch[1].match(/^\s*versionName:\s*(.+?)\s*$/m);
  if (!nameMatch) {
    throw new Error(`no "versionName:" found under versionInfo in ${ymlPath}`);
  }
  // Strip matching surrounding quotes, if apktool ever writes it quoted.
  return nameMatch[1].replace(/^['"](.*)['"]$/, "$1");
}
