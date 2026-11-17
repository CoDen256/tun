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


# ---------------------------------------------------------------------------
# dict.cc's `ajax_get_audiorecordings.php` — the ONLY reliable "is there a
# human recording" signal (providers/dict/api.md). One line, space-separated,
# one token per requested id in order, with a leading `0` consuming the first
# token. A recording key is `<recId>_<user>_<country>_lid<N>_v`; an entry with
# no recordings contributes a literal `0`. Both shapes (and the trailing
# space) were captured from the real endpoint while building these tests.
# ---------------------------------------------------------------------------

_LID = {"nb": "81", "de": "2", "en": "1"}


def _recordings_response(params, lids_by_id, recorded_calls=None):
    requested = params["id_str"].split(" ")
    assert requested[0] == "0", "id_str must carry the leading 0"
    ids = [int(x) for x in requested[1:]]
    if recorded_calls is not None:
        recorded_calls.append(ids)
    tokens = ["0"]
    for n, entry_id in enumerate(ids):
        lids = lids_by_id.get(entry_id, [])
        tokens.append(
            "|".join(f"{10000 + n}{i}_rec{i}_xx_lid{lid}_v" for i, lid in enumerate(lids))
            or "0"
        )
    resp = MagicMock()
    resp.raise_for_status = MagicMock()
    resp.text = " ".join(tokens) + " "
    return resp


def _is_recordings(url):
    return "ajax_get_audiorecordings" in url


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


def test_tts_two_step_flow_is_human_only(monkeypatch):
    # nb queries both DENO and ENNO pairs (dictcc-norwegian-multi-pair) —
    # both resolve to the same entry and the same bytes here, so this also
    # exercises dedup: 2 human fetches happen (one per pair) and one
    # candidate survives. The synthetic voice is NOT requested at all.
    translations_resp = _mock_response(_KALV_RESPONSE)
    audio_calls = []

    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return translations_resp
        if _is_recordings(url):
            return _recordings_response(params, {528676: ["81"]})
        audio_calls.append(params)
        resp = MagicMock()
        resp.raise_for_status = MagicMock()
        resp.headers = {"Content-Type": "audio/mpeg"}
        resp.content = b"fake-mp3-human"
        return resp

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "kalv", "lang": "nb"})

    assert len(audio_calls) == 2  # 2 pairs x human only
    assert len(result["candidates"]) == 1
    assert {c["source"] for c in result["candidates"]} == {"human"}
    assert all("voice" not in c for c in result["candidates"])
    # all audio calls were keyed by the translation entry's id
    assert all(p["id"] == 528676 for p in audio_calls)
    assert all("voice" not in p for p in audio_calls)


def test_tts_german_lookup_matches_the_german_lid(monkeypatch):
    # The requested language's lid is what gates the fetch: `de` -> lid2.
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_HAUS_RESPONSE)
        if _is_recordings(url):
            return _recordings_response(params, {67085: ["2"]})
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
        if _is_recordings(url):
            return _recordings_response(params, {528676: ["81"]})
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
        if _is_recordings(url):
            return _recordings_response(params, {528676: ["81"]})
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
        if _is_recordings(url):
            return _recordings_response(params, {67085: ["2"]})
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
    # Entry 100 has NO Norwegian recording (German only); entry 200 does.
    # Reading only translations[0] yielded no audio at all.
    audio_calls = []

    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        if _is_recordings(url):
            return _recordings_response(params, {100: ["2"], 200: ["81"]})
        audio_calls.append(params)
        return _audio_response(f"mp3-{params['id']}".encode())

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})

    assert {p["id"] for p in audio_calls} == {200}
    humans = [c for c in result["candidates"] if c["source"] == "human"]
    assert humans, "a later entry's recording must still be returned"
    assert all(c["context"] for c in humans)


def test_tts_candidates_carry_their_entry_context():
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        if _is_recordings(url):
            return _recordings_response(params, {100: ["81"], 200: ["81"]})
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
        if _is_recordings(url):
            return _recordings_response(params, {100: ["81"], 200: ["81"]})
        # every entry, every pair returns the same bytes
        return _audio_response(b"identical-mp3")

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})

    assert len(result["candidates"]) == 1


