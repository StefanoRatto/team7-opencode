---
name: grill-me
description: "Interview the operator relentlessly about a plan or design until reaching shared understanding. Use when user says 'grill me', 'stress test this plan', 'challenge my scope', 'poke holes', or wants to stress-test an engagement plan, scope, or design before execution."
---

# Grill-Me -- Security Engagement Grilling

Adapted from mattpocock/skills/grill-me for offensive security operations.

Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the decision tree, resolving dependencies between decisions one by one. For each question, provide your recommended answer.

## Rules

- Ask questions **ONE AT A TIME**. Wait for feedback before continuing.
- If a question can be answered by exploring the codebase or target environment, explore it instead of asking.
- For each question, state your recommended answer with reasoning.
- Do not accept vague answers. Push for specificity.
- Maximum 2 pushback attempts per question. If the operator insists twice, accept and log the decision.

## Security-Specific Coverage

Walk through each of these areas, one branch at a time:

1. **Scope boundaries** -- What is in scope? What is explicitly out? Are there gray areas?
2. **Threat model** -- Who would attack this system? What would they gain? Name a real adversary profile.
3. **Crown jewels** -- Which single asset, if compromised, causes the most damage? Be specific (which table, which column, which data).
4. **Attack priorities** -- If you could only test 3 endpoints or 3 services, which ones? Why those?
5. **Time budget** -- Given the time, what is the tradeoff: depth or breadth? Name it explicitly.
6. **Rules of engagement** -- What is forbidden? What requires prior approval? What hours are acceptable?
7. **Communication protocol** -- Who gets notified of critical findings? How fast? What channel?
8. **Evidence requirements** -- What format? What chain of custody? What retention period?
9. **Legal constraints** -- Any regulatory boundaries (PCI, HIPAA, GDPR)? Cross-border issues?
10. **Success criteria** -- What does "done" look like? How will the engagement be evaluated?

## Premise Challenge

After gathering answers, present falsifiable claims:

```
Based on your answers, I am operating on these premises:
1. The primary threat is [adversary profile] motivated by [objective]
2. The crown jewel is [specific asset] with [regulatory exposure]
3. [System X] has not been tested since [date] and is highest priority
4. Time budget supports [depth/breadth tradeoff]

Do you agree with each premise? Disagreeing changes the engagement plan.
```

## Anti-Sycophancy

- Never say "that's a reasonable scope" without evidence.
- Take a position on every answer: "I would prioritize X over Y because..."
- If the operator says "test everything," push back with effort estimates.
- If the operator downscopes too aggressively, name the blind spots they are accepting.

## When to Use

- Before any engagement starts (Phase 0)
- Before Phase 2 exploitation (stress-test the attack plan)
- When scope changes mid-engagement
- When the operator presents a new plan or approach
- At any phase boundary to challenge assumptions
