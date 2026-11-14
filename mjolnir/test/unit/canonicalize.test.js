import test from "node:test";
import assert from "node:assert/strict";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import { canonicalize, hashNode } from "../../src/canonicalize.js";

const generate = generatorPkg.default ?? generatorPkg;

function parseExpr(src) {
  return parse(src, { sourceType: "script", allowReturnOutsideFunction: true });
}

function genCode(ast) {
  return generate(ast, { comments: false }).code;
}

test("alpha-equivalent modules canonicalize to byte-identical source", () => {
  const a = parseExpr(`function foo(x, y) { var z = x + y; return z; }`);
  const b = parseExpr(`function foo(apple, banana) { var cherry = apple + banana; return cherry; }`);

  assert.equal(genCode(canonicalize(a)), genCode(canonicalize(b)));
});

test("property names and member-expression properties are preserved", () => {
  const ast = parseExpr(`var obj = { foo: 1, bar: 2 }; console.log(obj.foo);`);
  const code = genCode(canonicalize(ast));
  assert.match(code, /foo:\s*1/);
  assert.match(code, /bar:\s*2/);
  assert.match(code, /console\.log/);
  assert.match(code, /\.foo\)/);
});

test("unbound global identifiers are preserved", () => {
  const ast = parseExpr(`globalThing.doStuff(someGlobal);`);
  const code = genCode(canonicalize(ast));
  assert.match(code, /globalThing\.doStuff\(someGlobal\)/);
});

test("catch clause params are canonicalized", () => {
  const ast = parseExpr(`try { risky(); } catch (err) { log(err); }`);
  const code = genCode(canonicalize(ast));
  assert.match(code, /catch \(_b\d+\)/);
  assert.doesNotMatch(code, /\berr\b/);
});

test("shadowed names in nested scopes get distinct canonical names", () => {
  const ast = parseExpr(`function outer(e, t) { return function inner(e, t) { return e + t; }; }`);
  const code = genCode(canonicalize(ast));
  // four distinct bindings total (outer e, outer t, inner e, inner t)
  const matches = code.match(/_b\d+/g);
  assert.equal(new Set(matches).size, 4);
});

test("two structurally identical sibling statements hash the same", () => {
  const ast = parseExpr(`function f() { if (true) { return null; } return null; }`);
  const canon = canonicalize(ast);
  const fn = canon.program.body[0];
  const ifReturn = fn.body.body[0].consequent.body[0];
  const trailingReturn = fn.body.body[1];
  assert.equal(hashNode(ifReturn), hashNode(trailingReturn));
});