def test_tts_one_failing_entry_is_skipped_not_fatal():
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_MULTI_ENTRY_RESPONSE)
        if _is_recordings(url):
            return _recordings_response(params, {100: ["81"], 200: ["81"]})
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
        if _is_recordings(url):
            return _recordings_response(params, {100: ["81"], 200: ["81"]})
        return _audio_response(f"mp3-{params['lp']}-{params['id']}-{params['lang']}".encode())

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        filtered = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb", "pos": "substantiv"})
    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        unfiltered = DictccApiTtsAdapter().lookup({"text": "do", "lang": "nb"})

    assert filtered == unfiltered
    assert all("pos" not in p for p in seen_params)


# ---------------------------------------------------------------------------
# dictcc-parsing-fixes, acceptance criteria 6-16 — the operator's worked
# `stille` example.
#
# Entries, ids, entry types AND the raw `ajax_get_audiorecordings.php` tokens
# below are captured VERBATIM from the real dict.cc backend on 2026-11-17
# (both pairs, `dir=2`), so the fixture and production disagree only where the
# adapter is wrong. Emitting the real tokens is what makes the mock's dedupe
# behave like the live one: several entries share ONE recording id (1334012,
# mtbboy1993's "stille") and must collapse to a single candidate, while two
# DIFFERENT recordings of the same phrase must both survive.
#
# An entry with no recordings at all contributes a literal `0` token — also
# confirmed live, by requesting a nonexistent id.
# ---------------------------------------------------------------------------

_STILLE_DENO_RESPONSE = {
    "translations": [
        {"id": 383115, "term1": "still", "term2": "stille",
         "entry_type": "adj", "subj_ids": "", "vt_usage": 0, "sort_num": 0},
        {"id": 378532, "term1": "leise", "term2": "stille",
         "entry_type": "adj", "subj_ids": "", "vt_usage": 0, "sort_num": 1},
        {"id": 1645192, "term1": "fragen", "term2": "å stille [et spørsmål]",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 2},
        {"id": 1413919, "term1": "Sitz still!", "term2": "Sitt stille!",
         "entry_type": "", "subj_ids": "", "vt_usage": 0, "sort_num": 3},
        {"id": 2226742, "term1": "Forderungen stellen", "term2": "å stille krav",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 4},
        {"id": 1087643, "term1": "umstellen", "term2": "å stille om",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 5},
        {"id": 1379281, "term1": "umschalten", "term2": "å stille om",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 6},
        {"id": 2240021, "term1": "etw. [Akk.] aufstellen", "term2": "å stille opp noe",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 7},
        {"id": 1413586, "term1": "Schweig!", "term2": "Ti nå stille!",
         "entry_type": "", "subj_ids": "", "vt_usage": 0, "sort_num": 8},
        {"id": 1449265, "term1": "Sei still!", "term2": "Ti nå stille!",
         "entry_type": "", "subj_ids": "", "vt_usage": 0, "sort_num": 9},
        {"id": 1117393, "term1": "eine Diagnose stellen", "term2": "å stille en diagnose",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 10},
        {"id": 1645184, "term1": "eine Frage stellen", "term2": "å stille et spørsmål",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 11},
        {"id": 2326557, "term1": "die Uhr vorstellen", "term2": "å stille fram klokka",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 12},
        {"id": 2326559, "term1": "die Uhr vorstellen", "term2": "å stille frem klokka",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 13},
        {"id": 2326560, "term1": "die Uhr vorstellen", "term2": "å stille frem klokken",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 14},
        {"id": 1881443, "term1": "etw. [Akk.] zur Verfügung stellen", "term2": "å stille noe til rådighet",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 15},
        {"id": 1076064, "term1": "zur Verfügung stellen", "term2": "å stille til disposisjon",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 16},
        {"id": 2326552, "term1": "die Uhr zurückstellen", "term2": "å stille tilbake klokka",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 17},
        {"id": 2326577, "term1": "die Uhr zurückstellen", "term2": "å stille tilbake klokken",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 18},
        {"id": 2326546, "term1": "den Wecker stellen", "term2": "å stille vekkerklokka / vekkerklokken",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 19},
        {"id": 1163769, "term1": "mucksmäuschenstill [ugs.]", "term2": "stille som en mus",
         "entry_type": "adv", "subj_ids": "", "vt_usage": 0, "sort_num": 20},
        {"id": 2266223, "term1": "sich [Akk.] zurückhalten [sich im Hintergrund halten]", "term2": "å gå stille i dørene [idiom]",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 21},
        {"id": 1881442, "term1": "jdm. etw. [Akk.] zur Verfügung stellen", "term2": "å stille noe til noens rådighet",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 22},
        {"id": 1881444, "term1": "jdm. etw. [Akk.] zur Verfügung stellen", "term2": "å stille noe til rådighet for noen",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 23},
        {"id": 1099493, "term1": "jdn. an die Wand stellen [ugs.] [hinrichten]", "term2": "å stille noen opp mot veggen [for å bli henrettet]",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 24},
        {"id": 1055733, "term1": "sich anstellen [in einer Schlange]", "term2": "å stille seg i kø",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 25},
        {"id": 1193106, "term1": "etw. [Akk.] anzweifeln", "term2": "å stille seg tvilende til noe",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 26},
        {"id": 1223599, "term1": "Stille Wasser sind tief.", "term2": "Stille vann har dypest grunn.",
         "entry_type": "", "subj_ids": "", "vt_usage": 0, "sort_num": 27},
        {"id": 2251772, "term1": "sein Licht unter den Scheffel stellen [Redewendung]", "term2": "å sette / stille sitt lys under en skjeppe [idiom]",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 28},
    ],
    "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
}

