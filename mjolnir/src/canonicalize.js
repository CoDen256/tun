import traversePkg from "@babel/traverse";
import generatorPkg from "@babel/generator";
import * as t from "@babel/types";
import crypto from "node:crypto";

const traverse = traversePkg.default ?? traversePkg;
const generate = generatorPkg.default ?? generatorPkg;

function paramBindingNames(params) {
  const names = [];
  for (const param of params) {
    for (const name of Object.keys(t.getBindingIdentifiers(param))) {
      names.push(name);
    }
  }
  return names;
}

function renameBindingsInPlace(root) {
  let counter = 0;
  const renamedBindings = new Set();

  function renameNames(path, names) {
    for (const name of names) {
      const binding = path.scope.getBinding(name);
      if (!binding || renamedBindings.has(binding)) continue;
      renamedBindings.add(binding);
      path.scope.rename(name, `_b${counter++}`);
    }
  }

  traverse(root, {
    Function(path) {
      renameNames(path, paramBindingNames(path.node.params));
    },
    VariableDeclarator(path) {
      renameNames(path, Object.keys(t.getBindingIdentifiers(path.node.id)));
    },
    CatchClause(path) {
      if (path.node.param) {
        renameNames(path, Object.keys(t.getBindingIdentifiers(path.node.param)));
      }
    },
  });
}

// Renames every local binding (function params, var/let/const declarators,
// catch params) to a name derived purely from the order bindings are first
// encountered in a deterministic pre-order traversal. Property names,
// member-expression properties, literals, and unbound/global identifiers are
// never touched.
//
// Accepts a File, a Program, or an arbitrary expression/statement node
// (the latter is wrapped in a throwaway Program so Babel's scope resolution
// has somewhere to build bindings, then unwrapped again on return).
export function canonicalize(node) {
  if (node.type === "File") {
    const cloned = t.cloneNode(node, true);
    renameBindingsInPlace(cloned);
    return cloned;
  }

  const isProgram = node.type === "Program";
  const program = isProgram
    ? t.cloneNode(node, true)
    : t.program([t.expressionStatement(t.cloneNode(node, true))]);
  const file = t.file(program);
  renameBindingsInPlace(file);

  if (isProgram) return file.program;
  return file.program.body[0].expression;
}

// Content hash of a node's own canonicalized subtree, independent of its
// position within a parent. Two structurally identical (already
// canonicalized) nodes always hash the same.
export function hashNode(node) {
  const code = generate(node, { compact: true, comments: false }).code;
  return crypto.createHash("sha1").update(code).digest("hex");
}

// Cheap structural size of a subtree: total AST node count via a plain
// recursive walk over @babel/types' visitor keys, with no cloning, scope
// resolution, renaming, or code generation. Canonicalization is a bijective
// rename that never adds or removes nodes, so this count is identical before
// and after canonicalize() and can be compared directly against a
// canonicalized reference pattern's node count.
export function countNodes(node) {
  if (!node || typeof node.type !== "string") return 0;
  let count = 1;
  const keys = t.VISITOR_KEYS[node.type] || [];
  for (const key of keys) {
    const value = node[key];
    if (Array.isArray(value)) {
      for (const child of value) count += countNodes(child);
    } else if (value) {
      count += countNodes(value);
    }
  }
  return count;
}
