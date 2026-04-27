---
name: tdd
description: "Test-driven exploit development using vertical slices and red-green-refine loops. Use when user says 'tdd', 'test-driven', 'verify first', 'red green refactor', 'vertical slices', or wants structured hypothesis-probe-confirm methodology for exploitation."
---

# TDD -- Exploit-Verify-Refine Loop

Adapted from mattpocock/skills/tdd for offensive security operations.

Core principle: verify behavior through observable interfaces, not assumptions. Your first hypothesis about a vulnerability is unlikely to be correct.

## Anti-Pattern: Horizontal Slices

DO NOT scan everything first, then exploit everything. This is horizontal slicing -- it produces stale findings and wasted effort.

```
WRONG (horizontal):
  SCAN:    target1, target2, target3, target4, target5
  EXPLOIT: target1, target2, target3, target4, target5

RIGHT (vertical):
  SCAN+VERIFY: target1 -> confirm -> exploit -> document
  SCAN+VERIFY: target2 -> confirm -> exploit -> document
  SCAN+VERIFY: target3 -> confirm -> exploit -> document
```

## Exploit-Verify-Refine Loop

For each potential vulnerability:

1. **Hypothesis**: "This endpoint is vulnerable to X because of Y."
2. **Probe (RED)**: Send a witness payload that should trigger the vulnerability. Observe: does it behave as predicted?
3. **Confirm (GREEN)**: If probe succeeds, write the working PoC. Minimal payload that demonstrates exploitability.
4. **Refine**: After confirmation, look for variants. Same pattern in other endpoints? Different parameters? Different HTTP methods?

## Rules

- One finding at a time. Confirm before moving to the next.
- Only enough exploitation to prove the finding. Do not over-exploit.
- Keep probes focused on observable behavior (HTTP responses, timing, error messages).
- A finding that survives an internal code refactor is a good finding.
- Never probe while your hypothesis is unformed. Get to a clear prediction first.

## Checklist Per Cycle

```
[ ] Hypothesis states expected behavior, not implementation guess
[ ] Probe tests through the public interface (HTTP, API, network)
[ ] Probe would work regardless of internal code structure
[ ] PoC is minimal -- just enough to prove the finding
[ ] Variants checked after confirmation
[ ] Finding documented with evidence (command + output)
```

## When to Use

- During Phase 2 exploitation -- apply to each vulnerability
- When verifying scanner findings -- probe before reporting
- When investigating a suspected vulnerability -- hypothesis-first
- When an exploit fails -- refine the hypothesis, don't repeat blindly
