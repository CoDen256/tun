"""
The split's invariants, as tests rather than as prose.

These are deliberately database-free: they assert the SHAPE of the zone
boundary, which is what a careless edit would break. Behaviour that needs a
real cluster is verified in the change's own verification tasks, not here.

    cd shadow && python -m pytest
"""

import pathlib

import pytest

ROOT = pathlib.Path(__file__).resolve().parent.parent


def test_no_cross_service_foreign_key_on_user_id():
    """D42: `users` lives in phonexa's database, so nothing here may point at it."""
    models = (ROOT / "db" / "models.py").read_text()
    assert 'ForeignKey("users.id"' not in models
    assert "ForeignKey('users.id'" not in models
    # And the column still exists, as a plain integer.
    assert "user_id: Mapped[int] = mapped_column(Integer, nullable=False, index=True)" in models


def test_shadow_mounts_exactly_one_audio_volume_and_no_other_zone_s_data():
    """shadow now stores audio — and exactly one thing, in one place.

    THIS TEST WAS INVERTED ON 2026-11-15 (shadow-studying-mode). It used to
    assert that shadow declared NO named volume at all, because shadow
    stored no audio. The operator reversed that rule knowingly: the phone
    cannot study from a file that only exists in a desktop browser. The
    test is rewritten rather than deleted, because the invariant underneath
    it never changed — shadow may own ITS OWN audio and nothing else, and
    it must never reach into another zone's data.

    (An earlier generation of this test asserted `"    volumes:" not in
    compose`, which could never pass, since shadow legitimately binds
    `../libs:/libs:ro`. A test that forbids a string rather than a thing
    fails on correct code and trains you to ignore a red suite.)
    """
    compose = (ROOT / "compose.yaml").read_text()
    # Exactly one declared data store, and it is shadow's own.
    assert "\nvolumes:\n  shadow_audio:" in compose, "shadow must declare its own audio volume"
    assert compose.count("\nvolumes:") == 1, "shadow declares more than one top-level volumes: block"
    for forbidden in ("phonexa_audio", "stabbur_", "mjolnir_", "/ota", "/blob"):
        assert forbidden not in compose, f"shadow must not mount {forbidden}"
    # Every bind mount is still read-only shared source; the audio volume is
    # the only read-write mount.
    mounts = [l.strip()[2:] for l in compose.splitlines()
              if l.strip().startswith("- ") and ":" in l and "/" in l
              and not l.strip().startswith('- "')]
    for m in mounts:
        assert m.endswith(":ro") or m == "shadow_audio:/data/audio", \
            f"unexpected writable mount: {m}"


# Every route in shadowing.py that is ALLOWED to read a request body of
# bytes, and why. Anything else that reads one fails the guard below.
# Keeping it as an allowlist is the point: a new endpoint must be named
# here deliberately, in a test whose docstring says what the rule is.
BODY_READING_ROUTES = {
    # shadowing.py — persistence.
    "append_upload_slice": "one slice of the AUDIOBOOK's resumable upload",
    # app.py — pure proxies. Each takes the learner's own audio and
    # forwards it to another service without ever touching the disk; the
    # second assertion below is what holds them to that (design.md §7).
    "http_transcribe": "forwards one sentence of the AUDIOBOOK to smia; stores nothing",
    "analyze_praat": "forwards the learner's take to phonexa for a pitch "
                     "contour, transiently; stores nothing, here or there",
}

# Of those, the ones that must additionally never open a file.
MUST_NOT_WRITE = ("http_transcribe", "analyze_praat")

# The ways a Flask route can take a body. `request.files` was the only one
# the first version of this guard knew about — and this change's own upload
# path uses `request.stream`, so a recordings endpoint written in exactly
# the style of the code next to it would have sailed through.
BODY_ACCESSORS = ("files", "stream", "data", "form", "get_data", "input_stream")


def _body_reading_functions(source: str):
    """Every function in `source` that reads a request body, and how.

    One implementation, used both by the guard and by the test that proves
    the guard bites — a guard verified against planted code it never
    actually runs on is the failure mode this file keeps re-learning.
    """
    import ast

    found = {}
    for node in ast.walk(ast.parse(source)):
        if not isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
            continue
        used = {
            inner.attr for inner in ast.walk(node)
            if isinstance(inner, ast.Attribute)
            and isinstance(inner.value, ast.Name) and inner.value.id == "request"
            and inner.attr in BODY_ACCESSORS
        }
        if used:
            found[node.name] = sorted(used)
    return found


