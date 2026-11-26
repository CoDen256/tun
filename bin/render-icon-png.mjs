#!/usr/bin/env node
// Render a mark in libs/icons/ to PNG.
//
// WHY THIS EXISTS. Every browser tab in the ecosystem takes the vector
// straight from libs/icons/ (libs/pyservice/icon.py, libs/jsservice/icons.js),
// so nothing in the stack needs a raster. Two things outside it do, and
// neither will take an SVG: shadow is an INSTALLED app, whose manifest and
// apple-touch-icon want PNGs, and hover-translate is a browser EXTENSION,
// whose manifest.chrome.json wants four sizes. Those seven files are the only
// rasters anywhere.
//
// They must not become a second hand-drawn copy of a mark, so this script
// PARSES the SVG rather than redeclaring its geometry: edit libs/icons/x.svg,
// re-run, and the rasters follow. It is not a general SVG renderer and is not
// trying to be — it understands exactly the subset the marks use, and throws
// on anything else, which is the behaviour you want. Add an arc to a mark you
// rasterise and this stops and says so, instead of quietly dropping it.
//
// No dependency, because there is none to have: this host has no cairosvg, no
// Pillow, no librsvg and no ImageMagick, and the stack deliberately has no CI
// to install them in (D152). zlib is in node.
//
// Usage:
//   node bin/render-icon-png.mjs <mark.svg> <out-dir> <name.png:size[:maskable]>...
//
// The two callers, run from the repository root:
//   node bin/render-icon-png.mjs libs/icons/shadow.svg shadow/icons \
//     icon-192.png:192 icon-512.png:512 icon-maskable-512.png:512:maskable
//   node bin/render-icon-png.mjs libs/icons/hover-translate.svg \
//     hover-translate/assets/icons \
//     logo-16.png:16 logo-32.png:32 logo-48.png:48 logo-128.png:128

import fs from "node:fs";
import path from "node:path";
import zlib from "node:zlib";

// 4x4 samples per pixel. The marks are discs, rounded rects and straight-edged
// polygons, so coverage anti-aliasing is the whole of the quality here; 16
// samples is already past the point where a 128px icon changes.
const SS = 4;

// ── the small SVG subset ────────────────────────────────────────────────────

const attrs = (tag) => {
  const out = {};
  // Digits are part of an attribute NAME here (x1, y2), not just its value.
  for (const [, k, v] of tag.matchAll(/([a-zA-Z][\w-]*)="([^"]*)"/g)) out[k] = v;
  return out;
};

function parse(svg, source) {
  const viewBox = attrs(svg.match(/<svg\b[^>]*>/)[0]).viewBox.split(/\s+/).map(Number);
  const [, , vbW, vbH] = viewBox;

  const gradients = {};
  for (const [, open, inner] of svg.matchAll(/<linearGradient\b([^>]*)>([\s\S]*?)<\/linearGradient>/g)) {
    const a = attrs(`<x${open}>`);
    const stops = [...inner.matchAll(/<stop\b[^>]*\/>/g)].map((m) => attrs(m[0]));
    if (stops.length !== 2) throw new Error(`${source}: only two-stop gradients are supported`);
    gradients[a.id] = {
      x1: Number(a.x1), y1: Number(a.y1), x2: Number(a.x2), y2: Number(a.y2),
      from: hex(stops[0]["stop-color"]), to: hex(stops[1]["stop-color"]),
    };
  }

  // Shapes in paint order. `fill` and `opacity` inherit from the enclosing
  // <g> — the bars of shadow's waveform carry neither of their own, which is
  // the whole reason the mark groups them. Groups do not nest in any mark, so
  // one level of state is enough.
  const shapes = [];
  const body = svg.replace(/<defs>[\s\S]*?<\/defs>/, "").replace(/<!--[\s\S]*?-->/g, "");
  let group = { fill: undefined, opacity: 1 };
  for (const m of body.matchAll(/<(g|\/g|circle|rect|path|title|\/?svg)\b([^>]*)>/g)) {
    const [, name, rest] = m;
    if (name === "g") {
      const a = attrs(`<x${rest}>`);
      if (a.transform) throw new Error(`${source}: transforms are not supported — flatten the mark or teach this script about them`);
      group = { fill: a.fill, opacity: Number(a.opacity ?? 1) };
    } else if (name === "/g") group = { fill: undefined, opacity: 1 };
    else if (name === "circle" || name === "rect" || name === "path") {
      const a = attrs(`<x${rest}>`);
      if (a.transform) throw new Error(`${source}: transforms are not supported — flatten the mark or teach this script about them`);
      if (a.stroke) throw new Error(`${source}: strokes are not supported — this renderer fills only`);
      const shape = { kind: name, a: { ...a, fill: a.fill ?? group.fill }, opacity: group.opacity * Number(a.opacity ?? 1) };
      if (name === "path") shape.points = polygon(a.d, source);
      shapes.push(shape);
    } else if (name !== "title" && name !== "svg" && name !== "/svg") {
      throw new Error(`${source}: unsupported element <${name}> — teach this script about it`);
    }
  }
  return { vbW, vbH, gradients, shapes, source };
}

