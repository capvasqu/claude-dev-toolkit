# Claude Dev Toolkit

A collection of Claude Code agents to automate repetitive tasks
in software development teams.

Each agent can be run manually from the terminal or integrated into
GitHub Actions for automatic execution in the CI/CD cycle.

---

## Available agents

| Agent | Purpose | Manual run | GitHub Actions |
|-------|---------|------------|----------------|
| `review-bugs` | Comprehensive review: bugs, quality, security and performance | Yes | On every PR |
| `generate-docs` | Automatically generates README, ARCHITECTURE.md and CHANGELOG | Yes | Manual |
| `generate-tests` | Generates unit tests for classes without coverage | Yes | Manual |
| `describe-pr` | Generates professional Pull Request description | Yes | On PR open |
| `tech-debt` | Detects and prioritizes technical debt | Yes | Weekly (Monday) |

---

## Requirements

- [Claude Code](https://docs.anthropic.com/claude-code) installed globally
- Node.js 18 or higher
- Git Bash (Windows) or Unix/Mac terminal
- [claude.ai](https://claude.ai) account with Pro or Max subscription
- `CLAUDE_CODE_OAUTH_TOKEN` generated with `claude setup-token`

### Installing Claude Code

```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

---

## Manual usage

### From the toolkit directory

```bash
# Clone the toolkit
git clone https://github.com/capvasqu/claude-dev-toolkit.git
cd claude-dev-toolkit

# Grant execution permissions (Unix/Mac/Git Bash)
chmod +x agents/*/run.sh

# Run an agent on your project
./agents/review-bugs/run.sh /path/to/your/project
./agents/generate-docs/run.sh /path/to/your/project
./agents/generate-tests/run.sh /path/to/your/project
./agents/describe-pr/run.sh /path/to/your/project
./agents/tech-debt/run.sh /path/to/your/project
```

### From your project directory

```bash
cd /path/to/your/project

# Run directly with Claude Code
claude --print "$(cat /path/to/toolkit/agents/review-bugs/prompt.md)"
```

---

## GitHub Actions integration

### Prerequisite: configure the CLAUDE_CODE_OAUTH_TOKEN secret

1. Generate the token locally by running `claude setup-token` in Git Bash
2. In your repository go to **Settings → Secrets and variables → Actions**
3. Create a new secret named `CLAUDE_CODE_OAUTH_TOKEN`
4. Paste the generated token as the value

### Copy the workflows to your repository

```bash
# From the root of your project
cp -r /path/to/toolkit/.github .
```

Or manually copy the files from `.github/workflows/` and `.github/prompts/`
to your repository.

### Behavior of each workflow

#### review-bugs.yml
- **Trigger:** every time a Pull Request is opened or updated
- **Action:** analyzes the code and posts the report as a comment on the PR
- **Artifact:** saves the full report for 30 days

#### describe-pr.yml
- **Trigger:** when a new Pull Request is opened
- **Action:** automatically generates and updates the PR description

#### tech-debt.yml
- **Trigger:** every Monday at 8am UTC (automatic) or manual
- **Action:** analyzes technical debt and creates an Issue with the report
- **Artifact:** saves the full report for 90 days

---

## Customize the prompts

Each agent has a `prompt.md` file you can edit to adapt it
to your team's conventions:

```
agents/
  review-bugs/prompt.md    ← add your company's security rules
  generate-docs/prompt.md  ← adjust documentation structure
  generate-tests/prompt.md ← specify your project's frameworks
  describe-pr/prompt.md    ← customize the PR template
  tech-debt/prompt.md      ← adjust priority criteria
```

---

## Integration with static analysis tools

Claude Code performs semantic code analysis. For continuous
static analysis it is recommended to complement with:

| Tool | Purpose | Integration |
|------|---------|-------------|
| SonarQube / SonarCloud | Code quality and coverage | GitHub Action available |
| OWASP Dependency-Check | Dependency vulnerabilities | Maven/Gradle plugin |
| Snyk | Dependency and container security | GitHub Action available |
| Checkstyle | Java code style | Maven plugin |

---

## Repository structure

```
claude-dev-toolkit/
├── agents/
│   ├── review-bugs/
│   │   ├── prompt.md     # Complete agent instruction
│   │   └── run.sh        # Manual execution script
│   ├── generate-docs/
│   ├── generate-tests/
│   ├── describe-pr/
│   └── tech-debt/
├── .github/
│   ├── workflows/
│   │   ├── review-bugs.yml    # CI: runs on every PR
│   │   ├── describe-pr.yml    # CI: generates description on PR open
│   │   └── tech-debt.yml      # Scheduled: weekly analysis
│   └── prompts/               # Prompts for the workflows
├── README.md
└── USAGE.md
```

---

## Author

**Carlos Alberto Polo Vasquez**
IT Community Lead | Tech Lead | AI Automation
[github.com/capvasqu](https://github.com/capvasqu)

---

## License

MIT — free to use, modify and distribute.
