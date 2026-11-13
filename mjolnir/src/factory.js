// Locates the `__d(factory, id, deps)` call in a parsed module file and
// exposes the factory function's statement list — the only part diff/
// patch-back are allowed to change (the `__d(...)` wrapper's id and deps
// are never touched).
export function extractFactoryBody(fileAst) {
  for (const stmt of fileAst.program.body) {
    const expr = stmt.type === "ExpressionStatement" ? stmt.expression : null;
    if (
      expr &&
      expr.type === "CallExpression" &&
      expr.callee.type === "Identifier" &&
      expr.callee.name === "__d"
    ) {
      const factory = expr.arguments[0];
      return { call: expr, factory, statements: factory.body.body };
    }
  }
  throw new Error("No __d(...) call found in module source");
}
