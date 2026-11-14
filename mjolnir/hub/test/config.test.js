import test from "node:test";
import assert from "node:assert/strict";
import path from "node:path";
import { loadConfig } from "../src/config.js";

// D-C3: no DATABASE_URL needed — this is pure env/path resolution, not a DB
// test, so it always runs (not gated behind the DATABASE_URL skip the rest
// of this suite uses).

const REPO_ROOT = path.resolve(import.meta.dirname, "..", "..");

function withEnv(vars, fn) {
  const saved = {};
  for (const key of Object.keys(vars)) saved[key] = process.env[key];
  Object.assign(process.env, vars);
  try {
    return fn();
  } finally {
    for (const key of Object.keys(vars)) {
      if (saved[key] === undefined) delete process.env[key];
      else process.env[key] = saved[key];
    }
  }
}

test("workbenchPatchesDir defaults to the repo's own patches/ directory, regardless of process.cwd()", () => {
  withEnv({ TUN_PUBLIC_BASE: "https://example.test", WORKBENCH_PATCHES_DIR: undefined }, () => {
    delete process.env.WORKBENCH_PATCHES_DIR;
    const cwdBefore = process.cwd();
    process.chdir("/tmp");
    try {
      const config = loadConfig();
      assert.equal(config.workbenchPatchesDir, path.join(REPO_ROOT, "patches"));
    } finally {
      process.chdir(cwdBefore);
    }
  });
});

test("a patch saved through one entry point's resolved directory is visible through another's", () => {
  // Both "entry points" here are just `loadConfig()` called under different
  // `cwd`s (simulating a locally-run CLI session vs. hub's own deployed
  // cwd) — proving they resolve to the identical directory is the actual
  // fix; patches.js's own read/write behavior is unchanged and already
  // covered by its own tests.
  withEnv({ TUN_PUBLIC_BASE: "https://example.test" }, () => {
    delete process.env.WORKBENCH_PATCHES_DIR;
    const cwdBefore = process.cwd();
    process.chdir(REPO_ROOT);
    const fromRepoRoot = loadConfig().workbenchPatchesDir;
    process.chdir("/tmp");
    const fromTmp = loadConfig().workbenchPatchesDir;
    process.chdir(cwdBefore);
    assert.equal(fromRepoRoot, fromTmp);
  });
});

test("WORKBENCH_PATCHES_DIR, when set, overrides the default", () => {
  withEnv({ TUN_PUBLIC_BASE: "https://example.test", WORKBENCH_PATCHES_DIR: "/custom/patches" }, () => {
    assert.equal(loadConfig().workbenchPatchesDir, "/custom/patches");
  });
});
