"""Crawler: NTNU CALST (testcalst.hf.ntnu.no) -> providers/calst/calst_manifest.json.

Private research use only. Metadata only: no audio is downloaded (that is
`scripts.fetch_pygmalion_audio`'s job, which walks every `wordList` in the
manifest this writes).

    python -m scripts.crawl_calst                          # full crawl, every dialect
    python -m scripts.crawl_calst --exercises 947 937 \\
        --dialects 1 --out /tmp/x.json                     # smoke test
    python -m scripts.crawl_calst --limit 5 --out /tmp/y.json   # first 5 exercises

A partial run (--exercises / --limit / --dialects) must name an --out other
than the default manifest, so it can never overwrite the full one.

Walk:  /account/settings (the dialect list)
       /Home/Lessons -> /Home/Lesson/N -> (/Exercise/no/ID?wrid=N
                                           | /Home/LessonGroup/G -> /Exercise/no/ID?wrid=G)
       -> POST /Exercises/Details {ExerciseId, wrid, vwrid, Type=LAS}  (x samples x dialects)

calst-full-coverage (2026-11-23):

* CALST answers each Details request with a RANDOM draw of at most ~20 words
  from the exercise's pool, and all exercise types share one pool. So only
  `LAS` is requested (it answers for every exercise) and each
  (exercise, dialect) is SAMPLED TO SATURATION: a first response with fewer
  than RESPONSE_CAP words is the whole pool (1 request); otherwise sampling
  continues until `k_needed(pool, draw)` consecutive samples add no new word,
  or MAX_SAMPLES is hit (-> `unsaturated`, a failure).
* Every `Calst.<Name> = [ ... ]` array that carries word lists is parsed
  (incl. `Calst.WordList`, also in the `Calst.WordList = Calst.WordList = [`
  form). A 200 that yields no word is a FAILURE, never an empty success.
  Only a successful sample is cached; a cached failing entry is ignored and
  re-requested, so a re-run never replays a failure.
* Every Norwegian `L2_Dialect` offered in the settings page's `l2d` selector
  is crawled; the dialect travels in the cookie.
* A failure is isolated to its (exercise, dialect); timeouts are retried once
  with RETRY_TIMEOUT; a 429 honours Retry-After with exponential backoff;
  ABORT_AFTER consecutive failed requests abort the run (report printed,
  manifest not written, non-zero exit). The run ends with a coverage report and exits non-zero
  if any (exercise, dialect) is unsaturated or failed.

Every HTTP response is cached gzipped under providers/calst/.cache/. A Details
sample is keyed by (request, dialect, sample index), so a re-run replays every
finished sample with zero network calls and never replays one sample as
another. The pre-2026-11-23 cache (keyed by the request alone, Oslo cookie)
is read as Oslo sample 0, and GET pages keep that legacy key (the lesson tree
does not depend on the dialect: /Home/Lessons is byte-identical for
L2_Dialect 1, 2 and 8).
"""
from __future__ import annotations

import argparse
import gzip
import hashlib
import html
import json
import math
import random
import re
import sys
import time
from pathlib import Path
from urllib.parse import parse_qs, urljoin, urlparse

import requests

BASE = "https://testcalst.hf.ntnu.no"
UA = "smia-research-crawler/0.2 (private research)"
OUT_DIR = Path(__file__).resolve().parent.parent / "providers" / "calst"
CACHE_DIR = OUT_DIR / ".cache"
OUT_FILE = OUT_DIR / "calst_manifest.json"

TYPE = "LAS"
OSLO = 1
RESPONSE_CAP = 20  # a first response with fewer words than this is the whole pool
MISS_EPSILON = 0.001  # tolerated chance that one still-unseen word survives K zero-gain draws
K_MIN = 2
MAX_SAMPLES = 300
TIMEOUT = 30
RETRY_TIMEOUT = 90
PACE = (0.5, 1.0)  # seconds between network requests (start to start, at least)
BACKOFF_429 = (5, 4, 300)  # first wait (s), attempts, max wait (s) — doubled each time
ABORT_AFTER = 10  # consecutive failed requests that abort the whole run


class CrawlAborted(RuntimeError):
    pass


