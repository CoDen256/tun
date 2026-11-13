"""
The container health probe for every Python service. One file so the predicate
is identical in all three compose files instead of three copies of an inline
`python -c` one-liner that can drift.

    test: ["CMD", "python", "/libs/pyservice/healthcheck.py", "http://localhost:5056/_health"]

Exit 0 only on HTTP 200 (serving AND schema ready). A 503 from /_health means
serving-but-degraded and exits 1 — Docker has no third state, and reporting a
degraded service as healthy is the quietly-wrong outcome this change exists to
remove. Nothing in this stack `depends_on: service_healthy` a backend, so an
unhealthy backend blocks nothing; it is a signal, not a trigger.

The response body is printed either way, so `docker inspect --format
'{{json .State.Health.Log}}'` shows WHY a service is degraded without having
to go and find its logs.
"""

import sys
import urllib.error
import urllib.request

url = sys.argv[1] if len(sys.argv) > 1 else "http://localhost/_health"

try:
    response = urllib.request.urlopen(url, timeout=3)
    status = response.status
    body = response.read().decode("utf-8", "replace")
except urllib.error.HTTPError as exc:
    # An HTTPError IS the response — read it rather than discarding the one
    # payload that explains the failure.
    status = exc.code
    body = exc.read().decode("utf-8", "replace")
except Exception as exc:  # connection refused, DNS, timeout — not serving
    print(f"unreachable: {exc}")
    sys.exit(1)

print(f"{status} {body}")
sys.exit(0 if status == 200 else 1)
