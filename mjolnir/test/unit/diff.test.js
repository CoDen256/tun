import test from "node:test";
import assert from "node:assert/strict";
import { parse } from "@babel/parser";
import {
  diffStatementList,
  canonicalizeStatementList,
  diffModuleFactories,
} from "../../src/diff.js";
import { extractFactoryBody } from "../../src/factory.js";
import { buildPatchedFactoryStatements } from "../../src/commands/patchback.js";
import generatorPkg from "@babel/generator";

const generate = generatorPkg.default ?? generatorPkg;

function statements(src) {
  const ast = parse(src, { sourceType: "script", allowReturnOutsideFunction: true });
  return ast.program.body;
}

function diffStatements(rSrc, mSrc) {
  const rCanon = canonicalizeStatementList(statements(rSrc));
  const mCanon = canonicalizeStatementList(statements(mSrc));
  return diffStatementList(rCanon, mCanon);
}

function factoryOf(src) {
  const ast = parse(src, { sourceType: "script", allowReturnOutsideFunction: true });
  return extractFactoryBody(ast).factory;
}

test("disambiguates structurally identical sibling statements by occurrence order", () => {
  const entries = diffStatements(
    `if (cond) { return null; } return null;`,
    `if (cond) { return null; } return 42;`
  );

  const ifEntry = entries.find((e) => e.rNode?.type === "IfStatement");
  assert.equal(ifEntry.kind, "unchanged");

  const modified = entries.filter((e) => e.kind === "modified");
  assert.equal(modified.length, 1);
  assert.equal(modified[0].rNode.type, "ReturnStatement");
  assert.equal(modified[0].rIdx, 1);
});

test("attributes an edit to the correct occurrence regardless of which sibling changed", () => {
  const entries = diffStatements(
    `return null; if (cond) { return null; }`,
    `return 7; if (cond) { return null; }`
  );

  const unchanged = entries.filter((e) => e.kind === "unchanged");
  assert.equal(unchanged.length, 1);
  assert.equal(unchanged[0].rNode.type, "IfStatement");

  const modified = entries.filter((e) => e.kind === "modified");
  assert.equal(modified.length, 1);
  assert.equal(modified[0].rIdx, 0);
  assert.equal(modified[0].rNode.type, "ReturnStatement");
});

test("reports added and removed statements", () => {
  const entries = diffStatements(`var a = 1;`, `var a = 1; console.log(a);`);
  assert.equal(entries.filter((e) => e.kind === "unchanged").length, 1);
  const added = entries.filter((e) => e.kind === "added");
  assert.equal(added.length, 1);
  assert.equal(added[0].mNode.type, "ExpressionStatement");
});

test("renames alone produce no modified/added/removed entries", () => {
  const entries = diffStatements(
    `function f(x) { return x + 1; }`,
    `function f(value) { return value + 1; }`
  );
  assert.ok(entries.every((e) => e.kind === "unchanged"));
});

test("diffModuleFactories ignores a factory parameter rename, even when body statements reference those params", () => {
  const rFactory = factoryOf(
    `__d(function (g, r, i, a, m, e, d) { m.exports = "1.0.0"; }, 1, []);`
  );
  const mFactory = factoryOf(
    `__d(function (global, require, importDefault, importAll, mod, exports, deps) { mod.exports = "1.0.0"; }, 1, []);`
  );

  const entries = diffModuleFactories(rFactory, mFactory);
  assert.ok(entries.every((e) => e.kind === "unchanged"));
});

test("diffModuleFactories reports a real change even after a parameter rename", () => {
  const rFactory = factoryOf(
    `__d(function (g, r, i, a, m, e, d) { m.exports = "1.0.0"; }, 1, []);`
  );
  const mFactory = factoryOf(
    `__d(function (global, require, importDefault, importAll, mod, exports, deps) { mod.exports = "2.0.0"; }, 1, []);`
  );

  const entries = diffModuleFactories(rFactory, mFactory);
  const modified = entries.filter((e) => e.kind === "modified");
  assert.equal(modified.length, 1);
});

test("a single changed case in an otherwise-identical switch is reported as one modified entry", () => {
  const entries = diffStatements(
    `switch (x) { case 1: a(); break; case 2: b(); break; default: c(); }`,
    `switch (x) { case 1: a(); break; case 2: bb(); break; default: c(); }`
  );
  const switchEntry = entries.find((e) => e.rNode?.type === "SwitchStatement");
  assert.equal(switchEntry.kind, "modified");
  const caseEntries = switchEntry.children;
  assert.equal(caseEntries.filter((e) => e.kind === "unchanged").length, 2);
  const modifiedCases = caseEntries.filter((e) => e.kind === "modified");
  assert.equal(modifiedCases.length, 1);
  assert.equal(modifiedCases[0].rIdx, 1);
});

