"""Tests for the `dictcc_api` adapter (tasks 3.1-3.3, 3.5), mocking HTTP
against fixtures captured from the real API (providers/dict/api.md and
live probes run while implementing this adapter) rather than depending on
network access in CI."""

from __future__ import annotations

from unittest.mock import MagicMock, patch

import pytest
import requests

from adapters.dictcc_api import (
    DictccApiInflectAdapter,
    DictccApiTranslateAdapter,
    DictccApiTtsAdapter,
    UnsupportedPairError,
)
from cache import ProviderLookupError

# Captured from providers/dict/api.md's own documented example.
_KALV_RESPONSE = {
    "translations": [
        {"id": 528676, "term1": "calf", "term2": "kalv {m}", "entry_type": "noun",
         "subj_ids": ",25,", "vt_usage": 0, "sort_num": 16}
    ],
    "dir": 2,
    "inflections": (
        '<tr title="article indefinite.sg | definite.sg | indefinite.pl | definite.pl">'
        '<td valign="top"></td><td valign="top"><b>NOUN</b>&nbsp;&nbsp;</td>'
        '<td width="95%" > en&nbsp;kalv <span class="infl_pipe">|</span> kalven '
        '<span class="infl_pipe">|</span> kalver <span class="infl_pipe">|</span> kalvene </td></tr>'
    ),
    "inflections_repl": (
        " en&nbsp;kalv \tkalv\t;\t kalven \tkalven\t;\t kalver \tkalver\t;\t kalvene \tkalvene\t;\t"
    ),
    "inflections_info": "<br><b>NOUN</b> &nbsp; article indefinite.sg | definite.sg | indefinite.pl | definite.pl",
}

# Captured live: a German noun with a 2-slot (no indef/def split) table.
_HAUS_RESPONSE = {
    "translations": [{"id": 67085, "term1": "Haus {n}", "term2": "hus {n}", "entry_type": "noun",
                       "subj_ids": "", "vt_usage": 28, "sort_num": 16}],
    "dir": 1,
    "inflections": (
        '<tr title="article sg | article pl">'
        '<td valign="top"></td><td valign="top"><b>NOUN</b>&nbsp;&nbsp;</td>'
        '<td width="95%" > das&nbsp;Haus <span class="infl_pipe">|</span> die&nbsp;Häuser </td></tr>'
    ),
    "inflections_repl": " das&nbsp;Haus \tHaus\t;\t die&nbsp;Häuser \tHäuser\t;\t",
    "inflections_info": "<br><b>NOUN</b>&nbsp;&nbsp;article sg | article pl",
}

# Captured live: a homograph with both a NOUN and VERB inflection block.
_GEHEN_RESPONSE = {
    "translations": [],
    "dir": 1,
    "inflections": (
        '<tr title="article sg | article pl">'
        '<td valign="top"></td><td valign="top"><b>NOUN</b>&nbsp;&nbsp;</td>'
        '<td width="95%" > das&nbsp;Gehen <span class="infl_pipe">|</span> - </td></tr>'
        '<tr title="infinitive | preterite | pp">'
        '<td valign="top"></td><td valign="top"><b>VERB</b>&nbsp;&nbsp;</td>'
        '<td width="95%" > gehen <span class="infl_pipe">|</span> ging '
        '<span class="infl_pipe">|</span> gegangen </td></tr>'
    ),
    "inflections_repl": (
        " das&nbsp;Gehen \tGehen\t;\t - \t-\t;\t gehen \tgehen\t;\t ging \tging\t;\t gegangen \tgegangen\t;\t"
    ),
    "inflections_info": "<br><b>NOUN</b> &nbsp; article sg | article pl<br><b>VERB</b> &nbsp; infinitive | preterite | pp",
}

_NO_TABLE_RESPONSE = {
    "translations": [], "dir": 1, "inflections": "", "inflections_repl": "", "inflections_info": "",
}

