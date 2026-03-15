# Claude Code Agents

Ready-to-use subagent files for Claude Code. Copy any agent file to your project's `.claude/agents/` directory (or to `~/.claude/agents/` for personal use across all projects) and it becomes available immediately.

## How to Use

**Install a single agent into your project:**
```bash
cp agents/code-reviewer.md .claude/agents/
```

**Install all core agents into your project:**
```bash
mkdir -p .claude/agents
cp agents/*.md .claude/agents/
```

**Install agents from a category:**
```bash
mkdir -p .claude/agents
cp agents/language-specialists/*.md .claude/agents/
```

**Install an agent for personal use across all projects:**
```bash
mkdir -p ~/.claude/agents
cp agents/code-reviewer.md ~/.claude/agents/
```

**Reload agents without restarting Claude Code:**
```
/agents
```

**Use an agent directly:**
```
Use the code-reviewer agent to review my recent changes.
```

**Trigger auto-delegation** - agents with "use proactively" in their description will be selected automatically when you describe a matching task:
```
Review this code for security issues before I open a PR.
```

## Core Agents

These 12 agents ship with the repo at the top level of `agents/`.

| Agent | Model | Description |
|-------|-------|-------------|
| `code-reviewer.md` | sonnet | Reviews code for quality, security, and best practices. Read-only. Proactive. |
| `security-auditor.md` | opus | Deep OWASP-based security audit with severity ratings. Read-only. |
| `test-writer.md` | sonnet | Writes tests matching the project's framework and style. |
| `debugger.md` | inherit | Root cause analysis using hypothesis-driven debugging. Applies fixes. |
| `docs-writer.md` | sonnet | Writes JSDoc, docstrings, and README content matching project conventions. |
| `refactorer.md` | sonnet | Refactors for readability while preserving behavior. Runs tests before and after. |
| `performance-analyst.md` | sonnet | Identifies N+1 queries, memory leaks, inefficient algorithms, missing indexes. Read-only. |
| `db-reader.md` | haiku | Read-only database queries. PreToolUse hook blocks all write operations. |
| `api-designer.md` | sonnet | Designs RESTful endpoints following REST conventions with OpenAPI output. |
| `migration-planner.md` | inherit | Analyzes current usage and produces phased migration plans with verification steps. |
| `dependency-checker.md` | haiku | Runs npm/pip/bundle/cargo audit and flags vulnerable and outdated packages. |
| `onboarding-guide.md` | sonnet | Generates architecture overviews, key file maps, and setup guides. Uses project memory. |

---

## Community Agents

131 community-contributed agents organized into 10 categories. Source: [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) (MIT license).

### Core Development (`core-development/`)

Agents for building applications across different platforms and architectural styles.

| Agent | Model | Description |
|-------|-------|-------------|
| `api-designer.md` | sonnet | Designing APIs, creating specifications, refactoring API architecture for scalability |
| `backend-developer.md` | sonnet | Building server-side APIs, microservices, and backend systems |
| `electron-pro.md` | sonnet | Building Electron desktop applications with native OS integration |
| `frontend-developer.md` | sonnet | Building complete frontend applications across React, Vue, and Angular |
| `fullstack-developer.md` | sonnet | Building complete features spanning database, API, and frontend layers |
| `graphql-architect.md` | opus | Designing GraphQL schemas across microservices, implementing federation |
| `microservices-architect.md` | opus | Designing distributed systems, decomposing monoliths into microservices |
| `mobile-developer.md` | sonnet | Building cross-platform mobile applications with native performance |
| `ui-designer.md` | sonnet | Designing visual interfaces, creating design systems, building component libraries |
| `websocket-engineer.md` | sonnet | Implementing real-time bidirectional communication with WebSockets |

### Language Specialists (`language-specialists/`)

Deep expertise in specific programming languages and frameworks.

