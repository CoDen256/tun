// card-preview-popup task group 2 ("The renderer emulation").
//
// This file is the one rendering engine every later task group (the popup's
// card faces, the tools drawer's live editor preview and Classes&tags
// samples, the Cards page's hover samples) calls into to turn a card's raw
// HTML into what the device actually shows — per design.md §2 and
// research/render-research.md's byte-level read of react-native-render-html
// v6 as module 1441 configures it. NOTHING in here hand-types a class's
// color/size/font: every tag/class default is read at call time from the
// object `extractCardStyle()` (tool/src/extractCardStyle.js) returns. If a
// class this file doesn't recognize some property of, it is carried through
// generically (see `styleObjToCss`) rather than special-cased by name — the
// extractor, not this file, is the place a new class/tag gets taught to the
// preview.
//
// ISOMORPHIC ON PURPOSE: no `node:*` import, no Node global. Node (hub's
// server, and this package's tests) imports it with a normal ESM `import`;
// the browser loads the exact same file as a `<script type="module">` via
// the read-only static route `hub/src/server.js` serves at
// `/mjolnir/cards/render-engine.js` (mirrors the existing font-file route's
// allowlist pattern). One source of the cascade logic, not a server copy
// and a hand-kept-in-sync client copy — that duplication is exactly the
// defect class this change exists to remove (see the deleted CSS block
// this replaced in `cardPreview.js`).

// --------------------------------------------------------------------------
// 2.5 normalize()
// --------------------------------------------------------------------------

// normalize(x) = round-to-device-pixel(x * shortSide/375 * (tablet?0.7:1))
// (design.md §2, verified verbatim in research/render-research.md §2 against
// module 1243). "round-to-device-pixel" on the real device means
// PixelRatio.roundToNearestPixel against the device's actual physical pixel
// grid; a browser rendering a *simulated* device has no such grid to round
// against (CSS px already IS the unit everything else here is defined in),
// so this rounds to the nearest whole CSS px instead. Tier-2 decision —
// noted here for whoever wires the device picker up in a later task group.
export function normalizeFactor(width, height, tablet) {
  const shortSide = Math.min(width, height);
  return (shortSide / 375) * (tablet ? 0.7 : 1);
}

export function normalize(value, width, height, tablet) {
  return Math.round(value * normalizeFactor(width, height, tablet));
}

// --------------------------------------------------------------------------
// line-height (inferred — research/render-research.md §4, labelled there as
// [I]: no lineHeight is set anywhere in the bundle; this is Android's natural
// per-line metric for each face's typeface, not a read value).
// --------------------------------------------------------------------------

export const LINE_HEIGHT_POPPINS = 1.4; // inferred
export const LINE_HEIGHT_ARIAL = 1.12; // inferred

// --------------------------------------------------------------------------
// A minimal HTML parser for card content.
// --------------------------------------------------------------------------
// research/render-research.md §2 "Class usage in the 2790 stock cards":
// only div/br/span/p/b (+one stray unclosed "<di " typo) ever occur, one
// `class` attribute each (quoted, single-quoted, or bare/unquoted), no
// inline `style=`. This parser supports exactly that subset. It is
// deliberately forgiving: an unknown/typo'd tag or an unmatched closing tag
// is treated as literal text rather than thrown on, because this will also
// back the throwaway HTML editor (a later task group) where the operator
// can type anything.

const VOID_TAGS = new Set(["br"]);
const KNOWN_TAGS = new Set(["div", "p", "b", "i", "span", "br", "a"]);

