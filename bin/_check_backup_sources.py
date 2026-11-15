#!/usr/bin/env python3
"""Does smia's backup exclusion list still rest on files that exist?

THE CLAIM THIS CHECKS, from `backup/entrypoint.sh` before 2026-11-14:

    smia holds NO irreplaceable data. ... every one is schema, a cache, or an
    imported corpus rebuilt by scripts/import_*.py from providers/ — which is
    itself tracked in git, so smia's real backup is already in the monorepo.

That audit was done by READING the table list. Running the import refuted it:

    [bootstrap] skipping scripts.import_nst:
        No such file: 'providers/nbno/nb_uttale_leksika.zip'
    [bootstrap] skipping scripts.import_leipzig:
        No such file: 'providers/leipzig/nob-no_web_2020_1M.tar.gz'

`nst_lexicon`, `nst_dialect` and the Leipzig rows of `corpus_sentence` are on
the `--exclude-table-data` list AND have no source in the repository, so they
are backed by nothing. All three are 0 rows today, which is the only reason
nothing has been lost.

The fix for the comment is prose. The fix for the CLASS of defect is this
file: every provider path smia's bootstrap names is checked against the
working tree on every `bin/check-standards.sh` run, and a path that is absent
and not already acknowledged below is a violation. A fourth
excluded-and-sourceless table cannot appear silently the way the first three
did.

Prints `SOURCES=<n>` and one `P:<problem>` line per violation, plus `N:` for
notes. Exit 0 always — the caller decides severity, exactly as
_check_services.py does.
"""
import pathlib
import subprocess
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
BOOTSTRAP = ROOT / "smia" / "scripts" / "bootstrap.py"
PROVIDERS = ROOT / "smia"

# Provider archives that are KNOWN to be absent from this repository, with
# the tables they leave unbacked. Acknowledged in backup/entrypoint.sh's
# category C: both are public re-downloads, both are large, and including
# their tables in a daily git commit would cost hundreds of megabytes a day
# for data an operator can fetch again. Listed here so the state is asserted
# rather than rediscovered.
ACKNOWLEDGED_MISSING = {
    "providers/nbno/nb_uttale_leksika.zip": "nst_lexicon, nst_dialect",
    "providers/leipzig/nob-no_web_2020_1M.tar.gz": "corpus_sentence (web_2020)",
    "providers/leipzig/nob_news_2013_1M.tar.gz": "corpus_sentence (news_2013)",
    "providers/leipzig/nob_wikipedia_2014_1M.tar.gz": "corpus_sentence (wikipedia_2014)",
}

if not BOOTSTRAP.is_file():
    print(f"P:cannot read {BOOTSTRAP.relative_to(ROOT)} — the provider list could not be checked")
    print("SOURCES=0")
    sys.exit(0)

text = BOOTSTRAP.read_text(encoding="utf-8")
# Every "providers/..." literal in the file. Deliberately a regex over the
# source rather than an import: importing smia's bootstrap pulls in Flask,
# SQLAlchemy and every adapter, none of which this check needs or should
# require to be installed on the host.
paths = sorted(set(re.findall(r'"(providers/[^"]+)"', text)))

problems = []
notes = []
def is_tracked(path):
    """Is this path committed to git? (not just sitting on disk)"""
    try:
        return subprocess.run(
            ["git", "ls-files", "--error-unmatch", str(path)],
            cwd=str(ROOT), capture_output=True, check=False,
        ).returncode == 0
    except OSError:
        return False


for rel in paths:
    # One entry is a glob (`providers/dict/*.txt` — dict.cc's dump filenames
    # are download tokens, not stable names, so bootstrap.py matches on each
    # file's own header line). "At least one match" is the right test there.
    # TRACKED, not merely present on this filesystem. The claim under test is
    # "the table is rebuildable from what the repository carries" - so a
    # gitignored local download does not satisfy it, and treating it as if it
    # did makes this check answer differently per machine. Found live: these
    # archives sit untracked on the dev box, so the check reported them
    # "now present" here while production genuinely cannot re-import the 9M
    # rows they feed. A backup-policy check that is machine-dependent is worse
    # than no check.
    if "*" in rel:
        exists = any(is_tracked(m) for m in PROVIDERS.glob(rel))
    else:
        exists = is_tracked(PROVIDERS / rel)
    if exists and rel in ACKNOWLEDGED_MISSING:
        # Good news that invalidates a written claim. A note, not a failure:
        # adding a provider archive is a legitimate operator action and must
        # not turn the gate red — but backup/entrypoint.sh now describes the
        # tables it feeds as unbacked, and that has stopped being true.
        notes.append(
            f"{rel} is now present — move {ACKNOWLEDGED_MISSING[rel]} out of category C "
            "in backup/entrypoint.sh (and decide whether to back the table data up)"
        )
    elif not exists and rel not in ACKNOWLEDGED_MISSING:
        problems.append(
            f"smia names {rel} but it is not in the tree, and it is not in "
            "ACKNOWLEDGED_MISSING — the table it feeds is excluded from the backup "
            "with nothing to rebuild it from"
        )

print(f"SOURCES={len(paths)}")
for n in notes:
    print("N:" + n)
for p in problems:
    print("P:" + p)