# Captured live: "hus"'s definite-plural cell has two alternates ("husa",
# "husene") — the raw `inflections` HTML shows them as one cell joined by
# "/", but `inflections_repl` flattens that into an extra ";"-delimited
# segment with no label of its own.
_HUS_RESPONSE = {
    "translations": [{"id": 1, "term1": "hus", "term2": "house {n}", "entry_type": "noun",
                       "subj_ids": "", "vt_usage": 0, "sort_num": 16}],
    "dir": 2,
    "inflections": (
        '<tr title="article indefinite.sg | definite.sg | indefinite.pl | definite.pl">'
        '<td valign="top"></td><td valign="top"><b>NOUN</b>&nbsp;&nbsp;</td>'
        '<td width="95%" > et&nbsp;hus <span class="infl_pipe">|</span> huset '
        '<span class="infl_pipe">|</span> hus <span class="infl_pipe">|</span> husa / husene </td></tr>'
    ),
    "inflections_repl": (
        " et&nbsp;hus \thus\t;\t huset \thuset\t;\t hus \thus\t;\t husa \thusa\t;\t husene \thusene\t;\t"
    ),
    "inflections_info": "<br><b>NOUN</b> &nbsp; article indefinite.sg | definite.sg | indefinite.pl | definite.pl",
}


def _mock_response(json_data):
    resp = MagicMock()
    resp.raise_for_status = MagicMock()
    resp.json.return_value = json_data
    return resp


def test_translate_parses_best_match():
    # Even an exact word match still echoes the raw source phrase in
    # context (intentional — e.g. "[verb] å spille" after a noun sense),
    # not just the entry type.
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_KALV_RESPONSE)):
        result = DictccApiTranslateAdapter().lookup({"text": "kalv", "from": "nb", "to": "en"})
    assert result == {"candidates": [{"text": "calf", "context": "[noun] kalv {m}"}]}


def test_translate_unsupported_pair_raises():
    with pytest.raises(UnsupportedPairError):
        DictccApiTranslateAdapter().lookup({"text": "hus", "from": "nb", "to": "fr"})


def test_translate_no_match_returns_empty_candidates():
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_NO_TABLE_RESPONSE)):
        result = DictccApiTranslateAdapter().lookup({"text": "zzz", "from": "nb", "to": "en"})
    assert result == {"candidates": []}


def test_translate_untyped_phrase_entry_gets_source_phrase_as_context():
    # Captured live: querying "igjen" (dir=2, nb from-side on term2)
    # surfaces "Kom igjen!" -> "Come on!", an entry_type="" phrase entry
    # unrelated to "igjen" as a standalone word — the source phrase (the
    # from-language field, term2 here) becomes this candidate's context so
    # it's clear which bigger phrase "Come on!" actually translates.
    response = {
        "translations": [
            {"id": 1, "term1": "again", "term2": "igjen", "entry_type": "adv", "subj_ids": "", "vt_usage": 0, "sort_num": 12},
            {"id": 2, "term1": "Come on!", "term2": "Kom igjen!", "entry_type": "", "subj_ids": "", "vt_usage": 0, "sort_num": 22},
        ],
        "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
    }
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(response)):
        result = DictccApiTranslateAdapter().lookup({"text": "igjen", "from": "nb", "to": "en"})
    assert result == {
        "candidates": [
            {"text": "again", "context": "[adv] igjen"},
            {"text": "Come on!", "context": "Kom igjen!"},
        ]
    }


def test_translate_groups_same_entry_type_into_one_candidate():
    # Two "noun" entries for the same lemma must join into one candidate's
    # text with "/", not become two separate candidates (translate-multi-
    # candidate D-TM3's grouping rule, mirrored from dictcc_static).
    response = {
        "translations": [
            {"id": 1, "term1": "calf", "term2": "kalv {m}", "entry_type": "noun", "subj_ids": "", "vt_usage": 0, "sort_num": 16},
            {"id": 2, "term1": "calf", "term2": "kalve {m}", "entry_type": "noun", "subj_ids": "", "vt_usage": 0, "sort_num": 17},
        ],
        "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
    }
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(response)):
        result = DictccApiTranslateAdapter().lookup({"text": "calf", "from": "en", "to": "nb"})
    assert result == {"candidates": [{"text": "kalv {m}/kalve {m}", "context": "[noun] calf"}]}


