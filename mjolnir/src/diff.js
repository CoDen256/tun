import * as t from "@babel/types";
import generatorPkg from "@babel/generator";
import { canonicalize, hashNode } from "./canonicalize.js";

const generate = generatorPkg.default ?? generatorPkg;

// Canonicalizes a raw statement list as a whole (so cross-statement scope —
// e.g. a var declared in one statement and read in another — resolves
// correctly), returning the parallel canonicalized list. Index i of the
// result corresponds to index i of `rawStatements`.
//
// Note: this wraps the statements in a bare Program, with no enclosing
// function scope. Statements that reference an *enclosing* function's own
// parameters (as every module factory body does) must go through
// `canonicalizeFactoryBody` instead, so those parameter bindings resolve
// instead of looking like free/global identifiers.
export function canonicalizeStatementList(rawStatements) {
  const wrapper = t.program(rawStatements);
  const canonicalProgram = canonicalize(wrapper);
  return canonicalProgram.body;
}

// Canonicalizes a factory FunctionExpression as a whole (so its own
// parameters are recognized as bindings — renamed to the same deterministic
// _b0, _b1, ... as any other local), then returns the canonicalized body's
// statement list. Two factories with the same param count/body shape but
// differently-spelled params (e.g. after a human's rename pass) canonicalize
// to identical statement hashes.
export function canonicalizeFactoryBody(factoryNode) {
  const canonicalFactory = canonicalize(factoryNode);
  return canonicalFactory.body.body;
}

// Pairs nodes of two (already canonicalized) lists by content-hash
// identity. Within a shared hash, pairing is first-occurrence-to-
// first-occurrence, second-to-second, etc. — occurrence order is only ever
// used to disambiguate a hash collision, never as the primary key. Returns
// matched pairs plus each side's unmatched ("leftover") indices, in order.
export function pairByHash(aNodes, bNodes) {
  const bQueues = new Map();
  bNodes.forEach((node, idx) => {
    const h = hashNode(node);
    if (!bQueues.has(h)) bQueues.set(h, []);
    bQueues.get(h).push(idx);
  });

  const pairs = [];
  const matchedB = new Set();
  const aLeftover = [];

  aNodes.forEach((node, aIdx) => {
    const h = hashNode(node);
    const queue = bQueues.get(h);
    if (queue && queue.length) {
      const bIdx = queue.shift();
      pairs.push({ aIdx, bIdx });
      matchedB.add(bIdx);
    } else {
      aLeftover.push(aIdx);
    }
  });

  const bLeftover = bNodes.map((_, i) => i).filter((i) => !matchedB.has(i));
  return { pairs, aLeftover, bLeftover };
}

function getNestedStatements(node) {
  if (!node) return null;
  if (node.type === "BlockStatement" || node.type === "Program") return node.body;
  if (
    (node.type === "FunctionDeclaration" ||
      node.type === "FunctionExpression" ||
      node.type === "ArrowFunctionExpression") &&
    node.body &&
    node.body.type === "BlockStatement"
  ) {
    return node.body.body;
  }
  return null;
}

// A SwitchCase's identity, for matching purposes, is its test expression —
// not its position. `default` (test === null) uses a fixed sentinel node so
// it still hashes to a stable, distinct value via the same hashNode/
// pairByHash machinery used for every other identity-by-content match in
// this module.
const SWITCH_DEFAULT_SENTINEL = t.identifier("__bundle_tool_diff_switch_default__");

export function switchCaseTestNode(caseNode) {
  return caseNode.test || SWITCH_DEFAULT_SENTINEL;
}

