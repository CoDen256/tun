import { test, mock } from "node:test";
import assert from "node:assert/strict";
import { parse } from "@babel/parser";

test("applyRules skips canonicalization for an oversized candidate, but still matches a true match", async () => {
  const real = await import("../../src/canonicalize.js");
  let canonicalizeCalls = 0;
  mock.module("../../src/canonicalize.js", {
    exports: {
      canonicalize: (node) => {
        canonicalizeCalls++;
        return real.canonicalize(node);
      },
      hashNode: real.hashNode,
      countNodes: real.countNodes,
    },
  });

  const { applyRules } = await import("../../src/commands/deobfuscate.js");
  const { interopWildcardRule } = await import("../../src/rules/interopWildcard.js");

  // Module initialization (e.g. interopWildcardRule hashing its own reference
  // pattern) already happened above; only count calls from here on.
  canonicalizeCalls = 0;

  // Oversized candidate: a huge synthetic IIFE, structurally nothing like
  // the interop-wildcard pattern, with a node count far outside its
  // reference pattern's node count (150).
  const bigStatements = Array.from(
    { length: 500 },
    (_, i) => `var v${i} = ${i} + 1;`
  ).join("\n");
  const bigSrc = `(function(){\n${bigStatements}\n})();`;
  const bigAst = parse(bigSrc, { sourceType: "script" });

  const usedOnBig = applyRules(bigAst);
  assert.equal(usedOnBig.size, 0);
  assert.equal(
    canonicalizeCalls,
    0,
    "oversized candidate must be rejected without canonicalizing"
  );

  // True match: an actual interop-wildcard-shaped IIFE call, structurally
  // within the tolerance band (same node count as the reference pattern).
  const REFERENCE_SRC = `(function (e, t) {
    if ("function" == typeof WeakMap) var r = new WeakMap(),
      n = new WeakMap();
    return function (e, t) {
      if (!t && e && e.__esModule) return e;
      var o,
        f,
        u = {
          __proto__: null,
          default: e
        };
      if (null === e || "object" != typeof e && "function" != typeof e) return u;
      if (o = t ? n : r) {
        if (o.has(e)) return o.get(e);
        o.set(e, u);
      }
      for (var i in e) "default" !== i && {}.hasOwnProperty.call(e, i) && ((f = (o = Object.defineProperty) && Object.getOwnPropertyDescriptor(e, i)) && (f.get || f.set) ? o(u, i, f) : u[i] = e[i]);
      return u;
    }(e, t);
  })(someModule, true);`;
  const matchAst = parse(REFERENCE_SRC, { sourceType: "script" });

  const usedOnMatch = applyRules(matchAst);
  assert.equal(usedOnMatch.size, 1);
  assert.ok(usedOnMatch.has(interopWildcardRule));
  assert.ok(
    canonicalizeCalls > 0,
    "a candidate within the tolerance band must still be canonicalized and checked"
  );
});