# {entry id: raw recordings token} — one `|`-separated recording key list
# per entry, exactly as the endpoint returned it for this pair.
_STILLE_DENO_RECS = {
    383115: "126435_makro_atder_lid2_v|155195_Halmafelix_de_lid2_v|1334012_mtbboy1993_no_lid81_v",
    378532: "13246_stratsplit_unknown_lid2_v|191713_Halmafelix_de_lid2_v|1029358_starypa_trde_lid2_v|1325135_Taixum24_der_lid2_v|1334012_mtbboy1993_no_lid81_v",
    1645192: "82251_Monkstar_der_lid2_v|748418_Halmafelix_de_lid2_v|1076589_Sawwah_de_lid2_v|1347452_Taixum24_der_lid2_v|1348748_mtbboy1993_no_lid81_v",
    1413919: "1364244_mtbboy1993_no_lid81_v",
    2226742: "1481395_mtbboy1993_no_lid81_v",
    1087643: "358404_Halmafelix_de_lid2_v|693709_Halmafelix_de_lid2_v|1364238_mtbboy1993_no_lid81_v",
    1379281: "28009_Halmafelix_de_lid2_v|1364238_mtbboy1993_no_lid81_v",
    2240021: "917015_krautteich_der_lid2_v|1565525_Halmafelix_de_lid2_v",
    1413586: "572446_Halmafelix_de_lid2_v|1338537_mtbboy1993_no_lid81_v",
    1449265: "83539_blockbuster_de_lid2_v|155199_Halmafelix_de_lid2_v|344795_Vollprofi_de_lid2_v|1338537_mtbboy1993_no_lid81_v",
    1117393: "1045819_Halmafelix_de_lid2_v|1404444_mtbboy1993_no_lid81_v",
    1645184: "208673_Immanuel_der_lid2_v|622737_Halmafelix_de_lid2_v|1314436_bgreff_der_lid2_v|1348068_mtbboy1993_no_lid81_v|1514402_Taixum24_der_lid2_v",
    2326557: "1481394_mtbboy1993_no_lid81_v|1469675_Taixum24_der_lid2_v",
    2326559: "1469675_Taixum24_der_lid2_v",
    2326560: "1481393_mtbboy1993_no_lid81_v|1469675_Taixum24_der_lid2_v",
    1881443: "908490_tekkno_der_lid2_v|1565891_Halmafelix_de_lid2_v",
    1076064: "88490_Akam_de_lid2_v|379281_Halmafelix_de_lid2_v|1356635_mtbboy1993_no_lid81_v",
    2326552: "1481396_mtbboy1993_no_lid81_v",
    2326577: "1481397_mtbboy1993_no_lid81_v",
    2326546: "951751_berzerk_atde_lid2_v|1554480_Halmafelix_de_lid2_v",
    1163769: "348464_Connum_der_lid2_v|1429565_mtbboy1993_no_lid81_v",
    2266223: "62664_Halmafelix_de_lid2_v",
    1881442: "379278_Halmafelix_de_lid2_v",
    1881444: "379278_Halmafelix_de_lid2_v",
    1099493: "1390257_mtbboy1993_no_lid81_v",
    1055733: "408631_BHM_de_lid2_v|705485_Halmafelix_de_lid2_v|1374412_mtbboy1993_no_lid81_v",
    1193106: "672043_Halmafelix_de_lid2_v",
    1223599: "293388_Immanuel_der_lid2_v",
    2251772: "201488_Halmafelix_de_lid2_v",
}