_KOMME_RESPONSE = {
    "translations": [
        {"id": 1, "term1": "to come", "term2": "å komme", "entry_type": "verb", "subj_ids": "", "vt_usage": 8, "sort_num": 14},
        {"id": 2, "term1": "to overcome", "term2": "å komme over", "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 24},
        {"id": 3, "term1": "to recover", "term2": "å komme seg", "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 24},
        {"id": 4, "term1": "to get better [in health]", "term2": "å komme seg", "entry_type": "verb", "subj_ids": ",14,", "vt_usage": 0, "sort_num": 24},
        {"id": 5, "term1": "to start", "term2": "å komme i vei", "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 34},
        {"id": 6, "term1": "to get on", "term2": "å komme i vei", "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 34},
    ],
    "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
}


def test_translate_separates_distinct_phrasal_verb_senses():
    # Captured live (trimmed): querying "komme" returns 18 entries ALL
    # tagged entry_type="verb" — grouping by entry_type alone (the earlier
    # approach) collapsed every phrasal-verb sense into one unreadable
    # candidate. Entries sharing the identical source phrase ("å komme
    # seg" x2, "å komme i vei" x2 here) are genuine synonyms and join with
    # "/"; a different phrase ("å komme over") becomes its own candidate.
    # Even the bare "å komme" match (exactly the query, modulo the
    # infinitive marker) still echoes its own raw source phrase in
    # context, same as every other sense; the others show their phrase
    # (marker stripped, since it differs from the query) so it's clear
    # what's being translated.
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_KOMME_RESPONSE)):
        result = DictccApiTranslateAdapter().lookup({"text": "komme", "from": "nb", "to": "en"})
    assert result == {
        "candidates": [
            {"text": "to come", "context": "[verb] å komme"},
            {"text": "to overcome", "context": "[verb] komme over"},
            {"text": "to recover/to get better [in health]", "context": "[verb] komme seg"},
            {"text": "to start/to get on", "context": "[verb] komme i vei"},
        ]
    }


def test_inflect_noun_full_four_slot_shape():
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_KALV_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "kalv", "lang": "nb"})
    assert result["candidates"] == [{
        "lemma": "kalv", "pos": "substantiv",
        "paradigm": {"article": "en", "sg_indef": "kalv", "sg_def": "kalven", "pl_indef": "kalver", "pl_def": "kalvene"},
    }]


def test_inflect_noun_two_slot_shape_omits_def_keys():
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_HAUS_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "Haus", "lang": "de"})
    candidate = result["candidates"][0]
    assert candidate["paradigm"] == {"article": "das", "sg_indef": "Haus", "pl_indef": "Häuser"}
    assert "sg_def" not in candidate["paradigm"]
    assert "pl_def" not in candidate["paradigm"]


def test_inflect_multiple_pos_blocks_are_separate_candidates():
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_GEHEN_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "gehen", "lang": "de"})
    poses = {c["pos"] for c in result["candidates"]}
    assert poses == {"substantiv", "verb"}
    verb = next(c for c in result["candidates"] if c["pos"] == "verb")
    assert verb["paradigm"] == {"infinitiv": "gehen", "preteritum": "ging", "perfektum": "gegangen"}
    noun = next(c for c in result["candidates"] if c["pos"] == "substantiv")
    assert noun["paradigm"] == {"article": "das", "sg_indef": "Gehen"}  # "-" plural dropped, not "-"


