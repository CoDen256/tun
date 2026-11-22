"""operator-settings: defaults-on-read, partial write, and catalogue
reconciliation (tasks 6.1-6.9, backend tests for 6.10). Every test mocks
smia_client.get itself, never a real network call — same convention as
tests/test_enrich.py."""

from __future__ import annotations

import smia_client
from tests.conftest import AUTH


def _mock_catalogue(monkeypatch, catalogue):
    monkeypatch.setattr(smia_client, "get", lambda path, timeout=20.0: (200, catalogue))


def test_reading_before_anything_configured_returns_full_defaults(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "nst"]})
    resp = client.get("/api/settings", headers=AUTH)
    assert resp.status_code == 200
    body = resp.get_json()
    assert "translation_merge_mode" not in body
    assert body["theme"] == "auto"
    assert body["value_color"] == "blue"
    assert body["value_color_custom"] is None
    assert body["override_prefill"] is True
    assert body["default_target_langs"] == ["en", "de"]
    assert body["prefill_timing"] == "on_open"
    assert body["triage_navigate_save"] == "autosave"
    assert body["examples_count"] == 3
    assert body["examples_max_providers"] == 1
    assert body["providers"]["ipa"]["order"] == ["wikipron", "nst"]
    assert body["providers"]["ipa"]["primary"] == "wikipron"


def test_prefill_timing_can_be_set_to_on_demand(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"prefill_timing": "on_demand"}, headers=AUTH)
    assert resp.status_code == 200
    assert resp.get_json()["prefill_timing"] == "on_demand"


def test_prefill_timing_rejects_unknown_value(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"prefill_timing": "sometimes"}, headers=AUTH)
    assert resp.status_code == 400


def test_triage_navigate_save_can_be_set_to_manual(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"triage_navigate_save": "manual"}, headers=AUTH)
    assert resp.status_code == 200
    assert resp.get_json()["triage_navigate_save"] == "manual"


def test_triage_navigate_save_can_be_set_to_autosave(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"triage_navigate_save": "autosave"}, headers=AUTH)
    assert resp.status_code == 200
    assert resp.get_json()["triage_navigate_save"] == "autosave"


def test_triage_navigate_save_rejects_unknown_value(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"triage_navigate_save": "sometimes"}, headers=AUTH)
    assert resp.status_code == 400


def test_examples_count_can_be_set_within_range(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"examples_count": 6}, headers=AUTH)
    assert resp.status_code == 200
    assert resp.get_json()["examples_count"] == 6


def test_examples_count_rejects_out_of_range_value(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"examples_count": 11}, headers=AUTH)
    assert resp.status_code == 400


def test_examples_count_rejects_non_integer(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"examples_count": "3"}, headers=AUTH)
    assert resp.status_code == 400


def test_examples_max_providers_can_be_set_within_range(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"examples_max_providers": 4}, headers=AUTH)
    assert resp.status_code == 200
    assert resp.get_json()["examples_max_providers"] == 4


def test_examples_max_providers_rejects_out_of_range_value(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"examples_max_providers": 0}, headers=AUTH)
    assert resp.status_code == 400


def test_settings_requires_auth(client):
    resp = client.get("/api/settings")
    assert resp.status_code == 401


def test_partial_write_leaves_other_preferences_at_default(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch(
        "/api/settings", json={"theme": "light"}, headers=AUTH
    )
    assert resp.status_code == 200
    body = resp.get_json()
    assert body["theme"] == "light"
    assert body["value_color"] == "blue"
    # Untouched preferences remain at their defaults.
    assert body["override_prefill"] is True
    assert body["default_target_langs"] == ["en", "de"]


def test_partial_write_leaves_other_preferences_at_their_stored_values(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    client.patch("/api/settings", json={"override_prefill": False}, headers=AUTH)
    resp = client.patch(
        "/api/settings", json={"default_target_langs": ["fr"]}, headers=AUTH
    )
    body = resp.get_json()
    assert body["default_target_langs"] == ["fr"]
    # The earlier write to override_prefill survives this later, unrelated write.
    assert body["override_prefill"] is False


def test_writing_one_kinds_order_does_not_touch_another_kinds(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "nst"], "tts": ["kaikki_tts", "elevenlabs"]})
    client.patch(
        "/api/settings",
        json={"providers": {"tts": {"order": ["elevenlabs", "kaikki_tts"]}}},
        headers=AUTH,
    )
    resp = client.patch(
        "/api/settings",
        json={"providers": {"ipa": {"order": ["nst", "wikipron"]}}},
        headers=AUTH,
    )
    body = resp.get_json()
    assert body["providers"]["ipa"]["order"] == ["nst", "wikipron"]
    assert body["providers"]["tts"]["order"] == ["elevenlabs", "kaikki_tts"]


