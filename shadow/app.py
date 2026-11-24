"""
app.py — shadow: the shadowing-practice zone.

Split out of phonexa by zone-isolation task 3. phonexa kept the vowel/
consonant/formant domain (languages, samples, analyses, tokens, vowels,
consonants, users, settings); shadow took the shadowing domain
(shadowing_media, shadowing_segments) and the two stateless endpoints that
only shadowing ever used.

WHAT MOVED AND WHY EACH PIECE IS HERE
-------------------------------------
* `shadowing.py` — the persistence blueprint, unchanged in shape. It was
  already a self-contained Blueprint on its own /api/v1/shadowing/*
  namespace importing only its own two models, so the file boundary already
  matched the domain boundary.
* `/transcribe` and `/transcribe/providers` — a pure proxy to smia's STT.
  Stateless: VERIFIED, they touch no model, no session and no file, only
  SMIA_BASE_URL/INTERNAL_TOKEN and the uploaded slice. Only the shadowing
  page and the shadowing settings page ever called them.
* `/api/v1/youtube-extract` — shells out to yt-dlp, streams the WAV back,
  writes nothing. Stateless: VERIFIED. Its comment in phonexa called it
  "Formant Lab ingest-mode entry point", but its only caller has always been
  the shadowing page (Formant Lab's own ingest takes a file/blob, never a
  URL) — the stale comment is corrected here. Since shadow-studying-mode the
  caller is js/library.js, which feeds the extracted WAV into the same
  chunked upload a dropped file uses; js/shadow.js itself is gone. Moving it also moves the two
  hang-prone subprocesses (yt-dlp, ffmpeg) out of the service that holds the
  vowel chart, which was half the point of the split.
* the shadowing pages — shadow.html and settings.html. settings.html is
  entirely shadowing: a transcription-provider form and a shadowing-progress
  list, nothing about vowels.

WHAT SHADOW NEEDS FROM PHONEXA — see phonexa_client.py's docstring for the
whole finding. Short version: NOT audio storage — but note that the
parenthetical this line used to carry, "there is no audio to store, shadow
mounts no volume", stopped being true with shadow-studying-mode: shadow now
keeps ONE mono Opus master per book in its own volume (audio.py,
shadowing.py). What shadow still needs from phonexa is profiles, settings
and /analyze-praat, proxied server-side so the browser only ever talks to
/shadow/*.
(CORRECTION, 2026-11-24, D168: profiles and settings are no longer
needed from phonexa — shadow is single-user and keeps its settings in its
own database, appsettings.py. /analyze-praat and the Formant Lab handoff
remain.)

SERVE-BEFORE-MIGRATE. This module defines the app and nothing else; the
container runs it through scripts/bootstrap.py, which binds the port first
and migrates in the background behind a readiness flag
(libs/pyservice/bootstrap.py, zone-isolation task 1.2 — the same shape
phonexa, stabbur and smia use). That is also where the `/_health` route and
the per-prefix database guard come from, which is why neither is here. The
`python app.py` fallback at the bottom is for a native dev run only and
does neither.
"""

from __future__ import annotations

import json
import os
import re
import shutil
import subprocess
import tempfile
from urllib.parse import urlsplit

import requests
from flask import (
    Flask,
    abort,
    after_this_request,
    jsonify,
    request,
    send_file,
    send_from_directory,
)
from flask_cors import CORS
from pyservice.auth import register_auth
from pyservice.prefix import forwarded_prefix, render_page, safe_page_path

import phonexa_client
from appsettings import settings_bp
from shadowing import shadowing_bp

