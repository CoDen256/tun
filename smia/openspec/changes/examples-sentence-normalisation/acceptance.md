# Acceptance — examples-sentence-normalisation

Verified against the dev stack: by calling smia's `/examples` directly
(curl with `INTERNAL_TOKEN` from inside the compose network), and by
observing stabbur's Examples sheet in a browser (claude-in-chrome). A unit
test passing on its own is not a pass. Each criterion names the backlog item
it answers.

## Item 6 — capitalise and end with a dot

- **N01** `POST /examples` with `{text: "komme", provider: "ordbokene", limit: 10}`:
  **every** returned `candidates[].text` starts with an upper-case letter
  (after any leading quote or dash) and ends in `.`, `!`, `?` or `…`
  (optionally followed by a closing quote/bracket). Repeat for `kaikki`,
  `tatoeba`, `leipzig` and `lexin`, each with a word that returns at least
  one candidate. No candidate fails the check.
- **N02** Send the identical request from N01 a second time (a cache hit).
  The candidates are identical to the first response, normalised.
- **N03** Write a raw payload straight into smia's lookup cache for a
  `/examples` request: one lower-case candidate with no final punctuation,
  e.g. `ei lita jente`. `POST` that request and the response text is
  `Ei lita jente.`. Read the cache row back and it still holds `ei lita jente`.
- **N04** `GET /examples/{id}` for the resource id returned in N03 also
  returns `Ei lita jente.`.
- **N05** In stabbur, open a note whose word has dictionary examples
  (e.g. `komme`) and open the Examples sheet. Every candidate row in every
  provider box shows a capitalised sentence with terminal punctuation.
  Pressing Use on one puts exactly that normalised text into the note's
  Examples field.
