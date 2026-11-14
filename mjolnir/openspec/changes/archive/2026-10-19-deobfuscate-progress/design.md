## Context

Profiled against the real `index.android.bundle` (2190 logic modules): total runtime 54s, with modules `158` (18.8s), `461` (18.1s), `281` (9.4s), and `2029` (3.7s) accounting for ~50s of that. Each of these has very few IIFE-shaped call sites (4, 5, 15, and a handful respectively) but at least one spans nearly the entire module — a UMD-style "whole vendor chunk wrapped in one closure" pattern. `applyRules` (`src/commands/deobfuscate.js`) currently canonicalizes (full clone + scope-walk) and `generate()`s *every* IIFE-shaped candidate to compute its hash before checking it against the registered rules, regardless of size.

## Goals / Non-Goals

**Goals:**
- Make a long-running deobfuscate pass visibly alive via progress output.
- Avoid paying full canonicalize+generate cost on candidates that are structurally incapable of matching any registered rule.

**Non-Goals:**
- No change to which patterns match or how they're rewritten — output for every module must be identical to today's, just faster to produce and more visible while running.
- No general-purpose rule-authoring size hints API — the size band is derived directly from each rule's own reference pattern, not configured per-rule by hand.

## Decisions

**Progress: print one line per module, not a throttled/batched summary.** At 2190 modules with a handful of multi-second outliers, a human watching the terminal needs to see *which* module is currently running during a stall, not just a periodic counter — a per-module line (optionally only for modules above some size, to avoid flooding small fast ones) directly answers "is it stuck, and on what."

**Size pre-filter: node count of the candidate vs. the rule's reference pattern, with a tolerance band.** Compute a cheap structural size for a candidate (e.g. count of AST nodes, via a lightweight traversal that doesn't canonicalize or generate) and compare against each registered rule's own reference pattern's node count (computed once at rule-registration time, already available since `interopWildcard.js` parses and canonicalizes its reference pattern at module load). Only candidates within a tolerance band (e.g. the same node count, since canonicalization never adds/removes nodes) proceed to full canonicalize+hash.
- Alternative considered: hash a cheap low-fidelity fingerprint first (e.g. just the candidate's top-level statement count or string length) as a bloom-filter-style pre-check. Rejected as redundant — node count is already free to compute and is an exact, non-lossy necessary condition for a hash match (canonicalization is a bijective rename, never changes node count), so there's no need for a separate fuzzy fingerprint.

## Risks / Trade-offs

- [Risk] If a future rule's pattern has optional/variable-length sub-structure (e.g. a rule that should match regardless of some variadic part), a strict node-count filter could reject valid matches. → Mitigation: not a concern for the one currently-registered rule (fixed shape); revisit the filter's exactness if/when a variable-shape rule is ever added.

## Migration Plan

N/A — behavior-preserving performance and UX change to an existing command.