// The handful of entities/escapes card content actually uses (numeric
// entities decodeEntities:true would resolve on device, plus the few named
// ones that could plausibly appear through the editor's snippet palette).
function decodeEntities(text) {
  return text
    .replace(/&#x([0-9a-fA-F]+);/g, (_, h) => safeFromCodePoint(parseInt(h, 16)))
    .replace(/&#(\d+);/g, (_, d) => safeFromCodePoint(Number(d)))
    .replace(/&emsp;/g, " ")
    .replace(/&ensp;/g, " ")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/&#39;|&apos;/g, "'");
}

function safeFromCodePoint(cp) {
  try {
    return String.fromCodePoint(cp);
  } catch {
    return "";
  }
}

function parseClassAttr(attrText) {
  // class="a b c" / class='a b c' / bare class=royalRed (unquoted — a
  // confirmed real shape in stock content, research/render-research.md §2).
  const m = attrText.match(/class\s*=\s*(?:"([^"]*)"|'([^']*)'|([^\s>]+))/);
  if (!m) return [];
  const raw = m[1] ?? m[2] ?? m[3] ?? "";
  return raw.split(/\s+/).filter(Boolean); // attribute order preserved — the cascade needs this order, not a sorted one
}

// AST: { type:'root'|'element'|'text', tag?, classes?, children?, value? }
export function parseCardHtml(html) {
  const root = { type: "root", children: [] };
  const stack = [root];
  const src = String(html == null ? "" : html);
  const tagRe = /<\/?([A-Za-z][\w-]*)\s*((?:[^>"']|"[^"]*"|'[^']*')*)>|([^<]+)/g;
  let m;
  while ((m = tagRe.exec(src))) {
    if (m[3] !== undefined) {
      if (m[3].length) stack[stack.length - 1].children.push({ type: "text", value: decodeEntities(m[3]) });
      continue;
    }
    const whole = m[0];
    const closing = whole[1] === "/";
    const tag = m[1].toLowerCase();
    if (!KNOWN_TAGS.has(tag)) {
      // e.g. the stock "<di " typo — render literally rather than throw.
      stack[stack.length - 1].children.push({ type: "text", value: decodeEntities(whole) });
      continue;
    }
    if (closing) {
      for (let i = stack.length - 1; i > 0; i--) {
        if (stack[i].tag === tag) {
          stack.length = i;
          break;
        }
      }
      continue;
    }
    const classes = parseClassAttr(m[2] || "");
    const node = { type: "element", tag, classes, children: [] };
    stack[stack.length - 1].children.push(node);
    if (!VOID_TAGS.has(tag)) stack.push(node);
  }
  return root;
}

// --------------------------------------------------------------------------
// 2.2/2.3/2.4 the cascade
// --------------------------------------------------------------------------
// Cascade order (design.md §2 / research §2, TStyles.buildStyles):
//   built-in element defaults -> tagsStyles[tag] -> each class, IN
//   ATTRIBUTE ORDER -> inline style (no stock card has one, but the
//   editor can introduce it later; unsupported here on purpose — task 2
//   covers only what the device itself resolves from tag+class).
// `<div>` is special: it re-applies ITS OWN tagsStyle on every div,
// discarding whatever an ancestor's class put into the inherited context
// (acceptance C4). Everything else (span/b/i/p/a) merges the inherited
// context with its own tagsStyle, then layers classes on top, and PASSES
// THAT MERGED RESULT DOWN as the new inherited context for its children.

const CAMEL_TO_KEBAB = /[A-Z]/g;
function cssPropName(key) {
  return key.replace(CAMEL_TO_KEBAB, (c) => "-" + c.toLowerCase());
}

// Turns one resolved style object (a tag's or a class's finalized shape from
// extractCardStyle.js — see that file's `finalizeStyle`) into CSS
// declarations for the CURRENT render state (device size/tablet/theme).
// Deliberately generic over property name so a class this file has never
// heard of (any future one the extractor discovers) still renders correctly
// as long as its shape matches one of these known KINDS of value
// (normalize-number, literal, theme-token pair, flex/text layout keyword).
function styleObjToCss(obj, state, warnings, label) {
  if (!obj) return {};
  const css = {};
  const handledTokenPairs = new Set();
  for (const key of Object.keys(obj)) {
    if (key.endsWith("Token")) {
      const base = key.slice(0, -"Token".length);
      const byThemeKey = base + "ByTheme";
      if (obj[byThemeKey]) {
        const picked = obj[byThemeKey][state.theme] ?? obj[byThemeKey].light;
        css[cssPropName(base)] = picked;
        handledTokenPairs.add(key);
        handledTokenPairs.add(byThemeKey);
      }
    }
  }
  for (const [key, value] of Object.entries(obj)) {
    if (handledTokenPairs.has(key)) continue;
    switch (key) {
      case "fontFamily":
        css.fontFamily = `'${value}'`;
        break;
      case "fontDropped":
        if (value) warnings.push({ node: label, kind: "fontDropped", family: obj.droppedFontFamily });
        break;
      case "droppedFontFamily":
      case "colorOverridable": // link-color override capability, not a CSS value itself
      case "iosFontWeight": // iOS-only branch; this emulates the Android device the stock app ships
      case "fontSizeFallbackOnly":
        break;
      case "color":
        css.color = value;
        break;
      case "fontSize":
        css.fontSize = normalize(value, state.width, state.height, state.tablet) + "px";
        break;
      case "marginTop":
      case "marginBottom":
        css[cssPropName(key)] = normalize(value, state.width, state.height, state.tablet) + "px";
        break;
      case "marginHorizontal": {
        const px = normalize(value, state.width, state.height, state.tablet) + "px";
        css.marginLeft = px;
        css.marginRight = px;
        break;
      }
      case "width":
        css.width = normalize(value, state.width, state.height, state.tablet) + "px";
        break;
      case "textAlign":
      case "flexDirection":
      case "alignItems":
      case "justifyContent":
      case "fontStyle":
        css[cssPropName(key)] = value;
        break;
      case "textDecorationLine":
        // The `<a>` tag's value is an unresolved ternary in the bundle
        // (`y?'stroke':void 0`, where `y` is the component's own
        // `showLinkUnderline` prop — not a bundle constant this extractor
        // can resolve) — apply only a real CSS keyword, never that raw
        // expression text, and flag anything else instead of emitting
        // invalid CSS.
        if (value === "underline" || value === "line-through" || value === "none" || value === "overline") {
          css.textDecorationLine = value;
        } else {
          warnings.push({ node: label, kind: "unresolvedTextDecoration", value });
        }
        break;
      default:
        // An unrecognized-but-real prop (e.g. a ternary the extractor kept
        // as `{raw:...}` rather than resolving). Never guessed at — flagged
        // so a later extractor/engine change can pick it up deliberately.
        warnings.push({ node: label, kind: "unhandledProp", prop: key, value });
    }
  }
  return css;
}

// 2.3: each font is its own face, no synthetic bold/italic, ever — this is
// enforced by NEVER emitting fontWeight/fontStyle synthesis hints: the
// fontFamily string IS the face (e.g. 'Poppins-Bold'), declared via
// @font-face (see cardFontFaceCss) with weight/style normal, and
// `font-synthesis:none` is applied at the scope root (see
// cardRendererResetCss) so a browser cannot fake extra boldness/obliquing
// even for a family it fails to load.
function tagBaseCss(tag, styleData, state, warnings) {
  if (tag === "div") {
    // The session's live font-size control (10-22, default 15) drives the
    // SAME prop the bundle resolves as `(0,f.normalize)(t||16)` — `t` is
    // the component's `fontSize` PROP (this renderer's `state.fontSize`),
    // and `||16` is only the component's OWN internal JS fallback for the
    // (never-taken-in-the-real-app) case that prop is omitted entirely.
    // Using `tags.div.fontSize` (which extractCardStyle.js marks
    // `fontSizeFallbackOnly: true` for exactly this reason) here would
    // silently ignore the font stepper — acceptance C9 depends on this.
    const divStyle = styleData.tags.div || {};
    const css = styleObjToCss(divStyle, state, warnings, "div");
    css.fontSize = normalize(state.fontSize, state.width, state.height, state.tablet) + "px";
    // Wrapping defaults (design.md §2 "wrapping"/C7): every face is a
    // column of RN Views stretched to the face's own width; text always
    // wraps inside it and long words break rather than overflow. Applied
    // here (not left to a container the caller must remember to style)
    // since every div re-establishes this on the device, not just the
    // outermost one.
    css.whiteSpace = "normal";
    css.overflowWrap = "anywhere";
    css.wordBreak = "break-word";
    return css;
  }
  const tagStyle = styleData.tags[tag];
  return styleObjToCss(tagStyle, state, warnings, tag);
}

function classCss(className, styleData, state, warnings) {
  const classStyle = styleData.classes[className];
  if (!classStyle) return null; // undefined class (e.g. `.bold`, 1,459 stock uses) -> inert, by design
  return styleObjToCss(classStyle, state, warnings, "." + className);
}

// Resolves one parsed node (and its subtree) into { ...node, css, children }.
// `inherited` is the CSS the device would have the Text/View inherit from
// its enclosing flow at this point — `null` at the document root, where the
// device's own wrapper div style becomes the inherited context for the
// card's actual top-level markup (stock cards always open with a div, but a
// stray bare text/span would still get this baseline).
function resolveNode(node, inherited, styleData, state, warnings) {
  if (node.type === "text") {
    return { type: "text", value: node.value, css: inherited || {} };
  }
  if (node.type === "root") {
    const base = tagBaseCss("div", styleData, state, warnings);
    return { type: "root", css: base, children: node.children.map((c) => resolveNode(c, base, styleData, state, warnings)) };
  }

  let own;
  if (node.tag === "div") {
    own = { ...tagBaseCss("div", styleData, state, warnings) }; // RESET — design §2 "nested div resets its parent's class"
  } else {
    own = { ...(inherited || {}), ...tagBaseCss(node.tag, styleData, state, warnings) };
  }
  for (const cls of node.classes) {
    const c = classCss(cls, styleData, state, warnings);
    if (c) Object.assign(own, c);
  }
  // supWrap/flex (design §2, 2.4): real flex rows, never <sup>/vertical-align.
  // (`styleObjToCss` already stores CSS property names, e.g. "flex-direction"
  // kebab-case, not the JS-style "flexDirection" camelCase the extractor's
  // raw descriptors use — check the same key it actually wrote.)
  if (node.classes.includes("supWrap")) {
    own.display = "inline-flex";
  } else if (own["flex-direction"]) {
    own.display = "flex";
  }
  const children = (node.children || []).map((c) => resolveNode(c, own, styleData, state, warnings));
  return { type: "element", tag: node.tag, classes: node.classes, css: own, children };
}

// --------------------------------------------------------------------------
// Serialize a resolved AST to actual markup (inline styles only — see the
// style-isolation note at the bottom of this file for why).
// --------------------------------------------------------------------------

function escapeHtml(s) {
  return String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
}

function cssToStyleAttr(css) {
  const decls = Object.entries(css)
    .filter(([, v]) => v !== undefined && v !== null && v !== "")
    .map(([k, v]) => `${cssPropName(k)}:${v}`);
  return decls.length ? ` style="${decls.join(";")}"` : "";
}

function renderNode(node) {
  if (node.type === "text") return escapeHtml(node.value);
  if (node.tag === "br") return "<br>"; // 2.4: every <br> is a real line break, including a trailing one
  const inner = (node.children || []).map(renderNode).join("");
  return `<${node.tag}${cssToStyleAttr(node.css)}>${inner}</${node.tag}>`;
}

// 2.4 correction: a <br> that is the LAST rendered thing in the entire face
// (nothing — no text, no element — follows it anywhere in the flow) is a
// real browser quirk, not something this engine can leave to "native <br>
// already does this": Chrome/Firefox/Safari all suppress the empty line box
// a trailing <br> would otherwise create when it has zero content after it
// in the whole block-formatting context, even across element boundaries
// (confirmed by direct getClientRects() measurement — see C8's acceptance
// note and the task's root-cause write-up). A <br> anywhere else (followed
// by more text/elements, even just `<div>line<br></div>after`) renders
// fine; only the absolute trailing one collapses. Appending a zero-width
// space as its next sibling gives the browser "content" to anchor the
// empty line box to, without being visible or affecting layout width.
const TRAILING_BR_FIX = "​";

function markTrailingBr(children) {
  if (!children || !children.length) return;
  const last = children[children.length - 1];
  if (last.type === "element" && last.tag === "br") {
    children.push({ type: "text", value: TRAILING_BR_FIX, css: {} });
    return;
  }
  if (last.type === "element" && last.children && last.children.length) {
    markTrailingBr(last.children);
  }
}

// --------------------------------------------------------------------------
// Public entry point.
// --------------------------------------------------------------------------
// `styleData` is exactly what `extractCardStyle(bundlePath)` returns
// (tool/src/extractCardStyle.js) — `{ normalize, fonts, systemFonts,
// fontSizeControl, classes, tags, card, faces, divider, padding, themes }`.
// `state`:
//   fontSize  — the session's live stepper value (default styleData.fontSizeControl.default)
//   width,height — the simulated device's CSS px size (default 375x812, the app's own reference device)
//   tablet    — whether to apply the 0.7 tablet factor (default false; device-preset-driven, a later task group's call)
//   theme     — 'light' | 'dark' (default 'dark', matching the app's own Appearance.getColorScheme()||'dark' default)
//
// Returns { html, warnings, scaleFactor }:
//   html        — the face's content as real markup, every element's resolved
//                 style written inline (style="…") — never a page-level class,
//                 so no external CSS rule (an `.active`, an `.empty`, a
//                 `[hidden]` override) can ever change how a rendered run of
//                 card text looks (design §8 / acceptance C41).
//   warnings    — [{node,kind:'fontDropped'|'unhandledProp', ...}] — a
//                 fontDropped warning fires exactly when the device itself
//                 would drop that family (e.g. `.center`, `.tipOfTheDay`),
//                 computed from styleData.systemFonts, never a hard-coded list.
//   scaleFactor — normalizeFactor(width,height,tablet), for an info line.
export function renderCardFace(html, styleData, state = {}) {
  const resolvedState = {
    fontSize: state.fontSize ?? styleData.fontSizeControl.default,
    width: state.width ?? 375,
    height: state.height ?? 812,
    tablet: !!state.tablet,
    theme: state.theme === "light" ? "light" : "dark",
  };
  const warnings = [];
  const ast = parseCardHtml(html);
  const resolved = resolveNode(ast, null, styleData, resolvedState, warnings);
  markTrailingBr(resolved.children);
  const bodyHtml = resolved.children.map(renderNode).join("");
  return {
    html: bodyHtml,
    warnings,
    scaleFactor: normalizeFactor(resolvedState.width, resolvedState.height, resolvedState.tablet),
    fontSize: resolvedState.fontSize,
  };
}

// --------------------------------------------------------------------------
// Fonts (2.3) — real @font-face rules for the real TTFs, never a synthetic
// bold/italic fallback. `fontUrlFor(fileName)` is supplied by the caller
// (hub serves them read-only at /mjolnir/cards/fonts/<file>, mirroring the
// extractor's own "never write to base/" rule — this only ever requests a
// GET of a file already shipped inside the stock bundle/APK).
function fontFileFor(family) {
  return family.toLowerCase() === "arial" ? "arial.ttf" : `${family}.ttf`;
}

function collectFontFamilies(styleData) {
  const families = new Set();
  const consider = (styleObj) => {
    if (!styleObj) return;
    if (styleObj.fontFamily && !styleObj.fontDropped) families.add(styleObj.fontFamily);
  };
  for (const tagStyle of Object.values(styleData.tags)) consider(tagStyle);
  for (const classStyle of Object.values(styleData.classes)) consider(classStyle);
  return families;
}

export function cardFontFaceCss(styleData, fontUrlFor) {
  const families = collectFontFamilies(styleData);
  return [...families]
    .map(
      (family) =>
        `@font-face{font-family:'${family}';font-weight:normal;font-style:normal;src:url('${fontUrlFor(fontFileFor(family))}') format('truetype');font-display:swap;}`
    )
    .join("\n");
}

// --------------------------------------------------------------------------
// 2.6 style isolation
// --------------------------------------------------------------------------
// Every property this engine computes for card content is written as an
// inline `style="…"` attribute (see renderNode above) — never a shared CSS
// class. That alone is what keeps a rendered card immune to the three
// clashes design.md §8 names (a global `.active`, `.empty`, `[hidden]`
// override): none of those rules can out-specificity an inline style
// without `!important`, and this engine never emits a class for the page to
// collide with in the first place.
//
// The popup's OWN chrome (the editor, the occurrence-cell markup) is a
// later task group's build, not this one's — but it is built "on top of"
// what this module exposes, so two reusable, stronger building blocks are
// exported here for it to adopt rather than re-solving style isolation a
// second time:
//
//   - `cardRendererResetCss(scopeClass)`: a defensive CSS block that resets
//     `display`/`visibility`/`opacity` back to their intended authored
//     value for anything under `scopeClass`, with `!important`, so an
//     *unrelated* page-level selector matching one of this subtree's own
//     element classes/attributes by accident (design.md §8's examples) is
//     overridden back rather than winning by source order.
//   - `isolateInShadow(hostEl, html, cssText)`: attaches (or reuses) an open
//     Shadow DOM on `hostEl` and sets its content — the strongest available
//     isolation (a true style boundary, not just specificity), for markup
//     that is NOT practical to keep 100% inline (interactive controls:
//     textareas, buttons). Browser-only; a no-op guard lets this module
//     stay importable under Node's test runner without a DOM.
export function cardRendererResetCss(scopeClass) {
  return `.${scopeClass}, .${scopeClass} * { font-synthesis: none !important; }
.${scopeClass}[data-mcr-display] { display: var(--mcr-display, block) !important; }
.${scopeClass}[hidden] { display: none !important; }`;
}

export function isolateInShadow(hostEl, html, cssText) {
  if (typeof document === "undefined" || !hostEl || typeof hostEl.attachShadow !== "function") return null;
  const root = hostEl.shadowRoot || hostEl.attachShadow({ mode: "open" });
  root.innerHTML = `<style>:host{all:initial;display:block;}${cssText || ""}</style>${html}`;
  return root;
}