def retry_after(value: str | None) -> float:
    """Seconds from a Retry-After header (delta-seconds form; an HTTP date
    or garbage counts as 0, i.e. the backoff schedule decides)."""
    try:
        return max(0.0, float(value)) if value is not None else 0.0
    except ValueError:
        return 0.0


def cookie_for(dialect: int | str) -> str:
    return f"IL1=en; L1=61; L2_Dialect={dialect}; L2_LanguageId=1; L2_Id=552"


# ---------------------------------------------------------------- HTTP + cache
def cache_key(method: str, path: str, data: dict | None,
              dialect: int = OSLO, sample: int | None = None) -> str:
    """The legacy key (request only) for GETs and for Oslo sample 0 — that is
    exactly what the pre-2026-11-23 cache holds; every other sample gets the
    dialect and the sample index in its key."""
    if sample is None or (dialect == OSLO and sample == 0):
        material = [method, path, data]
    else:
        material = [method, path, data, {"dialect": dialect, "sample": sample}]
    return hashlib.sha256(json.dumps(material, sort_keys=True).encode()).hexdigest()[:32]


class Client:
    def __init__(self, cache_dir: Path = CACHE_DIR) -> None:
        self.cache_dir = cache_dir
        self.s = requests.Session()
        self.s.headers.update({"User-Agent": UA})
        self.last = 0.0
        self.network_calls = 0
        self.consecutive_failures = 0

    def _sleep(self) -> None:
        wait = random.uniform(*PACE) - (time.monotonic() - self.last)
        if wait > 0:
            time.sleep(wait)

    def _fetch(self, method: str, url: str, data: dict | None, dialect: int,
               timeout: float) -> requests.Response:
        first, attempts, cap = BACKOFF_429
        for attempt in range(attempts + 1):
            self._sleep()
            self.last = time.monotonic()
            self.network_calls += 1
            self.s.cookies.clear()  # the cookie header below is the only state
            r = self.s.request(method, url, data=data, timeout=timeout, allow_redirects=False,
                               headers={"Cookie": cookie_for(dialect)})
            self.last = time.monotonic()
            if r.status_code != 429 or attempt == attempts:
                break
            wait = min(cap, max(retry_after(r.headers.get("Retry-After")), first * 2 ** attempt))
            print(f"  ! HTTP 429 on {method} {url}; backing off {wait:.0f}s", file=sys.stderr)
            time.sleep(wait)
        if r.status_code == 429 or r.status_code >= 500:
            raise RuntimeError(f"HTTP {r.status_code} on {method} {url}")
        return r

    def request(self, method: str, path: str, data: dict | None = None, *,
                dialect: int = OSLO, sample: int | None = None, accept=None) -> dict:
        """Returns {status, location, body}, cached (see cache_key) only if
        `accept(rec)` (default: HTTP 200) holds — a failure is never cached,
        and an already-cached entry that fails `accept` is treated as absent.
        A failed first attempt is retried once with RETRY_TIMEOUT; a second
        failure raises RuntimeError. Tracks consecutive failed requests."""
        accept = accept or (lambda rec: rec["status"] == 200)
        cf = self.cache_dir / f"{cache_key(method, path, data, dialect, sample)}.json.gz"
        if cf.exists():
            rec = json.loads(gzip.decompress(cf.read_bytes()))
            if accept(rec):
                return rec

        url = urljoin(BASE, path)
        try:
            try:
                r = self._fetch(method, url, data, dialect, TIMEOUT)
            except (requests.RequestException, RuntimeError) as first:
                print(f"  ! {method} {path} {data or ''} d={dialect}: {first}; "
                      f"retrying with {RETRY_TIMEOUT}s timeout", file=sys.stderr)
                time.sleep(5)
                try:
                    r = self._fetch(method, url, data, dialect, RETRY_TIMEOUT)
                except requests.RequestException as e:
                    raise RuntimeError(f"{e.__class__.__name__} on {method} {url} (after retry)") from e
        except RuntimeError:
            self.consecutive_failures += 1
            raise
        rec = {"status": r.status_code, "location": r.headers.get("Location"), "body": r.text}
        if not accept(rec):
            self.consecutive_failures += 1
            return rec
        self.consecutive_failures = 0
        self.cache_dir.mkdir(parents=True, exist_ok=True)
        tmp = cf.with_suffix(".tmp")
        tmp.write_bytes(gzip.compress(json.dumps(rec).encode()))
        tmp.replace(cf)
        return rec