app = Flask(__name__)
# flask-cors IS STILL LIVE HERE, AND THAT IS NOT WHAT THE SURROUNDING
# DOCUMENTATION USED TO SAY (corrected 2026-11-14, P57). `libs/pyservice/auth.py`
# claimed the service-side CORS answer had been removed in favour of the
# gateway's, and grind/caddy/Caddyfile reasons at length about "the gateway's
# `*` policy" as though it were the only one. Measured, with the stack up:
#
#   curl -H 'Origin: https://evil.example' .../smia/health
#       -> Access-Control-Allow-Origin: https://evil.example
#
# So there are TWO policies, in two places, and they disagree: the gateway
# answers the PREFLIGHT with `*`, and this line answers the ACTUAL request by
# REFLECTING whatever Origin asked.
#
# Kept, deliberately, until the extension lands (unified-auth 6.1/6.2). The
# gateway sets Access-Control-Allow-Origin on the preflight only — nothing in
# the Caddyfile adds it to a real response — so deleting this line would let
# a cross-origin preflight succeed and then have the browser discard the
# answer to the request it authorised. hover-translate (D154) is exactly that
# client and it is not in this repository, so the regression could not be
# caught here.
#
# Not exploitable as it stands: `Access-Control-Allow-Credentials` is never
# set, so a browser will not attach the operator cookie or basic credential to
# a cross-origin request, and a response read this way carries no authority
# the caller did not already have. It is a documentation defect, recorded
# rather than silently left: two CORS policies with a comment claiming one.
CORS(app)

# unified-auth 4.1/4.3. shadow had NO auth of its own until now — the only
# thing in front of it was the gateway's credential check, inherited when
# zone-isolation split it out of phonexa. The check is the shared one: the
# gateway-verified `X-Tun-Operator` marker, or `Authorization: Bearer
# INTERNAL_TOKEN`; otherwise 401. `/_health` stays open for the container
# probe and nothing else does.
register_auth(app)
app.register_blueprint(shadowing_bp)
app.register_blueprint(settings_bp)


# ══════════════════════════════════════════════════════════════════════════════
# Health — serving vs. ready (zone-isolation task 1.3)
# ══════════════════════════════════════════════════════════════════════════════

@app.route('/ping')
def ping():
    """Liveness, matching phonexa's /ping: 200 whenever the process serves.

    Deliberately NOT the container healthcheck. With serve-before-migrate,
    "the process is alive" no longer implies "the schema is there", so the
    probe is `/_health` — registered by scripts/bootstrap.py, 200 ready /
    503 degraded. This route stays because it is cheap, unconditional and
    the one thing you can curl to tell "shadow is down" from "shadow has no
    database".
    """
    return jsonify({'ok': True})


# ══════════════════════════════════════════════════════════════════════════════
# Transcription — a thin proxy to smia's speech-to-text. Moved verbatim from
# phonexa/formanter.py; shadow does not run a speech-recognition model
# itself: smia owns the providers and their credentials. smia's address and
# bearer token stay server-side — the browser only ever talks to the two
# routes below, never to smia or a provider.
# ══════════════════════════════════════════════════════════════════════════════

SMIA_STT_TIMEOUT_SEC = 60
SMIA_PROVIDERS_TIMEOUT_SEC = 5


def _smia_config():
    """(base_url, bearer_token) from the environment; token may be empty."""
    return (
        os.environ.get('SMIA_BASE_URL', 'http://smia-backend:5055').rstrip('/'),
        os.environ.get('INTERNAL_TOKEN', ''),
    )


def _smia_not_configured():
    return jsonify({'error': 'Transcription is not configured (INTERNAL_TOKEN is not set on the server)'}), 503


def _smia_unreachable(base_url):
    # Host only — never echo the token, and requests' own error text can carry
    # more than the caller needs.
    return jsonify({'error': f'smia not reachable at {urlsplit(base_url).netloc or base_url}'}), 503


def _smia_error_response(resp):
    """Relay a non-2xx smia answer to the browser without leaking credentials."""
    if resp.status_code in (401, 403):
        # Our own token was refused — not something the browser's user can fix,
        # and a bare 401 here would read as shadow's own login failing.
        return jsonify({'error': "smia rejected shadow's credentials (check INTERNAL_TOKEN)"}), 502
    try:
        body = resp.json()
    except ValueError:
        body = {}
    out = {'error': body.get('error') or f'smia returned HTTP {resp.status_code}'}
    if 'available' in body:
        out['available'] = body['available']
    return jsonify(out), resp.status_code