_STILLE_ENNO_RESPONSE = {
    "translations": [
        {"id": 378533, "term1": "quiet", "term2": "stille",
         "entry_type": "adj", "subj_ids": "", "vt_usage": 0, "sort_num": 0},
        {"id": 421622, "term1": "still", "term2": "stille",
         "entry_type": "adj", "subj_ids": "", "vt_usage": 0, "sort_num": 1},
        {"id": 383116, "term1": "silent", "term2": "stille",
         "entry_type": "adj", "subj_ids": "", "vt_usage": 0, "sort_num": 2},
        {"id": 1127940, "term1": "to ask [a question]", "term2": "å stille [et spørsmål]",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 3},
        {"id": 1975617, "term1": "Sit still!", "term2": "Sitt stille!",
         "entry_type": "", "subj_ids": "", "vt_usage": 0, "sort_num": 4},
        {"id": 2016116, "term1": "to set the clock", "term2": "å stille klokka",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 5},
        {"id": 2016117, "term1": "to set the clock", "term2": "å stille klokken",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 6},
        {"id": 1149015, "term1": "to feature", "term2": "å stille ut",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 7},
        {"id": 1975616, "term1": "Shut up!", "term2": "Ti nå stille!",
         "entry_type": "", "subj_ids": "", "vt_usage": 0, "sort_num": 8},
        {"id": 2101646, "term1": "to make a diagnosis", "term2": "å stille en diagnose",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 9},
        {"id": 1130166, "term1": "to ask a question", "term2": "å stille et spørsmål",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 10},
        {"id": 1975614, "term1": "to change to sth. [shift]", "term2": "å stille om til noe",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 11},
        {"id": 1849840, "term1": "Still waters run deep.", "term2": "Stille vann har dypest grunn.",
         "entry_type": "", "subj_ids": "", "vt_usage": 0, "sort_num": 12},
        {"id": 421568, "term1": "to hover", "term2": "å stå stille i lufta / luften",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 13},
    ],
    "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
}

# {entry id: raw recordings token} — one `|`-separated recording key list
# per entry, exactly as the endpoint returned it for this pair.
_STILLE_ENNO_RECS = {
    378533: "123211_Artists_usr_lid1_v|1334012_mtbboy1993_no_lid81_v",
    421622: "26189_kcoats_us_lid1_v|27109_nlark_gb_lid1_v|235548_Artists_usr_lid1_v|1172922_Agyen_gbcnr_lid1_v|1334012_mtbboy1993_no_lid81_v",
    383116: "165856_Nachteule_gbr_lid1_v|362702_Artists_usr_lid1_v|1334012_mtbboy1993_no_lid81_v",
    1127940: "16592_Nachteule_gbr_lid1_v|216062_Artists_usr_lid1_v|1348748_mtbboy1993_no_lid81_v",
    1975617: "1364244_mtbboy1993_no_lid81_v",
    2016116: "1299839_C-elegans_aur_lid1_v|1388320_mtbboy1993_no_lid81_v",
    2016117: "1299839_C-elegans_aur_lid1_v|1388319_mtbboy1993_no_lid81_v",
    1149015: "95452_thrashwell_car_lid1_v|124448_Artists_usr_lid1_v|1230386_Agyen_gbcnr_lid1_v|1348747_mtbboy1993_no_lid81_v",
    1975616: "181588_scabaret_deusr_lid1_v|123006_Artists_usr_lid1_v|15192_Nachteule_gbr_lid1_v|1338537_mtbboy1993_no_lid81_v",
    2101646: "264719_Artists_usr_lid1_v|1404444_mtbboy1993_no_lid81_v",
    1130166: "86021_Nachteule_gbr_lid1_v|834958_Artists_usr_lid1_v|1348068_mtbboy1993_no_lid81_v",
    1975614: "1376048_mtbboy1993_no_lid81_v",
    1849840: "1157992_Agyen_gbcnr_lid1_v|660224_doug-e3b_usr_lid1_v|123282_Artists_usr_lid1_v|21923_naatiu_ehde_lid1_v",
    421568: "97030_Artists_usr_lid1_v|1339635_mtbboy1993_no_lid81_v",
}


