# team7 Sub-Agents Index

> **Complete listing of all team7 sub-agents for the Red Team Exercise**

## Agent Overview

This directory contains all specialized sub-agents that support the team7 primary agent in executing the Red Team Exercise Test Plan.

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
| `t7-code-review-agent.md` | White-Box Analyst | Static analysis and attack surface mapping |

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
- Preservable Format: Standardized documentation structure

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
- **Test Plan Version**: Latest
- **Assessment Period**: As defined in engagement scope

### Recent Updates
- Added Trail of Bits Advanced Capabilities (Blockchain, Fuzzing)
- Integrated `skill` tool access for specialized agents
- Added Vulnerability Specialists section (XSS, Injection, SSRF)
- Integrated oh-my-opencode design patterns across all agents
- Added two-phase vulnerability specialist workflow (Analysis + Exploitation)
- Added deliverables directory structure documentation
- Updated agent dependencies tree with t7-code-review-agent
- Added evidence collection and chain of custody patterns

---

# REFERENCE MATERIAL

## MANDATORY PROMPT TEMPLATES

When delegating to sub-agents, use these templates to ensure high-quality results.

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

## Agent Results Summary

### t7-recon-agent Findings
- **Assets Discovered**: [count]
- **Key Services**: [list top 5]
- **Attack Surface Rating**: [Low/Medium/High/Critical]
- **Notable Findings**: [bullet points]

### t7-vuln-analysis-agent Findings
- **Critical Vulnerabilities**: [count]
- **High Vulnerabilities**: [count]
- **Most Significant**: [CVE-XXXX-XXXXX description]
- **Exploitability**: [assessment]

### t7-container-security-agent Findings
- **Container Isolation**: [Pass/Fail]
- **Escape Vectors**: [count found]
- **Test Case Results**: TC-001[P/F], TC-002[P/F], ...

### t7-auth-bypass-agent Findings
- **Auth Mechanisms**: [types found]
- **Bypass Vectors**: [count]
- **Credentials Obtained**: [Yes/No]

### t7-dataflow-mapping-agent Findings
- **Communication Paths**: [count mapped]
- **Backend Connections**: [identified]
- **Interception Points**: [count]

### t7-certificate-agent Findings
- **Certificates Analyzed**: [count]
- **TC-010 Status**: [Pass/Fail]
- **Crypto Weaknesses**: [list]

### t7-compliance-agent Findings
- **CIS Compliance**: [X%]
- **NIAP Compliance**: [X%]
- **Critical Gaps**: [list]

## Consolidated Attack Paths
1. [Attack path 1 combining multiple agent findings]
2. [Attack path 2]
3. [Attack path 3]

## Recommended Phase 2 Actions
1. [Priority 1 action]
2. [Priority 2 action]
3. [Priority 3 action]

## Evidence Index
| Finding | Agent | Evidence ID | Location |
|---------|-------|-------------|----------|
| [Finding] | [Agent] | [ID] | [Path] |
```

### Phase 2 Synthesis Template
```markdown
# PHASE 2 EXPLOITATION & LATERAL MOVEMENT - SYNTHESIS REPORT

## Executive Summary
[2-3 sentence overview of Phase 2 achievements]

## Exploitation Results

### t7-exploitation-agent Results
- **Exploits Attempted**: [count]
- **Successful Exploits**: [count]
- **Access Achieved**: [level]
- **Systems Compromised**: [list]

### t7-cloud-pivot-agent Results
- **Cloud Access**: [Yes/No]
- **Resources Accessed**: [list]
- **Privileges Obtained**: [IAM roles/permissions]

### t7-reverse-tunnel-agent Results
- **Tunnel Established**: [Yes/No]
- **Type**: [tunnel type]
- **Stability**: [assessment]

### t7-lateral-movement-agent Results
- **Systems Reached**: [count]
- **Methods Used**: [techniques]
- **Current Position**: [network location]

## Attack Path Executed
```
[Initial Access] -> [Exploitation] -> [Pivot 1] -> [Pivot 2] -> [Objective]
```

## Access Summary
| System | Access Level | Method | Credentials |
|--------|--------------|--------|-------------|
| [Host] | [Level] | [Method] | [Creds] |

## Phase 3 Readiness
- [ ] Data targets identified
- [ ] Exfil paths mapped
- [ ] Evidence collected
- [ ] Ready for action on objectives
```

### Phase 3 Synthesis Template
```markdown
# PHASE 3 ACTION ON OBJECTIVES - SYNTHESIS REPORT

## Executive Summary
[2-3 sentence summary of objective achievement]

## Objective Status

### Primary Objectives
| Objective | Status | Evidence |
|-----------|--------|----------|
| (1) Deep Reconnaissance | [COMPLETE/PARTIAL/FAILED] | [ref] |
| (2) Vulnerability Analysis | [COMPLETE/PARTIAL/FAILED] | [ref] |
| (3) Auth Bypass | [COMPLETE/PARTIAL/FAILED] | [ref] |
| (4) Dataflow Mapping | [COMPLETE/PARTIAL/FAILED] | [ref] |
| (5) Cloud Pivot | [COMPLETE/PARTIAL/FAILED] | [ref] |
| (6) Reverse Tunnel | [COMPLETE/PARTIAL/FAILED] | [ref] |
| (7) Lateral Movement | [COMPLETE/PARTIAL/FAILED] | [ref] |
| (8) Data Exfiltration | [COMPLETE/PARTIAL/FAILED] | [ref] |

### Test Case Status
| Test Case | Status | Finding |
|-----------|--------|---------|
| TC-001 | [PASS/FAIL] | [summary] |
| TC-002 | [PASS/FAIL] | [summary] |
| ... | ... | ... |

## Data Exfiltration Results (t7-data-exfiltration-agent)
- **Data Identified**: [types/volume]
- **Exfil Capability**: [Demonstrated/Not Demonstrated]
- **Method**: [technique used]
- **Evidence**: [reference]

## Final Evidence Package
[Reference to t7-evidence-collection-agent output]

## Report Status
[Reference to t7-report-generation-agent deliverables]
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
```
