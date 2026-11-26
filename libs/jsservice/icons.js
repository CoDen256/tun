// The service tab icons, for the node half of the stack.
//
// The icons themselves live in libs/icons/<name>.svg — ONE file per service,
// shared with the python half through libs/pyservice/icon.py, because the
// standard is that nothing in this ecosystem exists in two files. They are
// hand-written SVG (a circle, a gradient and one glyph each), small enough
// that a data: URI in the <head> is cheaper than the extra route, the extra
// cache directive and the extra auth exemption a /icon.svg endpoint would
// need in four separate node servers.
//
// WHY NOT A ROUTE. hub, builder, sync and the backup console have no static
// directory at all — every byte they serve is a handler. Adding one meant a
// handler in each, and a favicon is fetched before the operator's basic_auth
// prompt is answered in some browsers, so each would also have needed a
// public-path exemption in libs/jsservice/auth.js. Inlining the mark into the
// page that is already authorised sidesteps the whole question.
//
// Read once at module load: these files change when a designer changes them,
// which is a deploy, not a request.

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const DIR = path.join(path.dirname(fileURLToPath(import.meta.url)), "..", "icons");

const cache = new Map();

/** The raw SVG source for a service's mark. Throws if the name is unknown —
 *  a typo here is a missing icon on every page, so fail at boot. */
export function iconSvg(name) {
  if (!cache.has(name)) {
    cache.set(name, fs.readFileSync(path.join(DIR, `${name}.svg`), "utf8"));
  }
  return cache.get(name);
}

/** `<link rel="icon">` markup for a service's mark, as a data: URI.
 *  encodeURIComponent, not base64: the source stays readable in view-source,
 *  and an SVG this small does not benefit from base64 (which is longer).
 *
 *  The comments that explain each glyph are stripped on the way in — they are
 *  there for whoever edits the file, and they are a third of its bytes. */
export function iconLink(name) {
  const svg = iconSvg(name)
    .replace(/<!--[\s\S]*?-->/g, "")
    .replace(/>\s+</g, "><")
    .trim();
  return `<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,${encodeURIComponent(svg)}">`;
}
