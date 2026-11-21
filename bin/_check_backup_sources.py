#!/usr/bin/env python3
"""Does every backup exclusion still rest on a source that exists?

TWO CHECKS, ONE FILE. Both answer the same question — "is this excluded table
backed by anything at all?" — against two different kinds of source.

  A. Every `--exclude-table-data` in `backup/entrypoint.sh` must name a table
     with a DECLARED source (below). This is the general guard: a fourth
     sourceless exclusion cannot appear silently the way the first three did.
  B. Every provider archive smia's bootstrap names must be in the tree, or
     acknowledged absent with the tables it leaves unbacked.

Check A was added by `userdata-git-history`, which created a genuinely new
category: `userdata` and `userdata_history` are excluded from the dump and
their source is neither a repository file nor a cache but THE BACKUP REPO'S
OWN EXPORT, `userdata/<uid>.json`. That is asserted here rather than left to
be rediscovered — and the assertion has teeth in both directions: excluding
those tables while `backup/entrypoint.sh` contains no exporter is itself
reported, because account data excluded with no archive behind it is gone.

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
ENTRYPOINT = ROOT / "backup" / "entrypoint.sh"

# EVERY TABLE THE BACKUP DELIBERATELY EXCLUDES, AND WHAT BACKS IT INSTEAD.
# A `--exclude-table-data` for a table that is not in here is a violation —
# that is the whole point, and it is what keeps this check from being
# weakened by the very change that added it. Adding a table here is a
# decision someone has to write down, not an omission anyone can make.
DECLARED_EXCLUSIONS = {
    "job_logs": "regenerable machine output — pure run-history bookkeeping (D-B4b)",
    "build_jobs": "regenerable machine output — pure run-history bookkeeping (D-B4b)",
    # The new category (D167). Not a cache, not regenerable, and not a file in
    # THIS repository: the source is the backup repository's own export,
    # written by export_userdata() in the same run, before the same commit.
    "userdata": "the backup repo's own export, userdata/<uid>.json",
    "userdata_history": (
        "deliberately not archived at all — a rolling 48h window feeding the "
        "console's per-PATCH tier, superseded by userdata/<uid>.json"
    ),
}

# The exclusion of `userdata` is only safe BECAUSE the exporter exists. If one
# of these ever appears without the other, the dump carries no account data
# and nothing else does either.
EXPORT_BACKED = {"userdata"}
EXPORT_MARKER = "export_userdata"

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

# ---- check A: every --exclude-table-data has a declared source ------------
excluded = []
if not ENTRYPOINT.is_file():
    problems.append(
        f"cannot read {ENTRYPOINT.relative_to(ROOT)} — the backup's table "
        "exclusions could not be checked at all"
    )
else:
    entry = ENTRYPOINT.read_text(encoding="utf-8")
    # Every exclusion the script really passes to pg_dump. A regex over the
    # source for the same reason check B uses one: running the script is not
    # an option, and the flag is the thing that takes effect.
    excluded = sorted(set(re.findall(r"--exclude-table-data=([A-Za-z0-9_]+)", entry)))
    for table in excluded:
        if table not in DECLARED_EXCLUSIONS:
            problems.append(
                f"backup/entrypoint.sh excludes `{table}` from a dump but no source is "
                "declared for it in bin/_check_backup_sources.py's DECLARED_EXCLUSIONS "
                "— an excluded table whose source does not exist is backed by nothing"
            )
    for table in sorted(EXPORT_BACKED):
        if table in excluded and EXPORT_MARKER not in entry:
            problems.append(
                f"backup/entrypoint.sh excludes `{table}` but has no {EXPORT_MARKER}() — "
                "the account data is in neither the dump nor an export"
            )
        if table not in excluded and EXPORT_MARKER in entry:
            notes.append(
                f"backup/entrypoint.sh exports account documents but still dumps `{table}` — "
                "harmless (the dump is merely large), and expected only mid-rollout"
            )

print(f"SOURCES={len(paths)}")
print(f"EXCLUSIONS={len(excluded)}")
for n in notes:
    print("N:" + n)
for p in problems:
    print("P:" + p)
