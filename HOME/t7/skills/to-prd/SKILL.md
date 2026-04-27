---
name: to-prd
description: "Synthesize the current conversation context into a formal engagement scope document. Use when user says 'synthesize scope', 'write the scope doc', 'to-prd', 'create engagement scope', or wants to formalize what has been discussed into a scope document."
---

# To-PRD -- Engagement Scope Synthesis

Adapted from mattpocock/skills/to-prd for offensive security operations.

Take the current conversation context and target understanding and produce an engagement scope document. Do NOT interview the operator -- synthesize what is already known.

## Process

1. Review what is already known about the target from the conversation.
2. Sketch the major attack phases and target components. Identify opportunities for deep testing (small attack surface, significant impact).
3. Check with operator that these components match expectations.
4. Write the engagement scope and save to `deliverables/engagement-scope.md`.

## Output Template

```markdown
# Engagement Scope

## Threat Statement
[Who would attack, what they would gain, adversary profile]

## Scope Items
| ID | Target | Description | Priority |
|----|--------|-------------|----------|
| S-001 | [target] | [description] | [high/medium/low] |

## Prioritized Objectives
1. [Objective with specific success criteria]
2. [Next objective]

## Attack Approach
[Depth vs breadth tradeoff. Which phases. Which agents.]

## Testing Decisions
- [What will be tested and how]
- [What tools/techniques are appropriate]

## Out of Scope
- [Explicitly excluded items with reasoning]

## Time Estimates
| Phase | Estimated Duration |
|-------|-------------------|
| Recon | [estimate] |
| Exploitation | [estimate] |
| Reporting | [estimate] |
```

## When to Use

- After discussion has already covered scope and just needs formalization
- As the fast-path alternative to the full Engagement Discovery Protocol
- When the operator says "write it up" or "formalize this"