def _stille_response_for(params):
    return _mock_response(
        _STILLE_DENO_RESPONSE if params["lp"] == "DENO" else _STILLE_ENNO_RESPONSE
    )


def _stille_recs_for(url_or_lp):
    return _STILLE_DENO_RECS if "DENO" in url_or_lp.upper() else _STILLE_ENNO_RECS


def _stille_fake_get(calls, recs_override=None, recordings_text=None):
    """One mock of the whole dict.cc surface for `stille`, recording every
    outbound call so the "was it fetched at all" criteria are observable."""

    def fake_get(url, params=None, headers=None, timeout=None):
        calls.append((url, params))
        if "app_translations" in url:
            return _stille_response_for(params)
        if _is_recordings(url):
            resp = MagicMock()
            resp.raise_for_status = MagicMock()
            if recordings_text is not None:
                resp.text = recordings_text
                return resp
            recs = recs_override or _stille_recs_for(url)
            ids = [int(x) for x in params["id_str"].split(" ")[1:]]
            resp.text = " ".join(["0"] + [recs.get(i, "0") for i in ids]) + " "
            return resp
        # Audio. The bytes a recording carries are identified by the
        # RECORDING id, not the entry — entries sharing one recording return
        # byte-identical audio, exactly as live, so content-hash dedupe is
        # exercised for real.
        recs = recs_override or _stille_recs_for(params["lp"])
        token = recs.get(params["id"], "0")
        nb_keys = [k for k in token.split("|") if "_lid81_" in k]
        assert nb_keys, (
            f"entry {params['id']} has no Norwegian recording and must never "
            f"have been fetched — `_rec_ip` would have synthesised one"
        )
        return _audio_response(f"mp3-rec-{nb_keys[0].split('_')[0]}".encode())

    return fake_get


def _audio_calls(calls):
    return [p for url, p in calls if "speak.audio" in url]


def test_tts_stille_returns_far_more_than_the_first_entrys_audio():
    # Criterion 6. Before the change this returned 2 candidates (the first
    # entry's human + synthetic); the operator counted 22 real recordings.
    calls = []
    with patch("adapters.dictcc_api.requests.get", side_effect=_stille_fake_get(calls)):
        result = DictccApiTtsAdapter().lookup({"text": "stille", "lang": "nb"})

    assert len(result["candidates"]) > 15


def test_tts_every_candidate_is_human_and_no_voice_is_ever_requested():
    # Criterion 7. No `source: "synthetic"`, no `voice` key on a candidate,
    # and — the part that matters — no outbound request carrying `voice=`.
    calls = []
    with patch("adapters.dictcc_api.requests.get", side_effect=_stille_fake_get(calls)):
        result = DictccApiTtsAdapter().lookup({"text": "stille", "lang": "nb"})

    assert result["candidates"]
    assert {c["source"] for c in result["candidates"]} == {"human"}
    assert all("voice" not in c for c in result["candidates"])
    assert all("voice" not in (params or {}) for _url, params in calls)


