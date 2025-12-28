# team7 Sub-Agents Index

> **Complete listing of all team7 sub-agents for the FedRAMP Red Team Exercise**

## Agent Overview

This directory contains all specialized sub-agents that support the team7 primary agent in executing the FedRAMP Red Team Exercise Test Plan.

## Agent Inventory

### Primary Orchestration Agent

The primary orchestration agent is defined at:
- **File**: `./team7.md`
- **Config**: Configured in `opencode.jsonc` as the primary agent

> **Note**: The primary agent (`team7`) is an **orchestrator** that delegates all specialized tasks to the sub-agents listed below. It does NOT perform security testing directly.

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
| `t7-report-generation-agent.md` | Final Report Generation | Generate comprehensive final report |

### Specialized team7 Agents

| Agent File | Description | Purpose |
|------------|-------------|---------|
| `t7-bbhunter.md` | Bug Bounty Hunter | World class bug bounty hunting |
| `t7-malwareanalyst.md` | Malware Analyst | World class malware analysis |
| `t7-pentester.md` | Penetration Tester | World class penetration testing |
| `t7-pentesterweb.md` | Web Application Pentester | World class web app security testing |
| `t7-redteamer.md` | Red Team Operator | World class red team operations |
| `t7-threathunter.md` | Threat Hunter | World class threat hunting |
| `t7-reviewer.md` | Code Reviewer | Security-focused code review |

### Vulnerability Specialists

| Agent File | Description | Purpose | Phases |
|------------|-------------|---------|--------|
| `t7-xss-specialist.md` | XSS Vulnerability Specialist | XSS analysis and exploitation (Reflected, Stored, DOM) | Analysis, Exploitation |
| `t7-injection-specialist.md` | Injection Vulnerability Specialist | SQLi, Command Injection, SSTI, LFI, RFI analysis | Analysis, Exploitation |
| `t7-ssrf-specialist.md` | SSRF Vulnerability Specialist | SSRF analysis and internal service access | Analysis, Exploitation |

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
team7-primary
├── Phase 1 Agents
│   ├── t7-recon-agent
│   │   └── feeds → t7-vuln-analysis-agent, t7-dataflow-mapping-agent, t7-code-review-agent
│   ├── t7-vuln-analysis-agent
│   │   └── feeds → t7-exploitation-agent, t7-compliance-agent
│   ├── t7-container-security-agent
│   │   └── feeds → t7-exploitation-agent, t7-lateral-movement-agent
│   ├── t7-auth-bypass-agent
│   │   └── feeds → t7-exploitation-agent, t7-cloud-pivot-agent
│   └── t7-dataflow-mapping-agent
│       └── feeds → t7-cloud-pivot-agent, t7-reverse-tunnel-agent
├── Phase 2 Agents
│   ├── t7-exploitation-agent
│   │   └── feeds → t7-lateral-movement-agent, t7-persistence-agent
│   ├── t7-cloud-pivot-agent
│   │   └── feeds → t7-lateral-movement-agent, t7-data-exfiltration-agent
│   ├── t7-reverse-tunnel-agent
│   │   └── feeds → t7-data-exfiltration-agent
│   ├── t7-lateral-movement-agent
│   │   └── feeds → t7-data-exfiltration-agent
│   └── t7-persistence-agent
│       └── feeds → t7-report-generation-agent
├── Phase 3 Agents
│   └── t7-data-exfiltration-agent
│       └── feeds → t7-report-generation-agent
├── Vulnerability Specialists (Two-Phase: Analysis + Exploitation)
│   ├── t7-xss-specialist → XSS analysis/exploitation
│   ├── t7-injection-specialist → Injection analysis/exploitation
│   └── t7-ssrf-specialist → SSRF analysis/exploitation
├── Specialized Agents
│   ├── t7-bbhunter → Bug bounty hunting
│   ├── t7-malwareanalyst → Malware analysis
│   ├── t7-pentester → Penetration testing
│   ├── t7-pentesterweb → Web app testing
│   ├── t7-redteamer → Red team operations
│   ├── t7-threathunter → Threat hunting
│   ├── t7-reviewer → Security-focused code review
│   └── t7-code-review-agent → White-box code analysis, attack surface mapping
└── Support Agents
    ├── t7-compliance-agent → t7-report-generation-agent
    ├── t7-certificate-agent → t7-compliance-agent, t7-report-generation-agent
    ├── t7-evidence-collection-agent → t7-report-generation-agent
    ├── t7-tools-arsenal-agent → All agents
    ├── t7-social-engineering-agent → t7-report-generation-agent
    └── t7-report-generation-agent → Final deliverables
