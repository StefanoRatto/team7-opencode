# l7 - Loop 7

```
██        ██████   ██████  ███████  ███████
██       ██    ██ ██    ██ ██    ██      ██
██       ██    ██ ██    ██ ███████     ██
██       ██    ██ ██    ██ ██        ██
████████  ██████   ██████  ██       ██
```

Autonomous AI task loop powered by team7. Give it a WPRD and it works through every item until the list is done -- then verifies each one actually got done.

Single file. No dependencies beyond opencode and standard Unix tools.

---

## Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage Examples](#usage-examples)
- [Modes of Operation](#modes-of-operation)
- [WPRD Format](#wprd-format)
- [Task States](#task-states)
- [Task Verification](#task-verification)
- [Execution Control](#execution-control)
- [Progress Display](#progress-display)
- [Live Following](#live-following)
- [Cost Tracking](#cost-tracking)
- [How It Works](#how-it-works)
- [CLI Reference](#cli-reference)
- [Reliability](#reliability)
- [Troubleshooting](#troubleshooting)
- [License](#license)

---

## Overview

l7 operates in a simple cycle:

```
Pick next task -> Mark [\] in progress -> AI does the work -> Verify -> Mark [+] done -> Repeat
```

Tasks live in a WPRD file and move through 4 states:

```
[ ] pending  ->  [\] in progress  ->  [+] completed
                                  ->  [x] failed
```

Three optional verification layers ensure tasks are actually done:

| Layer | What it checks | How |
|-------|---------------|-----|
| `verify:` | Did the thing get produced? | Shell commands that must exit 0 |
| `accept:` | Is the thing correct? | Natural-language criteria checked by AI reviewer |
| Rules of Engagement | Were the rules followed? | Extracted from WPRD and verified by AI reviewer on every task |
| AI review | Overall sanity check | Second AI call inspects the work |

---

## Requirements

| Tool | Purpose | Install |
|------|---------|---------|
| `opencode` | AI engine (required) | [opencode.ai/docs](https://opencode.ai/docs/) |
| `jq` | JSON parsing (required) | `apt install jq` / `brew install jq` |
| `bc` | Cost calculation (optional) | Usually pre-installed |

---

## Installation

```bash
chmod +x l7
```

Verify:

```bash
./l7 --help
```

---

## Usage Examples

### Single task -- one-off work

The simplest mode. Pass a task description as a string. The AI works autonomously until it's done.

```bash
# Write a complete tool from scratch
l7 "write a bash script that takes a target IP, runs nmap for open ports, checks each port for known CVEs using searchsploit, and produces a markdown report with findings sorted by severity"

# Generate a config file
l7 "create a production-ready nginx.conf that reverse-proxies to localhost:3000, enables gzip, sets security headers, and configures TLS with Let's Encrypt paths"

# Research and summarize
l7 "analyze the CVE-2024-3094 xz backdoor -- explain the attack chain, affected versions, detection methods, and write an IOC checklist to evidence/xz-iocs.md"

# Refactor existing code
l7 "refactor the Python files in src/ to use async/await instead of threading, update all call sites, and make sure the existing tests still pass"

# Build infrastructure
l7 "write a docker-compose.yml with postgres, redis, and a Python FastAPI app -- include health checks, volume mounts, and a .env.example with all required variables"
```

### WPRD mode -- task list from a file

Pass a WPRD file. l7 works through every `[ ]` task in order, verifying each one.

```bash
# Run a WPRD in the current directory
l7 WPRD.md

# Run a WPRD from a specific path
l7 projects/api-rewrite/WPRD.md

# Run with a different model
l7 --model gpt-4o WPRD.md

# Preview what will happen without executing
l7 --dry-run WPRD.md
```

### WPRD with title and verify checks

The `## Title` section names the run. It shows in the dashboard banner so you can identify what's running at a glance.

```markdown
## Title

Express API Build

## Context

Build a REST API for user management using Express.js and PostgreSQL.
A task is done when all verify commands pass and the server responds correctly.

## Rules of Engagement

- Use TypeScript strict mode
- All endpoints return JSON
- Include input validation on every route
- Do not use any ORM -- write raw SQL

## Tasks

- [ ] Initialize the project with package.json and tsconfig.json
  verify: test -f package.json
  verify: test -f tsconfig.json
  verify: grep -q '"strict": true' tsconfig.json
- [ ] Create the database schema with users and sessions tables
  verify: test -f schema.sql
  verify: grep -q "CREATE TABLE users" schema.sql
  verify: grep -q "CREATE TABLE sessions" schema.sql
- [ ] Implement POST /users endpoint with validation
  verify: npx tsc --noEmit
  verify: curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/users -X POST -H "Content-Type: application/json" -d '{"email":"test@test.com","name":"Test"}' | grep -q 201
- [ ] Implement GET /users/:id endpoint
  verify: curl -s http://localhost:3000/users/1 | jq -e '.email'
- [ ] Add error handling middleware
  verify: curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/users/999 | grep -q 404
```

When running, the banner shows:

```
██        ██████   ██████  ███████  ███████
██       ██    ██ ██    ██ ██    ██      ██
██       ██    ██ ██    ██ ███████     ██
██       ██    ██ ██    ██ ██        ██
████████  ██████   ██████  ██       ██

  Express API Build  WPRD.md
  tail -f ~/.l7/20260403T200726Z_express_api_build/20260403T200726Z_express_api_build.log
```

The `tail -f` line is a copy-pasteable command you can run in another terminal to follow the AI's work in real time.

### WPRD with accept criteria

Natural-language conditions checked by the AI reviewer after the worker finishes.

```markdown
## Title

Payments Documentation Sprint

## Context

Write internal documentation for the payments module.
Done means the docs are accurate, complete, and a new engineer could onboard from them alone.

## Rules of Engagement

- Write in plain English, no jargon without definitions
- Include diagrams as Mermaid code blocks where helpful
- Every public function must be documented

## Tasks

- [ ] Document the payment flow from checkout to settlement
  accept: Covers the full lifecycle: cart -> checkout -> charge -> webhook -> settlement
  accept: Includes a Mermaid sequence diagram
  accept: Lists all error states and retry behavior
- [ ] Document the refund process
  accept: Explains partial vs full refunds
  accept: Covers the Stripe webhook handling
  accept: Includes example API calls with curl
- [ ] Create a troubleshooting guide for common payment failures
  accept: Covers at least 5 failure scenarios
  accept: Each scenario has symptoms, cause, and resolution steps
```

### WPRD with both verify and accept

Use verify for structural checks, accept for semantic checks. Both must pass.

```markdown
## Title

Pentest Report Generator

## Context

Create a CLI penetration testing report generator.
A task is done when the tool runs without errors and the output meets quality standards.

## Rules of Engagement

- Python 3.11+, use click for CLI
- Output must be valid Markdown and convertible to PDF via pandoc
- Include CVSS score calculations

## Tasks

- [ ] Create the report generator CLI skeleton
  verify: test -f report_gen.py
  verify: python3 report_gen.py --help
  accept: Has subcommands for 'new', 'add-finding', and 'generate'
- [ ] Implement the 'add-finding' subcommand
  verify: python3 report_gen.py new --title "Test" --output /tmp/test-report
  verify: python3 report_gen.py add-finding --report /tmp/test-report --title "SQLi" --severity critical
  accept: Stores findings in a structured JSON file
  accept: Validates CVSS vector strings
- [ ] Implement the 'generate' subcommand
  verify: python3 report_gen.py generate --report /tmp/test-report --format markdown --output /tmp/report.md
  verify: test -f /tmp/report.md
  accept: Generated report has executive summary, findings sorted by severity, and remediation recommendations
  accept: Each finding includes CVSS score, description, impact, and remediation
```

### Controlling execution

```bash
# Stop after processing 3 tasks (useful for testing a WPRD)
l7 --max-iterations 3 WPRD.md

# Allow more retries for flaky tasks (default is unlimited)
l7 --max-retries 5 WPRD.md

# Longer delay between retries (e.g. waiting for a service to start)
l7 --retry-delay 15 WPRD.md

# Give the AI more time for complex tasks (30 minutes)
l7 --ai-timeout 1800 WPRD.md

# Give the reviewer more time (10 minutes)
l7 --review-timeout 600 WPRD.md

# Combine multiple options
l7 --model gpt-4o --max-retries 5 --ai-timeout 1800 WPRD.md
```

### Disabling verification

```bash
# Skip shell verify: checks (useful when iterating on the WPRD itself)
l7 --no-verify WPRD.md

# Skip the AI review pass (faster, less thorough)
l7 --no-review WPRD.md

# Skip all verification (raw speed, trust the AI)
l7 --no-verify --no-review WPRD.md
```

### Debugging and previewing

```bash
# See exactly what prompt will be sent to the AI, without running it
l7 --dry-run WPRD.md

# Dry-run a single task
l7 --dry-run "explain how l7 builds prompts"

# Enable verbose debug output
l7 -v WPRD.md

# Dry-run with verbose to see full internal state
l7 --dry-run -v WPRD.md
```

### Infrastructure and DevOps WPRD

```markdown
## Title

Production Monitoring Stack

## Context

Set up a monitoring stack for a production Kubernetes cluster.
We run on AWS EKS. The cluster has 12 nodes across 3 availability zones.
A task is done when the component is deployed, healthy, and producing data.

## Rules of Engagement

- Use Helm charts from official repos where available
- All secrets go in AWS Secrets Manager, not in manifests
- Every deployment must have resource limits and health checks
- Use namespace 'monitoring' for everything

## Tasks

- [ ] Deploy Prometheus with persistent storage
  verify: kubectl get pods -n monitoring -l app=prometheus --no-headers | grep -q Running
  verify: curl -s http://localhost:9090/api/v1/status/config | jq -e '.status == "success"'
- [ ] Deploy Grafana with SSO integration
  verify: kubectl get pods -n monitoring -l app=grafana --no-headers | grep -q Running
  accept: Configured with OAuth2 proxy for SSO
  accept: Has at least 3 default dashboards (cluster overview, node metrics, pod metrics)
- [ ] Deploy Alertmanager with PagerDuty integration
  verify: kubectl get pods -n monitoring -l app=alertmanager --no-headers | grep -q Running
  accept: Routes critical alerts to PagerDuty
  accept: Routes warning alerts to Slack
- [ ] Create alert rules for SLO violations
  verify: curl -s http://localhost:9090/api/v1/rules | jq -e '.data.groups | length > 0'
  accept: Covers error rate > 1%, latency p99 > 500ms, and pod restart loops
```

### Security assessment WPRD

```markdown
## Title

Admin Dashboard Security Review

## Context

Perform a security review of the internal admin dashboard.
Target: https://admin.internal.example.com
The app is a React SPA backed by a Node.js API on port 8443.
A task is done when findings are documented with evidence and reproduction steps.

## Rules of Engagement

- Do not perform denial of service testing
- Do not modify or delete production data
- Document all findings in evidence/ directory
- Screenshot or curl output required for every finding
- Stay within the admin.internal.example.com scope

## Tasks

- [ ] Enumerate all API endpoints and authentication mechanisms
  verify: test -f evidence/api-endpoints.md
  accept: Lists every endpoint with method, path, auth requirement, and parameters
- [ ] Test for IDOR vulnerabilities across all resource endpoints
  verify: test -f evidence/idor-findings.md
  accept: Tested every endpoint that takes a resource ID
  accept: Documents which endpoints are vulnerable and which are properly scoped
- [ ] Test session management and token security
  verify: test -f evidence/session-findings.md
  accept: Covers token expiration, rotation, invalidation on logout
  accept: Checks for secure cookie flags (HttpOnly, Secure, SameSite)
- [ ] Test for injection vulnerabilities (SQLi, XSS, command injection)
  verify: test -f evidence/injection-findings.md
  accept: Tested all user-input fields and URL parameters
  accept: Each finding has a proof-of-concept payload and impact assessment
- [ ] Generate the final security report
  verify: test -f evidence/security-report.md
  accept: Has executive summary, risk matrix, and prioritized remediation plan
  accept: Every finding has severity, CVSS score, evidence, and fix recommendation
```

### Data pipeline WPRD

```markdown
## Title

S3 to Postgres ETL Pipeline

## Context

Build an ETL pipeline that ingests CSV files from S3, transforms them, and loads into PostgreSQL.
Source bucket: s3://raw-data-intake/daily/
Target database: analytics_warehouse on port 5432.
A task is done when the pipeline processes the sample file without errors and data appears in the target table.

## Rules of Engagement

- Python 3.11 with pandas for transforms
- Use connection pooling for database writes
- All transforms must be idempotent (re-running the same file produces the same result)
- Log every step with timestamps to pipeline.log

## Tasks

- [ ] Create the S3 file ingestion module
  verify: python3 -c "from pipeline.ingest import S3Ingester; print('ok')"
  accept: Supports glob patterns for file selection
  accept: Handles missing files gracefully with clear error messages
- [ ] Create the transformation module with data validation
  verify: python3 -c "from pipeline.transform import Transformer; print('ok')"
  accept: Validates column types, null constraints, and value ranges
  accept: Produces a validation report for each file
- [ ] Create the PostgreSQL loader with upsert support
  verify: python3 -c "from pipeline.load import PGLoader; print('ok')"
  accept: Uses COPY for bulk inserts, falls back to upsert for conflicts
  accept: Reports row counts (inserted, updated, skipped, failed)
- [ ] Create the CLI entrypoint that orchestrates the full pipeline
  verify: python3 -m pipeline --help
  verify: python3 -m pipeline --source "s3://raw-data-intake/daily/sample.csv" --target analytics_warehouse --dry-run
  accept: Dry-run mode shows what would happen without writing to the database
- [ ] Write integration tests with a sample CSV
  verify: python3 -m pytest tests/test_integration.py -v
  accept: Tests cover: valid file, malformed file, duplicate records, empty file
```

### Resuming an interrupted run

```bash
# First run -- gets interrupted at task 4 of 10
l7 WPRD.md
# ^C

# Second run -- automatically picks up from the interrupted task
l7 WPRD.md
```

Tasks marked `[\]` (in progress) are resumed first. No manual intervention needed.

### Using a different model

```bash
# Use a specific model for both worker and reviewer
l7 --model gpt-4o WPRD.md

# Use a fast model for quick tasks
l7 --model o3-mini "generate a .gitignore for a Python project"

# Use a reasoning model for complex work
l7 --model o3 WPRD.md
```

---

## Modes of Operation

### Single Task Mode

Pass a task description as a string. The AI works autonomously until it's done and exits. No WPRD, no task state management, no verification layers.

### WPRD Mode

Pass a WPRD file. l7 loops through every task. Each task goes through: mark in-progress -> AI work -> verify -> review -> mark done.

---

## WPRD Format

Four sections. The entire file is sent to the AI as context for every task.

```markdown
## Title

A name for this run. Shows in the dashboard banner.

## Context

What the project is about, the environment, the overall objective.
Include what "done" means -- how the agent should decide a task is complete.

## Rules of Engagement

- Do's and don'ts the agent must follow for every task
- Constraints, boundaries, style requirements
- What to avoid, what to prefer

## Tasks

- [ ] First task to do
  verify: shell command that must exit 0
  accept: Natural-language criterion for the AI reviewer
- [ ] Second task
- [+] Already completed task
  - result: output or notes added by the agent as nested bullet points
- [x] Previously failed task (skipped)
```

### Section details

| Section | Purpose | Enforcement |
|---------|---------|-------------|
| `## Title` | Names the run -- displayed in the dashboard banner | Display only |
| `## Context` | Tells the agent *what* it's working on and *when* something counts as done | Injected as framing context at the top of every worker prompt |
| `## Rules of Engagement` | Tells the agent *how* to behave while working | Injected as explicit constraints in the worker prompt. The reviewer verifies compliance on every task -- violations cause the task to fail review and retry. |
| `## Tasks` | The actual work items with optional verification | Parsed for task state, `verify:` commands, and `accept:` criteria |

### How sections are enforced

The Context and Rules of Engagement are not just passed as background text. l7 extracts them from the WPRD and injects them as structurally prominent sections in both the worker and reviewer prompts:

**Worker prompt** receives:
1. The full WPRD file (for reference)
2. Context as a framing section ("your working environment")
3. Rules of Engagement as explicit constraints ("you MUST follow these -- the reviewer will verify compliance")
4. The exact task text stated explicitly ("Implement this specific task: ...")
5. Accept criteria for the current task (if defined)

**Reviewer prompt** receives:
1. The full WPRD file (for reference)
2. Rules of Engagement as a verification checklist ("verify compliance -- if ANY rule is violated, verdict is FAIL")
3. Accept criteria as a second checklist (if defined)

This means Rules of Engagement are enforced on every task through the review pass. A task that completes its work but violates a rule will fail review and be retried.

---

## Task States

Tasks use a 4-state notation:

| Marker | State | Meaning | Color in dashboard |
|--------|-------|---------|-------------------|
| `[ ]` | Pending | To do, not yet started | dim |
| `[\]` | In progress | Currently being worked on | white bold |
| `[+]` | Completed | Finished successfully | dim |
| `[x]` | Failed | Did not complete (retries exhausted or stopped by breaker) | white bold |

### State transitions

```
[ ] pending
 |
 |  l7 picks up the task
 v
[\] in progress
 |
 |  AI works, then verify + review
 |
 +---> [+] completed    (all checks passed)
 |
 +---> [x] failed       (retries exhausted, if limited)
```

l7 manages these transitions automatically:

1. When a task is picked up: `[ ]` -> `[\]`
2. When verification passes: `[\]` -> `[+]`
3. On retry (if AI marked it `[+]` prematurely): `[+]` -> `[\]` (reset before re-sending to AI)
4. When retries are exhausted (if limited): `[\]` -> `[x]`

The AI is also told the notation and asked to mark tasks `[+]` when done. If the AI marks it directly and verification passes, l7 respects that. If verification fails, l7 resets the marker to `[\]` before retrying.

### Resuming interrupted runs

If l7 is interrupted (Ctrl+C, crash, timeout), tasks marked `[\]` stay in progress. On the next run, l7 picks up `[\]` tasks first before moving to `[ ]` tasks. Interrupted work is automatically resumed.

By default, retries are unlimited -- l7 keeps retrying a failing task until it succeeds or the run is interrupted. Use `--max-retries N` to cap retries per task.

### Writing a WPRD

Start all tasks as `[ ]`. You can pre-mark tasks if needed:

```markdown
## Tasks

- [+] Initial setup (already done manually)
  - project scaffolded, dependencies installed
- [x] Broken deployment (skip this, known issue)
- [ ] First real task
- [ ] Second task
- [ ] Third task
```

When the agent completes a task, it changes the marker to `[+]` and adds results as nested bullet points below the task line, without modifying the task text:

```markdown
- [+] Ping google.com 5 times and calculate the average latency
  - avg: 7.712 ms (min: 7.1, max: 8.4)
  - all 5 packets received, 0% loss
  verify: test -f results.txt
```

---

## Task Verification

### The Three Layers

After the AI finishes working on a task, up to three checks run:

```
AI finishes work
       |
       v
[1] verify: ---------> Shell commands from WPRD (must exit 0)
       |
       | all pass
       v
[2] Rules of     ----> Reviewer checks each rule from ## Rules of Engagement
    Engagement         Violations cause FAIL
       +
    accept: ---------> Reviewer checks each accept: criterion
       +
    AI review          Returns PASS or FAIL
       |
       | pass
       v
[3] Mark [+] --------> Task completed, move to next
```

If any layer fails, the task is retried. By default, retries are unlimited -- the task is retried until it passes. If `--max-retries N` is set, the task is marked `[x]` after N failures.

### verify: -- Shell Checks

Shell commands you write in the WPRD. Each must exit 0.

```markdown
- [ ] Create the database schema
  verify: test -f schema.sql
  verify: grep -q "CREATE TABLE" schema.sql
```

### accept: -- Acceptance Criteria

Natural-language conditions checked by the AI reviewer.

```markdown
- [ ] Research quantum computing history
  accept: Covers Feynman's 1981 proposal
  accept: Mentions Shor's algorithm
  accept: Includes recent IBM/Google milestones
```

### verify: vs accept:

- If you can check it with a shell command, use `verify:`
- If you'd check it by reading, use `accept:`
- Use both together when a task has structural AND semantic requirements

---

## Execution Control

### Retry Behavior

When a task fails (empty response, API error, failed verify, or failed review):
1. If the AI marked the task `[+]` during its attempt, l7 resets it to `[\]`
2. The prompt is rebuilt fresh (picks up any WPRD changes from the failed attempt)
3. Wait `--retry-delay` seconds
4. Retry the task
5. By default, retries are unlimited -- the task is retried until it succeeds
6. If `--max-retries N` is set, mark the task `[x]` after N failures and move on
7. After 3 consecutive `[x]` failures, stop entirely

---

## Progress Display

### Dashboard

Shown before each task. Updates live.

```
  [==============>...................................] 2/7 (28%)
  [+] Setup project
  [+] Write core module
  [x] Deploy to staging
  [\] Fix deployment config
  [>] Retry deployment
  [ ] Write documentation
  [ ] Final review
  2m 34s  ·  5 calls  ·  $0.48
```

| Icon | Meaning |
|------|---------|
| `[+]` | completed |
| `[x]` | failed |
| `[\]` | in progress |
| `[>]` | next up |
| `[ ]` | pending |

### Run Summary

Shown when all tasks finish. Also written to the stats file.

```
  complete

  [====================] 5/5 (100%)

  elapsed  4m 12s
  calls    8
  tokens   58070
  cost     $0.48
  checks   5/5 verify  3/3 review

  log    ~/.l7/20260403T.../20260403T....log
  stats  ~/.l7/20260403T.../20260403T....txt
```

### Run Files

Each execution creates a unique directory under `~/.l7/`:

```
~/.l7/20260403T200726Z_api_security_audit/
  20260403T200726Z_api_security_audit.log        # full interaction log
  20260403T200726Z_api_security_audit.txt        # run stats
  20260403T200726Z_api_security_audit_wprd.md    # final WPRD state
```

The `.log` file contains every prompt sent, every raw response, every verify/review result with timestamps. The `.txt` file is the same stats summary shown in the terminal.

### Live Following

The log file is populated live during execution. AI output is streamed to the log as it happens, so you can follow along in real time from another terminal.

At startup, l7 prints a `tail -f` command you can copy-paste:

```
  Express API Build  WPRD.md
  tail -f ~/.l7/20260403T200726Z_express_api_build/20260403T200726Z_express_api_build.log
```

Run that command in a second terminal to see:
- The prompt being sent to the AI
- Raw AI JSON output as it streams (tool calls, text generation, file edits)
- Verify check results (pass/fail with commands)
- Review verdicts (pass/fail with explanations)
- Token usage and cost per call

---

## Cost Tracking

Token usage from both worker and reviewer calls is tracked. Requires `bc`.

---

## How It Works

```
1. parse args, check requirements
2. create run directory (~/.l7/<timestamp>_<title>/)
3. print banner with tail -f command for live following
4. loop:
   a. get next task ([\] first, then [ ])
   b. if none → show summary, write stats, exit
   c. mark [\] in progress
   d. show dashboard
   e. ensure task is [\] (reset if AI marked [+] in a prior failed attempt)
   f. build prompt with explicit task text and accept: criteria
   g. run AI (background, with timeout watchdog + live log streaming)
   h. show spinner with activity detection
   i. parse result
   j. re-locate task line (AI may have inserted result lines)
   k. run verify: checks
   l. run AI review with accept: criteria
   m. pass → mark [+]
   n. fail → retry (unlimited by default, or up to --max-retries)
   o. retries exhausted (if limited) → mark [x]
   p. 3 consecutive [x] → stop
   q. repeat
```

Each task is passed to the AI explicitly by name ("Implement this specific task: ...") rather than relying on the AI to find it in the WPRD. The prompt is rebuilt fresh on every attempt (including retries) to pick up any WPRD changes.

l7 edits the WPRD file directly via sed to transition task markers. The AI is also told the notation and asked to mark `[+]` when done. Both paths converge to the same state.

---

## CLI Reference

```
l7 - Loop 7 - Autonomous AI Task Loop

USAGE:
  l7 path/to/WPRD.md          WPRD mode
  l7 "task description"       Single task mode

OPTIONS:
  --model <name>         Override opencode model
  --max-iterations N     Stop after N tasks (0 = unlimited)
  --max-retries N        Retries per failed task (0 = unlimited, default)
  --retry-delay N        Seconds between retries (default: 5)
  --ai-timeout N         Max seconds per AI call (default: 900)
  --review-timeout N     Max seconds per review call (default: 300)
  --no-verify            Skip verify: shell checks
  --no-review            Skip AI review (and accept: checking)
  --dry-run              Show prompt without executing
  --wprd-template        Print a blank WPRD template to stdout
  -v, --verbose          Show debug output
  -h, --help             Show this help
```

---

## Reliability

| Feature | Detail |
|---------|--------|
| 4-state tracking | `[ ]` `[\]` `[+]` `[x]` -- always know where things stand |
| Explicit task targeting | each task is passed to the AI by name, not discovered by the AI |
| Interrupted resume | `[\]` tasks picked up first on restart |
| verify: checks | shell commands that must exit 0 |
| accept: criteria | natural-language conditions checked by AI reviewer |
| AI review | second AI call inspects work |
| Unlimited retries | default: keeps retrying until success (cap with `--max-retries N`) |
| Retry state reset | if AI marked task `[+]` but verify/review failed, marker is reset to `[\]` before retry |
| Fresh prompt per attempt | prompt is rebuilt on each retry to pick up WPRD changes |
| Result-line tolerance | verify/accept scanning skips AI-inserted result bullets without breaking |
| Failed marking | exhausted retries → `[x]`, never left dangling |
| Failure breaker | 3 consecutive `[x]` → stop |
| Timeout watchdog | kills hung AI after configurable timeout |
| Live log streaming | AI output streamed to log file in real time for `tail -f` following |
| Clean shutdown | all children killed on exit |
| Run logging | full interaction log + stats file per execution |

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Tasks stuck as `[\]` | Previous run was interrupted. l7 resumes them automatically. Manual fix: change `[\]` to `[ ]` |
| Want to retry `[x]` tasks | Change `[x]` to `[ ]` in the WPRD and run again |
| verify: keeps failing | Run the command manually. Use `--dry-run` to preview. Use `--no-verify` to skip |
| Review keeps saying FAIL | Add specific `accept:` criteria. Use `--no-review` to skip |
| opencode not found | Install from [opencode.ai/docs](https://opencode.ai/docs/) |
| AI hangs | Timeout kills it automatically. Adjust with `--ai-timeout 1800` |
| AI works on wrong task | Should not happen -- l7 passes each task by name. Check the WPRD for duplicate task text |
| Want to watch the AI work | Copy the `tail -f` command shown at startup and run it in another terminal |

---

## License

MIT
