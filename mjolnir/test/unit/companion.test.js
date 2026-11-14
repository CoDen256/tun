import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import { appendCompanion, substituteBakedPlaceholders } from "../../src/commands/companion.js";

const REAL_BOOT_OK_COMPANION = fs.readFileSync(path.resolve("patches/js/boot-ok-companion.js"), "utf8");

const PLACEHOLDER_COMPANION = "(function(){ var id='__MJOLNIR_BUILD_ID__'; })();";
const PLAIN_COMPANION = "(function(){ /* no buildId */ })();";

// A bundle whose trailer mirrors the real one: entry calls then sourcemap comments.
function bundleWithMap() {
  return Buffer.from(
    "var __BUNDLE_START_TIME__=0;\n__d(function(){},0,[]);\n__r(160);\n__r(0);\n//# sourceMappingURL=x.map\n//# debugId=abc\n",
    "utf8"
  );
}
// A bundle with no sourcemap comment (like the test fixture: entry call, then EOF).
function bundleNoMap() {
  return Buffer.from("var __BUNDLE_START_TIME__=0;\n__d(function(){},0,[]);\n__r(824);\n", "utf8");
}

test("inserts the companion before the sourcemap comments, after the entry call", () => {
  const out = appendCompanion(bundleWithMap(), PLACEHOLDER_COMPANION, {
    placeholders: { BUILD_ID: "b000002" },
    name: "boot-ok",
  }).toString("utf8");
  const entryIdx = out.indexOf("__r(0);");
  const bodyIdx = out.indexOf("b000002");
  const mapIdx = out.indexOf("//# sourceMappingURL");
  assert.ok(entryIdx < bodyIdx, "companion runs after the entry call");
  assert.ok(bodyIdx < mapIdx, "companion sits before the sourcemap comments");
  assert.ok(out.endsWith("//# debugId=abc\n"), "sourcemap comments stay last");
});

test("substitutes the buildId placeholder", () => {
  const out = appendCompanion(bundleWithMap(), PLACEHOLDER_COMPANION, {
    placeholders: { BUILD_ID: "b000002" },
    name: "boot-ok",
  }).toString("utf8");
  assert.ok(out.includes("id='b000002'"));
  assert.ok(!out.includes("__MJOLNIR_BUILD_ID__"));
});

test("leaves the 26-byte activation prefix untouched (D51)", () => {
  const out = appendCompanion(bundleWithMap(), PLACEHOLDER_COMPANION, {
    placeholders: { BUILD_ID: "b000002" },
    name: "boot-ok",
  });
  assert.equal(out.subarray(0, 26).toString("utf8"), "var __BUNDLE_START_TIME__=");
});

test("appends at EOF when there is no sourcemap comment", () => {
  const out = appendCompanion(bundleNoMap(), PLACEHOLDER_COMPANION, {
    placeholders: { BUILD_ID: "b000002" },
    name: "boot-ok",
  }).toString("utf8");
  assert.ok(out.indexOf("__r(824);") < out.indexOf("b000002"));
});

test("requires a value only when the companion uses that placeholder", () => {
  assert.throws(
    () => appendCompanion(bundleWithMap(), PLACEHOLDER_COMPANION, { placeholders: {}, name: "boot-ok" }),
    /no value was given for BUILD_ID/
  );
  // A companion without the placeholder needs no value for it.
  const out = appendCompanion(bundleWithMap(), PLAIN_COMPANION, { placeholders: {}, name: "debug" }).toString("utf8");
  assert.ok(out.includes("/* no buildId */"));
});

test("rejects a BUILD_ID outside the D48 charset", () => {
  assert.throws(
    () => appendCompanion(bundleWithMap(), PLACEHOLDER_COMPANION, { placeholders: { BUILD_ID: "bad id!" }, name: "boot-ok" }),
    /BUILD_ID must match/
  );
});

test("substitutes BASE_VERSION and PATCH_REV placeholders alongside BUILD_ID with no interaction", () => {
  const companion = "(function(){ var b='__MJOLNIR_BUILD_ID__'; var v='__MJOLNIR_BASE_VERSION__'; var p=__MJOLNIR_PATCH_REV__; })();";
  const out = appendCompanion(bundleWithMap(), companion, {
    placeholders: { BUILD_ID: "b000002", BASE_VERSION: "1.5.12", PATCH_REV: 3 },
    name: "boot-ok",
  }).toString("utf8");
  assert.ok(out.includes("b='b000002'"));
  assert.ok(out.includes("v='1.5.12'"));
  assert.ok(out.includes("p=3"));
  assert.ok(!out.includes("__MJOLNIR_"));
});