# ------------------------------------------------------------------ HTML walk
TOKEN_RE = re.compile(
    r"<h(?P<lvl>[1-3])[^>]*>(?P<h>.*?)</h(?P=lvl)>"
    r"|<a\s[^>]*?href=\"(?P<href>[^\"]+)\"[^>]*>(?P<a>.*?)</a>",
    re.S | re.I,
)


def _text(fragment: str) -> str:
    return " ".join(html.unescape(re.sub(r"<[^>]+>", " ", fragment)).split())


def parse_page(page: str) -> list[dict]:
    """Document-order stream of links, each tagged with the headings above it."""
    heads = {"1": "", "2": "", "3": ""}
    out = []
    for m in TOKEN_RE.finditer(page):
        if m["lvl"]:
            heads[m["lvl"]] = _text(m["h"])
            for deeper in "23"[int(m["lvl"]) - 1 :]:  # h1 resets h2/h3, h2 resets h3
                if deeper > m["lvl"]:
                    heads[deeper] = ""
        else:
            out.append(
                {
                    "href": html.unescape(m["href"]),
                    "title": _text(m["a"]),
                    "h1": heads["1"],
                    "h2": heads["2"],
                    "h3": heads["3"],
                }
            )
    return out


def get_page(c: Client, path: str) -> list[dict]:
    rec = c.request("GET", path)
    if rec["status"] != 200:
        raise RuntimeError(f"GET {path} -> {rec['status']}")
    return parse_page(rec["body"])


_L2D_SELECT = re.compile(r"<select[^>]*\bname=\"l2d\"[^>]*>(.*?)</select>", re.S | re.I)
_OPTGROUP = re.compile(r"<optgroup\s+label=\"([^\"]*)\"\s*>(.*?)</optgroup>", re.S | re.I)
_OPTION = re.compile(r"<option[^>]*\bvalue=\"(\d+)\"[^>]*>(.*?)</option>", re.S | re.I)


def parse_dialects(page: str, language: str = "Norwegian") -> list[dict]:
    """The `L2_Dialect` values CALST offers for `language`, from the settings
    page's target-language selector (`<select name="l2d">`, one optgroup per
    language). Raises if the selector is missing — a silent empty list would
    crawl nothing and look like success."""
    m = _L2D_SELECT.search(page)
    if not m:
        raise RuntimeError("settings page has no l2d selector; cannot discover dialects")
    found = {}
    for g in _OPTGROUP.finditer(m[1]):
        if _text(g[1]) != language:
            continue
        for o in _OPTION.finditer(g[2]):
            found[int(o[1])] = _text(o[2])
    if not found:
        raise RuntimeError(f"l2d selector has no {language} options")
    return [{"dialect_id": k, "name": v} for k, v in sorted(found.items())]


def discover_dialects(c: Client) -> list[dict]:
    rec = c.request("GET", "/account/settings")
    if rec["status"] != 200:
        raise RuntimeError(f"GET /account/settings -> {rec['status']}")
    return parse_dialects(rec["body"])


# ----------------------------------------------------- JS literal -> JSON
# `Calst.X = [` and the chained `Calst.X = Calst.X = [` form.
_ARRAY_ASSIGN = re.compile(r"Calst\.(\w+)\s*=\s*(?:Calst\.\w+\s*=\s*)*\[")


def _array_at(js: str, start: int) -> str | None:
    """The bracket-balanced array literal starting at js[start] == '['."""
    depth, i, in_str, esc = 0, start, False, False
    while i < len(js):
        ch = js[i]
        if in_str:
            if esc:
                esc = False
            elif ch == "\\":
                esc = True
            elif ch == '"':
                in_str = False
        elif ch == '"':
            in_str = True
        elif ch == "[":
            depth += 1
        elif ch == "]":
            depth -= 1
            if depth == 0:
                return js[start : i + 1]
        i += 1
    return None


