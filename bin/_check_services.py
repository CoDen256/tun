#!/usr/bin/env python3
"""Service-level standards checks, fed `docker compose config --format json`.

A separate file rather than `python3 -c "..."` inside the shell script on
purpose: the embedded form needs backslash-escaped quotes inside an f-string
inside a double-quoted shell string, and that mis-parsed in practice —
`line 127: restart:: command not found`, while the surrounding check still
printed ` ok `. A checker that emits shell errors and passes anyway is the same
"failure reports success" shape everything else here guards against.

Prints `SERVICES=<n>` and one `P:<problem>` line per violation. Exit 0 always —
the caller decides severity.
"""
import json
import sys

try:
    doc = json.load(sys.stdin)
except Exception as exc:  # malformed or empty input is the caller's problem
    print(f"P:could not parse the rendered config: {exc}")
    sys.exit(0)

services = doc.get("services") or {}
problems = []

# A ONE-SHOT must run to completion and stay exited; `restart: "no"` is the
# declaration of intent. Exempt from the restart and healthcheck rules BY
# SHAPE, not by a name list — a name list rots the moment a second one-shot
# appears, and silently exempts a typo'd name.
def is_one_shot(svc):
    return svc.get("restart") == "no"

# Checked PER SERVICE. An earlier version counted occurrences per FILE, so a
# file where five of six services lost their policy still passed.
for name, svc in sorted(services.items()):
    if is_one_shot(svc):
        continue
    if svc.get("restart") != "unless-stopped":
        problems.append(f"restart: {name} = {svc.get('restart')!r}, expected unless-stopped")

# Only the gateway may publish on a non-loopback interface.
for name, svc in sorted(services.items()):
    for port in svc.get("ports") or []:
        host_ip = port.get("host_ip", "0.0.0.0")
        if name != "caddy" and host_ip not in ("127.0.0.1", "::1"):
            problems.append(f"public port: {name} on {host_ip}:{port.get('published')}")

# `network_mode: host` publishes nothing and exposes everything: the container
# shares the host's network namespace, so every port it listens on is reachable
# from outside the loopback without a `ports:` key anywhere. Neither this
# helper nor the text-level scan looked for it until the 2026-11-14 review
# pointed out that a one-line edit defeated the whole marker-header
# precondition (P53).
for name, svc in sorted(services.items()):
    if svc.get("network_mode") == "host" and name != "caddy":
        problems.append(f"host networking: {name} uses network_mode: host")

# Every application backend needs a healthcheck of its own. The gateway and
# the database browser are named here as known-unmonitored rather than
# silently skipped — see the service-standard spec.
#
# `backup` WAS IN THIS SET AND SHOULD NEVER HAVE BEEN. Its exemption was
# argued from liveness — the process stays up, so a probe would only ever say
# "up" — which is exactly backwards: this is the one service whose process
# staying up tells you nothing at all about whether it is doing its job. It
# had produced no backup whatsoever for seven hours (failed clone,
# placeholder deploy key), logged the failure honestly, and still showed as
# "Up 7 hours" with this checker reporting green. It now has a healthcheck
# that reads a stamp written only after a completed run (backup/healthcheck.sh).
NO_HEALTHCHECK_BY_DESIGN = {"caddy", "adminer"}
for name, svc in sorted(services.items()):
    if name in NO_HEALTHCHECK_BY_DESIGN or is_one_shot(svc):
        continue
    if not svc.get("healthcheck"):
        problems.append(f"no healthcheck: {name}")

print(f"SERVICES={len(services)}")
for p in problems:
    print("P:" + p)