| Agent | Model | Description |
|-------|-------|-------------|
| `angular-architect.md` | sonnet | Architecting enterprise Angular 15+ applications with complex state management |
| `cpp-pro.md` | sonnet | Building high-performance C++ systems with modern C++20/23 features |
| `csharp-developer.md` | sonnet | Building ASP.NET Core web APIs and cloud-native .NET solutions |
| `django-developer.md` | sonnet | Building Django 4+ web applications and REST APIs |
| `dotnet-core-expert.md` | sonnet | Building .NET Core applications with cloud-native architecture |
| `dotnet-framework-4.8-expert.md` | sonnet | Working on legacy .NET Framework 4.8 enterprise applications |
| `elixir-expert.md` | sonnet | Building fault-tolerant, concurrent systems leveraging OTP patterns |
| `flutter-expert.md` | sonnet | Building cross-platform mobile applications with Flutter 3+ |
| `golang-pro.md` | sonnet | Building Go applications with concurrent programming and microservices |
| `java-architect.md` | sonnet | Designing enterprise Java architectures and Spring Boot migrations |
| `javascript-pro.md` | sonnet | Building, optimizing, or refactoring modern JavaScript code |
| `kotlin-specialist.md` | sonnet | Building Kotlin applications with advanced coroutine patterns |
| `laravel-specialist.md` | sonnet | Building Laravel 10+ applications and Eloquent model architectures |
| `nextjs-developer.md` | sonnet | Building production Next.js 14+ applications with full-stack development |
| `php-pro.md` | sonnet | Working with PHP 8.3+ projects with strict typing and modern features |
| `powershell-5.1-expert.md` | sonnet | Automating Windows infrastructure tasks with PowerShell 5.1 |
| `powershell-7-expert.md` | sonnet | Building cross-platform cloud automation scripts with PowerShell 7 |
| `python-pro.md` | sonnet | Building type-safe, production-ready Python code for web APIs and systems |
| `rails-expert.md` | sonnet | Building or modernizing Rails applications with Hotwire |
| `react-specialist.md` | sonnet | Optimizing React applications and implementing advanced React 18+ patterns |
| `rust-engineer.md` | sonnet | Building Rust systems with memory safety and zero-cost abstractions |
| `spring-boot-engineer.md` | sonnet | Building enterprise Spring Boot 3+ microservices applications |
| `sql-pro.md` | sonnet | Optimizing complex SQL queries and designing efficient database schemas |
| `swift-expert.md` | sonnet | Building native iOS, macOS, or server-side Swift applications |
| `typescript-pro.md` | sonnet | Implementing TypeScript with advanced type system patterns and generics |
| `vue-expert.md` | sonnet | Building Vue 3 applications with Composition API and reactivity |

### Infrastructure (`infrastructure/`)

Cloud, DevOps, and infrastructure management agents.

| Agent | Model | Description |
|-------|-------|-------------|
| `azure-infra-engineer.md` | sonnet | Designing and managing Azure infrastructure with network architecture |
| `cloud-architect.md` | opus | Designing and optimizing cloud infrastructure architecture across providers |
| `database-administrator.md` | sonnet | Optimizing database performance and implementing high-availability setups |
| `deployment-engineer.md` | haiku | Designing and optimizing CI/CD pipelines and deployment automation |
| `devops-engineer.md` | sonnet | Building infrastructure automation, CI/CD pipelines, and containerized deployments |
| `devops-incident-responder.md` | sonnet | Responding to production incidents and diagnosing critical service failures |
| `docker-expert.md` | sonnet | Building, optimizing, and securing Docker container images |
| `incident-responder.md` | sonnet | Handling active security breaches, outages, or operational incidents |
| `kubernetes-specialist.md` | sonnet | Designing, deploying, and troubleshooting Kubernetes clusters |
| `network-engineer.md` | sonnet | Designing and troubleshooting cloud and hybrid network infrastructure |
| `platform-engineer.md` | opus | Building internal developer platforms and self-service infrastructure |
| `security-engineer.md` | opus | Implementing comprehensive security solutions across infrastructure |
| `sre-engineer.md` | sonnet | Establishing system reliability through SLOs and error budgets |
| `terraform-engineer.md` | sonnet | Building and scaling infrastructure as code using Terraform |
| `terragrunt-expert.md` | sonnet | Terragrunt infrastructure orchestration and DRY configurations |
| `windows-infra-admin.md` | sonnet | Managing Windows Server, Active Directory, DNS, DHCP, and Group Policy |

### Quality and Security (`quality-security/`)

Testing, code review, security auditing, and compliance agents.