def _quote_keys(lit: str) -> str:
    """Quote bare object keys outside string literals: {a:1} -> {"a":1}."""
    out, i, n = [], 0, len(lit)
    while i < n:
        ch = lit[i]
        if ch == '"':
            j, esc = i + 1, False
            while j < n:
                if esc:
                    esc = False
                elif lit[j] == "\\":
                    esc = True
                elif lit[j] == '"':
                    break
                j += 1
            out.append(lit[i : j + 1])
            i = j + 1
        elif ch.isalpha() or ch == "_":
            j = i
            while j < n and (lit[j].isalnum() or lit[j] == "_"):
                j += 1
            word = lit[i:j]
            k = j
            while k < n and lit[k] in " \t\r\n":
                k += 1
            if k < n and lit[k] == ":":
                out.append(f'"{word}"')
            else:
                out.append(word)  # true / false / null / undefined
            i = j
        else:
            out.append(ch)
            i += 1
    return "".join(out)


def iter_wordlists(obj):
    """Every `wordList` array at any depth (the same walk the extractor in
    scripts.fetch_pygmalion_audio does)."""
    if isinstance(obj, dict):
        wl = obj.get("wordList")
        if isinstance(wl, list):
            yield wl
        for v in obj.values():
            yield from iter_wordlists(v)
    elif isinstance(obj, list):
        for v in obj:
            yield from iter_wordlists(v)


def parse_words(body: str) -> tuple[list[dict], list[str], list[str]]:
    """(word entries, variables that held word lists, parse errors) from every
    `Calst.<Name> = [ ... ]` array in the body. A word entry is any wordList
    element with a non-empty `text`."""
    words, variables, errors = [], [], []
    for m in _ARRAY_ASSIGN.finditer(body):
        lit = _array_at(body, m.end() - 1)
        if lit is None:
            errors.append(f"{m[1]}: unterminated array")
            continue
        try:
            value = json.loads(_quote_keys(lit))
        except json.JSONDecodeError as e:
            if "wordList" in lit:  # only a word-list-shaped array matters
                errors.append(f"{m[1]}: {e} :: {lit[:120]}")
            continue
        got = [w for wl in iter_wordlists(value) for w in wl
               if isinstance(w, dict) and w.get("text")]
        if got:
            words.extend(got)
            if m[1] not in variables:
                variables.append(m[1])
    return words, variables, errors


def is_good_sample(rec: dict) -> bool:
    """A Details response worth caching: HTTP 200 with at least one word."""
    return rec["status"] == 200 and bool(parse_words(rec["body"] or "")[0])


def _word_key(w: dict) -> str:
    return f"{w.get('wordID', '')}\x1f{w['text']}"


# ---------------------------------------------------------------- sampling
def k_needed(pool: int, draw: int, epsilon: float = MISS_EPSILON) -> int:
    """Consecutive zero-gain samples required before calling a pool saturated.

    The hardest case is exactly one unseen word, i.e. a true pool of pool+1.
    One draw of `draw` words misses it with probability 1 - draw/(pool+1); K
    misses in a row happen with probability <= epsilon. Grows with the pool
    (epsilon 0.001: 94 words, draws of 20 -> 30 samples; a 20-word pool
    drawn whole -> 3)."""
    p_miss = 1 - draw / (pool + 1)
    if p_miss <= 0:
        return K_MIN
    return max(K_MIN, math.ceil(math.log(epsilon) / math.log(p_miss)))


