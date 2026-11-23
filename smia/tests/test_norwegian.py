"""Tests for the shared `norwegian.py` query-preparation module (tasks
2.1-2.7), against the rules fixed in design.md D1-D3, D8."""

from __future__ import annotations

from norwegian import query_variants, tokenize


def test_single_lowercase_word_yields_one_variant():
    assert query_variants("kalv") == ["kalv"]


def test_each_gender_article_and_infinitive_marker_yield_two_variants():
    assert query_variants("en kalv") == ["en kalv", "kalv"]
    assert query_variants("ei bok") == ["ei bok", "bok"]
    assert query_variants("et hus") == ["et hus", "hus"]
    assert query_variants("å komme") == ["å komme", "komme"]


def test_bare_article_or_marker_is_not_stripped():
    assert query_variants("å") == ["å"]
    assert query_variants("en") == ["en"]


def test_en_aa_strips_exactly_once():
    assert query_variants("en å") == ["en å", "å"]


def test_unrecognised_first_token_is_unchanged():
    assert query_variants("god morgen") == ["god morgen"]


def test_casing_variants_in_exact_order():
    assert query_variants("Kalv") == ["Kalv", "kalv"]
    assert query_variants("En Kalv") == ["En Kalv", "en kalv", "Kalv", "kalv"]


def test_tokenize_two_word_phrase():
    assert tokenize("god morgen") == ["god", "morgen"]


def test_tokenize_keeps_hyphenated_compound_whole():
    assert tokenize("sju-åtte") == ["sju-åtte"]


def test_tokenize_drops_digit_only_tokens():
    assert tokenize("klokka 5") == ["klokka"]


def test_tokenize_keeps_reflexive_seg():
    assert tokenize("anstrenge seg") == ["anstrenge", "seg"]


def test_tokenize_strips_trailing_punctuation():
    assert tokenize("god morgen!") == ["god", "morgen"]


def test_tokenize_does_not_apply_prefix_rule():
    assert tokenize("en kalv") == ["en", "kalv"]


# ---------------------------------------------------------------------------
# tts-candidate-matching: the one fuzzy match key + trailing-particle strip,
# on the corpus shapes from design.md.
# ---------------------------------------------------------------------------

import pytest  # noqa: E402

from norwegian import TRAILING_PARTICLES, normalize_match_key, strip_trailing_particles  # noqa: E402


@pytest.mark.parametrize("text, key", [
    ("ei avis", "avis"),
    ("en bil", "bil"),
    ("et bord", "bord"),
    ("å stille", "stille"),
    ("ein gut", "gut"),
    ("eit hus", "hus"),
    ("bok + handel", "bokhandel"),
    ("flagg  + stang", "flaggstang"),
    ("Hallo!", "hallo"),
    ("Hva heter du?", "hva heter du"),
    ("Kan jeg få...", "kan jeg få"),
    ("  Led  ", "led"),
    ("en CD-spiller", "cd-spiller"),
    ("deres (3. person)", "deres"),
    ("Takk,   bare bra.", "takk, bare bra"),
])
def test_normalize_match_key_corpus_shapes(text, key):
    assert normalize_match_key(text) == key


@pytest.mark.parametrize("text", ["en", "å", "ei", "Et!"])
def test_lone_article_or_marker_is_kept(text):
    assert normalize_match_key(text) == text.casefold().rstrip("!")


def test_only_one_leading_article_is_dropped():
    assert normalize_match_key("en en") == "en"
    assert normalize_match_key("å en bil") == "en bil"


def test_strip_trailing_particles():
    assert strip_trailing_particles("stille opp") == "stille"
    assert strip_trailing_particles("glede seg over") == "glede"
    assert strip_trailing_particles("opp") == "opp"  # at least one token survives
    assert strip_trailing_particles("hva heter du") == "hva heter du"


def test_particle_list_holds_the_required_core():
    assert set("opp ned ut inn av på til med seg om fram frem bort igjen over".split()) <= TRAILING_PARTICLES
