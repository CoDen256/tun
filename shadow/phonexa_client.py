"""
phonexa_client.py — everything shadow needs FROM phonexa, in one place.

WHY THIS EXISTS AT ALL — the finding behind zone-isolation task 3.4.
--------------------------------------------------------------------
The change documents said "shadow stores audio by calling phonexa's storage
API rather than mounting the audio volume." Checked against the code: there
is no audio to store. `shadowing.py` never calls `get_audio_store`, never
receives audio bytes, and ShadowingMedia deliberately holds no storage key
(an earlier version did and was reverted — see db/models.py). phonexa's
audio tree holds VOWEL SAMPLES, which shadow never writes and never reads.
So there is no storage call to make and no volume to decline to mount:
shadow mounts no volume at all, which satisfies the rule trivially.

CORRECTION, 2026-11-24 (shadow-playback-chapter-reading, D168): the
users and settings rows below are HISTORY. shadow is single-user and owns
its settings (appsettings.py). What is left here is /analyze-praat, and a
single settings READ used once by the background import. The text below is
kept as the record of what the coupling was.

The coupling that WAS real, and is what this module implemented:

  users     phonexa owns the `users` table. The profile picker on shadow's
            pages lists and creates profiles.                [degrades: see below]
  settings  phonexa owns `settings`; 'transcribeBackend' (shadow's STT
            provider choice) is one of its keys.
  praat     the 🎵 pitch comparison posts a recorded slice to phonexa's
            /analyze-praat (parselmouth lives there, with the vowel domain).

All three are proxied SERVER-SIDE, not called from the browser, for three
reasons: the browser would otherwise have to cross the gateway's per-prefix
basic_auth boundary on an XHR; internal service-to-service calls never pass
through the gateway (CLAUDE.md zone 3); and a proxy is where "phonexa is
down" turns into a clean 503 with a reason instead of an opaque fetch error.
It is the same shape phonexa's own /transcribe -> smia proxy already uses.

DEGRADATION (zone-isolation task 3.8). With phonexa unreachable:
  * existing media and segments still list and play — those reads never
    leave this service,
  * profile NAMES cannot be resolved, so the picker falls back to the id the
    browser already has in localStorage,
  * find-or-create no longer validates the profile id and accepts it,
  * saving the transcription provider and the pitch comparison report
    unavailable (503).
"""

from __future__ import annotations

import os

import requests

# Timeouts are short on purpose: every call here is on a page-render path,
# and "phonexa is down" must be a fast, visible degradation rather than a
# hang that makes shadow look broken too.
PHONEXA_TIMEOUT_SEC = 5
# /analyze-praat runs parselmouth over a whole recorded slice.
PHONEXA_ANALYZE_TIMEOUT_SEC = 30


class PhonexaUnavailable(Exception):
    """phonexa could not be reached, or answered unreadably."""


def base_url() -> str:
    """Derived from phonexa's compose service key, never configured (D151)."""
    return os.environ.get("PHONEXA_BASE_URL", "http://phonexa-backend:5050").rstrip("/")


def public_prefix() -> str:
    """The path prefix the BROWSER reaches phonexa under.

    Only used for links a human clicks (the Vowel Chart / Formant Lab
    handoff), never for data. Distinct from base_url(), which is the
    internal address this process uses and which the browser can never
    reach. Set in compose.yaml, defaulted to the gateway's own mount point.
    """
    return os.environ.get("PHONEXA_PUBLIC_PREFIX", "/phonexa").rstrip("/")


def _headers(extra: dict | None = None) -> dict:
    """The internal service-to-service credential (D159).

    THIS WAS MISSING AND BROKE SHADOW IN PRODUCTION (P67). This module was
    written while phonexa had NO auth of its own, so sending nothing was
    correct. `unified-auth` 4.3 gave phonexa the shared check — and every
    call here started coming back 401: the profile picker 503'd on
    `list_users` ("phonexa not reachable — HTTP 401") and `create_user`
    passed phonexa's bare 401 through to the browser. Neither the gateway
    nor either service was wrong; the caller simply never learned about the
    new requirement, because nothing fails when a client omits a header
    that nobody checked yet.

    Internal calls never pass through the gateway (CLAUDE.md zone 3), so the
    gateway's `X-Tun-Operator` marker is not available here and must not be
    forged — the bearer is the correct half of that contract.
    """
    headers = {"Authorization": f"Bearer {os.environ.get('INTERNAL_TOKEN', '')}"}
    if extra:
        headers.update(extra)
    return headers


def _get(path: str, **kwargs):
    try:
        return requests.get(
            base_url() + path, timeout=PHONEXA_TIMEOUT_SEC,
            headers=_headers(kwargs.pop("headers", None)), **kwargs
        )
    except requests.RequestException as exc:
        raise PhonexaUnavailable(str(exc)) from exc


def _post(path: str, timeout: int = PHONEXA_TIMEOUT_SEC, **kwargs):
    try:
        return requests.post(
            base_url() + path, timeout=timeout,
            headers=_headers(kwargs.pop("headers", None)), **kwargs
        )
    except requests.RequestException as exc:
        raise PhonexaUnavailable(str(exc)) from exc


# ── Profiles: GONE (shadow-playback-chapter-reading, D168) ───────────
#
# list_users / create_user / verify_user lived here. shadow is single-user
# now: the owner id is pinned in shadow's own database (appsettings.py) and
# shadow never lists, creates or verifies phonexa users.


# ── Settings: read ONCE, for the one-time import (appsettings.py) ───────
#
# shadow owns its settings now. This read is the only remaining settings
# call: the background import of the owner's `transcribeBackend` and
# `shadowTrimSilence`, which stops for good the first time phonexa answers.

def get_settings(user_id: int):
    resp = _get("/api/v1/settings", params={"userId": user_id})
    if not resp.ok:
        raise PhonexaUnavailable(f"HTTP {resp.status_code}")
    return resp.json()


# ── Praat analysis (the vowel domain keeps parselmouth) ────────────────

def analyze_praat(files, data):
    return _post("/analyze-praat", timeout=PHONEXA_ANALYZE_TIMEOUT_SEC, files=files, data=data)