def test_recordings_are_never_persisted():
    """The one thing this change must not quietly relax.

    shadow stores the AUDIOBOOK. It must never gain a route that accepts
    the learner's own take for storage — that is what keeps the database
    dump a complete backup and the audio volume disposable (design.md §7).

    THIS GUARD WAS TOO NARROW UNTIL 2026-11-16: it scanned for
    `request.files` only, while shadow's own upload path streams with
    `request.stream`, so a recordings endpoint written in exactly the
    style of the code next to it would have sailed through. It now
    enumerates every function that reads a body in ANY style this codebase
    uses and demands each one be on a named allowlist. The code it was
    written against is clean; the test was the defect.
    """
    import ast  # noqa: PLC0415

    sources = {name: (ROOT / name).read_text() for name in ("shadowing.py", "app.py")}
    offenders = {}
    for module, source in sources.items():
        for name, acc in _body_reading_functions(source).items():
            if name not in BODY_READING_ROUTES:
                offenders[f"{module}:{name}"] = acc

    # A proxy that gained a file write would be persistence by another name.
    for module, source in sources.items():
        for node in ast.walk(ast.parse(source)):
            if not isinstance(node, ast.FunctionDef) or node.name not in MUST_NOT_WRITE:
                continue
            for inner in ast.walk(node):
                opened = (isinstance(inner, ast.Call)
                          and getattr(inner.func, "id", getattr(inner.func, "attr", ""))
                          in ("open", "write_bytes", "write_text", "save", "copyfileobj"))
                assert not opened, (
                    f"{module}:{node.name} writes the learner's audio to disk — "
                    "takes are transient and are never stored"
                )

    assert not offenders, (
        "these functions read a request body and are not on the allowlist: "
        + "; ".join(f"{name} (request.{', request.'.join(acc)})"
                    for name, acc in offenders.items())
        + " — recordings must stay ephemeral and no route may persist the "
          "learner's own audio. If this is a new AUDIOBOOK route, add it to "
          "BODY_READING_ROUTES with the reason."
    )
    # And no route anywhere in the service may be named for taking one.
    for forbidden in ("/recordings", "/takes", "/recording", "/take"):
        for module, source in sources.items():
            assert f"'{forbidden}" not in source and f'"{forbidden}' not in source, \
                f"{module} declares a route at {forbidden} — a place to put a recording"


@pytest.mark.parametrize("accessor", BODY_ACCESSORS)
def test_the_recordings_guard_would_catch_a_planted_route(accessor):
    """The guard run against a violation in each style, so it cannot pass
    by being blind. A test that cannot fail on bad code is a green light.
    """
    planted = (
        "@shadowing_bp.route('/api/v1/shadowing/sessions/<i>/take', methods=['PUT'])\n"
        "def store_take(i):\n"
        f"    blob = request.{accessor}\n"
        "    open('/data/audio/take.webm', 'wb').write(blob)\n"
    )
    found = _body_reading_functions(planted)
    assert found.get("store_take") == [accessor], \
        f"the guard would miss a recordings route using request.{accessor}"
    assert "store_take" not in BODY_READING_ROUTES


def test_shadow_does_not_import_phonexa_models():
    """The only link to phonexa is HTTP, in one file.

    Checks IMPORT STATEMENTS, parsed, rather than substrings anywhere in the
    file. The first version grepped for "parselmouth" and failed on a prose
    comment explaining that shadow deliberately does NOT need it — a test
    that cannot tell code from a comment about code.
    """
    import ast

    for name in ("app.py", "shadowing.py"):
        path = ROOT / name
        if not path.exists():
            continue
        tree = ast.parse(path.read_text())
        imported = set()
        for node in ast.walk(tree):
            if isinstance(node, ast.Import):
                imported.update(a.name.split(".")[0] for a in node.names)
            elif isinstance(node, ast.ImportFrom):
                if node.module:
                    imported.add(node.module.split(".")[0])
                imported.update(a.name for a in node.names)
        for forbidden in ("parselmouth", "formanter", "get_audio_store", "ShadowingMedia_phonexa"):
            assert forbidden not in imported, f"{name} imports {forbidden} from phonexa's domain"


@pytest.mark.parametrize("route", [
    "/api/v1/shadowing/media",
    "/transcribe",
    "/transcribe/providers",
    "/api/v1/youtube-extract",
])
def test_moved_routes_are_registered(route):
    import sys
    sys.path.insert(0, str(ROOT))
    from app import app  # noqa: PLC0415

    rules = {r.rule for r in app.url_map.iter_rules()}
    assert route in rules
