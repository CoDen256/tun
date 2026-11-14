import fs from "node:fs";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import traversePkg from "@babel/traverse";
import * as t from "@babel/types";
import { minify } from "terser";
import { loadManifest } from "./deobfuscate.js";
import { readModuleSource } from "../parseBundle.js";
import { extractFactoryBody } from "../factory.js";
import {
  diffModuleFactories,
  canonicalizeFactoryBody,
  pairByHash,
  extractAssignReturnShape,
  propertyKeyName,
  switchCaseTestNode,
} from "../diff.js";
import { reassembleBundle } from "../reassemble.js";

const generate = generatorPkg.default ?? generatorPkg;
const traverse = traversePkg.default ?? traversePkg;

function parseFile(filePath) {
  const source = fs.readFileSync(filePath, "utf8");
  return parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
}

function insertionsAfter(insertions, oIdx) {
  return insertions.filter((ins) => ins.afterOIdx === oIdx).map((ins) => ins.node);
}

// Names a statement directly declares at the factory's top level (a `var`
// declarator's bound identifier(s), or a named function declaration) — the
// level at which O's kept-verbatim statements and M's spliced-in statements
// can reference each other's bindings.
function topLevelDeclaredNames(stmt) {
  if (!stmt) return [];
  if (stmt.type === "VariableDeclaration") {
    return stmt.declarations.flatMap((d) => Object.keys(t.getBindingIdentifiers(d.id)));
  }
  if (stmt.type === "FunctionDeclaration" && stmt.id) {
    return [stmt.id.name];
  }
  return [];
}

// M's statements are written in terms of R's local names — factory
// parameters and any other local variable the human renamed during their
// refactor pass (e.g. `e` -> `bugReportingModule`). Splicing them into O
// verbatim would reference identifiers O's factory never declares, or
// shadow/miss O's own names, whenever a kept-verbatim O statement and a
// spliced-in M statement both touch the same logical binding. `renameMap`
// (built from the R<->O statement correspondence, see
// `buildFactoryBindingRenameMap`) carries every such name back to O's
// spelling. This produces a clone of `sourceFactory` with those names
// rewired via scope-aware rename (two passes through unique placeholders,
// so a map that swaps two names doesn't clobber itself).
function realignFactoryBindings(sourceFactory, renameMap) {
  const clone = t.cloneNode(sourceFactory, true);
  const file = t.file(t.program([t.expressionStatement(clone)]));
  const entries = Object.entries(renameMap).filter(([from, to]) => from !== to);

  traverse(file, {
    FunctionExpression(path) {
      if (path.node !== clone) return;
      const placeholders = entries.map((_, idx) => `__patchback_bind_${idx}__`);
      entries.forEach(([from], idx) => {
        if (path.scope.getBinding(from)) path.scope.rename(from, placeholders[idx]);
      });
      entries.forEach(([, to], idx) => {
        if (path.scope.getBinding(placeholders[idx])) path.scope.rename(placeholders[idx], to);
      });
      path.stop();
    },
  });

  return file.program.body[0].expression;
}

// Builds the R-name -> O-name map `realignFactoryBindings` needs: the 7
// factory parameters (always positionally aligned), plus every top-level
// binding R declares in a statement that corresponds (via `oForR`, hash- or
// position-matched) to an O statement declaring the same kind/count of
// bindings. Statements introduced fresh by R (e.g. nothing to map) or whose
// O counterpart declares a different shape are simply skipped — those names
// are either genuinely new or don't need realignment.
function buildFactoryBindingRenameMap({ oFactory, rFactory, oForR }) {
  const map = {};
  rFactory.params.forEach((rParam, idx) => {
    const oParam = oFactory.params[idx];
    if (rParam.type === "Identifier" && oParam && oParam.type === "Identifier") {
      map[rParam.name] = oParam.name;
    }
  });

  const rStatements = rFactory.body.body;
  const oStatements = oFactory.body.body;
  for (const [rIdx, oIdx] of oForR.entries()) {
    const rNames = topLevelDeclaredNames(rStatements[rIdx]);
    const oNames = topLevelDeclaredNames(oStatements[oIdx]);
    if (rNames.length !== oNames.length) continue;
    rNames.forEach((name, i) => {
      map[name] = oNames[i];
    });
  }

  return map;
}