def test_unknown_settings_key_is_rejected(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"bogus": 1}, headers=AUTH)
    assert resp.status_code == 400


def test_translation_merge_mode_no_longer_exists(client, monkeypatch):
    # stabbur-editor-redesign D7: translations are always separate rows.
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"translation_merge_mode": "append"}, headers=AUTH)
    assert resp.status_code == 400


# ------------------------------------- stabbur-editor-redesign D12 --

def test_theme_and_preset_value_color_are_stored(client, monkeypatch):
    # C12, the accepted half.
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"theme": "dark", "value_color": "teal"}, headers=AUTH)
    assert resp.status_code == 200, resp.get_json()
    body = client.get("/api/settings", headers=AUTH).get_json()
    assert body["theme"] == "dark"
    assert body["value_color"] == "teal"


def test_every_theme_and_preset_is_accepted(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    for theme in ("auto", "light", "dark"):
        assert client.patch("/api/settings", json={"theme": theme}, headers=AUTH).status_code == 200
    for color in ("blue", "teal", "violet", "orange"):
        assert client.patch("/api/settings", json={"value_color": color}, headers=AUTH).status_code == 200


def test_invalid_appearance_values_are_rejected(client, monkeypatch):
    # C12, the refused half.
    _mock_catalogue(monkeypatch, {})
    for body in (
        {"value_color": "pink"},
        {"value_color_custom": "red"},
        {"value_color_custom": "#c2185"},
        {"value_color_custom": "c2185b"},
        {"value_color_custom": "#c2185bff"},
        {"value_color_custom": 123},
        {"theme": "sepia"},
        {"theme": None},
    ):
        resp = client.patch("/api/settings", json=body, headers=AUTH)
        assert resp.status_code == 400, body
    stored = client.get("/api/settings", headers=AUTH).get_json()
    assert stored["value_color"] == "blue" and stored["value_color_custom"] is None


def test_a_custom_value_color_is_stored_and_can_be_cleared(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch(
        "/api/settings", json={"value_color": "custom", "value_color_custom": "#c2185b"}, headers=AUTH
    )
    assert resp.status_code == 200, resp.get_json()
    assert resp.get_json()["value_color"] == "custom"
    assert resp.get_json()["value_color_custom"] == "#c2185b"

    # Clearing the colour while "custom" is selected would leave nothing to use.
    assert client.patch("/api/settings", json={"value_color_custom": None}, headers=AUTH).status_code == 400

    # Back to a preset; the custom colour can then be cleared.
    assert client.patch("/api/settings", json={"value_color": "violet"}, headers=AUTH).status_code == 200
    resp = client.patch("/api/settings", json={"value_color_custom": None}, headers=AUTH)
    assert resp.status_code == 200
    assert resp.get_json()["value_color_custom"] is None


def test_custom_without_any_custom_colour_is_rejected(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch("/api/settings", json={"value_color": "custom"}, headers=AUTH)
    assert resp.status_code == 400


def test_unknown_kind_is_rejected(client, monkeypatch):
    _mock_catalogue(monkeypatch, {})
    resp = client.patch(
        "/api/settings", json={"providers": {"notakind": {"order": ["x"]}}}, headers=AUTH
    )
    assert resp.status_code == 400


def test_duplicate_provider_in_order_is_rejected(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "nst"]})
    resp = client.patch(
        "/api/settings",
        json={"providers": {"ipa": {"order": ["wikipron", "wikipron"]}}},
        headers=AUTH,
    )
    assert resp.status_code == 400


def test_provider_absent_from_catalogue_is_retained_not_refused(client, monkeypatch):
    # D3/3.3: a stored provider the current catalogue doesn't mention is
    # retained, not rejected — the catalogue can change underneath stabbur.
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron"]})
    resp = client.patch(
        "/api/settings",
        json={"providers": {"ipa": {"order": ["wikipron", "ghost_provider"]}}},
        headers=AUTH,
    )
    assert resp.status_code == 200


def test_reordering_changes_the_primary(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "ipadict", "nst"]})
    resp = client.patch(
        "/api/settings",
        json={"providers": {"ipa": {"order": ["nst", "wikipron", "ipadict"]}}},
        headers=AUTH,
    )
    assert resp.get_json()["providers"]["ipa"]["primary"] == "nst"