@app.route('/transcribe', methods=['POST'])
def http_transcribe():
    """
    Speech-to-text via smia (POST /stt). Called once per sentence slice by the
    shadowing page.

    Request (multipart/form-data)
    ------------------------------
    file      — audio file
    provider  — smia STT provider (e.g. 'hf_whisper'); smia requires one and
                answers 400 with the available list when it is missing
    language  — optional ISO 639-1 hint (e.g. 'sv'), forwarded to smia as
                ``lang``; omitted when empty

    Response
    --------
    { provider, text }   (text is '' when no speech was detected)
    """
    uploaded_file = request.files.get('file')
    if not uploaded_file:
        return jsonify({'error': 'No file uploaded'}), 400

    base_url, token = _smia_config()
    if not token:
        return _smia_not_configured()

    form = {}
    provider = (request.form.get('provider') or '').strip()
    if provider:
        form['provider'] = provider
    language = (request.form.get('language') or '').strip()
    if language:
        form['lang'] = language

    try:
        resp = requests.post(
            f'{base_url}/stt',
            headers={'Authorization': f'Bearer {token}'},
            files={'audio': (uploaded_file.filename or 'slice.wav', uploaded_file.stream,
                             uploaded_file.mimetype or 'application/octet-stream')},
            data=form,
            timeout=SMIA_STT_TIMEOUT_SEC,
        )
    except requests.RequestException:
        return _smia_unreachable(base_url)

    if not resp.ok:
        return _smia_error_response(resp)
    try:
        body = resp.json()
    except ValueError:
        return jsonify({'error': 'smia returned an unreadable response'}), 502
    return jsonify({'provider': body.get('provider', provider), 'text': body.get('text') or ''})


@app.route('/transcribe/providers', methods=['GET'])
def http_transcribe_providers():
    """The speech-to-text providers smia currently offers: { providers: [name, ...] }."""
    base_url, token = _smia_config()
    if not token:
        return _smia_not_configured()
    try:
        resp = requests.get(
            f'{base_url}/providers',
            headers={'Authorization': f'Bearer {token}'},
            timeout=SMIA_PROVIDERS_TIMEOUT_SEC,
        )
    except requests.RequestException:
        return _smia_unreachable(base_url)
    if not resp.ok:
        return _smia_error_response(resp)
    try:
        providers = resp.json().get('stt', [])
    except (ValueError, AttributeError):
        return jsonify({'error': 'smia returned an unreadable response'}), 502
    return jsonify({'providers': providers})


# ══════════════════════════════════════════════════════════════════════════════
# phonexa proxies — Praat analysis only. (Profiles and settings were
# proxied here too until D168; shadow owns its settings now.)
#
# Server-side, never from the browser: /shadow/* and /phonexa/* are two
# different basic_auth scopes at the gateway, and internal service-to-service
# calls do not pass through the gateway at all. Each one degrades to a 503
# with a reason the page can show, instead of a cascade.
# ══════════════════════════════════════════════════════════════════════════════

def _phonexa_down(exc):
    return jsonify({'error': f'phonexa not reachable — {exc}'}), 503


def _relay(resp):
    """Pass a phonexa answer straight through, body and status code."""
    try:
        return jsonify(resp.json()), resp.status_code
    except ValueError:
        return jsonify({'error': 'phonexa returned an unreadable response'}), 502


# /api/v1/users and /api/v1/settings USED TO BE proxied to phonexa here.
# Both are gone (shadow-playback-chapter-reading, D168): there are no
# profiles, and settings are shadow's own — see appsettings.py, whose
# blueprint now answers /api/v1/settings from shadow's database.