def test_inflect_cell_with_slash_alternates_keeps_both():
    # Regression: inflections_repl flattens "husa / husene" (one cell) into
    # an extra untagged segment beyond the label count — a strict
    # 1-segment-per-label read silently dropped "husene".
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_HUS_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "hus", "lang": "nb"})
    candidate = result["candidates"][0]
    assert candidate["paradigm"]["pl_def"] == "husa / husene"


def test_inflect_no_table_returns_empty_candidates():
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_NO_TABLE_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "zzz", "lang": "nb"})
    assert result == {"candidates": []}


def test_inflect_unsupported_language_raises():
    with pytest.raises(UnsupportedPairError):
        DictccApiInflectAdapter().lookup({"word": "chat", "lang": "fr"})


def test_inflect_nb_merges_both_norwegian_pairs(monkeypatch):
    # "kalv" has no table under DENO here but does under ENNO — a word only
    # in dict.cc's NO<->EN data, not its NO<->DE data (dictcc-norwegian-
    # multi-pair). The merged result still finds it.
    seen_lps = []

    def fake_get(url, params=None, headers=None, timeout=None):
        seen_lps.append(params["lp"])
        return _mock_response(_NO_TABLE_RESPONSE if params["lp"] == "DENO" else _KALV_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiInflectAdapter().lookup({"word": "kalv", "lang": "nb"})

    assert sorted(seen_lps) == ["DENO", "ENNO"]
    assert result["candidates"] == [{
        "lemma": "kalv", "pos": "substantiv",
        "paradigm": {"article": "en", "sg_indef": "kalv", "sg_def": "kalven", "pl_indef": "kalver", "pl_def": "kalvene"},
    }]


def test_inflect_nb_one_pair_fails_other_succeeds(monkeypatch):
    def fake_get(url, params=None, headers=None, timeout=None):
        if params["lp"] == "DENO":
            raise requests.RequestException("boom")
        return _mock_response(_KALV_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiInflectAdapter().lookup({"word": "kalv", "lang": "nb"})

    assert len(result["candidates"]) == 1


def test_inflect_nb_both_pairs_fail_raises(monkeypatch):
    def fake_get(url, params=None, headers=None, timeout=None):
        raise requests.RequestException("boom")

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        with pytest.raises(ProviderLookupError):
            DictccApiInflectAdapter().lookup({"word": "kalv", "lang": "nb"})


def test_inflect_en_de_still_query_exactly_one_pair(monkeypatch):
    calls = []

    def fake_get(url, params=None, headers=None, timeout=None):
        calls.append(params["lp"])
        return _mock_response(_HAUS_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        DictccApiInflectAdapter().lookup({"word": "Haus", "lang": "de"})
    assert calls == ["DEEN"]


def test_tts_two_step_flow_human_and_synthetic(monkeypatch):
    # nb queries both DENO and ENNO pairs (dictcc-norwegian-multi-pair) —
    # both resolve to the same translations/audio data here (byte-identical
    # per audio type), so this also exercises dedup: 4 audio fetches happen
    # (human+synthetic x2 pairs) but only 2 distinct candidates survive.
    translations_resp = _mock_response(_KALV_RESPONSE)
    audio_calls = []

    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return translations_resp
        audio_calls.append(params)
        resp = MagicMock()
        resp.raise_for_status = MagicMock()
        resp.headers = {"Content-Type": "audio/mpeg"}
        resp.content = b"fake-mp3-human" if "_rec_ip" in params["lang"] else b"fake-mp3-synthetic"
        return resp

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "kalv", "lang": "nb"})

    assert len(audio_calls) == 4  # 2 pairs x (human + synthetic)
    assert len(result["candidates"]) == 2
    sources = {c["source"] for c in result["candidates"]}
    assert sources == {"human", "synthetic"}
    synthetic = next(c for c in result["candidates"] if c["source"] == "synthetic")
    assert synthetic["voice"] == "Liv"
    # all audio calls were keyed by the translation entry's id
    assert all(p["id"] == 528676 for p in audio_calls)


def test_tts_skips_synthetic_voice_for_unconfirmed_language(monkeypatch):
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_HAUS_RESPONSE)
        resp = MagicMock()
        resp.raise_for_status = MagicMock()
        resp.headers = {"Content-Type": "audio/mpeg"}
        resp.content = b"fake-mp3-bytes"
        return resp

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "Haus", "lang": "de"})

    assert len(result["candidates"]) == 1
    assert result["candidates"][0]["source"] == "human"