// Builds the R-index -> O-index correspondence for a statement/case list:
// hash-match first, then positional fallback for same-index leftovers (a
// statement unchanged between R and M but rewritten by a deobfuscation rule
// won't hash-match O, but still corresponds 1:1 by position, since rule
// rewriting never adds/removes statements).
function computeOForRByHash(rCanonList, oCanonList, rRawLength, oRawLength) {
  const { pairs } = pairByHash(rCanonList, oCanonList);
  const oForR = new Map(pairs.map((p) => [p.aIdx, p.bIdx]));
  for (let i = 0; i < rRawLength; i++) {
    if (!oForR.has(i) && i < oRawLength) oForR.set(i, i);
  }
  return oForR;
}

// Switch cases and Object.assign-return properties have intrinsic identity
// (a case's test, a property's key) rather than positional identity — an
// unmatched one is a genuinely different case/property, not a
// renamed-in-place node, so (unlike computeOForRByHash) there is no
// positional fallback here.
function computeOForRByKey(rKeyNodes, oKeyNodes) {
  const { pairs } = pairByHash(rKeyNodes, oKeyNodes);
  return new Map(pairs.map((p) => [p.aIdx, p.bIdx]));
}

function rebuildAssignReturnArgument(oShape, newProperties) {
  const clone = t.cloneNode(oShape.argumentNode, true);
  if (oShape.kind === "call") {
    clone.arguments[2].properties = newProperties;
  } else {
    clone.properties = [t.cloneNode(clone.properties[0], true), ...newProperties];
  }
  return clone;
}

// Reapplies an R->M property-level diff (`diffObjectAssignProperties`'s
// entries, via `extractAssignReturnShape`) onto O's own property list,
// keeping every O property the diff doesn't mention untouched — this is
// what lets a target bundle's own unrelated Object.assign properties
// survive reapplication.
function reapplyObjectProperties({ oProps, propEntries, mProps }) {
  const newProps = oProps.map((p) => t.cloneNode(p, true));
  for (const entry of propEntries) {
    if (entry.kind === "modified") {
      const key = propertyKeyName(entry.rNode);
      const idx = newProps.findIndex((p) => propertyKeyName(p) === key);
      if (idx !== -1) {
        newProps[idx] = t.objectProperty(newProps[idx].key, t.cloneNode(mProps[entry.mIdx].value, true));
      }
    } else if (entry.kind === "removed") {
      const key = propertyKeyName(entry.rNode);
      const idx = newProps.findIndex((p) => propertyKeyName(p) === key);
      if (idx !== -1) newProps.splice(idx, 1);
    }
  }
  const addedEntries = propEntries.filter((e) => e.kind === "added").sort((a, b) => a.mIdx - b.mIdx);
  for (const entry of addedEntries) {
    newProps.push(t.cloneNode(mProps[entry.mIdx], true));
  }
  return newProps;
}

// Reapplies an R->M switch-case diff (`diffSwitchCases`'s entries) onto O's
// own case list, keeping any O case the diff doesn't mention (matched by
// test hash) untouched — this is what lets a target bundle's own unrelated
// switch case survive reapplication.
function applySwitchCaseDiff({ oCases, oCanonCases, rCanonCases, mCases, entries }) {
  const oForR = computeOForRByKey(rCanonCases.map(switchCaseTestNode), oCanonCases.map(switchCaseTestNode));

  const removedOIdx = new Set();
  const replacements = new Map();
  for (const entry of entries) {
    if (entry.kind === "modified") {
      const oIdx = oForR.get(entry.rIdx);
      if (oIdx === undefined) {
        throw new Error("patch-back: could not locate the original switch case for a modified entry");
      }
      const oCase = oCases[oIdx];
      const rCase = rCanonCases[entry.rIdx];
      const mCase = mCases[entry.mIdx];
      const newConsequent = entry.children
        ? applyStatementDiff({
            oStatements: oCase.consequent,
            oCanonStatements: oCanonCases[oIdx].consequent,
            rCanonStatements: rCase.consequent,
            mStatements: mCase.consequent,
            entries: entry.children,
          })
        : mCase.consequent;
      replacements.set(oIdx, t.switchCase(oCase.test ? t.cloneNode(oCase.test, true) : null, newConsequent));
    } else if (entry.kind === "removed") {
      const oIdx = oForR.get(entry.rIdx);
      if (oIdx !== undefined) removedOIdx.add(oIdx);
    }
  }

  const insertions = [];
  let lastAnchorOIdx = -1;
  const mOrderedEntries = entries.filter((e) => e.mIdx !== undefined).sort((a, b) => a.mIdx - b.mIdx);
  for (const entry of mOrderedEntries) {
    if (entry.kind === "added") {
      insertions.push({ afterOIdx: lastAnchorOIdx, node: mCases[entry.mIdx] });
    } else {
      const oIdx = oForR.get(entry.rIdx);
      if (oIdx !== undefined) lastAnchorOIdx = oIdx;
    }
  }

  const newCases = [...insertionsAfter(insertions, -1)];
  for (let oIdx = 0; oIdx < oCases.length; oIdx++) {
    if (!removedOIdx.has(oIdx)) {
      newCases.push(replacements.has(oIdx) ? replacements.get(oIdx) : oCases[oIdx]);
    }
    newCases.push(...insertionsAfter(insertions, oIdx));
  }
  return newCases;
}

