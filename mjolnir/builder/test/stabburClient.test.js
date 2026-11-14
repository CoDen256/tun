import test from "node:test";
import assert from "node:assert/strict";
import { pullGrammarRules, buildGrammarRuleLookup, pullNotes } from "../src/stabburClient.js";
import { startFakeStabbur } from "./helpers/fakeStabbur.js";

test("pullGrammarRules fetches stabbur's GET /api/grammar_rules list verbatim", async () => {
  const fake = startFakeStabbur({ grammarRules: [{ id: "rule-1", title: "Present tense", html: "<p>...</p>" }] });
  const baseUrl = await fake.listen();
  try {
    const rules = await pullGrammarRules({ baseUrl, authToken: fake.authToken });
    assert.deepEqual(rules, [{ id: "rule-1", title: "Present tense", html: "<p>...</p>" }]);
  } finally {
    await fake.close();
  }
});

test("buildGrammarRuleLookup returns a synchronous id -> {title, html} lookup, undefined for an unknown id", async () => {
  const fake = startFakeStabbur({
    grammarRules: [
      { id: "rule-1", title: "Present tense", html: "<p>a</p>" },
      { id: "rule-2", title: "Past tense", html: "<p>b</p>" },
    ],
  });
  const baseUrl = await fake.listen();
  try {
    const lookup = await buildGrammarRuleLookup({ baseUrl, authToken: fake.authToken });
    assert.deepEqual(lookup("rule-1"), { title: "Present tense", html: "<p>a</p>" });
    assert.deepEqual(lookup("rule-2"), { title: "Past tense", html: "<p>b</p>" });
    assert.equal(lookup("no-such-rule"), undefined);
  } finally {
    await fake.close();
  }
});

// D85: the bug this guards against — pullNotes/pullGrammarRules sending no
// Authorization header at all — was invisible to every other test here
// because the fake didn't check auth either, until it was made to.
test("D85: pullNotes and pullGrammarRules send a bearer token; a missing/wrong one 401s", async () => {
  const fake = startFakeStabbur({ notes: [], grammarRules: [], authToken: "the-real-token" });
  const baseUrl = await fake.listen();
  try {
    await assert.rejects(() => pullNotes({ baseUrl, authToken: "wrong-token" }), /stabbur pull failed: 401/);
    await assert.rejects(() => pullNotes({ baseUrl }), /authToken is required/);
    await assert.doesNotReject(() => pullNotes({ baseUrl, authToken: "the-real-token" }));

    await assert.rejects(() => pullGrammarRules({ baseUrl, authToken: "wrong-token" }), /grammar_rules pull failed: 401/);
    await assert.doesNotReject(() => pullGrammarRules({ baseUrl, authToken: "the-real-token" }));
  } finally {
    await fake.close();
  }
});