| Agent | Model | Description |
|-------|-------|-------------|
| `accessibility-tester.md` | haiku | Comprehensive accessibility testing and WCAG compliance verification |
| `ad-security-reviewer.md` | opus | Auditing Active Directory security posture and privilege escalation paths |
| `architect-reviewer.md` | opus | Evaluating system design decisions and architectural patterns |
| `chaos-engineer.md` | sonnet | Designing and executing controlled failure experiments |
| `code-reviewer.md` | opus | Comprehensive code reviews for quality, security, and best practices |
| `compliance-auditor.md` | opus | Achieving regulatory compliance and implementing compliance controls |
| `debugger.md` | sonnet | Diagnosing and fixing bugs, identifying root causes of failures |
| `error-detective.md` | sonnet | Diagnosing system errors and correlating error patterns |
| `penetration-tester.md` | opus | Conducting authorized security penetration tests |
| `performance-engineer.md` | sonnet | Identifying and eliminating performance bottlenecks |
| `powershell-security-hardening.md` | opus | Hardening PowerShell automation and securing remoting configuration |
| `qa-expert.md` | sonnet | Comprehensive quality assurance strategy and test planning |
| `security-auditor.md` | opus | Comprehensive security audits, compliance assessments, and risk evaluation |
| `test-automator.md` | sonnet | Building and enhancing automated test frameworks |

### Data and AI (`data-ai/`)

Data engineering, data science, machine learning, and AI agents.

| Agent | Model | Description |
|-------|-------|-------------|
| `ai-engineer.md` | opus | Architecting and optimizing end-to-end AI systems |
| `data-analyst.md` | haiku | Extracting insights from business data, creating dashboards and reports |
| `data-engineer.md` | sonnet | Designing and optimizing data pipelines and ETL/ELT processes |
| `data-scientist.md` | sonnet | Analyzing data patterns and building predictive models |
| `database-optimizer.md` | sonnet | Analyzing slow queries and optimizing database performance |
| `llm-architect.md` | opus | Designing LLM systems for production, implementing RAG architectures |
| `machine-learning-engineer.md` | sonnet | Deploying and optimizing ML models at scale in production |
| `ml-engineer.md` | sonnet | Building production ML systems with model training pipelines |
| `mlops-engineer.md` | sonnet | Designing ML infrastructure and CI/CD for machine learning |
| `nlp-engineer.md` | sonnet | Building production NLP systems and text processing pipelines |
| `postgres-pro.md` | sonnet | Optimizing PostgreSQL performance and high-availability replication |
| `prompt-engineer.md` | sonnet | Designing, optimizing, and evaluating prompts for LLMs |

### Developer Experience (`developer-experience/`)

Tooling, build systems, documentation, and workflow optimization agents.

| Agent | Model | Description |
|-------|-------|-------------|
| `build-engineer.md` | haiku | Optimizing build performance and reducing compilation times |
| `cli-developer.md` | sonnet | Building command-line tools and terminal applications |
| `dependency-manager.md` | haiku | Auditing dependencies for vulnerabilities and resolving version conflicts |
| `documentation-engineer.md` | haiku | Creating and architecting comprehensive documentation systems |
| `dx-optimizer.md` | sonnet | Optimizing complete developer workflow including build times and feedback loops |
| `git-workflow-manager.md` | haiku | Designing and optimizing Git workflows and branching strategies |
| `legacy-modernizer.md` | sonnet | Modernizing legacy systems with incremental migration strategies |
| `mcp-developer.md` | sonnet | Building and debugging Model Context Protocol (MCP) servers and tools |
| `powershell-module-architect.md` | sonnet | Architecting and refactoring PowerShell modules and profile systems |
| `powershell-ui-architect.md` | sonnet | Designing desktop graphical interfaces (WinForms, WPF) with PowerShell |
| `refactoring-specialist.md` | sonnet | Transforming poorly structured code into clean, maintainable code |
| `slack-expert.md` | sonnet | Developing Slack applications and implementing Slack API integrations |
| `tooling-engineer.md` | sonnet | Building developer tools including CLIs, code generators, and linters |

### Specialized Domains (`specialized-domains/`)

Domain-specific agents for fintech, gaming, IoT, blockchain, and more.

| Agent | Model | Description |
|-------|-------|-------------|
| `api-documenter.md` | haiku | Creating API documentation, writing OpenAPI specifications |
| `blockchain-developer.md` | sonnet | Building smart contracts, DApps, and blockchain protocols |
| `embedded-systems.md` | sonnet | Developing firmware for resource-constrained microcontrollers |
| `fintech-engineer.md` | opus | Building payment systems and compliance-heavy financial applications |
| `game-developer.md` | sonnet | Implementing game systems, optimizing rendering, building multiplayer |
| `iot-engineer.md` | sonnet | Designing IoT solutions with device management and edge computing |
| `m365-admin.md` | sonnet | Automating Microsoft 365 administration tasks |
| `mobile-app-developer.md` | sonnet | Developing iOS and Android mobile applications |
| `payment-integration.md` | opus | Implementing payment systems and integrating payment gateways |
| `quant-analyst.md` | opus | Developing quantitative trading strategies and financial models |
| `risk-manager.md` | opus | Identifying, quantifying, and mitigating enterprise-level risks |
| `seo-specialist.md` | haiku | Comprehensive SEO optimization including technical audits |

