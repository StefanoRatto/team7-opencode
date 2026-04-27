# team7 Sub-Agents Index

> **Complete listing of all team7 sub-agents for the Red Team Exercise**

## Agent Overview

This directory contains all specialized sub-agents that support the team7 primary agent in executing the Red Team Exercise Test Plan.

team7's orchestration system is inspired by [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) (OmO), [gstack](https://github.com/garrytan/gstack), and [mattpocock/skills](https://github.com/mattpocock/skills), adapting their multi-agent coordination patterns, engineering discipline, and structured interview techniques for offensive security operations.

**OmO concepts**: IntentGate (true intent classification), category-based routing, ultrawork mode (continuous autonomous execution), wisdom accumulation (cross-agent learning), boulder protocol (anti-idle enforcement), and skill injection (technology-specific context).

**gstack concepts**: Builder Ethos (Boil the Lake completeness principle, Search Before Exploiting, Three Layers of Knowledge), Safety Guardrails (/careful, /freeze, /guard patterns), Investigation Protocol (Iron Law -- no fixes without investigation), Cross-Validation Protocol (multi-agent finding verification), Engagement Readiness Dashboard (phase gate tracking), Security Sprint Process (Discover -> Scope -> Plan -> Recon -> Analyze -> Exploit -> Deliver -> Verify -> Retro), Post-Engagement Retrospective, Proactive Agent Suggestions, Engagement Discovery Protocol (6 forcing questions), Autoplan Pipeline (Strategic -> Technical -> Compliance -> Scope Lock), Delivery Workflow (readiness checks, evidence audit, packaging), Post-Remediation Verification, Security Posture Baselines, Browser-Based Verification Loop, Report Quality Scoring (0-10 dimensions, security slop detection), Operator Sovereignty Protocol, Confusion Protocol, Self-Regulation Heuristics (exploitation risk budget), Auto-Documentation Sync, Continuous Checkpoint Mode, and ELI16 Communication Mode.

**Matt Pocock concepts**: Grill-Me (relentless plan interrogation), Design-An-Interface (parallel radically-different designs via sub-agents), TDD vertical slices (one test -> one implementation -> repeat), Triage-Issue (root-cause investigation with TDD fix plans), Zoom-Out (abstraction-level elevation), Caveman Mode (ultra-compressed communication), To-PRD (conversation-to-scope synthesis), and To-Issues (vertical-slice task decomposition with AFK/HITL classification).

