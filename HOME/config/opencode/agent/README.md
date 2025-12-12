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
│   │   └── feeds → t7-vuln-analysis-agent, t7-dataflow-mapping-agent
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
├── Specialized Agents
│   ├── t7-bbhunter → Bug bounty hunting
│   ├── t7-malwareanalyst → Malware analysis
│   ├── t7-pentester → Penetration testing
│   ├── t7-pentesterweb → Web app testing
│   ├── t7-redteamer → Red team operations
│   ├── t7-threathunter → Threat hunting
│   └── t7-reviewer → Code review
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

## Version Information

- **Version**: Current
- **FedRAMP Test Plan Version**: Latest
- **Assessment Period**: As defined in engagement scope