// Diffs two matched `switch` statements' cases as a list, pairing each case
// by the hash of its test expression (or the default sentinel) rather than
// by position. A case whose test doesn't appear on the other side is a
// genuinely different case (added/removed), not a candidate for positional
// "modified" pairing the way two arbitrary statements are — case identity
// *is* its test.
function diffSwitchCases(rCases, mCases) {
  const { pairs, aLeftover: rLeftover, bLeftover: mLeftover } = pairByHash(
    rCases.map(switchCaseTestNode),
    mCases.map(switchCaseTestNode)
  );

  const entries = [];
  for (const { aIdx, bIdx } of pairs) {
    const rCase = rCases[aIdx];
    const mCase = mCases[bIdx];
    const sameBody =
      hashNode(t.blockStatement(rCase.consequent)) === hashNode(t.blockStatement(mCase.consequent));
    if (sameBody) {
      entries.push({ kind: "unchanged", rIdx: aIdx, mIdx: bIdx, rNode: rCase, mNode: mCase });
    } else {
      entries.push({
        kind: "modified",
        rIdx: aIdx,
        mIdx: bIdx,
        rNode: rCase,
        mNode: mCase,
        children: diffStatementList(rCase.consequent, mCase.consequent),
      });
    }
  }
  for (const rIdx of rLeftover) {
    entries.push({ kind: "removed", rIdx, rNode: rCases[rIdx] });
  }
  for (const mIdx of mLeftover) {
    entries.push({ kind: "added", mIdx, mNode: mCases[mIdx] });
  }

  entries.sort((a, b) => {
    const aKey = a.rIdx ?? a.mIdx + 0.5;
    const bKey = b.rIdx ?? b.mIdx + 0.5;
    return aKey - bKey;
  });

  return entries;
}

export function propertyKeyName(prop) {
  if (!prop || prop.type !== "ObjectProperty") return null;
  if (prop.key.type === "Identifier" && !prop.computed) return prop.key.name;
  if (prop.key.type === "StringLiteral") return prop.key.value;
  return null;
}

// Recognizes a `return Object.assign({}, <identifier>, {<object literal>})`
// statement (or its canonicalized object-spread equivalent, `return
// {...<identifier>, <object literal properties>}`) and extracts the pieces
// needed to diff/rebuild it: which identifier is being spread, and the
// trailing object literal's own properties. Returns null for any other
// shape — callers must fall back to whole-statement handling rather than
// guess at an unrecognized structure.
export function extractAssignReturnShape(node) {
  if (!node || node.type !== "ReturnStatement" || !node.argument) return null;
  const arg = node.argument;

  if (
    arg.type === "CallExpression" &&
    arg.callee.type === "MemberExpression" &&
    !arg.callee.computed &&
    arg.callee.object.type === "Identifier" &&
    arg.callee.object.name === "Object" &&
    arg.callee.property.type === "Identifier" &&
    arg.callee.property.name === "assign" &&
    arg.arguments.length === 3 &&
    arg.arguments[0].type === "ObjectExpression" &&
    arg.arguments[0].properties.length === 0 &&
    arg.arguments[1].type === "Identifier" &&
    arg.arguments[2].type === "ObjectExpression" &&
    arg.arguments[2].properties.every((p) => p.type === "ObjectProperty")
  ) {
    return {
      identifierName: arg.arguments[1].name,
      properties: arg.arguments[2].properties,
      kind: "call",
      argumentNode: arg,
    };
  }

  if (
    arg.type === "ObjectExpression" &&
    arg.properties.length >= 1 &&
    arg.properties[0].type === "SpreadElement" &&
    arg.properties[0].argument.type === "Identifier" &&
    arg.properties.slice(1).every((p) => p.type === "ObjectProperty")
  ) {
    return {
      identifierName: arg.properties[0].argument.name,
      properties: arg.properties.slice(1),
      kind: "spread",
      argumentNode: arg,
    };
  }

  return null;
}

// Diffs the trailing object literal's properties of two matched
// Object.assign-shaped return statements, by key rather than position or
// whole-node hash — a property's identity is its key.
function diffObjectAssignProperties(rProps, mProps) {
  const rByKey = new Map(rProps.map((p, i) => [propertyKeyName(p), i]));
  const mByKey = new Map(mProps.map((p, i) => [propertyKeyName(p), i]));

  const entries = [];
  for (const [key, rIdx] of rByKey) {
    if (mByKey.has(key)) {
      const mIdx = mByKey.get(key);
      const same = hashNode(rProps[rIdx].value) === hashNode(mProps[mIdx].value);
      entries.push({
        kind: same ? "unchanged" : "modified",
        rIdx,
        mIdx,
        rNode: rProps[rIdx],
        mNode: mProps[mIdx],
      });
    } else {
      entries.push({ kind: "removed", rIdx, rNode: rProps[rIdx] });
    }
  }
  for (const [key, mIdx] of mByKey) {
    if (!rByKey.has(key)) {
      entries.push({ kind: "added", mIdx, mNode: mProps[mIdx] });
    }
  }

  entries.sort((a, b) => {
    const aKey = a.rIdx ?? a.mIdx + 0.5;
    const bKey = b.rIdx ?? b.mIdx + 0.5;
    return aKey - bKey;
  });

  return entries;
}

