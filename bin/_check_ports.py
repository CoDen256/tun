#!/usr/bin/env python3
"""unified-auth 4.7, text level: does any compose file publish outside loopback?

Fed a list of compose files on argv. Prints `FILES=<n>` and one `P:<problem>`
line per violation, and exits non-zero only if it could not do its job — the
caller treats "did not run" as COULD NOT VERIFY, never as a pass.

WHY A PARSER AND NOT A REGEX. The awk scan this replaces matched exactly one
of the six shapes Compose accepts, and an adversarial review published a real
port through every other one while the check printed ` ok ` and exited 0:

    ports: ["0.0.0.0:5056:5056"]      flow sequence — the `ports:` line was
                                      consumed by awk's `next`
    - target: 5056 / published: 5056  long syntax — no `host_ip:` means all
                                      interfaces
    - "[::]:5056:5056"                the character class `[0-9:.]` has no `[`
    - " 0.0.0.0:5056:5056"            a leading space inside the quotes
    network_mode: host                checked by NEITHER layer
    - "5056:5056"                     no host ip at all = 0.0.0.0

This is the precondition of the whole marker-header trust model
(libs/pyservice/auth.py, libs/jsservice/auth.js): any direct reach to a
backend turns `curl -H 'X-Tun-Operator: 1'` into a total bypass, because the
marker is checked for PRESENCE, not value. So the rule here is deliberately
inverted from the old one: a mapping is PUBLIC unless it proves it is
loopback, rather than public only if it matches a known-bad pattern.

PyYAML is not installed anywhere in this repo and adding a dependency to a
standards gate would make the gate the thing that breaks, so this is a
line-oriented reader. It understands indentation, block and flow sequences,
short and long port syntax, and quoting; it does not understand anchors or
multi-line flow mappings, which no compose file here uses.
"""
from __future__ import annotations

import re
import sys

# A host IP that cannot be reached from another machine. `localhost` is
# accepted because Compose resolves it, and `[::1]` because the bracketed form
# is what the IPv6 short syntax looks like.
LOOPBACK = {"127.0.0.1", "::1", "[::1]", "localhost"}

ALL_INTERFACES = "0.0.0.0"

problems: list[str] = []


def strip_quotes(s: str) -> str:
    s = s.strip()
    if len(s) >= 2 and s[0] == s[-1] and s[0] in "\"'":
        s = s[1:-1]
    # A leading space INSIDE the quotes is still a leading space.
    return s.strip()


def host_ip_of_short(spec: str) -> str:
    """The host interface a short-syntax port mapping binds.

    Returns `0.0.0.0` whenever no interface is named, because that is what
    Docker does — "5056:5056" and "5056" are both public.
    """
    spec = strip_quotes(spec)
    spec = spec.split("/")[0].strip()  # drop /tcp, /udp
    if not spec:
        return ALL_INTERFACES
    if spec.startswith("["):  # [::]:5056:5056 / [::1]:5056:5056
        end = spec.find("]")
        if end == -1:
            return ALL_INTERFACES
        return spec[: end + 1]
    parts = spec.split(":")
    if len(parts) >= 3:
        return parts[0]
    # "5056:5056" or "5056" — no interface named, so every interface.
    return ALL_INTERFACES


def is_public(host_ip: str) -> bool:
    host_ip = host_ip.strip()
    if host_ip.startswith("[") and host_ip.endswith("]"):
        inner = host_ip[1:-1]
        return not (inner in LOOPBACK or host_ip in LOOPBACK)
    return host_ip not in LOOPBACK


def report(path: str, lineno: int, raw: str, why: str) -> None:
    problems.append(f"{path}:{lineno}: {why} -> {raw.strip()}")


def check_short(path: str, lineno: int, raw: str, spec: str) -> None:
    ip = host_ip_of_short(spec)
    if is_public(ip):
        report(path, lineno, raw, f"publishes on {ip}")


def check_long(path: str, lineno: int, raw: str, mapping: dict) -> None:
    """Long syntax. `host_ip:` is optional and its absence means 0.0.0.0."""
    ip = strip_quotes(mapping.get("host_ip", ALL_INTERFACES))
    if is_public(ip):
        pub = mapping.get("published", "<ephemeral>")
        report(path, lineno, raw, f"publishes on {ip}:{strip_quotes(pub)} (long syntax)")


