import traversePkg from "@babel/traverse";

const traverse = traversePkg.default ?? traversePkg;

const FUNCTION_TYPES = new Set([
  "FunctionDeclaration",
  "FunctionExpression",
  "ArrowFunctionExpression",
]);

function containsFunction(literalNode) {
  let found = false;
  traverse(literalNode, {
    noScope: true,
    enter(path) {
      if (FUNCTION_TYPES.has(path.node.type)) {
        found = true;
        path.stop();
      }
    },
  });
  return found;
}

function literalFromStatement(stmt) {
  if (stmt.type === "ReturnStatement") {
    return stmt.argument;
  }
  if (
    stmt.type === "ExpressionStatement" &&
    stmt.expression.type === "AssignmentExpression" &&
    stmt.expression.operator === "="
  ) {
    return stmt.expression.right;
  }
  return null;
}

export function classifyModule(ast, factoryNode, deps) {
  if (!deps || deps.length !== 0) return "logic";

  const body = factoryNode.body;
  if (!body || body.type !== "BlockStatement" || body.body.length !== 1) {
    return "logic";
  }

  const literalNode = literalFromStatement(body.body[0]);
  if (!literalNode) return "logic";
  if (literalNode.type !== "ArrayExpression" && literalNode.type !== "ObjectExpression") {
    return "logic";
  }

  return containsFunction(literalNode) ? "logic" : "data";
}