def test_disabling_the_first_provider_promotes_the_next(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "ipadict", "nst"]})
    resp = client.patch(
        "/api/settings",
        json={"providers": {"ipa": {"order": ["wikipron", "ipadict", "nst"], "disabled": ["wikipron"]}}},
        headers=AUTH,
    )
    assert resp.get_json()["providers"]["ipa"]["primary"] == "ipadict"


def test_a_vanished_provider_is_skipped_without_error(client, monkeypatch):
    # Store an order while nst is present.
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "nst"]})
    client.patch(
        "/api/settings", json={"providers": {"ipa": {"order": ["wikipron", "nst"]}}}, headers=AUTH
    )
    # nst vanishes from the catalogue (e.g. its token got unset).
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron"]})
    resp = client.get("/api/settings", headers=AUTH)
    ipa = resp.get_json()["providers"]["ipa"]
    assert ipa["order"] == ["wikipron"]
    assert ipa["primary"] == "wikipron"


def test_a_vanished_provider_resumes_its_stored_position_and_enabled_state_on_return(client, monkeypatch):
    # The reconciliation case most likely to be got subtly wrong (design
    # D3 / Risks) — a disabled provider must come back disabled, at the
    # same position, not treated as newly discovered and re-enabled.
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "nst", "ipadict"]})
    client.patch(
        "/api/settings",
        json={
            "providers": {
                "ipa": {"order": ["wikipron", "nst", "ipadict"], "disabled": ["nst"]}
            }
        },
        headers=AUTH,
    )

    # nst vanishes.
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "ipadict"]})
    vanished = client.get("/api/settings", headers=AUTH).get_json()["providers"]["ipa"]
    assert vanished["order"] == ["wikipron", "ipadict"]

    # nst reappears.
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "nst", "ipadict"]})
    returned = client.get("/api/settings", headers=AUTH).get_json()["providers"]["ipa"]
    assert returned["order"] == ["wikipron", "nst", "ipadict"]
    assert "nst" in returned["disabled"]
    assert returned["primary"] == "wikipron"


def test_a_new_provider_is_appended_enabled_and_is_not_primary(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron"]})
    client.patch(
        "/api/settings", json={"providers": {"ipa": {"order": ["wikipron"]}}}, headers=AUTH
    )

    # kaikki_ipa is a brand-new provider in the catalogue.
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron", "kaikki_ipa"]})
    resp = client.get("/api/settings", headers=AUTH)
    ipa = resp.get_json()["providers"]["ipa"]
    assert ipa["order"] == ["wikipron", "kaikki_ipa"]
    assert "kaikki_ipa" not in ipa["disabled"]
    assert ipa["primary"] == "wikipron"


def test_every_stored_provider_vanished_still_resolves_a_primary_from_the_catalogue(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"ipa": ["wikipron"]})
    client.patch(
        "/api/settings", json={"providers": {"ipa": {"order": ["wikipron"]}}}, headers=AUTH
    )

    _mock_catalogue(monkeypatch, {"ipa": ["ipadict", "nst"]})
    resp = client.get("/api/settings", headers=AUTH)
    ipa = resp.get_json()["providers"]["ipa"]
    assert ipa["order"] == ["ipadict", "nst"]
    assert ipa["primary"] == "ipadict"


def test_smia_unreachable_degrades_to_stored_order_rather_than_failing(client, monkeypatch):
    def fake_get(path, timeout=20.0):
        raise smia_client.SmiaUnavailableError("connection refused")

    monkeypatch.setattr(smia_client, "get", fake_get)
    resp = client.get("/api/settings", headers=AUTH)
    assert resp.status_code == 200


def test_pos_and_stt_have_their_own_provider_order(client, monkeypatch):
    """stabbur-editor-redesign C17: part of speech is reconciled against the
    inflections catalogue but ordered independently; stt against smia's own
    stt catalogue."""
    _mock_catalogue(monkeypatch, {"inflections": ["ordbank", "dictcc_api"], "stt": ["hf_whisper"]})
    body = client.get("/api/settings", headers=AUTH).get_json()
    assert body["providers"]["pos"]["order"] == ["ordbank", "dictcc_api"]
    assert body["providers"]["stt"]["order"] == ["hf_whisper"]

    resp = client.patch(
        "/api/settings", json={"providers": {"pos": {"order": ["dictcc_api", "ordbank"], "disabled": ["ordbank"]}}}, headers=AUTH
    )
    assert resp.status_code == 200
    providers = resp.get_json()["providers"]
    assert providers["pos"] == {"order": ["dictcc_api", "ordbank"], "disabled": ["ordbank"], "primary": "dictcc_api"}
    assert providers["inflections"]["order"] == ["ordbank", "dictcc_api"]  # untouched


