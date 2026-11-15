# Acceptance criteria — ota-pull-tracking

The review contract for the build phase. Every criterion is a falsifiable,
observable end state, verifiable in the local dev compose stack
(`docker compose -f compose.yaml -f compose.dev.yaml up`) with curl, psql and
claude-in-chrome. None may be verified by reading code or by trusting a log
line that announces its own success.

---

## Item: "sync — track what bundle and when each bundle was pulled, display it in the UI"

### B1 — A bundle download produces a log line, and nothing else does
**WHEN** three requests are issued against the dev gateway with a valid OTA
token — `/ota/bundle/<id>.js`, `/ota/current.json`, and any operator-plane URL
**THEN** the gateway's `pulls.log` contains **exactly one** line, for the
bundle, carrying that build id in its `uri`, a `status`, a `size`, a
`remote_ip` and a `ts`.

### B2 — The gateway's general log still works
**WHEN** the same three requests are issued
**THEN** `docker compose logs caddy` shows handled-request lines for the two
non-bundle requests, and shows none for the bundle. (The failure mode this
catches is real and silent: in the wrong logger declaration order, all three
land in `pulls.log` and the console log is empty.)

### B3 — The adapted config proves the ordering
**WHEN** `caddy adapt --adapter caddyfile` is run against the real Caddyfile
and `apps.http.servers.srv0.logs.default_logger_name` is read
**THEN** it is the stdout logger's name, **not** `otapulls`.

### B4 — The gateway actually starts
**WHEN** the stack is brought up
**THEN** the caddy container reaches a running state and stays there for at
least 30 seconds — not "adapted config to JSON" followed by exit 1, which is
what a reserved logger name produces and which reads like a successful boot in
the first four log lines.

### B5 — The device-plane response is byte-identical
**WHEN** the same bundle is fetched before and after this change and both
responses are captured in full
**THEN** the status code is identical, every response header is identical
(including both `Cache-Control` values), and the body's sha256 is identical.

### B6 — A write method is still rejected
**WHEN** `PUT /ota/bundle/<id>.js` is issued with a valid token
**THEN** the response is still 405, as before the change.

### B7 — A missing or wrong token is still rejected identically
**WHEN** the bundle is requested with no token, and then with a wrong token
**THEN** both return 401 with the same body, and neither produces a row in
`ota_pulls` that distinguishes them.

### B8 — Rows land in the table
**WHEN** a bundle is downloaded and the Pulls page is then loaded
**THEN** `SELECT * FROM ota_pulls` contains a row whose `build_id` is that
build, whose `at` is a real timestamptz within a minute of now (not a float,
not an epoch integer), and whose `status` and `bytes` match what the gateway
served.

### B9 — Ingestion is idempotent
**WHEN** the Pulls page is loaded, `SELECT count(*) FROM ota_pulls` is
recorded, the ingest's cooldown is bypassed and the page is loaded five more
times
**THEN** the count is unchanged.

### B10 — Ingestion survives rotation
**WHEN** pulls have been ingested, the gateway's log file is then deleted or
rolled away, and the Pulls page is loaded
**THEN** every previously ingested row is still present and the page still
shows those pulls.

### B11 — A junk log line does not stop ingestion
**WHEN** a line of non-JSON text, and a line whose `uri` is
`/ota/bundle/../../etc/passwd`, are appended to the log alongside one valid
bundle line, and ingestion runs
**THEN** the valid line produces a row, neither junk line produces a row, no
exception reaches the page, and the skipped count is visible to the operator.

### B12 — A download is attributed to the right build
**WHEN** two different build ids are downloaded
**THEN** `ota_pulls` holds one row per download, each with its own correct
`build_id`, and the per-build table on the page attributes them separately.

### B13 — A failed download is recorded, not dropped
**WHEN** a request for a bundle path that does not exist on disk is made with
a valid token
**THEN** a row exists carrying the non-success status, and the page's timeline
renders it with a warning treatment rather than omitting it.

### B14 — The page exists in the rail
**WHEN** any hub page is opened in a browser
**THEN** the Device group in the left rail shows a third item, "Pulls", linking
to `/mjolnir/device/pulls`, and clicking it loads that page.

### B15 — The per-build table shows what it must
**WHEN** `/mjolnir/device/pulls` is opened after at least two builds have been
published and one has been pulled twice
**THEN** the table shows one row per published build; the pulled build shows a
first-pulled time, a last-pulled time and a count of 2; and the build id is
rendered as the primary identifier with the human version label beneath it.

### B16 — A never-pulled build is visibly flagged
**WHEN** a build is published and never downloaded, and the page is opened
**THEN** its row is present and carries a visible "never pulled" marker — not
an empty cell, and not absence from the table.

### B17 — The page states its two limits
**WHEN** the page is read
**THEN** it states that a download is not an activation, and that the recorded
value is a network address rather than a device or account identity.

### B18 — The pre-recording boundary is not reported as "never pulled"
**WHEN** a `publications` row exists whose `created_at` precedes the earliest
`ota_pulls.at`, and the page is opened
**THEN** that build is NOT presented as a plain "never pulled" build — it is
either distinguished as predating the record or the page states that no record
exists before that time.

### B19 — An unknown build id still renders
**WHEN** a row exists in `ota_pulls` whose `build_id` has no `publications` row
**THEN** the page renders it, marked as an unknown build, rather than dropping
it or erroring.

### B20 — Missing log file is a reported state, not a crash
**WHEN** the Pulls page is opened on a stack where the log file has never been
created
**THEN** the page renders with a message distinguishing "no pull log found"
from "no pulls recorded", and returns 200 rather than erroring.

### B21 — An unwritable log destination does not break the device plane
**WHEN** the log destination is made unwritable and a bundle is requested with
a valid token
**THEN** the bundle is served with the same status, headers and bytes as
always, and the operator can see that logging failed.

### B22 — Nothing outside this change's scope was touched
**WHEN** the full diff is reviewed
**THEN** no file under `mjolnir/sync/`, `mjolnir/patches/`, `mjolnir/base/`,
`mjolnir/builder/` or `mjolnir/hub/src/*builder*` is modified, and
`docs/11-ota-contract.md` has no contract clause altered (a note recording that
downloads are logged is permitted).

### B23 — Both themes render
**WHEN** the Pulls page is viewed in light and in dark theme
**THEN** every pill, table row and timeline entry is legible in both, and the
page body does not scroll horizontally at a narrow viewport.