### Business and Product (`business-product/`)

Product management, business analysis, marketing, and non-technical agents.

| Agent | Model | Description |
|-------|-------|-------------|
| `business-analyst.md` | sonnet | Analyzing business processes and gathering requirements |
| `content-marketer.md` | haiku | Developing content strategies and creating SEO-optimized materials |
| `customer-success-manager.md` | sonnet | Assessing customer health and developing retention strategies |
| `legal-advisor.md` | sonnet | Drafting contracts, reviewing compliance, and developing IP protections |
| `product-manager.md` | haiku | Product strategy decisions, feature prioritization, and roadmaps |
| `project-manager.md` | haiku | Establishing project plans, tracking progress, and managing risks |
| `sales-engineer.md` | sonnet | Technical pre-sales activities and solution architecture |
| `scrum-master.md` | haiku | Team facilitation, process optimization, and agile ceremony management |
| `technical-writer.md` | haiku | Creating and maintaining technical documentation |
| `ux-researcher.md` | sonnet | Conducting user research and analyzing user behavior |
| `wordpress-master.md` | sonnet | Architecting, optimizing, and troubleshooting WordPress implementations |

### Meta-Orchestration (`meta-orchestration/`)

Agents for coordinating, monitoring, and managing other agents.

| Agent | Model | Description |
|-------|-------|-------------|
| `agent-installer.md` | haiku | Discovering, browsing, and installing Claude Code agents |
| `agent-organizer.md` | sonnet | Assembling and optimizing multi-agent teams for complex projects |
| `context-manager.md` | sonnet | Managing shared state and data synchronization across agents |
| `error-coordinator.md` | sonnet | Coordinated error handling across distributed agent systems |
| `it-ops-orchestrator.md` | sonnet | Orchestrating complex IT operations tasks across multiple domains |
| `knowledge-synthesizer.md` | sonnet | Extracting actionable patterns and synthesizing insights from agents |
| `multi-agent-coordinator.md` | opus | Coordinating multiple concurrent agents with shared state |
| `performance-monitor.md` | haiku | Establishing observability infrastructure and tracking system metrics |
| `task-distributor.md` | haiku | Distributing tasks across multiple agents and balancing workloads |
| `workflow-orchestrator.md` | opus | Designing and optimizing complex business process workflows |

### Research and Analysis (`research-analysis/`)

Research, competitive analysis, and trend analysis agents.

| Agent | Model | Description |
|-------|-------|-------------|
| `competitive-analyst.md` | haiku | Analyzing competitors and benchmarking against market leaders |
| `data-researcher.md` | haiku | Discovering, collecting, and validating data from multiple sources |
| `market-researcher.md` | haiku | Analyzing markets and understanding consumer behavior |
| `research-analyst.md` | sonnet | Comprehensive research across multiple sources with synthesis |
| `scientific-literature-researcher.md` | sonnet | Searching scientific literature and retrieving structured experimental data |
| `search-specialist.md` | haiku | Finding specific information across multiple sources with advanced search |
| `trend-analyst.md` | haiku | Analyzing emerging patterns and predicting industry shifts |

---

## Model Selection Guide

| Model | Use when |
|-------|----------|
| `opus` | Maximum reasoning depth needed (security audits, complex architecture, system design) |
| `sonnet` | Default for most tasks - good balance of quality and speed |
| `haiku` | Speed and low cost matter most (simple queries, lightweight checks, audits) |
| `inherit` | Match the model the user already has active in their session |

## Tips

- Agents listed in `.claude/agents/` (project scope) are committed to git and shared with your team.
- Agents in `~/.claude/agents/` (user scope) are personal and available in every project.
- The `description` field controls when Claude auto-delegates. Be specific about trigger conditions.
- You can install agents from any category subdirectory - just copy the `.md` files to `.claude/agents/`.
- Community agents use standard Claude Code agent format with frontmatter (name, description, tools, model).