def test_tts_unsupported_language_raises():
    with pytest.raises(UnsupportedPairError):
        DictccApiTtsAdapter().lookup({"text": "chat", "lang": "fr"})


def test_tts_nb_merges_both_norwegian_pairs(monkeypatch):
    # DENO has no translation entry at all for this word; ENNO does — the
    # merged result still finds its audio.
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_NO_TABLE_RESPONSE if params["lp"] == "DENO" else _KALV_RESPONSE)
        resp = MagicMock()
        resp.raise_for_status = MagicMock()
        resp.headers = {"Content-Type": "audio/mpeg"}
        resp.content = b"fake-mp3-bytes"
        return resp

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "kalv", "lang": "nb"})

    assert len(result["candidates"]) > 0


def test_tts_nb_one_pair_fails_other_succeeds(monkeypatch):
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            if params["lp"] == "DENO":
                raise requests.RequestException("boom")
            return _mock_response(_KALV_RESPONSE)
        resp = MagicMock()
        resp.raise_for_status = MagicMock()
        resp.headers = {"Content-Type": "audio/mpeg"}
        resp.content = b"fake-mp3-bytes"
        return resp

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "kalv", "lang": "nb"})

    assert len(result["candidates"]) > 0


def test_tts_nb_both_pairs_fail_raises(monkeypatch):
    def fake_get(url, params=None, headers=None, timeout=None):
        raise requests.RequestException("boom")

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        with pytest.raises(ProviderLookupError):
            DictccApiTtsAdapter().lookup({"text": "kalv", "lang": "nb"})


def test_tts_en_de_still_query_exactly_one_pair(monkeypatch):
    calls = []

    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            calls.append(params["lp"])
            return _mock_response(_HAUS_RESPONSE)
        resp = MagicMock()
        resp.raise_for_status = MagicMock()
        resp.headers = {"Content-Type": "audio/mpeg"}
        resp.content = b"fake-mp3-bytes"
        return resp

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        DictccApiTtsAdapter().lookup({"text": "Haus", "lang": "de"})
    assert calls == ["DEEN"]


# ---------------------------------------------------------------------------
# norwegian-input-normalization: query-variant fan-out (tasks 5.1-5.7)
# ---------------------------------------------------------------------------

# Real (not placeholder) inflection HTML, same pattern as _HUS_RESPONSE,
# needed because `_parse_inflection_blocks` matches on a real `title="..."`
# attribute.
_KALV_HTML_RESPONSE = {
    "translations": [{"id": 528676, "term1": "calf", "term2": "kalv {m}", "entry_type": "noun",
                       "subj_ids": "", "vt_usage": 0, "sort_num": 16}],
    "dir": 2,
    "inflections": (
        '<tr title="article indefinite.sg | definite.sg | indefinite.pl | definite.pl">'
        '<td valign="top"></td><td valign="top"><b>NOUN</b>&nbsp;&nbsp;</td>'
        '<td width="95%" > en&nbsp;kalv <span class="infl_pipe">|</span> kalven '
        '<span class="infl_pipe">|</span> kalver <span class="infl_pipe">|</span> kalvene </td></tr>'
    ),
    "inflections_repl": "",
    "inflections_info": "",
}