test("requires BASE_VERSION/PATCH_REV only when their own placeholder is present", () => {
  assert.throws(
    () => appendCompanion(bundleWithMap(), "var v='__MJOLNIR_BASE_VERSION__';", { placeholders: {}, name: "boot-ok" }),
    /no value was given for BASE_VERSION/
  );
  assert.throws(
    () => appendCompanion(bundleWithMap(), "var p=__MJOLNIR_PATCH_REV__;", { placeholders: {}, name: "boot-ok" }),
    /no value was given for PATCH_REV/
  );
  // Neither placeholder present — neither value is required.
  const out = appendCompanion(bundleWithMap(), PLAIN_COMPANION, { placeholders: {}, name: "debug" }).toString("utf8");
  assert.ok(out.includes("/* no buildId */"));
});

test("boot-companion-label-data-version: the real boot-ok-companion.js requires and substitutes LABEL/DATA_VERSION alongside the existing three globals unaffected", () => {
  const out = appendCompanion(bundleWithMap(), REAL_BOOT_OK_COMPANION, {
    placeholders: {
      BUILD_ID: "b000002",
      BASE_VERSION: "1.5.12",
      PATCH_REV: 3,
      LABEL: "spring-release",
      DATA_VERSION: "17",
    },
    name: "boot-ok",
  }).toString("utf8");
  assert.ok(out.includes("globalThis.MJOLNIR_BUILD_ID = BUILD_ID"));
  assert.ok(out.includes("globalThis.MJOLNIR_BASE_VERSION = BASE_VERSION"));
  assert.ok(out.includes("globalThis.MJOLNIR_PATCH_REV = PATCH_REV"));
  assert.ok(out.includes("globalThis.MJOLNIR_LABEL = LABEL"));
  assert.ok(out.includes("globalThis.MJOLNIR_DATA_VERSION = DATA_VERSION"));
  assert.ok(out.includes("BUILD_ID = 'b000002'"));
  assert.ok(out.includes("BASE_VERSION = '1.5.12'"));
  assert.ok(out.includes("PATCH_REV = 3"));
  assert.ok(out.includes("LABEL = 'spring-release'"));
  assert.ok(out.includes("DATA_VERSION = '17'"));
  assert.ok(!out.includes("__MJOLNIR_"));
});

test("boot-companion-label-data-version: omitting LABEL/DATA_VERSION aborts, since the real companion always bakes them", () => {
  assert.throws(
    () =>
      appendCompanion(bundleWithMap(), REAL_BOOT_OK_COMPANION, {
        placeholders: { BUILD_ID: "b000002", BASE_VERSION: "1.5.12", PATCH_REV: 3 },
        name: "boot-ok",
      }),
    /no value was given for LABEL/
  );
});

test("rejects a PATCH_REV that isn't a non-negative integer", () => {
  assert.throws(
    () => appendCompanion(bundleWithMap(), "var p=__MJOLNIR_PATCH_REV__;", { placeholders: { PATCH_REV: -1 }, name: "boot-ok" }),
    /PATCH_REV must be/
  );
  assert.throws(
    () => appendCompanion(bundleWithMap(), "var p=__MJOLNIR_PATCH_REV__;", { placeholders: { PATCH_REV: 1.5 }, name: "boot-ok" }),
    /PATCH_REV must be/
  );
});

test("progress-sync-shim: substitutes SYNC_BASE_URL/SYNC_TOKEN placeholders in an appended companion", () => {
  const companion = "(function(){ var u='__MJOLNIR_SYNC_BASE_URL__'; var t='__MJOLNIR_SYNC_TOKEN__'; })();";
  const out = appendCompanion(bundleWithMap(), companion, {
    placeholders: { SYNC_BASE_URL: "https://hub.example.net/mjolnir/userdata", SYNC_TOKEN: "s3cret" },
    name: "progress-sync-restore-companion",
  }).toString("utf8");
  assert.ok(out.includes("u='https://hub.example.net/mjolnir/userdata'"));
  assert.ok(out.includes("t='s3cret'"));
  assert.ok(!out.includes("__MJOLNIR_SYNC_"));
});

test("progress-sync-shim: requires SYNC_BASE_URL/SYNC_TOKEN only when their own placeholder is present, and validates SYNC_BASE_URL is https://", () => {
  assert.throws(
    () => appendCompanion(bundleWithMap(), "var u='__MJOLNIR_SYNC_BASE_URL__';", { placeholders: {}, name: "restore" }),
    /no value was given for SYNC_BASE_URL/
  );
  assert.throws(
    () => appendCompanion(bundleWithMap(), "var t='__MJOLNIR_SYNC_TOKEN__';", { placeholders: {}, name: "restore" }),
    /no value was given for SYNC_TOKEN/
  );
  assert.throws(
    () =>
      appendCompanion(bundleWithMap(), "var u='__MJOLNIR_SYNC_BASE_URL__';", {
        placeholders: { SYNC_BASE_URL: "http://insecure.example.net" },
        name: "restore",
      }),
    /must be a bare https:\/\/ URL/
  );
  // Neither placeholder present — neither value is required.
  const out = appendCompanion(bundleWithMap(), PLAIN_COMPANION, { placeholders: {}, name: "debug" }).toString("utf8");
  assert.ok(out.includes("/* no buildId */"));
});