def sample_exercise(c, ex: dict, dialect: int, max_samples: int = MAX_SAMPLES) -> dict:
    """Sample one (exercise, dialect) to saturation. Never raises for a
    request failure: the result's `status` is saturated / unsaturated /
    failed, and a failed result keeps whatever pool was seen before."""
    data = {"ExerciseId": ex["exercise_id"], "wrid": ex["wrid"], "vwrid": ex["vwrid"], "Type": TYPE}
    pool: dict[str, dict] = {}
    variables: list[str] = []
    samples = zero_run = draw = 0
    status, error = "unsaturated", None
    for i in range(max_samples):
        try:
            rec = c.request("POST", "/Exercises/Details", data, dialect=dialect, sample=i,
                            accept=is_good_sample)
        except Exception as e:  # noqa: BLE001 — isolate to this (exercise, dialect)
            status, error = "failed", f"sample {i}: {e}"
            break
        samples += 1
        if rec["status"] != 200:
            status = "failed"
            error = f"sample {i}: HTTP {rec['status']} type {TYPE} location {rec.get('location')}"
            break
        words, vars_, errors = parse_words(rec["body"])
        if not words:
            status = "failed"
            head = " ".join((rec["body"] or "")[:300].split())
            error = (f"sample {i}: HTTP 200 but no word list parsed, type {TYPE}"
                     f"{'; ' + '; '.join(errors) if errors else ''}; body: {head}")
            break
        for v in vars_:
            if v not in variables:
                variables.append(v)
        distinct = {_word_key(w) for w in words}
        draw = max(draw, len(distinct))
        gain = 0
        for w in words:
            k = _word_key(w)
            have = pool.get(k)
            if have is None:
                pool[k] = {**w, "sounds": list(w.get("sounds") or [])}
                gain += 1
            else:  # union the sounds of a word seen again
                urls = {s.get("url") for s in have["sounds"]}
                have["sounds"] += [s for s in (w.get("sounds") or []) if s.get("url") not in urls]
        # the RAW entry count: a capped draw of 20 can repeat a word, and
        # 18 distinct of 20 entries is a capped draw, not a small pool
        if i == 0 and len(words) < RESPONSE_CAP:
            status = "saturated"
            break
        zero_run = 0 if gain else zero_run + 1
        if i > 0 and zero_run >= k_needed(len(pool), draw):
            status = "saturated"
            break
    word_list = sorted(pool.values(), key=lambda w: (w["text"].casefold(), w["text"], str(w.get("wordID", ""))))
    for w in word_list:
        w["sounds"] = sorted(w["sounds"], key=lambda s: str(s.get("url", "")))
    out = {
        "dialect_id": dialect,
        "status": status,
        "pool_size": len(pool),
        "samples": samples,
        "max_draw": draw,
        "variables": variables,
        "wordList": word_list,
    }
    if error:
        out["error"] = error
    return out


# ------------------------------------------------------------------- crawl
def discover(c: Client) -> tuple[list[dict], dict]:
    """Returns (lessons, exercise_index). exercise_index is keyed by
    (exercise_id, wrid, vwrid) so an exercise linked twice is fetched once."""
    lessons, index = [], {}

    def add_exercise(link: dict, lesson: dict, group: dict | None) -> None:
        u = urlparse(link["href"])
        m = re.match(r"^/Exercise/([^/]+)/(\d+)$", u.path, re.I)
        if not m:
            return
        q = parse_qs(u.query)
        key = (int(m[2]), int(q.get("wrid", ["0"])[0]), int(q.get("vwrid", ["0"])[0]))
        entry = index.setdefault(
            key,
            {
                "exercise_id": key[0],
                "wrid": key[1],
                "vwrid": key[2],
                "language": m[1],
                "href": link["href"],
                "appearances": [],
            },
        )
        entry["appearances"].append(
            {
                "lesson_id": lesson["lesson_id"],
                "lesson_title": lesson["title"],
                "lesson_level": lesson["level"],
                "group_id": group["group_id"] if group else None,
                "group_title": group["title"] if group else None,
                "part": link["h2"],
                "section": link["h3"],
                "title": link["title"],
            }
        )

    for ln in get_page(c, "/Home/Lessons"):
        m = re.match(r"^/Home/Lesson/(\d+)$", ln["href"], re.I)
        if m:
            lessons.append(
                {"lesson_id": int(m[1]), "title": ln["title"], "level": ln["h1"], "groups": []}
            )
    print(f"lessons: {len(lessons)}")

    for lesson in lessons:
        for ln in get_page(c, f"/Home/Lesson/{lesson['lesson_id']}"):
            gm = re.match(r"^/Home/LessonGroup/(\d+)$", ln["href"], re.I)
            if gm:
                g = {
                    "group_id": int(gm[1]),
                    "title": ln["title"],
                    "part": ln["h2"],
                    "section": ln["h3"],
                }
                lesson["groups"].append(g)
                for gl in get_page(c, f"/Home/LessonGroup/{g['group_id']}"):
                    add_exercise(gl, lesson, g)
            else:
                add_exercise(ln, lesson, None)
    print(f"exercises: {len(index)}")
    return lessons, index


