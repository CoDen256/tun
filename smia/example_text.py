"""
example_text.py — the `/examples` sentence normaliser (D3 of
`examples-sentence-normalisation`).

A `/examples` candidate is meant to read as an example *sentence*, so smia —
not the caller — owns that shape (D1). The functions here are pure: they take
text (or a payload dict) and return new text (or a new payload), touching no
database and no provider.

The normaliser is applied at the RESPONSE boundary only, after the
lookup-cache read (D2). The cache keeps the provider's raw answer, so every
already-cached entry comes back normalised on its next read with no purge,
and a later change to the rule takes effect immediately.
"""

from __future__ import annotations

# Characters that may precede the first letter of a sentence and must be
# skipped when looking for the letter to upper-case: opening quotes of every
# flavour the sources use, dashes, brackets and whitespace.
_LEADING_SKIP = set("«»\"'‘’“”„‚–—-−([{<*… ., \t\n\r")

# Closing quotes/brackets that may trail terminal punctuation. They are set
# aside when asking "is this already terminated?", so `«Kom hit!»` is left
# alone, but the `.` a fragment is missing is appended AFTER them:
# `«Kom hit»` -> `«Kom hit».` (design D3 step 3's worked example; a quoted
# fragment inside a sentence takes its full stop outside the quote).
_TRAILING_CLOSERS = set("»\"'’”‚›)]}>")

_TERMINALS = (".", "!", "?", "…")


def normalise_example_text(text) -> str | None:
    """Returns `text` trimmed, with its first letter upper-cased and with
    terminal punctuation, or `None` when nothing usable is left.

    `None` is also returned for a non-string, and for text that holds no
    letter at all (pure punctuation) — such a candidate is not a sentence and
    the caller drops it rather than emitting `....`.
    """
    if not isinstance(text, str):
        return None
    trimmed = text.strip()
    if not trimmed:
        return None
    if not any(char.isalnum() for char in trimmed):
        # Pure punctuation (`...`, `—`, `?!`) is not a sentence; capitalising
        # it is impossible and terminating it would only produce `....`. The
        # caller drops it, exactly as it drops an empty text.
        return None

    capitalised = _capitalise_first_letter(trimmed)
    if capitalised is None:
        return None
    return _ensure_terminal(capitalised)


def _capitalise_first_letter(text: str) -> str | None:
    """Upper-cases the first character that is a letter, skipping leading
    quotes/dashes/brackets/spaces. Every other character is left exactly as
    it is — no title-casing, no lower-casing of the rest. `str.upper()`
    handles `æ ø å` natively. Returns `None` when there is no letter."""
    for index, char in enumerate(text):
        if char.isalpha():
            return text[:index] + char.upper() + text[index + 1 :]
        if char not in _LEADING_SKIP:
            # A digit or any other sentence-opening character: there is
            # nothing to capitalise, but the text is still a sentence.
            return text
    return None


def _ensure_terminal(text: str) -> str:
    """Appends `.` unless the text — with trailing closing quotes/brackets
    set aside — already ends in `.`, `!`, `?` or `…` (`...` ends in `.`, so
    it is covered).

    Tier-2 placement decision: the stop goes at the very end, after any
    trailing closer, matching design D3's worked example
    `«Kom hit»` -> `«Kom hit».` An already-terminated quotation keeps its own
    punctuation inside (`«Kom hit!»` is untouched), so nothing ever ends up
    doubly stopped."""
    end = len(text)
    while end > 0 and text[end - 1] in _TRAILING_CLOSERS:
        end -= 1
    core = text[:end]
    if core.endswith(_TERMINALS):
        return text
    return text + "."


def normalise_examples_payload(payload):
    """Returns a copy of an `/examples` payload with every candidate's `text`
    normalised, candidates with no usable text dropped, and candidates whose
    normalised text repeats an earlier one in the SAME response dropped
    (D3.4).

    De-duplication runs after the adapter's own `limit` slicing, so a
    response may come back shorter than `limit`: the payload is all this
    layer has, and the provider's pre-slice list is long gone by the time the
    cache hands the payload back (tier-2 decision — no re-fill).

    Anything that is not an `/examples`-shaped payload is returned untouched.
    """
    if not isinstance(payload, dict):
        return payload
    candidates = payload.get("candidates")
    if not isinstance(candidates, list):
        return payload

    seen: set[str] = set()
    out = []
    for candidate in candidates:
        if not isinstance(candidate, dict):
            continue
        text = normalise_example_text(candidate.get("text"))
        if text is None or text in seen:
            continue
        seen.add(text)
        out.append({**candidate, "text": text})

    return {**payload, "candidates": out}