def test_tts_entry_recorded_only_in_the_other_language_is_skipped_unfetched():
    # Criterion 9. `å stille opp noe` (DENO entry 2240021) carries two GERMAN
    # recordings and no Norwegian one. It must yield no candidate AND never
    # be fetched: `lang=NO_rec_ip` would happily synthesise a clip and the
    # adapter would then label it "human".
    assert "_lid81_" not in _STILLE_DENO_RECS[2240021]

    calls = []
    with patch("adapters.dictcc_api.requests.get", side_effect=_stille_fake_get(calls)):
        result = DictccApiTtsAdapter().lookup({"text": "stille", "lang": "nb"})

    fetched_ids = {p["id"] for p in _audio_calls(calls)}
    assert 2240021 not in fetched_ids
    for entry_id in (2266223, 1223599, 1849840):  # the operator's other three
        assert entry_id not in fetched_ids
    contexts = " | ".join(c.get("context", "") for c in result["candidates"])
    assert "å stille opp noe" not in contexts
    assert "å gå stille i dørene" not in contexts
    assert "Stille vann har dypest grunn." not in contexts


def test_tts_en_no_only_recording_is_returned():
    # Criterion 10. `å stille klokka` (ENNO entry 2016116) exists only in the
    # EN<->NO pair, which `dir=1` made unreachable entirely.
    calls = []
    with patch("adapters.dictcc_api.requests.get", side_effect=_stille_fake_get(calls)):
        result = DictccApiTtsAdapter().lookup({"text": "stille", "lang": "nb"})

    assert 2016116 in {p["id"] for p in _audio_calls(calls)}
    contexts = {c.get("context") for c in result["candidates"]}
    assert "[verb] å stille klokka" in contexts
    assert "[verb] å stille ut" in contexts


def test_tts_recordings_endpoint_is_called_once_per_pair_not_per_entry():
    # Criterion 13. 43 entries across the two pairs, two batched calls.
    calls = []
    with patch("adapters.dictcc_api.requests.get", side_effect=_stille_fake_get(calls)):
        DictccApiTtsAdapter().lookup({"text": "stille", "lang": "nb"})

    rec_calls = [(url, p) for url, p in calls if _is_recordings(url)]
    assert len(rec_calls) == 2, rec_calls
    assert {url for url, _ in rec_calls} == {
        "https://deno.dict.cc/dict/ajax_get_audiorecordings.php",
        "https://enno.dict.cc/dict/ajax_get_audiorecordings.php",
    }
    # Each call batched that pair's whole entry list, leading `0` included.
    for _url, params in rec_calls:
        ids = params["id_str"].split(" ")
        assert ids[0] == "0"
        assert len(ids) - 1 in (len(_STILLE_DENO_RESPONSE["translations"]),
                                len(_STILLE_ENNO_RESPONSE["translations"]))


def test_tts_misaligned_recordings_response_raises_rather_than_mispairing():
    # A short response must NOT be zipped against the id list — doing so
    # would attribute one entry's recordings to another and offer the wrong
    # audio. Every pair failing the same way makes the lookup raise.
    calls = []
    fake = _stille_fake_get(calls, recordings_text="0 1334012_mtbboy1993_no_lid81_v ")
    with patch("adapters.dictcc_api.requests.get", side_effect=fake):
        with pytest.raises(ProviderLookupError) as exc:
            DictccApiTtsAdapter().lookup({"text": "stille", "lang": "nb"})

    assert "refusing to align" in str(exc.value)
    assert not _audio_calls(calls)


def test_tts_context_names_the_phrase_actually_read_plus_the_pos_tag():
    # Criterion 8. The recording of entry 2226742 says "å stille krav" —
    # dict.cc's own term2 — so the context must carry the infinitive marker.
    # `/translations` keeps its established stripped convention; this is the
    # one place the two kinds deliberately differ.
    calls = []
    with patch("adapters.dictcc_api.requests.get", side_effect=_stille_fake_get(calls)):
        result = DictccApiTtsAdapter().lookup({"text": "stille", "lang": "nb"})

    contexts = {c.get("context") for c in result["candidates"]}
    assert "[verb] å stille krav" in contexts
    assert "[verb] stille krav" not in contexts
    assert "[adj] stille" in contexts
    assert all(c["context"].startswith("[") or " " in c["context"]
               for c in result["candidates"] if c.get("context"))