# A second, deliberately different paradigm (distinct sg_def) so a variant
# resolving to this must survive as its own candidate rather than collapse.
_KALV_HTML_RESPONSE_DIFFERENT = {
    "translations": [{"id": 1, "term1": "calf", "term2": "kalv {m}", "entry_type": "noun",
                       "subj_ids": "", "vt_usage": 0, "sort_num": 16}],
    "dir": 2,
    "inflections": (
        '<tr title="article indefinite.sg | definite.sg | indefinite.pl | definite.pl">'
        '<td valign="top"></td><td valign="top"><b>NOUN</b>&nbsp;&nbsp;</td>'
        '<td width="95%" > en&nbsp;kalv <span class="infl_pipe">|</span> ZZZ '
        '<span class="infl_pipe">|</span> kalver <span class="infl_pipe">|</span> kalvene </td></tr>'
    ),
    "inflections_repl": "",
    "inflections_info": "",
}


def test_inflect_citation_form_issues_four_requests_and_resolves_bare_lemma():
    seen = []

    def fake_get(url, params=None, headers=None, timeout=None):
        seen.append((params["lp"], params["s"]))
        return _mock_response(_KALV_HTML_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiInflectAdapter().lookup({"word": "en kalv", "lang": "nb"})

    assert len(seen) == 4  # 2 pairs x 2 variants ("en kalv", "kalv")
    assert sorted(s for _lp, s in seen) == ["en kalv", "en kalv", "kalv", "kalv"]
    assert result["candidates"] == [{
        "lemma": "en kalv", "pos": "substantiv",
        "paradigm": {"article": "en", "sg_indef": "kalv", "sg_def": "kalven", "pl_indef": "kalver", "pl_def": "kalvene"},
    }]


def test_inflect_single_lowercase_word_still_issues_two_requests():
    seen = []

    def fake_get(url, params=None, headers=None, timeout=None):
        seen.append(params["s"])
        return _mock_response(_KALV_HTML_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        DictccApiInflectAdapter().lookup({"word": "kalv", "lang": "nb"})

    assert seen == ["kalv", "kalv"]


def test_inflect_variants_resolving_to_same_paradigm_collapse_to_one_candidate():
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_KALV_HTML_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "en kalv", "lang": "nb"})
    assert len(result["candidates"]) == 1


def test_inflect_variants_resolving_to_different_paradigms_both_survive():
    def fake_get(url, params=None, headers=None, timeout=None):
        if params["s"] == "en kalv":
            return _mock_response(_KALV_HTML_RESPONSE)
        return _mock_response(_KALV_HTML_RESPONSE_DIFFERENT)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiInflectAdapter().lookup({"word": "en kalv", "lang": "nb"})
    assert len(result["candidates"]) == 2


