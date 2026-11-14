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
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-account-"));
  const outputPath = path.join(dir, "out.bundle");
  try {
    await runPatchback(BASE_BUNDLE, [`2176=${PAIR_BASELINE}:${PAIR_EDITED}`], outputPath);
    const patchedParsed = parseBundle(outputPath);
    return readModuleSource(outputPath, patchedParsed.modules.get(2176));
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

// `jsx`/`jsxs` are mocked to build a plain `{type, props}` descriptor tree
// instead of real React elements — this lets the test walk the rendered
// output and invoke a button's `onPress` directly, with no real React
// renderer needed. `useState` is faked with a simple index-ordered array
// that persists across repeated calls to the component function (each call
// simulates one render — the component's hook call order never branches,
// so a plain counter is safe here).
function loadPatchedModule2176(patchedSource) {
  const ast = parse(patchedSource, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const fnSrc = generate(factory, { comments: false }).code;
  const fn = eval(`(${fnSrc})`);

  const alertCalls = [];
  let pullImpl = () => Promise.resolve({ status: "restored" });

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
    (obj) => (obj && obj.__esModule ? obj : { default: obj }), // d[0]: _interopRequireDefault
    { __esModule: true, default: (genFn) => (...args) => genFn(...args) }, // d[1]: asyncToGenerator
    { __esModule: true, default: (arr) => arr }, // d[2]: slicedToArray (identity — arr is already length 2)
    { useState }, // d[3]: React (CJS shape — named exports directly on the module object, no __esModule marker, so the `w()` interopRequireWildcard helper copies them up rather than nesting under `.default`)
    { __esModule: true, connect: (mapState, mapDispatch) => (Component) => Component }, // d[4]: react-redux
    {
      // d[5]: react-native
      ScrollView: "ScrollView",
      View: "View",
      Text: "Text",
      SafeAreaView: "SafeAreaView",
      StyleSheet: { create: (styles) => styles },
      Alert: { alert: (...args) => alertCalls.push(args) },
    },
    { SafeAreaView: "SafeAreaView" }, // d[6]: safe-area-context (unused directly here)
    { __esModule: true, default: { setType: () => {}, getTheme: () => ({ heading: "#000", exclamation: "!", background: "#fff", buttonColor: "#00f" }) } }, // d[7]: theme
    { __esModule: true, default: { header: {}, secondaryText: {}, headerText: {} }, Fonts: { poppinsSemiBold: "semibold" } }, // d[8]: styles/fonts
    { normalize: (n) => n }, // d[9]
    { __esModule: true, default: "BackButton" }, // d[10]
    { __esModule: true, default: "Button" }, // d[11]: h — never invoked, jsx mock just references it as `type`
    { __esModule: true, default: "DialogButton" }, // d[12]: y
    { __esModule: true, default: "Dialog" }, // d[13]: x
    { visitStudyCards: (v) => ({ type: "VISIT_STUDY_CARDS", payload: v }), passInitialOnboarding: (v) => ({ type: "PASS_ONBOARDING", payload: v }), logoutDeck: () => ({ type: "LOGOUT_DECK" }) }, // d[14]
    { logout: () => ({ type: "LOGOUT" }) }, // d[15]
    { logoutSettings: () => ({ type: "LOGOUT_SETTINGS" }) }, // d[16]
    { __esModule: true, default: { deleteUserData: () => Promise.resolve() } }, // d[17]: 2080 shim
    { __esModule: true, default: { resetDecksStatus: () => {} } }, // d[18]: 2110
    { jsx, jsxs, Fragment: "Fragment" }, // d[19]: jsx runtime
  ];
  const requireStub = (idx) => deps[idx];

  global.__r = () => {
    throw new Error("module 2176's own patched factory should not call __r directly");
  };
  globalThis.MJOLNIR_PULL_CLOUD_PROGRESS = (...args) => pullImpl(...args);

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

  function findByTitle(tree, title) {
    if (!tree || typeof tree !== "object") return null;
    if (tree.props && tree.props.title === title) return tree;
    const children = tree.props && tree.props.children;
    const list = Array.isArray(children) ? children : children ? [children] : [];
    for (const child of list) {
      const found = findByTitle(child, title);
      if (found) return found;
    }
    return null;
  }

  return {
    render,
    findByTitle,
    alertCalls,
    setPullImpl: (fn) => {
      pullImpl = fn;
    },
  };
}

function cleanup() {
  delete global.__r;
  delete globalThis.MJOLNIR_PULL_CLOUD_PROGRESS;
}

test("my-account screen: a 'Pull cloud progress' button is rendered alongside 'Delete account'", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle } = loadPatchedModule2176(source);
  const tree = render();

  assert.ok(findByTitle(tree, "Pull cloud progress"), "expected a 'Pull cloud progress' button");
  assert.ok(findByTitle(tree, "Delete account"), "expected 'Delete account' to still be present, unmodified");
  cleanup();
});

