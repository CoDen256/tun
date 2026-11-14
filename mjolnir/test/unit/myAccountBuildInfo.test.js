import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import os from "node:os";
import { parse } from "@babel/parser";
import generatorPkg from "@babel/generator";
import { runPatchback } from "../../src/commands/patchback.js";
import { parseBundle, readModuleSource } from "../../src/parseBundle.js";
import { extractFactoryBody } from "../../src/factory.js";

const generate = generatorPkg.default ?? generatorPkg;

const BASE_BUNDLE = path.resolve("base/smali.mjolnir.merged/assets/index.android.bundle");
const PAIR_BASELINE = path.resolve("patches/js/2176-my-account-build-id.baseline.js");
const PAIR_EDITED = path.resolve("patches/js/2176-my-account-build-id.edited.js");

async function patchedModule2176Source() {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-account-info-"));
  const outputPath = path.join(dir, "out.bundle");
  try {
    await runPatchback(BASE_BUNDLE, [`2176=${PAIR_BASELINE}:${PAIR_EDITED}`], outputPath);
    const patchedParsed = parseBundle(outputPath);
    return readModuleSource(outputPath, patchedParsed.modules.get(2176));
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

// Same mock-dependency harness as myAccountPullButton.test.js (no shared
// module between the two test files — module 2176's patched factory needs
// its full dependency array re-stubbed either way).
function loadPatchedModule2176(patchedSource) {
  const ast = parse(patchedSource, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const fnSrc = generate(factory, { comments: false }).code;
  const fn = eval(`(${fnSrc})`);

  const hookStates = [];
  let hookIndex = 0;
  function useState(initial) {
    const i = hookIndex++;
    if (hookStates.length <= i) hookStates.push(initial);
    const setState = (v) => {
      hookStates[i] = v;
    };
    return [hookStates[i], setState];
  }

  const jsx = (type, props) => ({ type, props });
  const jsxs = jsx;

  const deps = [
    (obj) => (obj && obj.__esModule ? obj : { default: obj }),
    { __esModule: true, default: (genFn) => (...args) => genFn(...args) },
    { __esModule: true, default: (arr) => arr },
    { useState },
    { __esModule: true, connect: (mapState, mapDispatch) => (Component) => Component },
    {
      ScrollView: "ScrollView",
      View: "View",
      Text: "Text",
      SafeAreaView: "SafeAreaView",
      StyleSheet: { create: (styles) => styles },
      Alert: { alert: () => {} },
    },
    { SafeAreaView: "SafeAreaView" },
    { __esModule: true, default: { setType: () => {}, getTheme: () => ({ heading: "#000", exclamation: "!", background: "#fff", buttonColor: "#00f" }) } },
    { __esModule: true, default: { header: {}, secondaryText: {}, headerText: {} }, Fonts: { poppinsSemiBold: "semibold" } },
    { normalize: (n) => n },
    { __esModule: true, default: "BackButton" },
    { __esModule: true, default: "Button" },
    { __esModule: true, default: "DialogButton" },
    { __esModule: true, default: "Dialog" },
    { visitStudyCards: (v) => ({ type: "VISIT_STUDY_CARDS", payload: v }), passInitialOnboarding: (v) => ({ type: "PASS_ONBOARDING", payload: v }), logoutDeck: () => ({ type: "LOGOUT_DECK" }) },
    { logout: () => ({ type: "LOGOUT" }) },
    { logoutSettings: () => ({ type: "LOGOUT_SETTINGS" }) },
    { __esModule: true, default: { deleteUserData: () => Promise.resolve() } },
    { __esModule: true, default: { resetDecksStatus: () => {} } },
    { jsx, jsxs, Fragment: "Fragment" },
  ];
  const requireStub = (idx) => deps[idx];

  global.__r = () => {
    throw new Error("module 2176's own patched factory should not call __r directly");
  };

  const mod = { exports: {} };
  fn({}, requireStub, (x) => x, (x) => x, mod, mod.exports, Array.from({ length: 20 }, (_, i) => i));

  const Component = mod.exports.default;

  function render(props = {}) {
    hookIndex = 0;
    return Component({
      navigation: { navigate: () => {} },
      mode: "light",
      profile: { displayName: "Test User", email: "test@example.com" },
      completedSessions: 3,
      totalCards: [],
      logout: () => {},
      logoutDeck: () => {},
      logoutSettings: () => {},
      visitStudyCards: () => {},
      passInitialOnboarding: () => {},
      subscriptionPurchased: null,
      ...props,
    });
  }

  // Finds the row (a View containing a label Text and a value Text) whose
  // label matches `labelText`, and returns the value Text's own children
  // (module 2176's rows are `{label, value}` sibling Text pairs, not a
  // `title` prop — `findByTitle` in myAccountPullButton.test.js doesn't fit
  // here).
  function findRowValue(tree, labelText) {
    if (!tree || typeof tree !== "object") return undefined;
    const children = tree.props && tree.props.children;
    const list = Array.isArray(children) ? children : children ? [children] : [];
    if (
      list.length === 2 &&
      list[0] &&
      list[0].props &&
      list[0].props.children === labelText &&
      list[1] &&
      list[1].props
    ) {
      return list[1].props.children;
    }
    for (const child of list) {
      const found = findRowValue(child, labelText);
      if (found !== undefined) return found;
    }
    return undefined;
  }

  return { render, findRowValue };
}

function cleanup() {
  delete global.__r;
  delete globalThis.MJOLNIR_LABEL;
  delete globalThis.MJOLNIR_DATA_VERSION;
  delete globalThis.MJOLNIR_BUILD_ID;
  delete globalThis.MJOLNIR_BASE_VERSION;
}

test("my-account screen: 'Label' and 'Data version' rows render the baked globals", async () => {
  globalThis.MJOLNIR_LABEL = "spring-release";
  globalThis.MJOLNIR_DATA_VERSION = "17";

  const source = await patchedModule2176Source();
  const { render, findRowValue } = loadPatchedModule2176(source);
  const tree = render();

  assert.equal(findRowValue(tree, "Label"), "spring-release");
  assert.equal(findRowValue(tree, "Data version"), "17");
  cleanup();
});

test("my-account screen: 'Label'/'Data version' fall back to 'embedded' when the globals are unset (tier-4 asset, no companion)", async () => {
  const source = await patchedModule2176Source();
  const { render, findRowValue } = loadPatchedModule2176(source);
  const tree = render();

  assert.equal(findRowValue(tree, "Label"), "embedded");
  assert.equal(findRowValue(tree, "Data version"), "embedded");
  cleanup();
});
