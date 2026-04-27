---
name: triage-issue
description: "Investigate a failed exploit or ambiguous finding, find root cause, and produce an actionable verification plan. Use when user says 'triage this', 'investigate this finding', 'root cause', 'why did this fail', or wants to understand why something did not work as expected."
---

# Triage-Issue -- Security Finding Triage

Adapted from mattpocock/skills/triage-issue for offensive security operations.

Investigate a reported problem or failed exploit, find its root cause, and produce an actionable next-step plan. Mostly hands-off -- minimize questions to the operator.

## Process

### 1. Capture the Problem

Get a brief description. If unclear, ask ONE question: "What is the problem?" Start investigating immediately.

### 2. Explore and Diagnose

Deeply investigate the target. Find:
- **WHERE** it manifests (endpoint, service, network layer)
- **WHAT** code/config path is involved (trace the flow)
- **WHY** it fails (root cause, not just the symptom)
- **WHAT** related patterns exist (similar endpoints, other parameters)

Look at:
- Target service responses and error messages
- Network behavior (timing, headers, status codes)
- WAF/IDS indicators
- Environmental differences (what works elsewhere but fails here)
- Similar patterns that DO work on the same target

### 3. Identify Fix Approach

Based on investigation:
- The minimal change to the technique needed
- Which assumptions were wrong
- What behaviors need to be verified
- Whether this is a defense, misconfiguration, or wrong hypothesis

### 4. Design Verification Plan

Ordered list of probe-verify cycles (adapted from TDD):

- **PROBE**: Describe a specific test that checks the hypothesis
- **VERIFY**: Describe expected result and what it confirms/rejects

Rules:
- Probes verify behavior through observable interfaces (HTTP responses, timing, errors)
- One probe at a time, vertical slices
- Findings should be DURABLE -- describe behaviors and conditions, not internal file paths

### 5. Document

Write the finding with:
- Root cause analysis
- Verification plan
- Dead ends explored (and why to avoid them)
- Recommended next action

## When to Use

- When an exploit fails and the reason is unclear
- When a scanner finding cannot be reproduced
- When two agents return contradictory results
- When the three-strike rule triggers reassessment
