import { parse } from "@babel/parser";
import * as t from "@babel/types";
import { canonicalize, hashNode, countNodes } from "../canonicalize.js";

// Module 300's exact minified shape (the "__esModule"-interop wildcard
// helper, observed ~1390 times bundle-wide via the "__esModule" string
// count). This is the subtree a candidate IIFE's callee is compared
// against (after canonicalization) to recognize the pattern.
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
})`;

function parseExpression(src) {
  const ast = parse(src, { sourceType: "script", allowReturnOutsideFunction: true });
  return ast.program.body[0].expression;
}

const REFERENCE_PATTERN = canonicalize(parseExpression(REFERENCE_SRC));
const REFERENCE_HASH = hashNode(REFERENCE_PATTERN);
// Canonicalization is a bijective rename, so a candidate's raw node count
// equals its canonicalized node count; this is the exact node count a
// candidate must have to possibly match this rule.
const REFERENCE_NODE_COUNT = countNodes(REFERENCE_PATTERN);

const HELPER_NAME = "_interopRequireWildcard";

// Readable stand-in emitted once in deobfuscated output in place of the
// matched IIFE; same behavior, friendlier names, for a human to read.
const HELPER_SRC = `function ${HELPER_NAME}(obj, nodeInterop) {
  if ("function" == typeof WeakMap) var cacheBabel = new WeakMap(),
    cacheNode = new WeakMap();
  return function (obj, nodeInterop) {
    if (!nodeInterop && obj && obj.__esModule) return obj;
    var desc,
      hasPropertyDescriptor,
      newObj = {
        __proto__: null,
        default: obj
      };
    if (null === obj || "object" != typeof obj && "function" != typeof obj) return newObj;
    if (desc = nodeInterop ? cacheNode : cacheBabel) {
      if (desc.has(obj)) return desc.get(obj);
      desc.set(obj, newObj);
    }
    for (var key in obj) "default" !== key && {}.hasOwnProperty.call(obj, key) && ((hasPropertyDescriptor = (desc = Object.defineProperty) && Object.getOwnPropertyDescriptor(obj, key)) && (hasPropertyDescriptor.get || hasPropertyDescriptor.set) ? desc(newObj, key, hasPropertyDescriptor) : newObj[key] = obj[key]);
    return newObj;
  }(obj, nodeInterop);
}`;

const HELPER_DECLARATION = parse(HELPER_SRC, { sourceType: "script" }).program.body[0];

export const interopWildcardRule = {
  name: "interop-wildcard",
  nodeCount: REFERENCE_NODE_COUNT,
  matchesSize(nodeCount) {
    return nodeCount === REFERENCE_NODE_COUNT;
  },
  match(hash) {
    return hash === REFERENCE_HASH;
  },
  replace(node) {
    return t.callExpression(t.identifier(HELPER_NAME), [node.arguments[0]]);
  },
  helperName: HELPER_NAME,
  helperDeclaration: HELPER_DECLARATION,
};