```

## Usage

### Invoking a Sub-Agent

There are two methods to invoke sub-agents:

**Method 1: @ Mention (Direct)**
```
@t7-recon-agent Perform comprehensive reconnaissance on the target target system
```

```
@t7-container-security-agent Execute test case TC-001 for container escape prevention
```

```
@t7-compliance-agent Run CIS Debian 11 Benchmark assessment on the target
```

**Method 2: Task Tool (Programmatic)**
```python
Task(
    description="Reconnaissance scan",
    prompt="Perform comprehensive reconnaissance on the target target system",
    subagent_type="t7-recon-agent"
)
```

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

## Agent Configuration

Each sub-agent is configured with:
- **temperature**: Controls response creativity (0.1-0.4 for security tasks)
- **maxSteps**: Maximum agentic iterations before forced response
- **tools**: Specific tool access (bash, read, write, etc.)
- **permission**: Permission levels for sensitive operations

See `opencode.jsonc` for full configuration details.

## Design Patterns Integration

### Oh-My-Opencode Patterns

team7 sub-agents integrate oh-my-opencode design patterns for consistent agent behavior:

**Operational Discipline (All Agents)**
- Intent Analysis: EXECUTE FIRST - classify request before acting
- Parallel Execution: DEFAULT BEHAVIOR - launch independent tasks simultaneously
- Structured Results: MANDATORY FORMAT - return data in defined schemas
- Evidence Requirements: Document all findings with reproducible steps
- Date Awareness: CRITICAL - context awareness for temporal data

**Vulnerability Specialist Pattern (t7-*-specialist agents)**
- Two-Phase Workflow: ANALYSIS → EXPLOITATION
  - Phase 1 (ANALYSIS): Discover all sinks, classify render contexts, build exploitation queue
  - Phase 2 (EXPLOITATION): Execute verified payloads, demonstrate impact
- Output Format: JSON queues (e.g., `xss_exploitation_queue.json`) for reproducible testing
- Witness Payloads: Test with benign payloads to confirm sink existence before exploitation

**White-Box Analysis Pattern (t7-code-review-agent)**
- Pre-Reconnaissance: Static code analysis before dynamic testing
- Attack Surface Mapping: Entry points, sinks, API endpoints, critical paths
- Sink Classification: XSS, SSRF, Injection, Deserialization categories
- Context Tracing: Source-to-sink data flow analysis

**Evidence Collection Pattern (t7-evidence-collection-agent)**
- Chain of Custody: Timestamps, hashes, collector attribution
- Structured Evidence: Screenshots, logs, artifacts, network captures
- Preservable Format: FedRAMP-compliant documentation structure

### Pattern Enforcement

All sub-agents follow these mandatory patterns:
1. **MUST** execute Intent Analysis before any other action
2. **MUST** use parallel execution for independent tasks
3. **MUST** return structured results in defined formats
4. **MUST** document evidence with reproducible steps
5. **MUST** update deliverables in `deliverables/` directory

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
├── recon_deliverable.md              # t7-recon-agent
├── vuln_analysis_deliverable.md      # t7-vuln-analysis-agent
├── container_security_deliverable.md # t7-container-security-agent
├── auth_bypass_deliverable.md        # t7-auth-bypass-agent
├── dataflow_deliverable.md           # t7-dataflow-mapping-agent
├── certificate_deliverable.md        # t7-certificate-agent
├── compliance_deliverable.md         # t7-compliance-agent
├── code_analysis_deliverable.md     # t7-code-review-agent (white-box)
├── xss_exploitation_queue.json      # t7-xss-specialist (analysis phase)
├── injection_exploitation_queue.json # t7-injection-specialist (analysis phase)
├── ssrf_exploitation_queue.json     # t7-ssrf-specialist (analysis phase)
└── final_report.md                   # t7-report-generation-agent
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

- **Version**: Current (updated with oh-my-opencode patterns integration)
- **FedRAMP Test Plan Version**: Latest
- **Assessment Period**: As defined in engagement scope

### Recent Updates
- Added Vulnerability Specialists section (XSS, Injection, SSRF)
- Integrated oh-my-opencode design patterns across all agents
- Added two-phase vulnerability specialist workflow (Analysis + Exploitation)
- Added deliverables directory structure documentation
- Updated agent dependencies tree with t7-code-review-agent
- Added evidence collection and chain of custody patterns
