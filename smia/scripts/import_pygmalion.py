"""
scripts/import_pygmalion.py — load the Pygmalion recordings fetched by
`scripts/fetch_pygmalion_audio.py` into smia: each mp3 goes into the private
content-addressed audio cache (`audio_cache.store`) and its
word / dialect / take -> sha256 mapping into `pygmalion_audio`, which is what
the `pygmalion` /tts adapter queries.

Reads only committed files (the manifest and the mp3s beside it) — no network.
Every file's sha256 is checked against the manifest before it enters the
cache, so a corrupted or substituted file is skipped, not served. Rows marked
`surplus: true` (Slow recordings, or more than the first 2 Normal takes per
word/dialect — see `fetch_pygmalion_audio.mark_surplus`) are skipped the same
way, so the table holds only what /tts should serve.

Idempotent: `store()` is a no-op for known bytes and existing mapping rows are
left alone, so re-running (or a half-finished earlier run) is safe. To pick up
newly fetched words, truncate `pygmalion_audio` and restart — bootstrap only
imports when that table is empty (design D3/Risks).

Run interactively for a live progress display (processed/total, running
imported/existing/surplus counts), like `fetch_pygmalion_audio.py download`'s.
Without `rich` installed, or without a TTY (bootstrap's runtime image, piped
output), it falls back to plain stderr lines with identical behavior:

  python -m scripts.import_pygmalion providers/pygmalion/audio/manifest.jsonl
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from pathlib import Path

from audio_cache import store
from db.models import PygmalionAudio
from db.session import session_scope

try:
    from rich.console import Console
    from rich.progress import BarColumn, MofNCompleteColumn, Progress, TaskProgressColumn, TextColumn
except ImportError:  # not installed in the runtime image — bootstrap must still work
    Console = None  # type: ignore[assignment,misc]


def _rows(manifest: Path):
    with manifest.open(encoding="utf-8") as f:
        for n, line in enumerate(f, 1):
            line = line.strip()
            if line:
                try:
                    yield json.loads(line)
                except json.JSONDecodeError as exc:
                    print(f"[import_pygmalion] {manifest}:{n}: skipping invalid JSON line ({exc})", file=sys.stderr)


class _ProgressReporter:
    """Live `rich` bar when stdout is a terminal and `rich` is importable;
    otherwise a plain stderr line every time a counter changes — same
    information either way, and no dependency bootstrap needs."""

    def __init__(self, total: int):
        self.counts = {"imported": 0, "existing": 0, "surplus": 0, "skipped": 0, "mismatched": 0}
        self._total = total
        self._n = 0
        self._live = None
        self._task = None
        if Console is not None and Console().is_terminal:
            self._console = Console()
            self._progress = Progress(
                TextColumn("[bold]import_pygmalion"),
                BarColumn(),
                MofNCompleteColumn(),
                TaskProgressColumn(),
                TextColumn("{task.fields[counters]}"),
                console=self._console,
            )
            self._task = self._progress.add_task("import", total=total, counters=self._counter_text())
            self._progress.start()
        else:
            self._progress = None

    def _counter_text(self) -> str:
        c = self.counts
        return f"imported {c['imported']}  existing {c['existing']}  surplus {c['surplus']}"

    def advance(self, outcome: str) -> None:
        self.counts[outcome] += 1
        self._n += 1
        if self._progress is not None:
            self._progress.update(self._task, completed=self._n, counters=self._counter_text())
        elif self._n % 200 == 0 or self._n == self._total:
            print(f"[import_pygmalion] {self._n}/{self._total}  {self._counter_text()}", file=sys.stderr)

    def stop(self) -> None:
        if self._progress is not None:
            self._progress.stop()


def run(manifest_path: str) -> dict:
    """Returns `{imported, existing, skipped, mismatched, surplus}` counts."""
    manifest = Path(manifest_path)
    if not manifest.is_file():
        raise FileNotFoundError(f"pygmalion manifest not found: {manifest}")
    base = manifest.parent
    total = sum(1 for _ in _rows(manifest))

    progress = _ProgressReporter(total)
    counts = progress.counts
    try:
        with session_scope() as db:
            for row in _rows(manifest):
                if row.get("surplus"):
                    progress.advance("surplus")
                    continue
                if row.get("status") != "ok":
                    progress.advance("skipped")
                    continue
                path = base / row["path"]
                try:
                    data = path.read_bytes()
                except OSError:
                    print(f"[import_pygmalion] missing file {path}, skipping", file=sys.stderr)
                    progress.advance("skipped")
                    continue
                if hashlib.sha256(data).hexdigest() != row.get("sha256"):
                    print(f"[import_pygmalion] sha256 mismatch for {path}, skipping", file=sys.stderr)
                    progress.advance("mismatched")
                    continue

                sha256 = store(db, data, "audio/mpeg")
                key = (row["word"].casefold(), row["dialect"], row["take"])
                if db.get(PygmalionAudio, key) is not None:
                    progress.advance("existing")
                    continue
                db.add(PygmalionAudio(word=key[0], dialect=key[1], take=key[2], sha256=sha256))
                progress.advance("imported")
            db.commit()
    finally:
        progress.stop()

    print(
        "[import_pygmalion] {imported} imported, {existing} already present, {surplus} surplus, "
        "{skipped} skipped, {mismatched} hash-mismatched".format(**counts),
        file=sys.stderr,
    )
    return counts


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("manifest", help="providers/pygmalion/audio/manifest.jsonl")
    run(ap.parse_args().manifest)