@app.route('/analyze-praat', methods=['POST'])
def analyze_praat():
    """The 🎵 pitch comparison. parselmouth stays with the vowel domain, so
    this forwards the recorded slice to phonexa and relays the result."""
    uploaded_file = request.files.get('file')
    if not uploaded_file:
        return jsonify({'error': 'No file uploaded'}), 400
    try:
        resp = phonexa_client.analyze_praat(
            files={'file': (uploaded_file.filename or 'audio.wav', uploaded_file.stream,
                            uploaded_file.mimetype or 'application/octet-stream')},
            data={'config': request.form.get('config', '{}')},
        )
    except phonexa_client.PhonexaUnavailable as exc:
        return _phonexa_down(exc)
    return _relay(resp)


# ══════════════════════════════════════════════════════════════════════════════
# YouTube audio extraction — the shadowing page's "paste a URL" entry point.
# Shells out to yt-dlp (which itself shells out to ffmpeg for the audio-
# extraction postprocessing step — see the Dockerfile). Always argument-list
# subprocess calls (never shell=True/string interpolation) since the URL is
# untrusted user input reaching a shell-adjacent tool.
#
# Moved here from phonexa, where its comment claimed it was Formant Lab's
# ingest entry point. It was not: the shadowing page is the only caller
# anywhere in the tree (verified by grep across every html/js file), which is
# why this endpoint could move without touching Formant Lab at all. That
# caller is js/library.js since shadow-studying-mode replaced js/shadow.js.
# ══════════════════════════════════════════════════════════════════════════════

YOUTUBE_MAX_DURATION_SEC = 2 * 60 * 60  # ~2h cap — same unbounded-decode risk Shadowing hit, avoided up front


@app.route('/api/v1/youtube-extract', methods=['POST'])
def youtube_extract():
    data = request.get_json(silent=True) or {}
    url = (data.get('url') or '').strip()
    if not re.match(r'^https?://', url):
        return jsonify({'error': 'a valid http(s) URL is required'}), 400

    try:
        probe = subprocess.run(
            ['yt-dlp', '-j', '--no-playlist', url],
            capture_output=True, text=True, timeout=30,
        )
    except subprocess.TimeoutExpired:
        return jsonify({'error': 'Timed out fetching video info'}), 504
    if probe.returncode != 0:
        return jsonify({'error': 'Could not fetch video info: ' + (probe.stderr or '').strip()[:300]}), 400
    try:
        info = json.loads(probe.stdout)
    except json.JSONDecodeError:
        return jsonify({'error': 'Could not parse video info'}), 502
    duration = info.get('duration')
    if duration and duration > YOUTUBE_MAX_DURATION_SEC:
        return jsonify({
            'error': f'Video is {duration / 60:.0f} min — longer than the '
                     f'{YOUTUBE_MAX_DURATION_SEC // 60} min cap for this feature',
        }), 400

    tmp_dir = tempfile.mkdtemp(prefix='ytaudio-')

    @after_this_request
    def _cleanup(response):
        shutil.rmtree(tmp_dir, ignore_errors=True)
        return response

    out_template = os.path.join(tmp_dir, 'audio.%(ext)s')
    try:
        dl = subprocess.run(
            ['yt-dlp', '--no-playlist', '-f', 'bestaudio', '-x', '--audio-format', 'wav', '-o', out_template, url],
            capture_output=True, text=True, timeout=600,
        )
    except subprocess.TimeoutExpired:
        return jsonify({'error': 'Timed out downloading/extracting audio'}), 504
    if dl.returncode != 0:
        return jsonify({'error': 'Download failed: ' + (dl.stderr or '').strip()[:300]}), 502

    wav_path = os.path.join(tmp_dir, 'audio.wav')
    if not os.path.exists(wav_path):
        return jsonify({'error': 'Extraction did not produce an audio file'}), 502
    return send_file(wav_path, mimetype='audio/wav', as_attachment=False)


# ══════════════════════════════════════════════════════════════════════════════
# Static frontend — same prefix-aware shape phonexa, stabbur and smia use
# (D46/D119), with ONE addition: these pages also need to know where phonexa
# is in the BROWSER's URL space, because the Vowel Chart links and the
# Formant Lab handoff are navigations the human follows, not data calls.
# ══════════════════════════════════════════════════════════════════════════════