def test_translations_context_keeps_its_stripped_convention():
    # The counterpart of the test above: /translations is untouched.
    with patch("adapters.dictcc_api.requests.get",
               side_effect=lambda url, **kw: _stille_response_for(kw["params"])):
        result = DictccApiTranslateAdapter().lookup(
            {"text": "stille", "from": "nb", "to": "de"}
        )

    contexts = {c.get("context") for c in result["candidates"]}
    assert "[verb] stille krav" in contexts
    assert "[verb] å stille krav" not in contexts


# Two entries sharing one phrase but carrying DIFFERENT recordings of it.
_TWO_TAKES_RESPONSE = {
    "translations": [
        {"id": 701, "term1": "to set the clock", "term2": "å stille klokka",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 0},
        {"id": 702, "term1": "to adjust the clock", "term2": "å stille klokka",
         "entry_type": "verb", "subj_ids": "", "vt_usage": 0, "sort_num": 1},
    ],
    "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
}


def test_tts_two_different_recordings_of_one_phrase_both_survive():
    # Dedupe is on content hash ONLY. Two takes of the same phrase are two
    # candidates with the same context — the operator picks by ear.
    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(_TWO_TAKES_RESPONSE)
        if _is_recordings(url):
            return _recordings_response(params, {701: ["81"], 702: ["81"]})
        return _audio_response(f"mp3-take-{params['id']}".encode())

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "stille", "lang": "nb"})

    assert len(result["candidates"]) == 2
    assert len({c["sha256"] for c in result["candidates"]}) == 2
    assert {c["context"] for c in result["candidates"]} == {"[verb] å stille klokka"}


# api.md's `hus` evidence that `lid` is the LANGUAGE, not the user: ONE entry
# carries Norwegian recordings from two different users/countries.
_HUS_TWO_USERS_RECS = {
    811: "1334013_55S55_noch_lid81_v|1334014_mtbboy1993_no_lid81_v|99_Artists_usr_lid1_v",
}


def test_tts_lid_is_matched_as_a_language_not_as_a_user_id():
    # Criterion 11. Two distinct users, both lid81, plus an lid1 recording on
    # the same entry — the entry still matches for `nb`.
    response = {
        "translations": [
            {"id": 811, "term1": "house", "term2": "hus {n}", "entry_type": "noun",
             "subj_ids": "", "vt_usage": 0, "sort_num": 0},
        ],
        "dir": 2, "inflections": "", "inflections_repl": "", "inflections_info": "",
    }

    def fake_get(url, params=None, headers=None, timeout=None):
        if "app_translations" in url:
            return _mock_response(response)
        if _is_recordings(url):
            resp = MagicMock()
            resp.raise_for_status = MagicMock()
            ids = [int(x) for x in params["id_str"].split(" ")[1:]]
            resp.text = " ".join(["0"] + [_HUS_TWO_USERS_RECS.get(i, "0") for i in ids]) + " "
            return resp
        return _audio_response(b"mp3-hus")

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        result = DictccApiTtsAdapter().lookup({"text": "hus", "lang": "nb"})

    assert len(result["candidates"]) == 1
    assert result["candidates"][0]["source"] == "human"


def test_inflect_nb_queries_both_norwegian_pairs_with_dir_2():
    # Criterion 12. Norwegian is the SECOND language of both DENO and ENNO.
    # `dir=1` on ENNO asked for "stille as an English word" and returned 0
    # entries, hiding that pair's entire dataset.
    seen = []

    def fake_get(url, params=None, headers=None, timeout=None):
        seen.append((params["lp"], params["dir"]))
        return _mock_response(_NO_TABLE_RESPONSE)

    with patch("adapters.dictcc_api.requests.get", side_effect=fake_get):
        DictccApiInflectAdapter().lookup({"word": "stille", "lang": "nb"})

    assert {lp for lp, _ in seen} == {"DENO", "ENNO"}
    assert all(dir_ == 2 for _lp, dir_ in seen), seen
