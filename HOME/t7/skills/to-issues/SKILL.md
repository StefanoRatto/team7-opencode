---
name: to-issues
description: "Break an engagement plan into independently-grabbable tasks using vertical slices. Use when user says 'break this down', 'to-issues', 'create tasks', 'vertical slices', 'decompose the plan', or wants to convert a plan into actionable task items."
---

# To-Issues -- Engagement Task Vertical Slicing

Adapted from mattpocock/skills/to-issues for offensive security operations.

Break an engagement plan into independently-grabbable tasks using vertical slices (tracer bullets). Each task is a thin slice that cuts through all layers end-to-end, NOT a horizontal slice of one layer.

## Vertical Slice Rules

- Each slice delivers a narrow but COMPLETE path through reconnaissance, exploitation, and documentation.
- A completed slice produces a verified finding with evidence.
- Prefer many thin slices over few thick ones.
- Maximize parallelism -- mark which slices can run simultaneously.

## Slice Types

- **AFK**: Can be delegated to a sub-agent without operator interaction.
- **HITL**: Requires operator decision (scope boundary, risk tolerance, legal).
- Prefer AFK over HITL where possible.

## Process

### 1. Gather Context
Work from whatever is already in the conversation and AGENTS.md.

### 2. Draft Vertical Slices
Break the plan into tracer bullet tasks. Each task is a thin slice through all layers.

### 3. Present for Approval
Show each slice with:
- **Title**: short descriptive name
- **Type**: AFK / HITL
- **Blocked by**: which other slices must complete first
- **Objectives covered**: which engagement objectives this addresses
- **Agent**: which sub-agent handles this slice

Ask:
- Does the granularity feel right? (too coarse / too fine)
- Are the dependency relationships correct?
- Should any slices be merged or split further?

### 4. Create as Todos
Convert approved slices into todos (via todowrite) with dependency ordering. AFK slices are delegated to appropriate sub-agents. HITL slices are presented to the operator.

## Example Breakdown

```
Slice 1 [AFK]: Recon port 443 -> identify service -> check CVEs -> document
  Agent: t7-recon-agent
  Blocked by: none

Slice 2 [AFK]: Recon port 22 -> enumerate SSH config -> test weak ciphers -> document
  Agent: t7-recon-agent
  Blocked by: none

Slice 3 [AFK]: Test auth on /api/login -> brute force policy -> session analysis -> document
  Agent: t7-auth-bypass-agent
  Blocked by: Slice 1

Slice 4 [HITL]: Confirm exploitation scope for CVE found in Slice 1
  Blocked by: Slice 1
  Requires: operator approval before exploitation

Slice 5 [AFK]: Exploit confirmed CVE -> document PoC -> collect evidence
  Agent: t7-exploitation-agent
  Blocked by: Slice 4
```

## When to Use

- After scope is defined and before execution begins
- When breaking a large engagement into parallelizable work
- When the operator says "break this down" or "what are the tasks"
