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
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "bundle-tool-account-push-"));
  const outputPath = path.join(dir, "out.bundle");
  try {
    await runPatchback(BASE_BUNDLE, [`2176=${PAIR_BASELINE}:${PAIR_EDITED}`], outputPath);
    const patchedParsed = parseBundle(outputPath);
    return readModuleSource(outputPath, patchedParsed.modules.get(2176));
  } finally {
    fs.rmSync(dir, { recursive: true, force: true });
  }
}

// Same mock-dependency harness as myAccountPullButton.test.js — module
// 2176's patched factory needs its full dependency array re-stubbed either
// way, no shared module between the test files.
function loadPatchedModule2176(patchedSource) {
  const ast = parse(patchedSource, { sourceType: "script", allowReturnOutsideFunction: true });
  const { factory } = extractFactoryBody(ast);
  const fnSrc = generate(factory, { comments: false }).code;
  const fn = eval(`(${fnSrc})`);

  const alertCalls = [];
  let pushImpl = () => Promise.resolve({ status: "pushed" });

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
      Alert: { alert: (...args) => alertCalls.push(args) },
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
  globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS = (...args) => pushImpl(...args);

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
    setPushImpl: (fn) => {
      pushImpl = fn;
    },
  };
}

function cleanup() {
  delete global.__r;
  delete globalThis.MJOLNIR_PUSH_CLOUD_PROGRESS;
}

test("my-account screen: a 'Push cloud progress' button is rendered alongside 'Pull cloud progress'/'Delete account'", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle } = loadPatchedModule2176(source);
  const tree = render();

  assert.ok(findByTitle(tree, "Push cloud progress"), "expected a 'Push cloud progress' button");
  assert.ok(findByTitle(tree, "Pull cloud progress"), "expected 'Pull cloud progress' to still be present, unmodified");
  assert.ok(findByTitle(tree, "Delete account"), "expected 'Delete account' to still be present, unmodified");
  cleanup();
});

test("my-account screen: pressing 'Push cloud progress' calls MJOLNIR_PUSH_CLOUD_PROGRESS immediately, no confirmation dialog (D-PP3)", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle, alertCalls, setPushImpl } = loadPatchedModule2176(source);
  let pushCalls = 0;
  setPushImpl(() => {
    pushCalls++;
    return Promise.resolve({ status: "pushed" });
  });

  const tree = render();
  findByTitle(tree, "Push cloud progress").props.onPress();
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(pushCalls, 1, "pressing push must call MJOLNIR_PUSH_CLOUD_PROGRESS with no intervening dialog");
  assert.equal(alertCalls.length, 1);
  assert.equal(alertCalls[0][0], "Progress pushed");
  cleanup();
});

test("my-account screen: 'not signed in' on push shows the right message", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle, alertCalls, setPushImpl } = loadPatchedModule2176(source);
  setPushImpl(() => Promise.reject(Object.assign(new Error("not signed in"), { code: "not-signed-in" })));

  const tree = render();
  findByTitle(tree, "Push cloud progress").props.onPress();
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(alertCalls.at(-1)[0], "Not signed in");
  cleanup();
});

test("my-account screen: a generic push failure shows the error message, not swallowed", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle, alertCalls, setPushImpl } = loadPatchedModule2176(source);
  setPushImpl(() => Promise.reject(new Error("push failed: HTTP 500")));

  const tree = render();
  findByTitle(tree, "Push cloud progress").props.onPress();
  await new Promise((resolve) => setTimeout(resolve, 10));

  assert.equal(alertCalls.at(-1)[0], "Push failed");
  assert.equal(alertCalls.at(-1)[1], "push failed: HTTP 500");
  cleanup();
});

test("my-account screen: a second press while pushing is still in flight is a no-op — only one call made", async () => {
  const source = await patchedModule2176Source();
  const { render, findByTitle, setPushImpl } = loadPatchedModule2176(source);
  let pushCalls = 0;
  let resolvePush;
  setPushImpl(() => {
    pushCalls++;
    return new Promise((resolve) => {
      resolvePush = resolve;
    });
  });

  let tree = render();
  findByTitle(tree, "Push cloud progress").props.onPress();
  tree = render();

  const button = findByTitle(tree, "Pushing…");
  assert.ok(button, "expected the button's title to swap while pushing");
  assert.equal(button.props.disabled, true);

  button.props.onPress(); // same guard as pull's own `if (pushing) return;`
  await new Promise((resolve) => setTimeout(resolve, 5));
  assert.equal(pushCalls, 1, "the second press must not start a second concurrent push");

  resolvePush({ status: "pushed" });
  cleanup();
});
