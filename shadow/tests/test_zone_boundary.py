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


def test_recordings_are_never_persisted():
    """The one thing this change must not quietly relax.

    shadow stores the AUDIOBOOK. It must never gain a route that accepts
    the learner's own take for storage — that is what keeps the database
    dump a complete backup and the audio volume disposable.
    """
    import ast

    source = (ROOT / "shadowing.py").read_text()
    tree = ast.parse(source)
    for node in ast.walk(tree):
        if isinstance(node, ast.FunctionDef):
            body = ast.get_source_segment(source, node) or ""
            if "request.files" in body:
                raise AssertionError(
                    f"shadowing.{node.name} accepts an uploaded FILE — recordings "
                    "must stay ephemeral and no persistence route may take audio"
                )
    # And no route anywhere in the service may be named for taking one.
    assert "/recordings" not in source and "/takes" not in source


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
