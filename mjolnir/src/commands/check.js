import fs from "node:fs";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import { canonicalize } from "../canonicalize.js";

const generate = generatorPkg.default ?? generatorPkg;

export function canonicalizedCode(filePath) {
  const source = fs.readFileSync(filePath, "utf8");
  const ast = parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
  return generate(canonicalize(ast), { comments: false, retainLines: false }).code;
}

function lineDiff(baselineCode, currentCode) {
  const baseLines = baselineCode.split("\n");
  const curLines = currentCode.split("\n");
  const max = Math.max(baseLines.length, curLines.length);
  const out = [];
  for (let i = 0; i < max; i++) {
    const b = baseLines[i];
    const c = curLines[i];
    if (b === c) continue;
    if (b !== undefined) out.push(`- ${b}`);
    if (c !== undefined) out.push(`+ ${c}`);
  }
  return out.join("\n");
}

export function checkEquivalence(baselinePath, currentPath) {
  const baselineCode = canonicalizedCode(baselinePath);
  const currentCode = canonicalizedCode(currentPath);
  const pass = baselineCode === currentCode;
  return {
    pass,
    diff: pass ? null : lineDiff(baselineCode, currentCode),
  };
}

export function runCheck(baselinePath, currentPath) {
  const { pass, diff } = checkEquivalence(baselinePath, currentPath);

  if (pass) {
    console.log(`check: pass (${currentPath} is behavior-equivalent to ${baselinePath})`);
    return;
  }

  console.log(`check: fail (${currentPath} differs from ${baselinePath})`);
  console.log("");
  console.log(diff);
  process.exitCode = 1;
}