def title_of(ex: dict) -> str:
    return ex["appearances"][0]["title"] if ex.get("appearances") else ""


def coverage_report(rows: list[tuple[dict, dict, dict]], dialects: list[dict],
                    network_calls: int, out=sys.stdout,
                    offered: list[dict] | None = None) -> list[dict]:
    """Print one line per (exercise, dialect), the dialects found and the
    failure list. Returns the failures (empty == clean run)."""
    p = lambda s="": print(s, file=out)  # noqa: E731
    p()
    p("== CALST coverage report ==")
    offered = dialects if offered is None else offered
    fmt = lambda ds: ", ".join(f"{d['dialect_id']}={d['name']}" for d in ds)  # noqa: E731
    p("dialects found: " + fmt(offered))
    if offered != dialects:
        p("dialects crawled (restricted): " + fmt(dialects))
    if [d["dialect_id"] for d in offered] == [OSLO]:
        p("only Oslo is offered: no non-Oslo voice can exist")
    for ex, d, r in rows:
        p(f"ex {ex['exercise_id']:>5} wrid {ex['wrid']:>4} vwrid {ex['vwrid']:>3} "
          f"{d['name']:<14} pool {r['pool_size']:>4} samples {r['samples']:>3} "
          f"{r['status']:<11} {title_of(ex)}")
    failures = [
        {"exercise_id": ex["exercise_id"], "wrid": ex["wrid"], "vwrid": ex["vwrid"],
         "title": title_of(ex), "dialect_id": d["dialect_id"], "dialect": d["name"],
         "status": r["status"], "pool_size": r["pool_size"], "samples": r["samples"],
         "error": r.get("error")}
        for ex, d, r in rows if r["status"] != "saturated"
    ]
    counts = {s: sum(1 for *_, r in rows if r["status"] == s)
              for s in ("saturated", "unsaturated", "failed")}
    p(f"totals: {len(rows)} (exercise, dialect) — " + ", ".join(f"{k} {v}" for k, v in counts.items()))
    p(f"failures: {len(failures)}")
    for f in failures:
        p(f"  ! ex {f['exercise_id']} wrid {f['wrid']} {f['dialect']} [{f['status']}] "
          f"pool {f['pool_size']} samples {f['samples']} — {f['title']}"
          + (f": {f['error']}" if f["error"] else ""))
    p(f"network calls: {network_calls}")
    return failures


def build_manifest(lessons, todo, dialects, results, failures, offered=None) -> dict:
    names = {d["dialect_id"]: d["name"] for d in dialects}
    exercises = []
    for ex in todo:
        per = []
        for d in dialects:
            r = results.get((ex["exercise_id"], ex["wrid"], ex["vwrid"], d["dialect_id"]))
            if r is not None:
                per.append({"dialect": names[d["dialect_id"]], **r})
        exercises.append({**ex, "title": title_of(ex), "dialects": per})
    return {
        "meta": {
            "source": BASE,
            "cookie": cookie_for("<dialect_id>"),
            "type_requested": TYPE,
            "dialects_offered": offered if offered is not None else dialects,
            "dialects_crawled": dialects,
            "sampling": {
                "response_cap": RESPONSE_CAP,
                "miss_epsilon": MISS_EPSILON,
                "k_min": K_MIN,
                "max_samples": MAX_SAMPLES,
            },
            "note": "private research; metadata only; crawl date = this file's git history",
        },
        "lessons": lessons,
        "exercises": exercises,
        "failures": failures,
    }