// Builds the replacement node for a top-level "modified" entry. Without
// `entryChildren` (no recognized nested shape, or the diff engine fell back
// to whole-statement handling) this is the existing behavior: M's statement
// wholesale. With `entryChildren` (a switch-case or Object.assign-property
// sub-diff), the replacement is built by reapplying that sub-diff onto O's
// own matched node instead, so O's own unrelated cases/properties within
// that same statement survive.
function reapplyToOStatement({ oNode, oCanonNode, rNode, mNode, entryChildren }) {
  if (!entryChildren) return mNode;

  if (rNode.type === "SwitchStatement" && oNode.type === "SwitchStatement" && mNode.type === "SwitchStatement") {
    return t.switchStatement(
      t.cloneNode(oNode.discriminant, true),
      applySwitchCaseDiff({
        oCases: oNode.cases,
        oCanonCases: oCanonNode.cases,
        rCanonCases: rNode.cases,
        mCases: mNode.cases,
        entries: entryChildren,
      })
    );
  }

  const oShape = extractAssignReturnShape(oNode);
  if (rNode.type === "ReturnStatement" && oShape && mNode.type === "ReturnStatement") {
    const mShape = extractAssignReturnShape(mNode);
    const newProps = reapplyObjectProperties({
      oProps: oShape.properties,
      propEntries: entryChildren,
      mProps: mShape ? mShape.properties : [],
    });
    return t.returnStatement(rebuildAssignReturnArgument(oShape, newProps));
  }

  return mNode;
}

// Generalized version of the statement-list reconciliation algorithm:
// applies an R->M statement-list diff (`entries`, from `diffStatementList`)
// onto O's own statement list, recursing into nested switch-case/
// Object.assign-property sub-diffs via `reapplyToOStatement` so a target's
// own unrelated content at any nesting level survives. Used both for a
// factory's top-level body and (recursively) for a switch case's body.
function applyStatementDiff({ oStatements, oCanonStatements, rCanonStatements, mStatements, entries }) {
  const oForR = computeOForRByHash(rCanonStatements, oCanonStatements, rCanonStatements.length, oStatements.length);

  const removedOIdx = new Set();
  const replacements = new Map();
  for (const entry of entries) {
    if (entry.kind === "modified") {
      const oIdx = oForR.get(entry.rIdx);
      if (oIdx === undefined) {
        throw new Error(
          `patch-back: could not locate the original statement for a modified entry (R index ${entry.rIdx})`
        );
      }
      replacements.set(
        oIdx,
        reapplyToOStatement({
          oNode: oStatements[oIdx],
          oCanonNode: oCanonStatements[oIdx],
          rNode: rCanonStatements[entry.rIdx],
          mNode: mStatements[entry.mIdx],
          entryChildren: entry.children,
        })
      );
    } else if (entry.kind === "removed") {
      const oIdx = oForR.get(entry.rIdx);
      if (oIdx !== undefined) removedOIdx.add(oIdx);
    }
  }

  // Walk entries in M's own order (not R's) to anchor insertions correctly
  // — an "added" statement that appears before everything else in M must
  // land before everything else in the patched output too.
  const insertions = [];
  let lastAnchorOIdx = -1;
  const mOrderedEntries = entries
    .filter((e) => e.mIdx !== undefined)
    .sort((a, b) => a.mIdx - b.mIdx);

  for (const entry of mOrderedEntries) {
    if (entry.kind === "added") {
      insertions.push({ afterOIdx: lastAnchorOIdx, node: mStatements[entry.mIdx] });
    } else {
      const oIdx = oForR.get(entry.rIdx);
      if (oIdx !== undefined) lastAnchorOIdx = oIdx;
    }
  }

  const newStatements = [...insertionsAfter(insertions, -1)];
  for (let oIdx = 0; oIdx < oStatements.length; oIdx++) {
    if (!removedOIdx.has(oIdx)) {
      newStatements.push(replacements.has(oIdx) ? replacements.get(oIdx) : oStatements[oIdx]);
    }
    newStatements.push(...insertionsAfter(insertions, oIdx));
  }

  return newStatements;
}