function maybeRecurse(rNode, mNode) {
  if (rNode.type !== mNode.type) return null;

  if (rNode.type === "SwitchStatement") {
    return diffSwitchCases(rNode.cases, mNode.cases);
  }

  if (rNode.type === "ReturnStatement") {
    const rShape = extractAssignReturnShape(rNode);
    const mShape = extractAssignReturnShape(mNode);
    if (rShape && mShape && rShape.identifierName === mShape.identifierName) {
      return diffObjectAssignProperties(rShape.properties, mShape.properties);
    }
    return null;
  }

  const rStatements = getNestedStatements(rNode);
  const mStatements = getNestedStatements(mNode);
  if (!rStatements || !mStatements) return null;
  return diffStatementList(rStatements, mStatements);
}

// Recursive structural diff over two (already canonicalized) statement
// lists. Classifies each pairing as unchanged/modified/added/removed; a
// "modified" pair recurses into matched compound nodes (blocks, function
// bodies, switch-case lists, Object.assign-shaped returns) to localize
// further where possible.
export function diffStatementList(rNodes, mNodes) {
  const { pairs, aLeftover: rLeftover, bLeftover: mLeftover } = pairByHash(rNodes, mNodes);

  const entries = [];
  for (const { aIdx, bIdx } of pairs) {
    entries.push({
      kind: "unchanged",
      rIdx: aIdx,
      mIdx: bIdx,
      rNode: rNodes[aIdx],
      mNode: mNodes[bIdx],
    });
  }

  const minLen = Math.min(rLeftover.length, mLeftover.length);
  for (let k = 0; k < minLen; k++) {
    const rIdx = rLeftover[k];
    const mIdx = mLeftover[k];
    const rNode = rNodes[rIdx];
    const mNode = mNodes[mIdx];
    entries.push({
      kind: "modified",
      rIdx,
      mIdx,
      rNode,
      mNode,
      children: maybeRecurse(rNode, mNode),
    });
  }

  for (const rIdx of rLeftover.slice(minLen)) {
    entries.push({ kind: "removed", rIdx, rNode: rNodes[rIdx] });
  }
  for (const mIdx of mLeftover.slice(minLen)) {
    entries.push({ kind: "added", mIdx, mNode: mNodes[mIdx] });
  }

  entries.sort((a, b) => {
    const aKey = a.rIdx ?? a.mIdx + 0.5;
    const bKey = b.rIdx ?? b.mIdx + 0.5;
    return aKey - bKey;
  });

  return entries;
}

// Diffs two modules' factory functions (the FunctionExpression nodes
// straight from their parsed ASTs), canonicalizing each — params included —
// as a whole first.
export function diffModuleFactories(rFactoryNode, mFactoryNode) {
  const rCanon = canonicalizeFactoryBody(rFactoryNode);
  const mCanon = canonicalizeFactoryBody(mFactoryNode);
  return diffStatementList(rCanon, mCanon);
}

function codeOf(node) {
  if (!node) return null;
  try {
    return generate(node, { comments: false, compact: false }).code;
  } catch {
    return null;
  }
}

// Converts a `diffStatementList`-style entries array (full of live AST
// nodes) into a plain JSON-serializable structure for rendering in the UI
// (Compare's diff view, the Editor's live diff) — each entry becomes its
// kind plus the generated source of its r/m side, recursing into `children`.
export function serializeDiffEntries(entries) {
  if (!entries) return null;
  return entries.map((entry) => ({
    kind: entry.kind,
    rCode: codeOf(entry.rNode),
    mCode: codeOf(entry.mNode),
    children: entry.children ? serializeDiffEntries(entry.children) : null,
  }));
}