def run(c, lessons, todo, dialects, out_file: Path, max_samples: int = MAX_SAMPLES,
        report_out=sys.stdout, offered: list[dict] | None = None) -> int:
    """Sample every (exercise, dialect), write the manifest, print the
    report. Returns the process exit code."""
    if not todo or not dialects:
        print(f"nothing to crawl ({len(todo)} exercises x {len(dialects)} dialects); "
              f"manifest not written", file=report_out)
        return 2
    results, rows = {}, []
    total = len(todo) * len(dialects)
    n = 0
    aborted = None
    try:
        for d in dialects:  # dialect-major: Oslo completes first
            for ex in todo:
                n += 1
                r = sample_exercise(c, ex, d["dialect_id"], max_samples)
                results[(ex["exercise_id"], ex["wrid"], ex["vwrid"], d["dialect_id"])] = r
                print(f"[{n}/{total}] ex={ex['exercise_id']} wrid={ex['wrid']} {d['name']}: "
                      f"pool {r['pool_size']} samples {r['samples']} {r['status']} "
                      f"(net {c.network_calls})", file=sys.stderr)
                if getattr(c, "consecutive_failures", 0) >= ABORT_AFTER:
                    raise CrawlAborted(f"{c.consecutive_failures} consecutive failed requests "
                                       f"(last: ex {ex['exercise_id']} {d['name']})")
    except CrawlAborted as e:
        aborted = str(e)
    for ex in todo:
        for d in dialects:
            r = results.get((ex["exercise_id"], ex["wrid"], ex["vwrid"], d["dialect_id"]))
            if r is not None:
                rows.append((ex, d, r))

    failures = coverage_report(rows, dialects, c.network_calls, out=report_out, offered=offered)
    if aborted:
        print(f"ABORTED: {aborted}; {total - len(rows)} (exercise, dialect) not crawled; "
              f"manifest not written — re-run to resume from cache", file=report_out)
        return 3
    if not rows:
        print("no (exercise, dialect) crawled; manifest not written", file=report_out)
        return 2
    doc = build_manifest(lessons, todo, dialects, results, failures, offered)
    out_file.parent.mkdir(parents=True, exist_ok=True)
    tmp = out_file.with_suffix(".tmp")
    tmp.write_text(json.dumps(doc, ensure_ascii=False, indent=1, sort_keys=True) + "\n", encoding="utf-8")
    tmp.replace(out_file)
    print(f"wrote {out_file} ({out_file.stat().st_size / 1e6:.1f} MB)", file=report_out)
    return 1 if failures else 0


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--exercises", type=int, nargs="+", help="only these exercise ids")
    ap.add_argument("--limit", type=int, help="only the first N exercises")
    ap.add_argument("--dialects", type=int, nargs="+", help="only these L2_Dialect ids")
    ap.add_argument("--max-samples", type=int, default=MAX_SAMPLES)
    ap.add_argument("--out", type=Path, help=f"manifest path (default {OUT_FILE}; "
                    "required, and different, for a partial run)")
    args = ap.parse_args(argv)
    partial = bool(args.exercises or args.limit or args.dialects
                   or args.max_samples != MAX_SAMPLES)
    out = args.out or OUT_FILE
    if partial and out.resolve() == OUT_FILE.resolve():
        ap.error("a partial run (--exercises/--limit/--dialects/--max-samples) needs an --out "
                 "other than the default manifest")

    c = Client()
    offered = discover_dialects(c)
    print("dialects offered: " + ", ".join(f"{d['dialect_id']}={d['name']}" for d in offered))
    dialects = offered
    if args.dialects:
        unknown = sorted(set(args.dialects) - {d["dialect_id"] for d in offered})
        if unknown:
            print(f"error: dialect id(s) not offered: {unknown}", file=sys.stderr)
            return 2
        dialects = [d for d in offered if d["dialect_id"] in args.dialects]
    lessons, index = discover(c)
    if not lessons or not index:
        print(f"error: discovery found {len(lessons)} lessons, {len(index)} exercises; "
              f"refusing to write an empty manifest", file=sys.stderr)
        return 2
    todo = sorted(index.values(), key=lambda e: (e["wrid"], e["exercise_id"], e["vwrid"]))
    if args.exercises:
        unknown = sorted(set(args.exercises) - {e["exercise_id"] for e in todo})
        if unknown:
            print(f"error: exercise id(s) not found: {unknown}", file=sys.stderr)
            return 2
        todo = [e for e in todo if e["exercise_id"] in args.exercises]
    if args.limit:
        todo = todo[: args.limit]
    print(f"crawling {len(todo)} exercises x {len(dialects)} dialects")
    return run(c, lessons, todo, dialects, out, args.max_samples, offered=offered)


if __name__ == "__main__":
    sys.exit(main())