test("my-account screen: pressing the button opens a confirmation dialog, not an immediate pull", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle } = loadPatchedModule2176(source);
  let tree = render();

  const button = findByTitle(tree, "Pull cloud progress");
  button.props.onPress();
  tree = render();

  const dialog = findByTitle(tree, "Pull cloud progress?");
  assert.ok(dialog, "expected the confirmation dialog to now be active");
  assert.equal(dialog.props.isActive, true);
  cleanup();
});

test("my-account screen: confirming the dialog triggers MJOLNIR_PULL_CLOUD_PROGRESS and shows a success alert", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle, alertCalls, setPullImpl } = loadPatchedModule2176(source);
  let pullCalls = 0;
  setPullImpl(() => {
    pullCalls++;
    return Promise.resolve({ status: "restored" });
  });

  let tree = render();
  findByTitle(tree, "Pull cloud progress").props.onPress();
  tree = render();
  const dialog = findByTitle(tree, "Pull cloud progress?");
  const yesButton = dialog.props.buttons.props.children[0];
  yesButton.props.onPress();

  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(pullCalls, 1);
  assert.equal(alertCalls.length, 1);
  assert.equal(alertCalls[0][0], "Progress restored");
  cleanup();
});

test("my-account screen: 'nothing to restore' and 'not signed in' show distinct, correct messages", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle, alertCalls, setPullImpl } = loadPatchedModule2176(source);

  setPullImpl(() => Promise.resolve({ status: "nothing-to-restore" }));
  let tree = render();
  findByTitle(tree, "Pull cloud progress").props.onPress();
  tree = render();
  findByTitle(tree, "Pull cloud progress?").props.buttons.props.children[0].props.onPress();
  await new Promise((resolve) => setTimeout(resolve, 10));
  assert.equal(alertCalls.at(-1)[0], "Nothing to restore");

  setPullImpl(() => Promise.reject(Object.assign(new Error("not signed in"), { code: "not-signed-in" })));
  tree = render();
  findByTitle(tree, "Pull cloud progress").props.onPress();
  tree = render();
  findByTitle(tree, "Pull cloud progress?").props.buttons.props.children[0].props.onPress();
  await new Promise((resolve) => setTimeout(resolve, 10));
  assert.equal(alertCalls.at(-1)[0], "Not signed in");
  cleanup();
});

test("my-account screen: a second press while pulling is still in flight is a no-op — only one call made (D-M4)", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle, setPullImpl } = loadPatchedModule2176(source);
  let pullCalls = 0;
  let resolvePull;
  setPullImpl(() => {
    pullCalls++;
    return new Promise((resolve) => {
      resolvePull = resolve;
    });
  });

  let tree = render();
  findByTitle(tree, "Pull cloud progress").props.onPress();
  tree = render();
  findByTitle(tree, "Pull cloud progress?").props.buttons.props.children[0].props.onPress(); // first "Yes" — pull now in flight
  tree = render();

  const button = findByTitle(tree, "Pulling…");
  assert.ok(button, "expected the button's title to swap while pulling");
  assert.equal(button.props.disabled, true);

  // In a real app, `disabled: true` stops RN's TouchableOpacity from ever
  // firing onPress — but the test harness's jsx mock doesn't enforce that
  // itself, so pressing through to a second "Yes" here exercises the
  // handler's OWN `if (pulling) return;` guard directly, not just the prop.
  button.props.onPress(); // re-opens the confirmation dialog
  tree = render();
  findByTitle(tree, "Pull cloud progress?").props.buttons.props.children[0].props.onPress(); // second "Yes", while first still in flight
  await new Promise((resolve) => setTimeout(resolve, 5));
  assert.equal(pullCalls, 1, "the second press must not start a second concurrent pull");

  resolvePull({ status: "restored" });
  cleanup();
});