# unified-auth 5.2: one implementation, in libs/pyservice/prefix.py. This
# was the fourth copy of the same six lines.
_prefix = forwarded_prefix


def _serve_page(filename: str):
    """Serve an HTML page with both prefixes substituted in.

    __SHADOW_PREFIX__  → this service's own mount point (API_BASE).
    __PHONEXA_PREFIX__ → phonexa's mount point as the BROWSER sees it, for
                         the header links and the Formant Lab handoff. Not
                         the same thing as PHONEXA_BASE_URL, which is the
                         internal address the browser can never reach.

    Only HTML is read-and-rewritten; every other asset streams through
    send_from_directory untouched.
    """
    return render_page(app.root_path, filename,
                       SHADOW_PREFIX=_prefix(),
                       PHONEXA_PREFIX=phonexa_client.public_prefix())


# ── The PWA manifest (shadow-playback-chapter-reading D8, task 5.1) ────
#
# A route rather than a static file for two reasons: start_url and scope
# must be shadow's prefix AS SERVED (X-Forwarded-Prefix — '/shadow' behind the
# gateway, '' on a published port), which is the same substitution
# _serve_page makes; and the MIME type must be application/manifest+json,
# which this sets itself instead of trusting the platform's mimetypes table.
# No service worker and no offline mode (non-goal). It sits behind the same
# operator gate as every page — the <link> asks for it with credentials.

SHADOW_THEME = '#f6f6f4'       # --bg (light) in css/studio.css, as the page's theme-color meta
SHADOW_BACKGROUND = '#f6f6f4'  # --bg (light) in css/studio.css


@app.route('/manifest.webmanifest')
def web_manifest():
    base = _prefix() + '/'
    body = {
        'name': 'shadow',
        'short_name': 'shadow',
        'description': 'Shadowing audiobooks, sentence by sentence.',
        'id': base,
        'start_url': base,
        'scope': base,
        'display': 'standalone',
        'theme_color': SHADOW_THEME,
        'background_color': SHADOW_BACKGROUND,
        'icons': [
            {'src': base + 'icons/icon-192.png', 'sizes': '192x192', 'type': 'image/png',
             'purpose': 'any'},
            {'src': base + 'icons/icon-512.png', 'sizes': '512x512', 'type': 'image/png',
             'purpose': 'any'},
            {'src': base + 'icons/icon-maskable-512.png', 'sizes': '512x512',
             'type': 'image/png', 'purpose': 'maskable'},
        ],
    }
    resp = app.response_class(json.dumps(body), mimetype='application/manifest+json')
    resp.headers['Cache-Control'] = 'no-cache'
    return resp


@app.route('/')
def serve_index():
    return _serve_page('shadow.html')


@app.route('/<path:path>')
def serve_static(path):
    # An unknown /api/ path must not be answered as a missing FILE. This
    # route is the catch-all, so `/api/v1/shadowing/media/1/segments` — a
    # plausible-looking URL that does not exist (the real route is
    # `.../segment`, singular, and POST-only) — fell through to
    # send_from_directory and came back as Flask's HTML 404 page with
    # Content-Type: text/html to a caller that had asked for JSON. Every
    # other error this service emits on /api/ is JSON; so is this one now.
    if path.startswith('api/'):
        return jsonify({'error': 'not found', 'path': '/' + path}), 404
    if path.endswith('.html'):
        # send_from_directory's safe_join rules still apply: resolve the
        # request against the app directory and refuse anything escaping it
        # before reading the file ourselves. One implementation, in
        # libs/pyservice/prefix.py — phonexa had the identical block.
        return _serve_page(safe_page_path(app.root_path, path))
    return send_from_directory('.', path)


if __name__ == '__main__':
    print('shadow — HTTP :5051')
    app.run(host='0.0.0.0', port=5051, threaded=True, debug=False)