# --------------------- stabbur-editor-fixes D4: per-language translations --
# The Translations order is per TARGET LANGUAGE, under "translations:<lang>".
# Every other kind keeps exactly one list.


def test_a_translations_order_is_served_per_target_language(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"translations": ["dictcc", "google"]})
    body = client.get("/api/settings", headers=AUTH).get_json()
    assert body["providers"]["translations:en"]["order"] == ["dictcc", "google"]
    assert body["providers"]["translations:de"]["order"] == ["dictcc", "google"]


def test_adding_a_target_language_adds_its_list(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"translations": ["dictcc", "google"]})
    client.patch("/api/settings", json={"default_target_langs": ["en", "de", "fr"]}, headers=AUTH)
    body = client.get("/api/settings", headers=AUTH).get_json()
    assert "translations:fr" in body["providers"]


def test_a_new_language_inherits_the_configured_generic_order(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"translations": ["dictcc", "google"]})
    # The order the operator configured before any language had its own list.
    client.patch(
        "/api/settings",
        json={"providers": {"translations": {"order": ["google", "dictcc"]}}},
        headers=AUTH,
    )
    client.patch("/api/settings", json={"default_target_langs": ["en", "fr"]}, headers=AUTH)
    body = client.get("/api/settings", headers=AUTH).get_json()
    assert body["providers"]["translations:fr"]["order"] == ["google", "dictcc"]
    assert body["providers"]["translations:fr"]["primary"] == "google"


def test_one_languages_order_does_not_touch_anothers(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"translations": ["dictcc", "google"]})
    resp = client.patch(
        "/api/settings",
        json={"providers": {"translations:de": {"order": ["google", "dictcc"]}}},
        headers=AUTH,
    )
    assert resp.status_code == 200
    providers = resp.get_json()["providers"]
    assert providers["translations:de"]["order"] == ["google", "dictcc"]
    assert providers["translations:en"]["order"] == ["dictcc", "google"]


def test_a_per_language_order_survives_a_second_read(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"translations": ["dictcc", "google"]})
    client.patch(
        "/api/settings",
        json={"providers": {"translations:de": {"order": ["google", "dictcc"], "disabled": ["dictcc"]}}},
        headers=AUTH,
    )
    providers = client.get("/api/settings", headers=AUTH).get_json()["providers"]
    assert providers["translations:de"]["order"] == ["google", "dictcc"]
    assert providers["translations:de"]["disabled"] == ["dictcc"]
    assert providers["translations:de"]["primary"] == "google"


def test_a_language_removed_from_settings_keeps_its_stored_order(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"translations": ["dictcc", "google"]})
    client.patch(
        "/api/settings",
        json={"providers": {"translations:de": {"order": ["google", "dictcc"]}}},
        headers=AUTH,
    )
    client.patch("/api/settings", json={"default_target_langs": ["en"]}, headers=AUTH)
    providers = client.get("/api/settings", headers=AUTH).get_json()["providers"]
    assert providers["translations:de"]["order"] == ["google", "dictcc"]


def test_other_kinds_stay_single_however_many_languages_exist(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"translations": ["dictcc"], "ipa": ["nst"]})
    client.patch("/api/settings", json={"default_target_langs": ["en", "de", "fr"]}, headers=AUTH)
    providers = client.get("/api/settings", headers=AUTH).get_json()["providers"]
    assert [k for k in providers if k.startswith("ipa")] == ["ipa"]
    assert [k for k in providers if k.startswith("examples")] == ["examples"]


def test_a_malformed_per_language_kind_is_rejected(client, monkeypatch):
    _mock_catalogue(monkeypatch, {"translations": ["dictcc"]})
    resp = client.patch(
        "/api/settings",
        json={"providers": {"translations:NOT A LANG": {"order": ["dictcc"]}}},
        headers=AUTH,
    )
    assert resp.status_code == 400


def test_a_language_configured_in_the_same_request_can_be_ordered(client, monkeypatch):
    """The Settings page writes the language list and an order for it in one
    session; the key must not be refused merely because the language was not
    stored when the request arrived."""
    _mock_catalogue(monkeypatch, {"translations": ["dictcc", "google"]})
    resp = client.patch(
        "/api/settings",
        json={
            "default_target_langs": ["en", "sv"],
            "providers": {"translations:sv": {"order": ["google", "dictcc"]}},
        },
        headers=AUTH,
    )
    assert resp.status_code == 200
    assert resp.get_json()["providers"]["translations:sv"]["order"] == ["google", "dictcc"]
