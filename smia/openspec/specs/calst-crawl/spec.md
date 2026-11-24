# calst-crawl Specification

## Purpose
TBD - created by archiving change calst-full-coverage. Update Purpose after archive.
## Requirements
### Requirement: Each exercise's word pool is sampled to saturation
`scripts/crawl_calst.py` SHALL request exercise details with type `LAS` only. For each (exercise, dialect) it SHALL request until the union of words seen is saturated: a response holding fewer words than the per-response cap ends sampling immediately; otherwise sampling SHALL continue until a configured number of consecutive responses add no new word, or until a request cap is reached, in which case the (exercise, dialect) is reported `unsaturated`. Every sample SHALL be cached as its own entry, keyed by exercise, dialect and sample index, so a re-run resumes without re-requesting finished samples and never replays one sample as another.

#### Scenario: A small pool costs one request
- **WHEN** the first LAS response for an exercise holds 12 words
- **THEN** no further request is made for that (exercise, dialect) and the report shows pool 12, samples 1, saturated

#### Scenario: An oversized pool is sampled until stable
- **WHEN** exercise 947 is crawled for Oslo
- **THEN** the report shows it saturated with a pool of at least 94 words, and the manifest contains `målende`, `målene`, `bindende` and `seilende` with their sound URLs

#### Scenario: Re-running replays from cache
- **WHEN** the crawl is run a second time with an intact cache
- **THEN** it makes no network request for any sample already cached and produces the same manifest

### Requirement: Every word-list variable is parsed and an empty parse is a failure
The crawler SHALL extract every `Calst.<Name> = [ … ]` array whose elements carry word lists (including `Calst.WordList`). A response with HTTP 200 from which no word is parsed SHALL be recorded as a failure with the exercise id, type and the start of the body — never as an empty success.

#### Scenario: Tonelag exercises are parsed
- **WHEN** the response for exercise 947 holds its data in `Calst.WordList`
- **THEN** its words appear in the manifest

#### Scenario: Unrecognised shape fails loudly
- **WHEN** a 200 response contains no parseable word list
- **THEN** the exercise appears in the end-of-run failure list and the process exits non-zero

### Requirement: Failures are isolated per exercise and dialect
A request that times out SHALL be retried with a longer timeout. A persistent failure SHALL be recorded for that (exercise, dialect) only; the crawl SHALL continue with every other exercise and dialect.

#### Scenario: Formerly skipped stress exercises are crawled
- **WHEN** exercises 935–938 are crawled
- **THEN** each appears in the coverage report with a pool size, and none of them is listed as skipped

### Requirement: Every dialect CALST offers is crawled
The crawler SHALL determine the set of `L2_Dialect` values CALST offers and crawl every exercise under each. The coverage report SHALL list the dialects found.

#### Scenario: A second dialect becomes a voice
- **WHEN** CALST offers a dialect other than Oslo and its recordings are crawled, extracted, downloaded and imported
- **THEN** `POST /tts` with `provider: "pygmalion"` for a word in that dialect's pools returns a candidate whose `voice` is that dialect

### Requirement: Each run ends with a coverage report and an honest exit code
At the end of a run the crawler SHALL print one line per (exercise, dialect) with the exercise title, pool size, samples taken and status (`saturated`, `unsaturated`, `failed`), followed by the failure list, and SHALL exit non-zero if any (exercise, dialect) is `unsaturated` or `failed`.

#### Scenario: A clean run exits zero
- **WHEN** every (exercise, dialect) saturates
- **THEN** the process exits 0 and the failure list is empty
