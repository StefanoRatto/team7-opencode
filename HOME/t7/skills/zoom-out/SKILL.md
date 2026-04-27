---
name: zoom-out
description: "Go up a layer of abstraction and produce a map of all relevant modules, callers, data flows, and trust boundaries. Use when user says 'zoom out', 'bigger picture', 'how does this fit', 'map the architecture', or needs to understand how a component fits into the broader system."
---

# Zoom-Out -- Architecture Abstraction

Adapted from mattpocock/skills/zoom-out for offensive security operations.

I don't know this area well. Go up a layer of abstraction. Give me a map of all the relevant modules and callers.

## Rules

- This is a direct instruction, not an interview. Produce the map immediately.
- Show: module relationships, caller chains, data flow direction, trust boundary crossings, authentication checkpoints.
- From a security perspective: highlight where user input enters, where it crosses trust boundaries, where it reaches sensitive operations.
- Use the target's own terminology (service names, endpoint paths, domain concepts).

## Output Format

```
[Entry Point] -> [Component] -> [Trust Boundary] -> [Sensitive Operation]
                                      |
                              [Auth Checkpoint]
```

Include:
- Entry points (HTTP endpoints, API routes, CLI interfaces, network services)
- Trust boundaries (where authentication or authorization is checked)
- Data flow direction (which way data moves, what transforms it)
- Sensitive operations (database writes, file access, credential usage, external calls)
- Authentication checkpoints (where identity is verified)

## When to Use

- During code review when deep in a specific file and need context
- During recon when mapping infrastructure and need the bigger picture
- When an exploit succeeded and you need to understand what is reachable from the foothold
- When planning lateral movement and need to understand network topology