test("an added switch case is reported as added", () => {
  const entries = diffStatements(
    `switch (x) { case 1: a(); break; }`,
    `switch (x) { case 1: a(); break; case 2: b(); break; }`
  );
  const switchEntry = entries.find((e) => e.rNode?.type === "SwitchStatement");
  const added = switchEntry.children.filter((e) => e.kind === "added");
  assert.equal(added.length, 1);
  assert.equal(added[0].mNode.type, "SwitchCase");
});

test("a removed switch case is reported as removed", () => {
  const entries = diffStatements(
    `switch (x) { case 1: a(); break; case 2: b(); break; }`,
    `switch (x) { case 1: a(); break; }`
  );
  const switchEntry = entries.find((e) => e.rNode?.type === "SwitchStatement");
  const removed = switchEntry.children.filter((e) => e.kind === "removed");
  assert.equal(removed.length, 1);
  assert.equal(removed[0].rNode.type, "SwitchCase");
});

test("a property added to an Object.assign({}, state, {...}) return is reported as one added property", () => {
  const entries = diffStatements(
    `function f(state) { return Object.assign({}, state, { a: 1 }); }`,
    `function f(state) { return Object.assign({}, state, { a: 1, b: 2 }); }`
  );
  const fnEntry = entries.find((e) => e.rNode?.type === "FunctionDeclaration");
  assert.equal(fnEntry.kind, "modified");
  const returnEntry = fnEntry.children.find((e) => e.rNode?.type === "ReturnStatement" || e.mNode?.type === "ReturnStatement");
  assert.equal(returnEntry.kind, "modified");
  const propEntries = returnEntry.children;
  assert.equal(propEntries.filter((e) => e.kind === "unchanged").length, 1);
  const added = propEntries.filter((e) => e.kind === "added");
  assert.equal(added.length, 1);
  assert.equal(added[0].mNode.key.name, "b");
});

test("a property's changed value is reported as modified", () => {
  const entries = diffStatements(
    `function f(state) { return Object.assign({}, state, { a: 1 }); }`,
    `function f(state) { return Object.assign({}, state, { a: 2 }); }`
  );
  const fnEntry = entries.find((e) => e.rNode?.type === "FunctionDeclaration");
  const returnEntry = fnEntry.children.find((e) => e.rNode?.type === "ReturnStatement");
  const propEntries = returnEntry.children;
  const modified = propEntries.filter((e) => e.kind === "modified");
  assert.equal(modified.length, 1);
  assert.equal(modified[0].rNode.key.name, "a");
});

test("a statement that doesn't match the recognized Object.assign shape falls back to whole-statement diffing", () => {
  const entries = diffStatements(
    `function f(state) { return { a: 1 }; }`,
    `function f(state) { return { a: 2 }; }`
  );
  const fnEntry = entries.find((e) => e.rNode?.type === "FunctionDeclaration");
  const returnEntry = fnEntry.children.find((e) => e.rNode?.type === "ReturnStatement");
  assert.equal(returnEntry.kind, "modified");
  assert.equal(returnEntry.children, null);
});

test("reapplying a switch-case diff onto a target with an unrelated extra case preserves that case", () => {
  const rFactory = factoryOf(
    `__d(function (g, r, i, a, m, e, d) { switch (x) { case 1: a(); break; } }, 1, []);`
  );
  const mFactory = factoryOf(
    `__d(function (g, r, i, a, m, e, d) { switch (x) { case 1: aa(); break; } }, 1, []);`
  );
  // O matches R structurally except for one additional case neither R nor M
  // has at all.
  const oFactory = factoryOf(
    `__d(function (g, r, i, a, m, e, d) { switch (x) { case 1: a(); break; case 99: extra(); break; } }, 1, []);`
  );

  const statements = buildPatchedFactoryStatements({ oFactory, rFactory, mFactory });
  const code = statements.map((s) => generate(s, { comments: false }).code).join("\n");
  assert.match(code, /aa\(\)/);
  assert.match(code, /extra\(\)/);
  assert.match(code, /case 99/);
});

test("reapplying an Object.assign property diff onto a target with an unrelated extra property preserves it", () => {
  const rFactory = factoryOf(
    `__d(function (g, r, i, a, m, e, d) { return Object.assign({}, g, { a: 1 }); }, 1, []);`
  );
  const mFactory = factoryOf(
    `__d(function (g, r, i, a, m, e, d) { return Object.assign({}, g, { a: 1, b: 2 }); }, 1, []);`
  );
  const oFactory = factoryOf(
    `__d(function (g, r, i, a, m, e, d) { return Object.assign({}, g, { a: 1, extra: 99 }); }, 1, []);`
  );

  const statements = buildPatchedFactoryStatements({ oFactory, rFactory, mFactory });
  const code = statements.map((s) => generate(s, { comments: false }).code).join("\n");
  assert.match(code, /b:\s*2/);
  assert.match(code, /extra:\s*99/);
});
