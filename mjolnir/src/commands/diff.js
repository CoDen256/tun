import fs from "node:fs";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import { extractFactoryBody } from "../factory.js";
import { diffModuleFactories } from "../diff.js";

const generate = generatorPkg.default ?? generatorPkg;

function parseFile(filePath) {
  const source = fs.readFileSync(filePath, "utf8");
  return parse(source, { sourceType: "script", allowReturnOutsideFunction: true });
}

function code(node) {
  return generate(node, { comments: false, compact: true }).code;
}

export function diffModuleFiles(baselinePath, currentPath) {
  const rAst = parseFile(baselinePath);
  const mAst = parseFile(currentPath);
  const rFactory = extractFactoryBody(rAst).factory;
  const mFactory = extractFactoryBody(mAst).factory;
  return diffModuleFactories(rFactory, mFactory);
}

export function formatDiffEntries(entries, depth = 0) {
  const indent = "  ".repeat(depth);
  const lines = [];
  for (const entry of entries) {
    if (entry.kind === "unchanged") continue;
    if (entry.kind === "modified") {
      lines.push(`${indent}~ modified:`);
      lines.push(`${indent}  - ${code(entry.rNode)}`);
      lines.push(`${indent}  + ${code(entry.mNode)}`);
      if (entry.children) lines.push(...formatDiffEntries(entry.children, depth + 1));
    } else if (entry.kind === "added") {
      lines.push(`${indent}+ added: ${code(entry.mNode)}`);
    } else if (entry.kind === "removed") {
      lines.push(`${indent}- removed: ${code(entry.rNode)}`);
    }
  }
  return lines;
}

export function runDiff(baselinePath, currentPath) {
  const entries = diffModuleFiles(baselinePath, currentPath);
  const lines = formatDiffEntries(entries);
  if (lines.length === 0) {
    console.log("diff: no semantic changes");
    return;
  }
  console.log(lines.join("\n"));
}