FLOW_TAG = re.compile(r"^(?:![A-Za-z_][\w-]*\s*)*")
PORTS_RE = re.compile(r"^(\s*)ports:\s*(.*?)\s*(?:#.*)?$")
NETMODE_RE = re.compile(r"^\s*network_mode:\s*(.*?)\s*(?:#.*)?$")
ITEM_MAP_RE = re.compile(r"^-\s*([A-Za-z_][\w-]*)\s*:\s*(.*)$")
KEY_RE = re.compile(r"^([A-Za-z_][\w-]*)\s*:\s*(.*)$")


def split_flow(body: str) -> list[str]:
    """Split a flow sequence body on commas that are not inside quotes."""
    out, cur, quote = [], "", ""
    for ch in body:
        if quote:
            if ch == quote:
                quote = ""
            cur += ch
        elif ch in "\"'":
            quote = ch
            cur += ch
        elif ch == ",":
            out.append(cur)
            cur = ""
        else:
            cur += ch
    if cur.strip():
        out.append(cur)
    return [p for p in (x.strip() for x in out) if p]


def scan(path: str) -> None:
    with open(path, "r", encoding="utf-8", errors="replace") as fh:
        lines = fh.read().splitlines()

    i = 0
    while i < len(lines):
        raw = lines[i]
        stripped = raw.strip()
        if not stripped or stripped.startswith("#"):
            i += 1
            continue

        nm = NETMODE_RE.match(raw)
        if nm:
            mode = strip_quotes(nm.group(1))
            if mode == "host":
                report(path, i + 1, raw, "network_mode: host shares the host's "
                                         "network namespace — every listening "
                                         "port is public")
            i += 1
            continue

        pm = PORTS_RE.match(raw)
        if not pm:
            i += 1
            continue

        indent = len(pm.group(1))
        rest = FLOW_TAG.sub("", pm.group(2)).strip()  # drop !override etc.

        if rest.startswith("["):
            # Flow sequence, possibly spanning lines until the brackets close.
            buf, depth, j = "", 0, i
            while j < len(lines):
                for ch in lines[j]:
                    if ch == "[":
                        depth += 1
                    elif ch == "]":
                        depth -= 1
                buf += lines[j] if j > i else rest
                if depth <= 0:
                    break
                buf += " "
                j += 1
            body = buf[buf.find("[") + 1 : buf.rfind("]")]
            for item in split_flow(body):
                if item.startswith("{"):
                    mapping = {}
                    for pair in split_flow(item.strip("{} ")):
                        if ":" in pair:
                            k, _, v = pair.partition(":")
                            mapping[strip_quotes(k)] = v.strip()
                    check_long(path, i + 1, raw, mapping)
                else:
                    check_short(path, i + 1, raw, item)
            i = j + 1
            continue

        # Block sequence.
        i += 1
        pending: dict | None = None
        pending_line = 0
        pending_raw = ""
        while i < len(lines):
            line = lines[i]
            body = line.strip()
            if not body:
                i += 1
                continue
            cur_indent = len(line) - len(line.lstrip())
            if cur_indent <= indent:
                break
            if body.startswith("#"):
                i += 1
                continue
            if body.startswith("-"):
                if pending is not None:
                    check_long(path, pending_line, pending_raw, pending)
                    pending = None
                m = ITEM_MAP_RE.match(body)
                if m:  # long syntax: `- target: 5056`
                    pending = {m.group(1): m.group(2).strip()}
                    pending_line, pending_raw = i + 1, line
                elif body.strip() == "-":
                    pending = {}
                    pending_line, pending_raw = i + 1, line
                else:  # short syntax: `- "0.0.0.0:5056:5056"`
                    check_short(path, i + 1, line, body[1:].strip())
            elif pending is not None:
                m = KEY_RE.match(body)
                if m:
                    pending[m.group(1)] = m.group(2).strip()
            i += 1
        if pending is not None:
            check_long(path, pending_line, pending_raw, pending)


def main(argv: list[str]) -> int:
    files = argv[1:]
    if not files:
        print("P:no compose file was handed to the port check — nothing was scanned")
        return 3
    for path in files:
        scan(path)
    print(f"FILES={len(files)}")
    for p in problems:
        print("P:" + p)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
