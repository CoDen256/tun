"""Unit tests for the `/examples` sentence normaliser (examples-sentence-
normalisation task 1.2). Pure functions — no database, no Flask."""

from __future__ import annotations

import pytest

from example_text import normalise_example_text, normalise_examples_payload


@pytest.mark.parametrize(
    "raw,expected",
    [
        # The spec delta's scenarios
        ("komme seg opp", "Komme seg opp."),
        ("Kommer du i morgen?", "Kommer du i morgen?"),
        ("«øya ligger langt ute»", "«Øya ligger langt ute»."),
        # Trimming
        ("  ei lita jente  ", "Ei lita jente."),
        # Norwegian letters upper-case correctly
        ("ærlig talt", "Ærlig talt."),
        ("øya er fin", "Øya er fin."),
        ("året er omme", "Året er omme."),
        # Already terminated, in every flavour
        ("Kom hit!", "Kom hit!"),
        ("Hun ventet ...", "Hun ventet ..."),
        ("Hun ventet …", "Hun ventet …"),
        ("Han sa m.m.", "Han sa m.m."),
        # Leading non-letters are skipped, not capitalised
        ("– kom hit", "– Kom hit."),
        ('"hva nå"', '"Hva nå".'),
        ("(se ovenfor)", "(Se ovenfor)."),
        # Terminal punctuation goes before the trailing closer
        ("«Kom hit»", "«Kom hit»."),
        ("«Kom hit!»", "«Kom hit!»"),
        # Nothing but the first letter changes
        ("hun heter Åse", "Hun heter Åse."),
        # A sentence opening with a digit has no letter to upper-case
        ("1984 var et år", "1984 var et år."),
    ],
)
def test_normalise(raw, expected):
    assert normalise_example_text(raw) == expected


@pytest.mark.parametrize("raw", ["", "   ", "...", "…", "—", "?!", None, 7])
def test_dropped(raw):
    assert normalise_example_text(raw) is None


def test_payload_normalises_every_candidate_and_keeps_other_fields():
    payload = {
        "provider": "ordbokene",
        "candidates": [
            {"text": "komme seg opp", "source": "bm", "sense": "1"},
            {"text": "Kommer du i morgen?"},
        ],
    }
    assert normalise_examples_payload(payload) == {
        "provider": "ordbokene",
        "candidates": [
            {"text": "Komme seg opp.", "source": "bm", "sense": "1"},
            {"text": "Kommer du i morgen?"},
        ],
    }


def test_payload_drops_duplicates_after_normalisation_keeping_the_first():
    payload = {"candidates": [{"text": "komme seg"}, {"text": "Komme seg."}, {"text": "Kom hit"}]}
    out = normalise_examples_payload(payload)
    assert out["candidates"] == [{"text": "Komme seg."}, {"text": "Kom hit."}]


def test_payload_drops_empty_text():
    payload = {"candidates": [{"text": "   "}, {"text": "kalven"}]}
    assert normalise_examples_payload(payload)["candidates"] == [{"text": "Kalven."}]


def test_payload_does_not_mutate_the_input():
    payload = {"candidates": [{"text": "komme seg opp"}]}
    normalise_examples_payload(payload)
    assert payload["candidates"][0]["text"] == "komme seg opp"


def test_payload_without_candidates_is_untouched():
    assert normalise_examples_payload({"provider": "x"}) == {"provider": "x"}