/** A closed straight-edged path to a point list. M/L/H/V/Z only, absolute or
 *  relative; a curve or an arc throws, because silently straightening one
 *  would be worse than refusing. */
function polygon(d, source) {
  const pts = [];
  let x = 0, y = 0;
  const tokens = d.match(/[A-Za-z]|-?\d*\.?\d+/g) ?? [];
  let cmd = null, i = 0;
  const num = () => Number(tokens[i++]);
  while (i < tokens.length) {
    if (/[A-Za-z]/.test(tokens[i])) cmd = tokens[i++];
    if (cmd === "Z" || cmd === "z") break;
    switch (cmd) {
      case "M": x = num(); y = num(); break;
      case "m": x += num(); y += num(); break;
      case "L": x = num(); y = num(); break;
      case "l": x += num(); y += num(); break;
      case "H": x = num(); break;
      case "h": x += num(); break;
      case "V": y = num(); break;
      case "v": y += num(); break;
      default: throw new Error(`${source}: path command '${cmd}' is not supported (straight lines only)`);
    }
    pts.push([x, y]);
    // After an explicit M, further coordinate pairs are implicit L's.
    if (cmd === "M") cmd = "L";
    else if (cmd === "m") cmd = "l";
  }
  if (pts.length < 3) throw new Error(`${source}: a path with fewer than three points`);
  return pts;
}

function hex(s) {
  const h = s.trim().replace("#", "");
  const full = h.length === 3 ? [...h].map((c) => c + c).join("") : h;
  return [0, 2, 4].map((i) => parseInt(full.slice(i, i + 2), 16));
}

function insidePolygon(pts, x, y) {
  let inside = false;
  for (let i = 0, j = pts.length - 1; i < pts.length; j = i++) {
    const [xi, yi] = pts[i], [xj, yj] = pts[j];
    if (yi > y !== yj > y && x < ((xj - xi) * (y - yi)) / (yj - yi) + xi) inside = !inside;
  }
  return inside;
}