def test_inflect_one_triple_failing_others_succeed_still_returns_candidates():
    def fake_get(url, params=None, headers=None, timeout=None):
        if params["lp"] == "DENO" and params["s"] == "en kalv":
            raise requests.RequestException("boom")
        return _mock_response(_KALV_HTML_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiInflectAdapter().lookup({"word": "en kalv", "lang": "nb"})
    assert result["candidates"]


def test_inflect_every_triple_failing_raises():
    def fake_get(url, params=None, headers=None, timeout=None):
        raise requests.RequestException("boom")

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        with pytest.raises(ProviderLookupError):
            DictccApiInflectAdapter().lookup({"word": "en kalv", "lang": "nb"})


_KOMME_DE_RESPONSE = {
    "translations": [
        {"id": 1, "term1": "kommen", "term2": "å komme", "entry_type": "verb",
         "subj_ids": "", "vt_usage": 0, "sort_num": 14},
    ],
    "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
}


def test_translate_infinitive_resolves_and_context_names_matched_phrase():
    seen = []

    def fake_get(url, params=None, headers=None, timeout=None):
        seen.append(params["s"])
        return _mock_response(_KOMME_DE_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTranslateAdapter().lookup({"text": "å komme", "from": "nb", "to": "de"})

    assert seen == ["å komme", "komme"]
    assert result["candidates"]
    assert result["candidates"][0]["text"] == "kommen"


def test_translate_from_en_or_de_applies_no_variant_fan_out():
    seen = []

    def fake_get(url, params=None, headers=None, timeout=None):
        seen.append(params["s"])
        return _mock_response(_KOMME_DE_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        DictccApiTranslateAdapter().lookup({"text": "komme", "from": "de", "to": "nb"})

    assert seen == ["komme"]


# ---------------------------------------------------------------------------
# dictcc-parsing-fixes: two-gender article slots, per-entry audio
# ---------------------------------------------------------------------------

# Captured live during the design session against
# `app_translations.php?s=do&dir=2&lp=ENNO`: "do" is a TWO-GENDER noun
# ("en do" AND "et do"), and dict.cc writes both genders' alternatives into
# every slot, the article slot included. The old `seg.split(maxsplit=1)`
# read article="en" and sg_indef="/ et do".
_DO_RESPONSE = {
    "translations": [
        {"id": 100, "term1": "loo [Br.] [coll.]", "term2": "do {n}", "entry_type": "noun",
         "subj_ids": "", "vt_usage": 0, "sort_num": 16},
    ],
    "dir": 2,
    "inflections": (
        '<tr title="article indefinite.sg | definite.sg | indefinite.pl | definite.pl">'
        '<td valign="top"></td><td valign="top"><b>NOUN</b>&nbsp;&nbsp;</td>'
        '<td width="95%" > en / et do <span class="infl_pipe">|</span> doen / doet '
        '<span class="infl_pipe">|</span> doer / do '
        '<span class="infl_pipe">|</span> doene / doa </td></tr>'
    ),
    "inflections_repl": "",
    "inflections_info": "<br><b>NOUN</b> &nbsp; article indefinite.sg | definite.sg | indefinite.pl | definite.pl",
}


def test_inflect_two_gender_noun_keeps_both_articles_in_one_candidate():
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_DO_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "do", "lang": "nb"})

    # ONE candidate, never one per gender (design D1).
    assert len(result["candidates"]) == 1
    assert result["candidates"] == [{
        "lemma": "do", "pos": "substantiv",
        "paradigm": {
            "article": "en/et",
            "sg_indef": "do",
            "sg_def": "doen / doet",
            "pl_indef": "doer / do",
            "pl_def": "doene / doa",
        },
    }]
    assert "/ et do" not in str(result)


def test_inflect_single_gender_noun_article_split_unchanged():
    # Byte-identical to the pre-change output for a one-article slot.
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_KALV_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "kalv", "lang": "nb"})
    assert result["candidates"] == [{
        "lemma": "kalv", "pos": "substantiv",
        "paradigm": {"article": "en", "sg_indef": "kalv", "sg_def": "kalven",
                     "pl_indef": "kalver", "pl_def": "kalvene"},
    }]


def test_inflect_german_two_slot_table_byte_identical_to_pre_change():
    # The German 2-slot path: each slot carries its own article word, only
    # the first slot's is kept as canonical.
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(_HAUS_RESPONSE)):
        result = DictccApiInflectAdapter().lookup({"word": "Haus", "lang": "de"})
    assert result["candidates"] == [{
        "lemma": "Haus", "pos": "substantiv",
        "paradigm": {"article": "das", "sg_indef": "Haus", "pl_indef": "Häuser"},
    }]


def test_inflect_unidentifiable_article_run_leaves_whole_segment_and_no_article():
    # An article-marked slot whose leading words are not article forms:
    # the whole segment stays in the inflected slot, with NO article — a
    # visible gap, never a guessed split (task 1.2).
    response = {
        "translations": [],
        "dir": 2,
        "inflections": (
            '<tr title="article indefinite.sg | definite.sg">'
            '<td valign="top"></td><td valign="top"><b>NOUN</b>&nbsp;&nbsp;</td>'
            '<td width="95%" > sju&nbsp;ting <span class="infl_pipe">|</span> tingen </td></tr>'
        ),
        "inflections_repl": "", "inflections_info": "",
    }
    with patch("adapters.dictcc_api.requests.get", return_value=_mock_response(response)):
        result = DictccApiInflectAdapter().lookup({"word": "ting", "lang": "nb"})
    paradigm = result["candidates"][0]["paradigm"]
    assert paradigm["sg_indef"] == "sju ting"
    assert "article" not in paradigm