// Rebuilds the original module's factory statement list with the human's
// diffed edits (computed between the refactor baseline R and the modified
// M) applied at the corresponding structurally-matched locations in O —
// never by just using M wholesale, since M may reference rule-rewritten
// helper calls (e.g. `_interopRequireWildcard`) that only exist in the
// readable deobfuscated view, not in O, and may use parameter names O's
// factory never declares.
export function buildPatchedFactoryStatements({ oFactory, rFactory, mFactory }) {
  const oCanon = canonicalizeFactoryBody(oFactory);
  const rCanon = canonicalizeFactoryBody(rFactory);
  const oStatements = oFactory.body.body;

  const oForR = computeOForRByHash(rCanon, oCanon, rFactory.body.body.length, oStatements.length);

  const entries = diffModuleFactories(rFactory, mFactory);

  const renameMap = buildFactoryBindingRenameMap({ oFactory, rFactory, oForR });
  const mStatements = realignFactoryBindings(mFactory, renameMap).body.body;

  return applyStatementDiff({
    oStatements,
    oCanonStatements: oCanon,
    rCanonStatements: rCanon,
    mStatements,
    entries,
  });
}

async function patchModule({ bundlePath, manifest, moduleId, baselinePath, currentPath }) {
  const mod = manifest[moduleId];
  if (!mod) throw new Error(`module ${moduleId} not found in manifest`);

  const rAst = parseFile(baselinePath);
  const mAst = parseFile(currentPath);
  const rFactory = extractFactoryBody(rAst).factory;
  const mFactory = extractFactoryBody(mAst).factory;

  const originalSource = readModuleSource(bundlePath, mod);
  const oAst = parse(originalSource, { sourceType: "script", allowReturnOutsideFunction: true });
  const oFactoryInfo = extractFactoryBody(oAst);

  const newStatements = buildPatchedFactoryStatements({
    oFactory: oFactoryInfo.factory,
    rFactory,
    mFactory,
  });
  oFactoryInfo.factory.body.body = newStatements;

  const { code: regenerated } = generate(oAst, { comments: false, retainLines: false });
  const minified = await minify(regenerated, { compress: true, mangle: true });
  if (minified.error) throw minified.error;

  let newModuleSource = minified.code.trim();
  if (!newModuleSource.endsWith(";")) newModuleSource += ";";
  return newModuleSource;
}

function parsePatchSpec(spec) {
  const eqIdx = spec.indexOf("=");
  const colonIdx = spec.indexOf(":", eqIdx);
  if (eqIdx === -1 || colonIdx === -1) {
    throw new Error(`invalid patch spec "${spec}", expected <module-id>=<baseline-file>:<current-file>`);
  }
  return {
    moduleId: spec.slice(0, eqIdx),
    baselinePath: spec.slice(eqIdx + 1, colonIdx),
    currentPath: spec.slice(colonIdx + 1),
  };
}

export async function runPatchback(bundlePath, patchSpecs, outputBundlePath) {
  const manifest = loadManifest(bundlePath);

  const patches = [];
  for (const spec of patchSpecs) {
    const { moduleId, baselinePath, currentPath } = parsePatchSpec(spec);
    const newSource = await patchModule({ bundlePath, manifest, moduleId, baselinePath, currentPath });
    patches.push({ moduleId, newSource });
  }

  const outBuffer = reassembleBundle(bundlePath, manifest, patches);
  fs.writeFileSync(outputBundlePath, outBuffer);
  console.log(`wrote patched bundle to ${outputBundlePath}`);
}