**Compound Engineering concepts** (from [EveryInc/compound-engineering-plugin](https://github.com/EveryInc/compound-engineering-plugin)): Confidence-Anchored Finding Scoring (5 discrete anchors: 0/25/50/75/100 with cross-reviewer promotion and suppression gates), Multi-Persona Tiered Finding Review (6 parallel review personas with fingerprint-based dedup pipeline and remediation classification), Compound Knowledge Store (YAML frontmatter for machine retrieval, category directories, grep-first search, 5-dimension overlap detection, discoverability checks), Right-Sizing Protocol (Quick/Standard/Deep engagement classification matching ceremony to scope), Formal Document Review Before Execution (5 scope review personas dispatched against engagement plans), Smart Escalation Patterns (8-pattern exploitation escalation table for structured failure diagnosis), Session History Mining (prior session transcript search for investigation context), Traceability ID System (S-IDs for scope items, AP-IDs for attack paths, F-IDs for findings, E-IDs for evidence), Protected Artifact Classes, Compound Knowledge Refresh and Maintenance (Keep/Update/Consolidate/Replace/Delete outcomes), and Structured Web Research Methodology (5-phase search: Scope -> Narrow -> Deep Extract -> Gap-Fill -> Stop).

## Agent Inventory

### Primary Orchestration Agent

The primary orchestration agent is defined at:
- **File**: `./team7.md`
- **Config**: Configured in `opencode.jsonc` as the primary agent

> **Note**: The primary agent (`team7`) is an **orchestrator** that delegates all specialized tasks to the sub-agents listed below. It does NOT perform security testing directly.

### Strategic Agents (Inspired by OmO Prometheus/Oracle + gstack /office-hours)

| Agent File | Description | Purpose |
|------------|-------------|---------|
| `t7-planner-agent.md` | Engagement Planner (Prometheus-style + gstack reframe) | Interview-mode scope definition, premise challenge, reframe protocol, phased attack planning, risk register |
| `t7-oracle-agent.md` | Security Oracle (Read-only consultant) | Attack path analysis, risk assessment, exploitation decision support |
| `t7-investigator-agent.md` | Root-Cause Investigator (gstack /investigate) | Hypothesis-driven failure analysis, three-strike rule, dead end documentation |

### Phase 1: Reconnaissance and Establishing the Foothold

| Agent File | Description | Objective |
|------------|-------------|-----------|
| `t7-recon-agent.md` | Deep System Reconnaissance (OSINT & Local) | (1) Gather critical details about target and Debian OS |
| `t7-vuln-analysis-agent.md` | Configuration & Vulnerability Analysis | (2) Identify security misconfigurations |
| `t7-container-security-agent.md` | Container Escape & Security Testing | Test container security (TC-001 to TC-007) |
| `t7-auth-bypass-agent.md` | Authentication Bypass & Account Mapping | (3) Identify unauthenticated access vectors |
| `t7-dataflow-mapping-agent.md` | Critical Dataflow Mapping | (4) Document communication paths to backend |

### Phase 2: Exploitation and Lateral Movement

| Agent File | Description | Objective |
|------------|-------------|-----------|
| `t7-exploitation-agent.md` | Vulnerability Exploitation & PoC Development | Develop and execute exploits |
| `t7-cloud-pivot-agent.md` | Cloud Back-end Pivot via target | (5) Pivot to backend using target access |
| `t7-reverse-tunnel-agent.md` | Reverse Tunneling & Covert Channels | (6) Establish reverse tunnel to backend |
| `t7-lateral-movement-agent.md` | Internal Lateral Movement | (7) Move between systems and targets |
| `t7-persistence-agent.md` | Persistence Mechanism Analysis | Analyze persistence vectors |

### Phase 3: Action on Objectives

| Agent File | Description | Objective |
|------------|-------------|-----------|
| `t7-data-exfiltration-agent.md` | Data Exfiltration from Cloud Back-end | (8) Demonstrate data exfiltration capability |

### Continuous/Support Agents

| Agent File | Description | Purpose |
|------------|-------------|---------|
| `t7-compliance-agent.md` | CIS & NIAP Compliance Assessment | CIS Debian 11 & NIAP PP-OS v4.3 compliance |
| `t7-certificate-agent.md` | Certificate & Cryptographic Analysis | Certificate validity verification (TC-010) |
| `t7-evidence-collection-agent.md` | Evidence Collection & Chain of Custody | Collect and preserve all evidence |
| `t7-tools-arsenal-agent.md` | Security Tools Management | Manage and document all tools |
| `t7-social-engineering-agent.md` | Social Engineering Assessment | Phishing/pretexting if authorized |
| `t7-report-generation-agent.md` | Final Report Generation + Retro | Generate comprehensive final report and post-engagement retrospective |

### Specialized team7 Agents

| Agent File | Description | Purpose |
|------------|-------------|---------|
| `t7-bbhunter.md` | Bug Bounty Hunter | Bug bounty hunting |
| `t7-malwareanalyst.md` | Malware Analyst | Malware analysis |
| `t7-pentester.md` | Penetration Tester | Penetration testing |
| `t7-pentesterweb.md` | Web Application Pentester | Web app security testing with structured QA methodology |
| `t7-redteamer.md` | Red Team Operator | Red team operations |
| `t7-threathunter.md` | Threat Hunter | Threat hunting |
| `t7-reviewer.md` | Code Reviewer | Security-focused code review with paranoid review mode |
| `t7-code-review-agent.md` | White-Box Analyst + CSO | Static analysis, attack surface mapping, OWASP + STRIDE threat modeling |

### Vulnerability Specialists

| Agent File | Description | Purpose | Phases |
|------------|-------------|---------|--------|
| `t7-xss-specialist.md` | XSS Vulnerability Specialist | XSS analysis and exploitation (Reflected, Stored, DOM) | Analysis, Exploitation |
| `t7-injection-specialist.md` | Injection Vulnerability Specialist | SQLi, Command Injection, SSTI, LFI, RFI analysis | Analysis, Exploitation |
| `t7-ssrf-specialist.md` | SSRF Vulnerability Specialist | SSRF analysis and internal service access | Analysis, Exploitation |

### Trail of Bits Advanced Capabilities

| Agent File | Description | Purpose | Key Skills |
|------------|-------------|---------|------------|
| `t7-smart-contract-auditor.md` | Blockchain Security Specialist | Smart contract auditing (Solana, Cosmos, Substrate) | `solana-vuln-scanner`, `token-integration-analyzer` |
| `t7-fuzzing-specialist.md` | Fuzzing Specialist | Automated fuzzing and harness generation | `libfuzzer`, `aflpp`, `harness-writing`, `cargo-fuzz` |

### Installed Skills (from skills.sh)

Skills are reusable SKILL.md instruction files that extend agent capabilities. Managed via the `/skills` command.

| Skill | Source | Purpose | Load Command |
|-------|--------|---------|-------------|
| `pdf` | anthropics/skills | Read, extract, merge, split, create, OCR PDFs | `skill(name="pdf")` |
| `docx` | anthropics/skills | Create, read, edit Word documents (.docx) | `skill(name="docx")` |
| `pptx` | anthropics/skills | Create, read, edit PowerPoint presentations | `skill(name="pptx")` |
| `xlsx` | team7 (custom) | Create, read, edit Excel spreadsheets (.xlsx) with formatting, formulas, charts | `skill(name="xlsx")` |

**Installation paths:**
- Canonical: `~/.config/opencode/skills/{pdf,docx,pptx,xlsx}/` (real files, portable, committed to git)
- No symlinks -- everything self-contained in `~/.config/opencode/`

**Dependencies (installed):**
- Python: `pypdf`, `pdfplumber`, `reportlab`, `pytesseract`, `pdf2image`, `markitdown[pptx]`, `Pillow`, `openpyxl`, `xlsxwriter`
- Node.js (global): `docx`, `pptxgenjs`
- System: `poppler-utils` (pdftotext, pdftoppm)

**Managing skills:** Use the `/skills` custom command:
```
/skills search <query>     Search skills.sh
/skills add <owner/repo>   Install skill(s)
/skills list               Show installed skills
/skills update             Update installed skills
/skills remove <name>      Remove a skill
```

## Test Case Coverage

| Test Case | Agent | Description |
|-----------|-------|-------------|
| TC-001 | t7-container-security-agent | Container Escape Prevention |
| TC-002 | t7-container-security-agent | Memory Residue Protection |
| TC-003 | t7-container-security-agent | Resource Limit Enforcement (DoS Prevention) |
| TC-004 | t7-container-security-agent | Container Isolation |
| TC-005 | t7-container-security-agent | Privilege Minimization |
| TC-006 | t7-container-security-agent | Credential Security (Container) |
| TC-007 | t7-container-security-agent | Image Signing Verification |
| TC-008 | t7-auth-bypass-agent | Low-Privilege Command Escalation |
| TC-009 | t7-auth-bypass-agent | Authentication Lockout |
| TC-010 | t7-certificate-agent | Certificate Validity Period (<=13 months) |

## Objective Coverage

| Objective | Agent(s) | Phase |
|-----------|----------|-------|
| (1) Deep System Reconnaissance | t7-recon-agent | Phase 1 |
| (2) Configuration and Vulnerability Analysis | t7-vuln-analysis-agent | Phase 1 |
| (3) Authentication Bypass and Account Mapping | t7-auth-bypass-agent | Phase 1 |
| (4) Critical Dataflow Mapping | t7-dataflow-mapping-agent | Phase 1 |
| (5) Cloud Back-end Pivot via target | t7-cloud-pivot-agent | Phase 2 |
| (6) Reverse Tunneling Attempt | t7-reverse-tunnel-agent | Phase 2 |
| (7) Internal Lateral Movement | t7-lateral-movement-agent | Phase 2 |
| (8) Data Exfiltration from Cloud Back-end | t7-data-exfiltration-agent | Phase 3 |

## Compliance Framework Coverage

| Framework | Agent | Scope |
|-----------|-------|-------|
| CIS Debian 11 Benchmark v2.0.0 | t7-compliance-agent | Full benchmark assessment |
| NIAP PP-OS v4.3 | t7-compliance-agent | Protection profile verification |
| NIST 800-53 | t7-vuln-analysis-agent | Control correlation |
| NIST 800-115 | t7-report-generation-agent | Methodology documentation |
| MITRE ATT&CK | All agents | Technique mapping |

## Agent Dependencies

```
team7-primary (Orchestrator)
|
+-- Strategic Agents (Pre-engagement)
|   +-- t7-planner-agent (engagement planning, scope definition, reframe protocol)
|   |   +-- produces -> deliverables/engagement-plan.md
|   +-- t7-oracle-agent (read-only consultation, attack path analysis)
|   |   +-- advises -> orchestrator decisions at phase boundaries
|   +-- t7-investigator-agent (root-cause investigation, failure analysis)
|       +-- produces -> investigation reports, dead end documentation
|       +-- feeds -> AGENTS.md NOTES, orchestrator pivot decisions
|
+-- Phase 1 Agents (Reconnaissance & Foothold)
|   +-- t7-recon-agent
|   |   +-- feeds -> t7-vuln-analysis-agent, t7-dataflow-mapping-agent, t7-code-review-agent
|   +-- t7-vuln-analysis-agent
|   |   +-- feeds -> t7-exploitation-agent, t7-compliance-agent
|   +-- t7-container-security-agent
|   |   +-- feeds -> t7-exploitation-agent, t7-lateral-movement-agent
|   +-- t7-auth-bypass-agent
|   |   +-- feeds -> t7-exploitation-agent, t7-cloud-pivot-agent
|   +-- t7-dataflow-mapping-agent
|       +-- feeds -> t7-cloud-pivot-agent, t7-reverse-tunnel-agent
|
+-- Phase 2 Agents (Exploitation & Lateral Movement)
|   +-- t7-exploitation-agent
|   |   +-- feeds -> t7-lateral-movement-agent, t7-persistence-agent
|   |   +-- on failure -> t7-investigator-agent (root-cause analysis)
|   +-- t7-cloud-pivot-agent
|   |   +-- feeds -> t7-lateral-movement-agent, t7-data-exfiltration-agent
|   +-- t7-reverse-tunnel-agent
|   |   +-- feeds -> t7-data-exfiltration-agent
|   +-- t7-lateral-movement-agent
|   |   +-- feeds -> t7-data-exfiltration-agent
|   +-- t7-persistence-agent
|       +-- feeds -> t7-report-generation-agent
|
+-- Phase 3 Agents (Action on Objectives)
|   +-- t7-data-exfiltration-agent
|       +-- feeds -> t7-report-generation-agent
|
+-- Vulnerability Specialists (Two-Phase: Analysis + Exploitation)
|   +-- t7-xss-specialist -> XSS analysis/exploitation
|   +-- t7-injection-specialist -> Injection analysis/exploitation
|   +-- t7-ssrf-specialist -> SSRF analysis/exploitation
|
+-- Specialized Agents
|   +-- t7-bbhunter -> Bug bounty hunting
|   +-- t7-malwareanalyst -> Malware analysis
|   +-- t7-pentester -> Penetration testing
|   +-- t7-pentesterweb -> Web app testing (with structured QA methodology)
|   +-- t7-redteamer -> Red team operations
|   +-- t7-threathunter -> Threat hunting
|   +-- t7-reviewer -> Security-focused code review (with paranoid review mode)
|   +-- t7-code-review-agent -> White-box code analysis, attack surface mapping, CSO/STRIDE
|
+-- Support Agents
    +-- t7-compliance-agent -> t7-report-generation-agent
    +-- t7-certificate-agent -> t7-compliance-agent, t7-report-generation-agent
    +-- t7-evidence-collection-agent -> t7-report-generation-agent
    +-- t7-tools-arsenal-agent -> All agents
    +-- t7-social-engineering-agent -> t7-report-generation-agent
    +-- t7-report-generation-agent -> Final deliverables + retro
```

## Usage

### Invoking a Sub-Agent

There are two methods to invoke sub-agents:

**Method 1: @ Mention (Direct)**
```
@t7-recon-agent Perform comprehensive reconnaissance on the target target system
```

```
@t7-oracle-agent Should we prioritize the SQLi on /api/users or the auth bypass on /admin?
```

```
@t7-planner-agent Plan a full red team engagement for the target environment
```

**Method 2: Task Tool (Programmatic)**
```python
Task(
    description="Reconnaissance scan",
    prompt="Perform comprehensive reconnaissance on the target target system",
    subagent_type="t7-recon-agent"
)
```

### Category-Based Routing (OmO-Inspired)

Instead of picking agents by name, think in categories:

```python
# Category: recon-fast -> maps to t7-recon-agent
Task(description="Quick port scan", prompt="...", subagent_type="t7-recon-agent")

# Category: strategic-consult -> maps to t7-oracle-agent
Task(description="Attack path analysis", prompt="...", subagent_type="t7-oracle-agent")

# Category: strategic-plan -> maps to t7-planner-agent
Task(description="Engagement planning", prompt="...", subagent_type="t7-planner-agent")

# Category: specialist -> maps to specific specialist
Task(description="SQLi deep dive", prompt="...", subagent_type="t7-injection-specialist")
```

### Ultrawork Mode

When the user says `ultrawork` or `ulw`, the orchestrator enters continuous autonomous execution:

1. Launch ALL Phase 1 agents in parallel
2. Synthesize results with wisdom accumulation
3. Automatically chain to Phase 2
4. Continue to Phase 3
5. Generate final report
6. Do NOT stop until complete or user interrupts

### Parallel Execution for Maximum Performance

Launch multiple independent agents simultaneously:
```python
# Phase 1 parallel execution
Task(description="Recon", prompt="...", subagent_type="t7-recon-agent")
Task(description="Vuln scan", prompt="...", subagent_type="t7-vuln-analysis-agent")
Task(description="Container tests", prompt="...", subagent_type="t7-container-security-agent")
Task(description="Auth testing", prompt="...", subagent_type="t7-auth-bypass-agent")
Task(description="Dataflow mapping", prompt="...", subagent_type="t7-dataflow-mapping-agent")
Task(description="Cert analysis", prompt="...", subagent_type="t7-certificate-agent")
Task(description="Compliance", prompt="...", subagent_type="t7-compliance-agent")
```

### Vulnerability Specialist Usage Pattern

Vulnerability specialists follow a two-phase pattern:
```python
# Phase 1: Analysis (discover all sinks and potential vectors)
Task(description="XSS Analysis", prompt="PHASE: ANALYSIS ...", subagent_type="t7-xss-specialist")
Task(description="Injection Analysis", prompt="PHASE: ANALYSIS ...", subagent_type="t7-injection-specialist")
Task(description="SSRF Analysis", prompt="PHASE: ANALYSIS ...", subagent_type="t7-ssrf-specialist")

# Phase 2: Exploitation (after analysis completes and prioritization is done)
Task(description="XSS Exploitation", prompt="PHASE: EXPLOITATION ...", subagent_type="t7-xss-specialist")
Task(description="Injection Exploitation", prompt="PHASE: EXPLOITATION ...", subagent_type="t7-injection-specialist")
Task(description="SSRF Exploitation", prompt="PHASE: EXPLOITATION ...", subagent_type="t7-ssrf-specialist")
```

### Agent Communication

Sub-agents communicate findings through structured output that feeds into:
1. Other dependent agents for continued assessment
2. Evidence collection agent for documentation
3. Report generation agent for final deliverables
4. **Wisdom accumulation** for cross-agent learning (OmO-inspired)

## Agent Configuration

Each sub-agent is configured with:
- **temperature**: Controls response creativity (0.1-0.4 for security tasks)
- **maxSteps**: Maximum agentic iterations before forced response
- **tools**: Specific tool access (bash, read, write, etc.)
- **permission**: Permission levels for sensitive operations

See `opencode.jsonc` for full configuration details.

## OmO-Inspired + gstack-Inspired + Pocock-Inspired Design Patterns

### Patterns Integrated from oh-my-openagent

team7 adapts the following patterns from [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) for offensive security:

| OmO Pattern | team7 Adaptation | Where Documented |
|-------------|-----------------|------------------|
| **IntentGate** | Security-specific intent classification (RECONNAISSANCE, EXPLOITATION, INVESTIGATION, HARDENING, DOCUMENTATION, PLANNING) | team7.md - Intent Gate section |
| **Category System** | Security task categories (recon-fast, vuln-exploit, web-test, specialist, strategic-plan, etc.) | team7.md - Category-Based Routing |
| **Ultrawork Mode** | Continuous autonomous execution across all engagement phases | team7.md - Ultrawork Mode |
| **Prometheus Planner** | t7-planner-agent: interview-mode engagement planning | agent/t7-planner-agent.md |
| **Oracle Consultant** | t7-oracle-agent: read-only strategic security consultation | agent/t7-oracle-agent.md |
| **Atlas Wisdom** | Wisdom Accumulation Protocol: cross-agent learning (successes, failures, conventions, gotchas) | team7.md - Wisdom Accumulation |
| **Boulder/Ralph Loop** | Boulder Protocol + Continuous Execution: anti-idle enforcement, don't stop until done | team7.md - Boulder Protocol, Continuous Execution |
| **Todo Enforcer** | Enhanced todo management with anti-idle checks | team7.md - Todo Management |
| **Comment Checker** | Finding Quality Gate: evidence, severity justification, business impact, reproducibility | team7.md - Finding Quality Gate |
| **Skill-Embedded MCPs** | Skill Injection Protocol: technology-specific attack knowledge (WordPress, AWS, JWT, Docker, API) | team7.md - Skill Injection |
| **/init-deep** | Hierarchical AGENTS.md for complex engagements | team7.md - Deep Init |
| **/handoff** | Structured Handoff Format for session rotation | team7.md - Structured Handoff |
| **Fallback Chains** | Agent fallback chains documented per capability | team7.md - Fallback Logic |
| **Session Continuity** | Three-tier memory + session archive + structured handoff | team7.md - Adaptive Context |

### Patterns Integrated from Matt Pocock Skills

team7 adapts the following skills from [mattpocock/skills](https://github.com/mattpocock/skills) for offensive security:

| Pocock Skill | team7 Adaptation | Where Documented |
|-------------|-----------------|------------------|
| **grill-me** (MANDATORY) | Security Engagement Grilling: relentless interview about engagement plans until every branch resolved | team7.md - Grill-Me Skill |
| **design-an-interface** | Parallel Attack Path Design: spawn 3+ sub-agents with radically different attack strategies, then compare | team7.md - Design-An-Interface Skill |
| **triage-issue** | Security Finding Triage: investigate root cause, produce verification plan with test-verify cycles | team7.md - Triage-Issue Skill |
| **zoom-out** | Architecture Zoom-Out: go up a layer of abstraction, map modules/callers/trust boundaries | team7.md - Zoom-Out Skill |
| **caveman** | Caveman Mode: ultra-compressed communication (~75% token reduction) while preserving technical accuracy | team7.md - Caveman Skill |
| **tdd** | Exploit-Verify-Refine Loop: vertical-slice methodology for exploit development (probe -> confirm -> refine) | team7.md - TDD Skill |
| **to-prd** | Engagement Scope Synthesis: synthesize conversation context into formal engagement scope document | team7.md - To-PRD Skill |
| **to-issues** | Task Vertical Slicing: break engagement plans into thin AFK/HITL vertical slices with dependency ordering | team7.md - To-Issues Skill |

### Patterns Integrated from gstack

team7 adapts the following patterns from [gstack](https://github.com/garrytan/gstack) for offensive security:

| gstack Pattern | team7 Adaptation | Where Documented |
|----------------|-----------------|------------------|
| **Boil the Lake** | Completeness Principle: do the complete assessment, not the 80% version. Parallel agents make completeness cheap. | team7.md - Builder Ethos |
| **Search Before Building** | Search Before Exploiting: check exploit-db, known PoCs, standard tools before building custom. Three Layers of Knowledge. | team7.md - Builder Ethos |
| **Effort Compression** | Show human-team vs AI-assisted time estimates for security tasks (100x for recon, 50x for scanning, etc.) | team7.md - Effort Compression Table |
| **/careful + /freeze + /guard** | Safety Guardrails: destructive command warnings, scope lock, evidence preservation guardrail | team7.md - Safety Guardrails |
| **/investigate Iron Law** | Investigation Protocol: no fixes without investigation, hypothesis-driven, three-strike rule | team7.md - Investigation Protocol |
| **t7-investigator-agent** | New agent for systematic root-cause investigation when exploits fail or findings are ambiguous | agent/t7-investigator-agent.md |
| **/codex Multi-AI** | Cross-Validation Protocol: verify critical findings with a different agent than the one that discovered them | team7.md - Cross-Validation |
| **Review Readiness Dashboard** | Engagement Readiness Dashboard: phase gate tracking before proceeding to next phase | team7.md - Engagement Readiness |
| **Sprint Process** | Security Sprint: Scope -> Plan -> Recon -> Analyze -> Exploit -> Report -> Retro | team7.md - Security Sprint |
| **/retro** | Post-Engagement Retrospective: per-agent performance, metrics, dead ends, lessons learned | agent/t7-report-generation-agent.md |
| **/office-hours Reframe** | Reframe Protocol in t7-planner-agent: challenge the operator's framing, premise challenge, six forcing questions | agent/t7-planner-agent.md |
| **/review Paranoid Mode** | Paranoid Review: auto-fix obvious issues, flag completeness gaps, structural audit focus | agent/t7-reviewer.md |
| **/cso OWASP + STRIDE** | CSO Mode in t7-code-review-agent: OWASP Top 10 scan + STRIDE threat model with confidence gate | agent/t7-code-review-agent.md |
| **/qa Methodology** | Structured QA in t7-pentesterweb: diff-aware testing, systematic exploration, regression testing | agent/t7-pentesterweb.md |
| **Proactive Skill Suggestions** | Context-aware agent recommendations based on engagement phase and accumulated wisdom | team7.md - Proactive Agent Suggestions |
| **External Tool Integration** | Pattern for integrating Nessus/Burp/nuclei results: parse, classify, feed valid findings into engagement | team7.md - External Tool Integration |

### Operational Discipline (All Agents)

- Intent Analysis: EXECUTE FIRST - classify request before acting
- Parallel Execution: DEFAULT BEHAVIOR - launch independent tasks simultaneously
- Structured Results: MANDATORY FORMAT - return data in defined schemas
- Evidence Requirements: MANDATORY - Every piece of evidence must be collected together with the command that generated it
- Date Awareness: CRITICAL - context awareness for temporal data
- Language Protocol: MANDATORY - Toned down, no fuss, no fluff, no hype, no superlatives, no absolutes
- **Wisdom Injection**: Include accumulated wisdom from prior agents in all delegations
- **Skill Pack Injection**: Include technology-specific attack patterns when target tech is known

### Vulnerability Specialist Pattern (t7-*-specialist agents)

- Two-Phase Workflow: ANALYSIS -> EXPLOITATION
  - Phase 1 (ANALYSIS): Discover all sinks, classify render contexts, build exploitation queue
  - Phase 2 (EXPLOITATION): Execute verified payloads, demonstrate impact
- Output Format: JSON queues (e.g., `xss_exploitation_queue.json`) for reproducible testing
- Witness Payloads: Test with benign payloads to confirm sink existence before exploitation

### White-Box Analysis Pattern (t7-code-review-agent)

- Pre-Reconnaissance: Static code analysis before dynamic testing
- Attack Surface Mapping: Entry points, sinks, API endpoints, critical paths
- Sink Classification: XSS, SSRF, Injection, Deserialization categories
- Context Tracing: Source-to-sink data flow analysis

### Evidence Collection Pattern (t7-evidence-collection-agent)

- Chain of Custody: Timestamps, hashes, collector attribution
- Structured Evidence: Screenshots, logs, artifacts, network captures
- Preservable Format: Standardized documentation structure

### Pattern Enforcement

All sub-agents follow these mandatory patterns:
1. **MUST** execute Intent Analysis before any other action
2. **MUST** use parallel execution for independent tasks
3. **MUST** return structured results in defined formats
4. **MUST** document evidence with reproducible steps
5. **MUST** update deliverables in `deliverables/` directory
6. **MUST** consume and contribute to wisdom accumulation

## File Locations

All agent definition files are located in:
```
./agent/
```

Primary agent configuration:
```
./team7.md
./opencode.jsonc
```

## Deliverables Directory

Agents write structured outputs to the `deliverables/` directory:

```
deliverables/
+-- engagement-plan.md                # t7-planner-agent (with reframe protocol)
+-- recon_deliverable.md              # t7-recon-agent
+-- vuln_analysis_deliverable.md      # t7-vuln-analysis-agent
+-- container_security_deliverable.md # t7-container-security-agent
+-- auth_bypass_deliverable.md        # t7-auth-bypass-agent
+-- dataflow_deliverable.md           # t7-dataflow-mapping-agent
+-- certificate_deliverable.md        # t7-certificate-agent
+-- compliance_deliverable.md         # t7-compliance-agent
+-- code_analysis_deliverable.md      # t7-code-review-agent (white-box + CSO/STRIDE)
+-- xss_exploitation_queue.json       # t7-xss-specialist (analysis phase)
+-- injection_exploitation_queue.json # t7-injection-specialist (analysis phase)
+-- ssrf_exploitation_queue.json      # t7-ssrf-specialist (analysis phase)
+-- investigation_reports/            # t7-investigator-agent (root-cause reports)
+-- retro.md                          # t7-report-generation-agent (post-engagement retro)
+-- final_report.md                   # t7-report-generation-agent
```

### Vulnerability Specialist Queue Files

Specialists produce JSON queue files during the ANALYSIS phase:

**Format:**
```json
{
  "queue": [
    {
      "id": "XSS-001",
      "sink_endpoint": "/api/search",
      "sink_type": "innerHTML",
      "source_parameter": "q",
      "render_context": "HTML_BODY",
      "encoding_gap": true,
      "witness_payload": "\"<img src=x onerror=alert(1)>\"",
      "witness_reflection": "Confirmed",
      "exploitable": true
    }
  ],
  "analysis_summary": {
    "total_sinks": 15,
    "exploitable_sinks": 8,
    "priority_high": 3
  }
}
```

These queue files are consumed during the EXPLOITATION phase to execute targeted, verified payloads.

## Version Information

- **Version**: Current (updated with OmO integration patterns)
- **Test Plan Version**: Latest
- **Assessment Period**: As defined in engagement scope

### Recent Updates
- **[Skills Integration]** Added xlsx skill for Excel spreadsheet creation, reading, and editing (openpyxl + xlsxwriter)
- **[Skills Integration]** Updated Document Processing Skill Pack and routing triggers to include xlsx
- **[Matt Pocock Skills Integration]** Integrated 8 skills from mattpocock/skills adapted for offensive security: grill-me (mandatory), design-an-interface, triage-issue, zoom-out, caveman, tdd, to-prd, to-issues
- **[Matt Pocock Skills Integration]** Added Skill Trigger Routing Table for keyword-based activation of Pocock skills
- **[Matt Pocock Skills Integration]** Added Caveman Mode as operator-triggered ultra-compressed communication supplement to ELI16
- **[Matt Pocock Skills Integration]** Added Exploit-Verify-Refine Loop (TDD-adapted) as micro-methodology for Phase 2 exploitation
- **[Skills Integration]** Added `/skills` custom command for searching, installing, and managing skills from skills.sh
- **[Skills Integration]** Installed document processing skills (pdf, docx, pptx) from anthropics/skills
- **[Skills Integration]** Added Document Processing Skill Pack to Skill Injection Protocol in team7.md
- **[Skills Integration]** Added document processing routing triggers to Smart Routing Logic
- **[gstack Integration]** Added Builder Ethos: Boil the Lake completeness principle, Search Before Exploiting, Three Layers of Knowledge
- **[gstack Integration]** Added Safety Guardrails: destructive command warnings, scope lock, evidence preservation
- **[gstack Integration]** Added Investigation Protocol: Iron Law (no fixes without investigation), three-strike rule, hypothesis-driven analysis
- **[gstack Integration]** Created t7-investigator-agent for systematic root-cause investigation
- **[gstack Integration]** Added Cross-Validation Protocol: independent verification of critical findings by different agents
- **[gstack Integration]** Added Engagement Readiness Dashboard: phase gate tracking before proceeding
- **[gstack Integration]** Added Security Sprint Process: Scope -> Plan -> Recon -> Analyze -> Exploit -> Report -> Retro
- **[gstack Integration]** Added Post-Engagement Retrospective capability to t7-report-generation-agent
- **[gstack Integration]** Enhanced t7-planner-agent with Reframe Protocol, premise challenge, six forcing questions
- **[gstack Integration]** Enhanced t7-reviewer with Paranoid Review Mode: auto-fix, completeness gap detection
- **[gstack Integration]** Enhanced t7-code-review-agent with CSO Mode: OWASP Top 10 + STRIDE threat modeling
- **[gstack Integration]** Enhanced t7-pentesterweb with structured QA methodology: diff-aware, systematic, regression
- **[gstack Integration]** Added Proactive Agent Suggestions based on engagement phase context
- **[gstack Integration]** Added External Tool Integration pattern for Nessus/Burp/nuclei results
- **[gstack Integration]** Added Effort Compression Table showing human-team vs AI-assisted time estimates
- **[OmO Integration]** Added t7-planner-agent (Prometheus-style engagement planner)
- **[OmO Integration]** Added t7-oracle-agent (read-only strategic security consultant)
- **[OmO Integration]** Integrated IntentGate with security-specific intent classification
- **[OmO Integration]** Added category-based task routing system
- **[OmO Integration]** Added ultrawork mode for continuous autonomous execution
- **[OmO Integration]** Added wisdom accumulation protocol for cross-agent learning
- **[OmO Integration]** Added boulder protocol for anti-idle enforcement
- **[OmO Integration]** Added finding quality gate (inspired by OmO comment checker)
- **[OmO Integration]** Added skill injection protocol with technology-specific attack packs
- **[OmO Integration]** Added hierarchical AGENTS.md support (deep init)
- **[OmO Integration]** Added structured handoff format for session rotation
- **[OmO Integration]** Added continuous execution protocol (Ralph Loop equivalent)
- Enforced Mandatory Evidence Protocol: Evidence must be collected with generating commands
- Added Trail of Bits Advanced Capabilities (Blockchain, Fuzzing)
- Integrated `skill` tool access for specialized agents
- Added Vulnerability Specialists section (XSS, Injection, SSRF)
- Integrated oh-my-opencode design patterns across all agents
- Added two-phase vulnerability specialist workflow (Analysis + Exploitation)
- Added deliverables directory structure documentation
- Updated agent dependencies tree with t7-code-review-agent and strategic agents
- Added evidence collection and chain of custody patterns

---

# REFERENCE MATERIAL

## MANDATORY PROMPT TEMPLATES

When delegating to sub-agents, use these templates to ensure high-quality results.

### t7-planner-agent Prompt Template
```
MISSION: [Engagement planning objective]
TARGET: [Target environment description]
AUTHORIZATION: [Level of testing authorized]

REQUIRED OUTPUTS:
- Scoped engagement plan with phases
- Agent assignments per task
- Risk register
- Success criteria
- Time estimates

CONTEXT: [Any known information about the target]
CONSTRAINTS: [Time, scope, or authorization limitations]
```

### t7-oracle-agent Prompt Template
```
MISSION: [Strategic consultation objective]
CONTEXT: [Current engagement state and findings]
QUESTION: [Specific strategic question to answer]

REQUIRED OUTPUTS:
- Analysis with confidence levels
- Ranked recommendations
- Risk/reward assessment
- Clear YES/NO recommendation where applicable

WISDOM: [Accumulated findings from prior agents]
CURRENT PHASE: [Phase 1/2/3 and progress]
```

### t7-investigator-agent Prompt Template
```
MISSION: [Investigation objective -- what failed or is ambiguous]
TARGET: [System/component being investigated]
CONTEXT: [What was attempted and what happened]

REQUIRED OUTPUTS:
- Hypotheses tested with results (CONFIRMED/REJECTED/INCONCLUSIVE)
- Root cause identification with evidence
- Data flow trace showing where the issue occurs
- Dead ends documented (approaches ruled out and why)
- Recommendations for next agent

FAILED ATTEMPTS: [List of what was already tried]
EXPECTED BEHAVIOR: [What should have happened]
ACTUAL BEHAVIOR: [What actually happened]
SCOPE LOCK: [Restrict investigation to this component]
```

### t7-recon-agent Prompt Template
```
MISSION: [Specific reconnaissance objective]
TARGET: [Target identifier - IP, domain, organization]
SCOPE: [In-scope assets and boundaries]
DEPTH: [quick | standard | comprehensive | exhaustive]

REQUIRED OUTPUTS:
- Asset inventory (IPs, domains, subdomains)
- Service enumeration (ports, versions, banners)
- Technology stack identification
- Potential attack surface areas
- Recommended next steps

CONSTRAINTS:
- [Any specific limitations]
- [Stealth requirements if applicable]

WISDOM: [Accumulated findings from prior agents -- see Wisdom Accumulation Protocol]

SKILL PACK: [Technology-specific attack patterns if target tech is known]

PRIORITY FOCUS:
- [Specific areas of interest]
```

### t7-vuln-analysis-agent Prompt Template
```
MISSION: [Vulnerability assessment objective]
TARGET: [Target systems/applications]
SCOPE: [Assessment boundaries]
CONTEXT: [Any prior reconnaissance data]

REQUIRED OUTPUTS:
- Vulnerability inventory with CVE references
- CVSS scores and severity ratings
- Exploitability assessment
- Business impact analysis
- Remediation recommendations prioritized by risk

WISDOM: [Accumulated findings from prior agents]
SCAN INTENSITY: [passive | light | standard | aggressive]
FOCUS AREAS: [Specific vulnerability classes to prioritize]
```

### t7-container-security-agent Prompt Template
```
MISSION: [Container security objective]
TARGET: [Container/orchestration environment]
TEST CASES: [Specific TC-00X to execute]

REQUIRED OUTPUTS:
- Container isolation status
- Escape vector analysis
- Privilege assessment
- Resource limit verification
- Image security findings
- Compliance status (if applicable)

WISDOM: [Accumulated findings from prior agents]
ENVIRONMENT: [Docker | Kubernetes | containerd | other]
ACCESS LEVEL: [Current access/privileges]
```

### t7-auth-bypass-agent Prompt Template
```
MISSION: [Authentication testing objective]
TARGET: [Authentication endpoint/system]
AUTH TYPE: [Basic | Form | OAuth | SAML | JWT | MFA | other]

REQUIRED OUTPUTS:
- Authentication mechanism analysis
- Bypass vectors identified
- Credential exposure findings
- Session management weaknesses
- Account enumeration results
- Lockout policy analysis (TC-008, TC-009 if applicable)

WISDOM: [Accumulated findings from prior agents]
CREDENTIALS: [Any known credentials]
WORDLISTS: [Specific wordlists to use]
INTENSITY: [passive | moderate | aggressive]
```

### t7-dataflow-mapping-agent Prompt Template
```
MISSION: [Dataflow analysis objective]
TARGET: [System/network to analyze]
FOCUS: [Specific data flows of interest]

REQUIRED OUTPUTS:
- Network topology map
- Communication paths documented
- Protocol analysis
- Data classification by sensitivity
- Trust boundary identification
- Potential interception points

WISDOM: [Accumulated findings from prior agents]
CAPTURE DURATION: [Time window for traffic analysis]
PROTOCOLS: [Specific protocols to focus on]
```

### t7-certificate-agent Prompt Template
```
MISSION: [Certificate/crypto analysis objective]
TARGET: [Endpoints to analyze]
TEST CASE: [TC-010 if applicable]

REQUIRED OUTPUTS:
- Certificate inventory
- Validity period assessment (<=13 months requirement)
- Chain of trust verification
- Cipher suite analysis
- Key strength assessment
- Certificate transparency findings
- Compliance status

WISDOM: [Accumulated findings from prior agents]
STANDARDS: [Specific crypto standards to verify against]
```

### t7-compliance-agent Prompt Template
```
MISSION: [Compliance assessment objective]
TARGET: [System to assess]
FRAMEWORK: [CIS Debian 11 | NIAP PP-OS v4.3 | NIST 800-53 | other]

REQUIRED OUTPUTS:
- Control-by-control assessment
- Pass/Fail status for each control
- Evidence collected
- Remediation recommendations
- Compliance percentage score
- Exception documentation

WISDOM: [Accumulated findings from prior agents]
BENCHMARK VERSION: [Specific version]
PROFILE: [Level 1 | Level 2 | Server | Workstation]
```

### t7-exploitation-agent Prompt Template
```
MISSION: [Exploitation objective]
TARGET: [Vulnerable system/service]
VULNERABILITY: [CVE or vulnerability description]

REQUIRED OUTPUTS:
- Exploit development documentation
- PoC code (if developed)
- Exploitation steps
- Success/failure status
- Post-exploitation position achieved
- Evidence of exploitation

WISDOM: [Accumulated findings from prior agents]
SKILL PACK: [Technology-specific attack patterns]
EXPLOIT TYPE: [RCE | privesc | injection | other]
CONSTRAINTS: [Stealth requirements, damage limitations]
EXISTING ACCESS: [Current foothold if any]
```

### t7-cloud-pivot-agent Prompt Template
```
MISSION: [Cloud pivot objective]
TARGET: [Cloud environment - AWS/Azure/GCP]
PIVOT SOURCE: [Current access point]

REQUIRED OUTPUTS:
- Cloud credential discovery
- IAM analysis
- Resource enumeration
- Privilege escalation paths
- Data access achieved
- Persistence options

WISDOM: [Accumulated findings from prior agents]
SKILL PACK: [Cloud-specific attack patterns (AWS/Azure/GCP)]
CLOUD PROVIDER: [AWS | Azure | GCP | multi-cloud]
CURRENT ACCESS: [Compromised credentials/roles]
OBJECTIVE: [Specific cloud resources to access]
```

### t7-reverse-tunnel-agent Prompt Template
```
MISSION: [Tunneling objective]
TARGET: [Network/system to tunnel through]
DESTINATION: [Target endpoint for tunnel]

REQUIRED OUTPUTS:
- Tunnel establishment status
- Covert channel analysis
- Stability assessment
- Detection risk analysis
- Alternative tunnel options
- Persistence of tunnel

WISDOM: [Accumulated findings from prior agents]
TUNNEL TYPE: [SSH | chisel | ligolo | custom]
EGRESS RESTRICTIONS: [Known firewall/proxy rules]
CALLBACK ADDRESS: [Attacker-controlled endpoint]
```

### t7-lateral-movement-agent Prompt Template
```
MISSION: [Lateral movement objective]
SOURCE: [Current compromised system]
DESTINATION: [Target system(s)]

REQUIRED OUTPUTS:
- Movement path documentation
- Credentials used/discovered
- Systems compromised
- Access level on each system
- Detection indicators
- Recommended next movements

WISDOM: [Accumulated findings from prior agents]
TECHNIQUES: [PTH | PTT | PSExec | WMI | SSH | other]
AVAILABLE CREDS: [Credentials available for use]
NETWORK CONTEXT: [Subnet, domain, trust relationships]
```

### t7-data-exfiltration-agent Prompt Template
```
MISSION: [Data exfiltration objective]
TARGET: [Data to exfiltrate]
SOURCE: [Compromised system with data access]

REQUIRED OUTPUTS:
- Data identified and classified
- Exfiltration method used
- Volume of data accessed
- Evidence of capability (not actual exfil in most cases)
- Detection risk assessment
- Data handling compliance

WISDOM: [Accumulated findings from prior agents]
EXFIL METHOD: [HTTP | DNS | ICMP | cloud | physical]
DATA SENSITIVITY: [Classification level]
CONSTRAINTS: [Volume limits, stealth requirements]
```

### t7-persistence-agent Prompt Template
```
MISSION: [Persistence analysis objective]
TARGET: [System to analyze/persist on]
CURRENT ACCESS: [Existing foothold]

REQUIRED OUTPUTS:
- Persistence mechanism inventory
- Recommended persistence techniques
- Detection likelihood for each
- Survivability assessment
- Cleanup procedures
- Evidence collected

WISDOM: [Accumulated findings from prior agents]
PERSISTENCE TYPE: [userland | kernel | firmware | other]
OS TYPE: [Windows | Linux | macOS]
STEALTH REQUIREMENT: [low | medium | high]
```

### t7-social-engineering-agent Prompt Template
```
MISSION: [Social engineering objective]
TARGET: [Target individuals/organization]
PRETEXT: [Cover story/scenario]

REQUIRED OUTPUTS:
- Target reconnaissance
- Pretext development
- Attack vector recommendation
- Success/failure status
- Lessons learned
- Evidence collected

SE TYPE: [phishing | vishing | pretexting | physical]
AUTHORIZATION: [Explicit authorization details]
BOUNDARIES: [What is NOT permitted]
```

### t7-evidence-collection-agent Prompt Template
```
MISSION: [Evidence collection objective]
CONTEXT: [What was found/exploited]
CLASSIFICATION: [Evidence sensitivity level]

REQUIRED OUTPUTS:
- Evidence inventory with hashes
- Chain of custody documentation
- Screenshots/recordings
- Log extracts
- Timestamp correlation
- Storage location

EVIDENCE TYPE: [screenshot | log | artifact | memory | network]
RETENTION: [How long to preserve]
FORMAT: [Required output format]
```

### t7-tools-arsenal-agent Prompt Template
```
MISSION: [Tool management objective]
TASK: [What capability is needed]
ENVIRONMENT: [Target OS/platform]

REQUIRED OUTPUTS:
- Tool recommendation
- Installation steps
- Configuration guidance
- Usage examples
- Alternative tools
- Cleanup procedures

TOOL CATEGORY: [recon | exploit | post-exploit | other]
CONSTRAINTS: [Size limits, detection avoidance]
EXISTING TOOLS: [What's already available]
```

### t7-report-generation-agent Prompt Template
```
MISSION: [Report generation objective]
AUDIENCE: [Executive | Technical | Mixed]
FINDINGS: [Summary of findings to include]

REQUIRED OUTPUTS:
- Executive summary
- Technical findings detail
- Risk ratings
- Remediation roadmap
- Evidence appendix
- Methodology documentation

REPORT TYPE: [Executive | Technical | Full | Custom]
FORMAT: [Markdown | PDF | HTML | Word]
TEMPLATE: [Standard | Formal | Custom]
DEADLINE: [Report due date]
```

### t7-bbhunter Prompt Template
```
MISSION: [Bug bounty objective]
PROGRAM: [Target program - HackerOne/Bugcrowd/etc]
SCOPE: [In-scope targets from program]

REQUIRED OUTPUTS:
- Vulnerability discoveries
- Reproduction steps
- Impact assessment
- Suggested severity
- Draft submission report
- Similar/duplicate check

FOCUS: [Specific vulnerability classes]
TIME BUDGET: [Hours allocated]
PREVIOUS FINDINGS: [Known issues to skip]
```

### t7-malwareanalyst Prompt Template
```
MISSION: [Malware analysis objective]
SAMPLE: [Sample identifier/hash/location]
ANALYSIS TYPE: [Static | Dynamic | Both]

REQUIRED OUTPUTS:
- Sample classification
- Behavioral analysis
- IOC extraction
- C2 identification
- Capabilities assessment
- Detection signatures

SANDBOX: [Available sandbox environment]
TOOLS: [Analysis tools to use]
SAFETY: [Isolation requirements]
```

### t7-pentester Prompt Template
```
MISSION: [Penetration test objective]
TARGET: [Target scope]
TYPE: [External | Internal | Physical]

REQUIRED OUTPUTS:
- Vulnerability findings
- Exploitation results
- Privilege escalation paths
- Lateral movement achieved
- Data access demonstrated
- Remediation priorities

ENGAGEMENT TYPE: [Black | Gray | White box]
RULES OF ENGAGEMENT: [Specific constraints]
TIME WINDOW: [Testing schedule]
```

### t7-pentesterweb Prompt Template
```
MISSION: [Web application test objective]
TARGET: [Application URL/scope]
TYPE: [DAST | SAST | IAST | Manual]

REQUIRED OUTPUTS:
- OWASP Top 10 assessment
- Injection vulnerabilities
- Authentication weaknesses
- Session management issues
- API security findings
- Business logic flaws

AUTHENTICATION: [Credentials if authenticated test]
COVERAGE: [Specific functionality to test]
EXCLUSIONS: [What NOT to test]
```

### t7-redteamer Prompt Template
```
MISSION: [Red team objective]
SCENARIO: [Adversary simulation scenario]
TARGET: [Organization/systems in scope]

REQUIRED OUTPUTS:
- Attack narrative
- TTPs used (MITRE ATT&CK mapping)
- Objectives achieved
- Detection events triggered
- Evasion techniques used
- Lessons learned

ADVERSARY PROFILE: [APT to emulate]
OBJECTIVES: [Flags/goals to achieve]
DURATION: [Engagement timeframe]
```

### t7-threathunter Prompt Template
```
MISSION: [Threat hunting objective]
ENVIRONMENT: [Systems/networks to hunt in]
HYPOTHESIS: [Threat hypothesis to test]

REQUIRED OUTPUTS:
- Hunt findings
- IOC matches
- Anomaly detections
- False positive analysis
- Recommended detections
- Threat assessment

DATA SOURCES: [Logs, EDR, SIEM available]
HUNT TYPE: [IOC-based | TTP-based | Anomaly-based]
TIMEFRAME: [Historical period to analyze]
```

### t7-reviewer Prompt Template
```
MISSION: [Code review objective]
TARGET: [Repository/codebase to review]
FOCUS: [Security | Quality | Both]

REQUIRED OUTPUTS:
- Vulnerability findings in code
- Secure coding violations
- Hardcoded secrets
- Dependency vulnerabilities
- Remediation code suggestions
- Priority ranking

LANGUAGE: [Programming language(s)]
FRAMEWORK: [Frameworks in use]
STANDARDS: [Coding standards to check against]
```

### t7-code-review-agent Prompt Template
```
MISSION: [White-box code analysis objective]
TARGET: [Codebase directory/repository]
SCOPE: [Network-accessible components only | Full codebase]

REQUIRED OUTPUTS:
- Architecture & technology stack analysis
- Authentication & authorization deep dive
- Attack surface analysis (entry points, APIs)
- XSS sinks and render contexts
- SSRF sinks and HTTP client usage
- Injection sinks (SQL, Command, Template)
- Critical file paths categorized by security relevance
- Data security & storage analysis

ANALYSIS DEPTH: [quick | standard | comprehensive]
FOCUS AREAS: [Specific vulnerability classes to prioritize]
OUTPUT FORMAT: deliverables/code_analysis_deliverable.md
```

### t7-xss-specialist Prompt Template
```
MISSION: [XSS analysis/exploitation objective]
TARGET: [Application URL/endpoints]
PHASE: [ANALYSIS | EXPLOITATION]

REQUIRED OUTPUTS (Analysis):
- Source-to-sink traces for all XSS vectors
- Render context classification (HTML_BODY, ATTRIBUTE, JS_STRING, URL, CSS)
- Encoding/sanitization gap analysis
- Vulnerability classification (Reflected, Stored, DOM-based)
- Exploitation queue with witness payloads

REQUIRED OUTPUTS (Exploitation):
- Working payloads for each confirmed vulnerability
- CSP/WAF bypass techniques used
- Impact demonstration (session hijack, data theft)
- Reproducible exploitation steps

INPUT FILES: 
- deliverables/recon_deliverable.md
- deliverables/pre_recon_deliverable.md (XSS sinks section)
- deliverables/xss_exploitation_queue.json (for exploitation)

INTENSITY: [passive | moderate | aggressive]
```

### t7-injection-specialist Prompt Template
```
MISSION: [Injection analysis/exploitation objective]
TARGET: [Application URL/endpoints]
PHASE: [ANALYSIS | EXPLOITATION]
INJECTION_TYPES: [SQLi | CommandInjection | LFI | RFI | SSTI | PathTraversal | Deserialization]

REQUIRED OUTPUTS (Analysis):
- Source-to-sink traces for all injection vectors
- Slot type classification (SQL-val, SQL-ident, CMD-argument, etc.)
- Sanitization coverage analysis
- Post-sanitization concatenation detection
- Exploitation queue with witness payloads

REQUIRED OUTPUTS (Exploitation):
- Database fingerprint and enumeration
- Data extraction proof (first 5 rows from sensitive table)
- Command execution proof (for command injection)
- Reproducible exploitation steps

INPUT FILES:
- deliverables/recon_deliverable.md
- deliverables/pre_recon_deliverable.md (Injection sinks section)
- deliverables/injection_exploitation_queue.json (for exploitation)

DATABASE_TYPE: [MySQL | PostgreSQL | MSSQL | Oracle | SQLite | Unknown]
```

### t7-ssrf-specialist Prompt Template
```
MISSION: [SSRF analysis/exploitation objective]
TARGET: [Application URL/endpoints with URL parameters]
PHASE: [ANALYSIS | EXPLOITATION]

REQUIRED OUTPUTS (Analysis):
- HTTP client usage patterns
- Protocol/scheme validation gaps
- Hostname/IP restriction bypasses
- Port restriction analysis
- URL parsing inconsistencies
- Exploitation queue with suggested techniques

REQUIRED OUTPUTS (Exploitation):
- Internal service access proof
- Cloud metadata retrieval (AWS/Azure/GCP)
- Network reconnaissance results
- Reproducible exploitation steps

INPUT FILES:
- deliverables/recon_deliverable.md
- deliverables/pre_recon_deliverable.md (SSRF sinks section)
- deliverables/ssrf_exploitation_queue.json (for exploitation)

CLOUD_PROVIDER: [AWS | Azure | GCP | Unknown]
INTERNAL_TARGETS: [Known internal IPs/services to test]
```

## RESULT SYNTHESIS TEMPLATES

### Phase 1 Synthesis Template
```markdown
# PHASE 1 RECONNAISSANCE & FOOTHOLD - SYNTHESIS REPORT

## Executive Summary
[2-3 sentence overview of Phase 1 findings]

## Wisdom Accumulated
[Key learnings extracted for Phase 2 agents]

## Agent Results Summary
[Per-agent findings summary]

## Consolidated Attack Paths
[Ranked by likelihood, impact, effort]

## Recommended Phase 2 Actions
[Priority-ordered next steps]
```

### Phase 2 Synthesis Template
```markdown
# PHASE 2 EXPLOITATION & LATERAL MOVEMENT - SYNTHESIS REPORT

## Executive Summary
[2-3 sentence overview]

## Wisdom Accumulated
[Key learnings for Phase 3 agents]

## Exploitation Results
[Per-agent results]

## Access Summary
[Systems compromised, access levels]

## Phase 3 Readiness
[Checklist for action on objectives]
```

### Phase 3 Synthesis Template
```markdown
# PHASE 3 ACTION ON OBJECTIVES - SYNTHESIS REPORT

## Executive Summary
[Final summary]

## Objective Status
[All objectives with COMPLETE/PARTIAL/FAILED]

## Test Case Status
[All test cases with PASS/FAIL]

## Final Evidence Package
[Reference to evidence collection]
```

## PHASE ORCHESTRATION BLOCKS

### PHASE 1: FULL PARALLEL RECONNAISSANCE LAUNCH

```python
# PHASE 1: RECONNAISSANCE & ESTABLISHING FOOTHOLD
# Launch ALL agents in parallel for maximum performance

Task(description="Deep System Reconnaissance", prompt="MISSION: Comprehensive reconnaissance...", subagent_type="t7-recon-agent")
Task(description="Vulnerability Analysis", prompt="MISSION: Comprehensive vulnerability assessment...", subagent_type="t7-vuln-analysis-agent")
Task(description="Container Security Assessment", prompt="MISSION: Container security testing (TC-001 through TC-007)...", subagent_type="t7-container-security-agent")
Task(description="Authentication Testing", prompt="MISSION: Authentication mechanism testing (TC-008, TC-009)...", subagent_type="t7-auth-bypass-agent")
Task(description="Dataflow Mapping", prompt="MISSION: Critical dataflow and communication path mapping...", subagent_type="t7-dataflow-mapping-agent")
Task(description="Certificate Analysis", prompt="MISSION: Certificate and cryptographic analysis (TC-010)...", subagent_type="t7-certificate-agent")
Task(description="Compliance Assessment", prompt="MISSION: CIS and NIAP compliance assessment...", subagent_type="t7-compliance-agent")
```

### PHASE 2: EXPLOITATION & LATERAL MOVEMENT LAUNCH

```python
# PHASE 2: EXPLOITATION & LATERAL MOVEMENT
# Launch after Phase 1 synthesis, based on findings

Task(description="Vulnerability Exploitation", prompt="MISSION: Exploit identified vulnerabilities...", subagent_type="t7-exploitation-agent")
Task(description="Cloud Backend Pivot", prompt="MISSION: Pivot to cloud backend via target access...", subagent_type="t7-cloud-pivot-agent")
Task(description="Reverse Tunnel Establishment", prompt="MISSION: Establish reverse tunnel to backend...", subagent_type="t7-reverse-tunnel-agent")
Task(description="Lateral Movement", prompt="MISSION: Internal lateral movement between systems...", subagent_type="t7-lateral-movement-agent")
Task(description="Persistence Analysis", prompt="MISSION: Analyze persistence mechanisms and options...", subagent_type="t7-persistence-agent")
```

### PHASE 3: ACTION ON OBJECTIVES LAUNCH

```python
# PHASE 3: ACTION ON OBJECTIVES
# Launch after Phase 2 completion

Task(description="Data Exfiltration Demonstration", prompt="MISSION: Demonstrate data exfiltration capability...", subagent_type="t7-data-exfiltration-agent")
Task(description="Final Evidence Collection", prompt="MISSION: Comprehensive evidence collection for all phases...", subagent_type="t7-evidence-collection-agent")
Task(description="Final Report Generation", prompt="MISSION: Generate comprehensive final report...", subagent_type="t7-report-generation-agent")
```

## FALLBACK LOGIC CHAINS

```
PLANNING FALLBACK CHAIN:
t7-planner-agent (PRIMARY) -> t7-oracle-agent -> Manual planning

CONSULTATION FALLBACK CHAIN:
t7-oracle-agent (PRIMARY) -> t7-reviewer -> t7-code-review-agent

RECONNAISSANCE FALLBACK CHAIN:
t7-recon-agent (PRIMARY) -> t7-pentester -> t7-bbhunter -> Manual

VULNERABILITY ANALYSIS FALLBACK CHAIN:
t7-vuln-analysis-agent (PRIMARY) -> t7-pentester -> t7-pentesterweb -> t7-compliance-agent

CONTAINER SECURITY FALLBACK CHAIN:
t7-container-security-agent (PRIMARY) -> t7-exploitation-agent -> t7-compliance-agent

AUTHENTICATION FALLBACK CHAIN:
t7-auth-bypass-agent (PRIMARY) -> t7-pentesterweb -> t7-pentester -> t7-exploitation-agent

EXPLOITATION FALLBACK CHAIN:
t7-exploitation-agent (PRIMARY) -> t7-pentester -> t7-pentesterweb -> t7-redteamer

CLOUD SECURITY FALLBACK CHAIN:
t7-cloud-pivot-agent (PRIMARY) -> t7-pentester -> t7-recon-agent -> t7-exploitation-agent

LATERAL MOVEMENT FALLBACK CHAIN:
t7-lateral-movement-agent (PRIMARY) -> t7-redteamer -> t7-pentester -> t7-exploitation-agent

WEB TESTING FALLBACK CHAIN:
t7-pentesterweb (PRIMARY) -> t7-bbhunter -> t7-pentester -> t7-vuln-analysis-agent

CODE REVIEW FALLBACK CHAIN:
t7-reviewer (PRIMARY) -> t7-vuln-analysis-agent -> t7-pentesterweb -> Manual

MALWARE ANALYSIS FALLBACK CHAIN:
t7-malwareanalyst (PRIMARY) -> t7-threathunter -> t7-reviewer -> Manual

THREAT HUNTING FALLBACK CHAIN:
t7-threathunter (PRIMARY) -> t7-malwareanalyst -> t7-recon-agent -> Manual

REPORT GENERATION FALLBACK CHAIN:
t7-report-generation-agent (PRIMARY) -> t7-evidence-collection-agent -> Manual

INVESTIGATION FALLBACK CHAIN:
t7-investigator-agent (PRIMARY) -> t7-oracle-agent -> t7-reviewer -> Manual
```