/** Paint colour for a shape at a point, or null where the shape is absent. */
function fillAt(shape, x, y, grads, vbW, vbH, source) {
  const { kind, a } = shape;
  if (kind === "circle") {
    const dx = x - Number(a.cx), dy = y - Number(a.cy);
    if (dx * dx + dy * dy > Number(a.r) ** 2) return null;
  } else if (kind === "path") {
    if (!insidePolygon(shape.points, x, y)) return null;
  } else {
    const x0 = Number(a.x), y0 = Number(a.y);
    const x1 = x0 + Number(a.width), y1 = y0 + Number(a.height);
    const r = Number(a.rx ?? 0);
    if (x < x0 || x > x1 || y < y0 || y > y1) return null;
    // Rounded corner: outside only when beyond the corner arc in both axes.
    const dx = Math.max(x0 + r - x, 0, x - (x1 - r));
    const dy = Math.max(y0 + r - y, 0, y - (y1 - r));
    if (dx * dx + dy * dy > r * r) return null;
  }

  const fill = a.fill;
  if (!fill) throw new Error(`${source}: a <${kind}> has no fill, and nothing here guesses one`);
  const ref = fill.match(/^url\(#(.+)\)$/);
  if (!ref) return hex(fill);

  // objectBoundingBox gradient. Every gradient in these marks is on the
  // full-bleed disc, whose bbox is the whole viewBox, so the box is the
  // viewBox — stated rather than computed, and asserted by the only caller.
  const g = grads[ref[1]];
  const ax = g.x1 * vbW, ay = g.y1 * vbH;
  const vx = g.x2 * vbW - ax, vy = g.y2 * vbH - ay;
  const t = Math.min(1, Math.max(0, ((x - ax) * vx + (y - ay) * vy) / (vx * vx + vy * vy)));
  return g.from.map((c, i) => Math.round(c + (g.to[i] - c) * t));
}

// ── raster ─────────────────────────────────────────────────────────────────

/** `maskable` shrinks the ARTWORK toward the centre and drops the round
 *  background in favour of a full-bleed square one: Android crops a maskable
 *  icon to a shape of its own choosing, so the colour must reach every corner
 *  and the glyph must stay inside the middle 80%. 0.78 keeps the glyph's
 *  bounding circle at ~72% of the icon, with no room wasted. */
function render(doc, size, { maskable = false } = {}) {
  const { vbW, vbH, gradients, shapes, source } = doc;
  if (shapes[0].kind !== "circle") throw new Error(`${source}: expected the mark to open with its disc`);

  const glyphScale = maskable ? 0.78 : 1;
  const px = Buffer.alloc(size * size * 4);

  for (let py = 0; py < size; py++) {
    for (let pxi = 0; pxi < size; pxi++) {
      let r = 0, g = 0, b = 0, a = 0;
      for (let sy = 0; sy < SS; sy++) {
        for (let sx = 0; sx < SS; sx++) {
          const ux = ((pxi + (sx + 0.5) / SS) / size) * vbW;
          const uy = ((py + (sy + 0.5) / SS) / size) * vbH;

          let cr = 0, cg = 0, cb = 0, ca = 0;
          for (let i = 0; i < shapes.length; i++) {
            const shape = shapes[i];
            // Glyph coordinates are pulled toward the centre for a maskable
            // icon; the background is painted across the whole square there.
            let qx = ux, qy = uy;
            if (i > 0 && glyphScale !== 1) {
              qx = vbW / 2 + (ux - vbW / 2) / glyphScale;
              qy = vbH / 2 + (uy - vbH / 2) / glyphScale;
            }
            const col =
              i === 0 && maskable
                ? fillAt({ ...shape, a: { ...shape.a, r: "1e9" } }, qx, qy, gradients, vbW, vbH, source)
                : fillAt(shape, qx, qy, gradients, vbW, vbH, source);
            if (!col) continue;
            const op = shape.opacity;
            cr = col[0] * op + cr * (1 - op);
            cg = col[1] * op + cg * (1 - op);
            cb = col[2] * op + cb * (1 - op);
            ca = op + ca * (1 - op);
          }
          r += cr * ca; g += cg * ca; b += cb * ca; a += ca;
        }
      }
      const n = SS * SS;
      const alpha = a / n;
      const o = (py * size + pxi) * 4;
      // Un-premultiply: the accumulator above is premultiplied so partially
      // covered edge pixels blend without a dark halo.
      px[o] = alpha ? Math.round(r / n / alpha) : 0;
      px[o + 1] = alpha ? Math.round(g / n / alpha) : 0;
      px[o + 2] = alpha ? Math.round(b / n / alpha) : 0;
      px[o + 3] = Math.round(alpha * 255);
    }
  }
  return px;
}

// ── PNG container ──────────────────────────────────────────────────────────

const CRC = (() => {
  const t = new Int32Array(256);
  for (let n = 0; n < 256; n++) {
    let c = n;
    for (let k = 0; k < 8; k++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1;
    t[n] = c;
  }
  return (buf) => {
    let c = -1;
    for (const byte of buf) c = t[(c ^ byte) & 0xff] ^ (c >>> 8);
    return (c ^ -1) >>> 0;
  };
})();

function chunk(type, data) {
  const len = Buffer.alloc(4);
  len.writeUInt32BE(data.length);
  const body = Buffer.concat([Buffer.from(type, "ascii"), data]);
  const crc = Buffer.alloc(4);
  crc.writeUInt32BE(CRC(body));
  return Buffer.concat([len, body, crc]);
}

function png(px, size) {
  const ihdr = Buffer.alloc(13);
  ihdr.writeUInt32BE(size, 0);
  ihdr.writeUInt32BE(size, 4);
  ihdr[8] = 8;   // bit depth
  ihdr[9] = 6;   // truecolour with alpha
  // Scanlines with filter byte 0; deflate finds the redundancy from there.
  const stride = size * 4 + 1;
  const raw = Buffer.alloc(size * stride);
  for (let y = 0; y < size; y++) {
    raw[y * stride] = 0;
    px.copy(raw, y * stride + 1, y * size * 4, (y + 1) * size * 4);
  }
  return Buffer.concat([
    Buffer.from([0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]),
    chunk("IHDR", ihdr),
    chunk("IDAT", zlib.deflateSync(raw, { level: 9 })),
    chunk("IEND", Buffer.alloc(0)),
  ]);
}

// ── go ─────────────────────────────────────────────────────────────────────

const [svgPath, outDir, ...specs] = process.argv.slice(2);
if (!svgPath || !outDir || specs.length === 0) {
  console.error("usage: render-icon-png.mjs <mark.svg> <out-dir> <name.png:size[:maskable]>...");
  process.exit(2);
}

const doc = parse(fs.readFileSync(svgPath, "utf8"), svgPath);
fs.mkdirSync(outDir, { recursive: true });

for (const spec of specs) {
  const [name, size, flag] = spec.split(":");
  if (flag && flag !== "maskable") throw new Error(`unknown flag '${flag}' in '${spec}'`);
  const file = path.join(outDir, name);
  fs.writeFileSync(file, png(render(doc, Number(size), { maskable: flag === "maskable" }), Number(size)));
  console.log(`${file}  ${size}x${size}  ${fs.statSync(file).size} bytes`);
}