test("progress-sync-shim: substituteBakedPlaceholders bakes both placeholders across a whole assembled bundle, not just an appended companion's own text", () => {
  const bundle = Buffer.from(
    "var SYNC_BASE_URL = '__MJOLNIR_SYNC_BASE_URL__';\nvar SYNC_TOKEN = '__MJOLNIR_SYNC_TOKEN__';\n",
    "utf8"
  );
  const out = substituteBakedPlaceholders(bundle, {
    SYNC_BASE_URL: "https://hub.example.net/mjolnir/userdata",
    SYNC_TOKEN: "s3cret",
  }).toString("utf8");
  assert.ok(out.includes("'https://hub.example.net/mjolnir/userdata'"));
  assert.ok(out.includes("'s3cret'"));
  assert.ok(!out.includes("__MJOLNIR_SYNC_"));
});

test("progress-sync-shim: substituteBakedPlaceholders is a no-op (and needs no options) when none of its placeholders are present", () => {
  const bundle = Buffer.from("var x = 1;\n", "utf8");
  const out = substituteBakedPlaceholders(bundle, {});
  assert.equal(out, bundle); // same buffer, not merely equal bytes — confirms the early-return path
});

test("audio-link-playback-minimal: substitutes the AUDIO_BASE_URL placeholder in an appended companion, and across a whole bundle via substituteBakedPlaceholders (D120)", () => {
  const companion = "(function(){ var u='__MJOLNIR_AUDIO_BASE_URL__'; })();";
  const out = appendCompanion(bundleWithMap(), companion, {
    placeholders: { AUDIO_BASE_URL: "https://hub.example.net/audio-by-card" },
    name: "audio-companion",
  }).toString("utf8");
  assert.ok(out.includes("u='https://hub.example.net/audio-by-card'"));
  assert.ok(!out.includes("__MJOLNIR_AUDIO_BASE_URL__"));

  const bundle = Buffer.from("var AUDIO_BASE_URL = '__MJOLNIR_AUDIO_BASE_URL__';\n", "utf8");
  const whole = substituteBakedPlaceholders(bundle, { AUDIO_BASE_URL: "https://hub.example.net/audio-by-card" }).toString(
    "utf8"
  );
  assert.ok(whole.includes("'https://hub.example.net/audio-by-card'"));
});

test("audio-link-playback-minimal: requires AUDIO_BASE_URL only when its own placeholder is present, and validates it's https://", () => {
  assert.throws(
    () => appendCompanion(bundleWithMap(), "var u='__MJOLNIR_AUDIO_BASE_URL__';", { placeholders: {}, name: "audio-companion" }),
    /no value was given for AUDIO_BASE_URL/
  );
  assert.throws(
    () =>
      appendCompanion(bundleWithMap(), "var u='__MJOLNIR_AUDIO_BASE_URL__';", {
        placeholders: { AUDIO_BASE_URL: "http://insecure.example.net" },
        name: "audio-companion",
      }),
    /must be a bare https:\/\/ URL/
  );
  // Neither placeholder present — the value is not required.
  const out = appendCompanion(bundleWithMap(), PLAIN_COMPANION, { placeholders: {}, name: "debug" }).toString("utf8");
  assert.ok(out.includes("/* no buildId */"));
});

test("a brand-new, never-before-seen placeholder key substitutes correctly with no code change (proves genericness)", () => {
  const companion = "(function(){ var l='__MJOLNIR_LABEL__'; var d='__MJOLNIR_DATA_VERSION__'; })();";
  const out = appendCompanion(bundleWithMap(), companion, {
    placeholders: { LABEL: "base 0 · logic 0 · data 3", DATA_VERSION: "3" },
    name: "boot-ok",
  }).toString("utf8");
  assert.ok(out.includes("l='base 0 · logic 0 · data 3'"));
  assert.ok(out.includes("d='3'"));
  assert.ok(!out.includes("__MJOLNIR_"));
});

test("refuses to append the same companion twice", () => {
  const once = appendCompanion(bundleWithMap(), PLACEHOLDER_COMPANION, { placeholders: { BUILD_ID: "b000002" }, name: "boot-ok" });
  assert.throws(
    () => appendCompanion(once, PLACEHOLDER_COMPANION, { placeholders: { BUILD_ID: "b000002" }, name: "boot-ok" }),
    /already present/
  );
});