# Two entries of different parts of speech for one Norwegian word; the
# FIRST has no human recording at all (task 2.6).
_MULTI_ENTRY_RESPONSE = {
    "translations": [
        {"id": 100, "term1": "loo", "term2": "do {n}", "entry_type": "noun",
         "subj_ids": "", "vt_usage": 0, "sort_num": 16},
        {"id": 200, "term1": "to do", "term2": "å do", "entry_type": "verb",
         "subj_ids": "", "vt_usage": 0, "sort_num": 24},
    ],
    "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
}


def _audio_response(content: bytes | None):
    resp = MagicMock()
    resp.raise_for_status = MagicMock()
    if content is None:
        resp.headers = {"Content-Type": "text/plain"}
        resp.content = b"no audio"
    else:
        resp.headers = {"Content-Type": "audio/mpeg"}
        resp.content = content
    return resp


def test_tts_walks_every_entry_so_a_later_entry_audio_is_reachable():
    # Entry 100 has NO human recording; entry 200 does. Reading only
    # translations[0] yielded no human audio at all.
    audio_calls = []

    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        audio_calls.append(params)
        human = "_rec_ip" in params["lang"]
        if human and params["id"] == 100:
            return _audio_response(None)
        kind = "human" if human else "synthetic"
        return _audio_response(f"mp3-{params['id']}-{kind}".encode())

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})

    assert {p["id"] for p in audio_calls} == {100, 200}
    humans = [c for c in result["candidates"] if c["source"] == "human"]
    assert humans, "a later entry's recording must still be returned"
    assert all(c["context"] for c in humans)


def test_tts_candidates_carry_their_entry_context():
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        return _audio_response(f"mp3-{params['lp']}-{params['id']}-{params['lang']}".encode())

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})

    contexts = {c["context"] for c in result["candidates"]}
    # The bracketed part-of-speech tag leads, same convention as
    # /translations; the Norwegian-side phrase follows. That convention
    # echoes the source field RAW when its normalised form equals the
    # query — `display_dictcc_phrase` (which strips the `å ` infinitive
    # marker and `{n}`-style annotations) is applied only on the branch
    # where the source differs from the query. So "å do" stays "å do"
    # here, exactly as /translations renders it.
    assert "[noun] do {n}" in contexts
    assert "[verb] å do" in contexts
    assert all(c["context"].startswith("[") for c in result["candidates"])
    # No candidate is withheld on the basis of part of speech.
    assert len({c["sha256"] for c in result["candidates"]}) == len(result["candidates"])


def test_tts_identical_bytes_across_entries_dedupe_to_one_candidate():
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        # every entry, every voice, every pair returns the same bytes
        return _audio_response(b"identical-mp3")

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})

    assert len(result["candidates"]) == 1


def test_tts_one_failing_entry_is_skipped_not_fatal():
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        if params["id"] == 100:
            raise requests.RequestException("boom")
        return _audio_response(f"mp3-{params['lp']}-{params['lang']}".encode())

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})

    assert result["candidates"]


def test_tts_every_entry_failing_raises():
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        raise requests.RequestException("boom")

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        with pytest.raises(ProviderLookupError):
            DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})


def test_tts_no_pos_filtering_is_applied():
    # A `pos` key on the input is ignored outright — part of speech is an
    # ordering signal owned by the caller; smia never filters on it and no
    # pos parameter reaches dict.cc.
    seen_params = []

    def fake_get(url, params=None, headers=None, timeout=None):
        seen_params.append(params)
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        return _audio_response(f"mp3-{params['lp']}-{params['id']}-{params['lang']}".encode())

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        filtered = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb", "pos": "substantiv"})
    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        unfiltered = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})

    assert filtered == unfiltered
    assert all("pos" not in p for p in seen_params)
