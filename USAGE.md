# Usage Guide — Claude Dev Toolkit

Detailed guide for teams that want to adopt the toolkit
in their development workflow.

---

## Use case 1: Automated code review on PRs

### Situation
The team wastes time on manual code reviews always checking
the same types of problems: missing validations,
bad practices, basic security issues.

### Solution
Configure the `review-bugs.yml` workflow so that Claude Code
does an automatic first pass on every PR, leaving a
comment with the findings. The human reviewer focuses
on what the machine cannot see: business logic, architecture
and design decisions.

### Setup (5 minutes)
1. Copy `.github/workflows/review-bugs.yml` to your repository
2. Copy `.github/prompts/review-bugs.md` to your repository
3. Add `CLAUDE_CODE_OAUTH_TOKEN` in Settings → Secrets → Actions
4. The workflow activates automatically on the next PR

### Expected result
Each PR receives an automatic comment with:
- Findings table by category (bugs, quality, security, performance)
- Detail of each finding with file, line and suggested fix
- Prioritized action plan

---

## Use case 2: Always up-to-date documentation

### Situation
The project documentation is outdated or simply
does not exist. Nobody has time to write and maintain it.

### Solution
Run the `generate-docs` agent at the start of the project and
whenever major architecture changes are made.

### Execution
```bash
./agents/generate-docs/run.sh /path/to/your/project
```

### Expected result
- Complete README.md with Mermaid architecture diagram
- ARCHITECTURE.md with flows and class relationships
- CHANGELOG.md with change history

---

## Use case 3: PRs with professional descriptions

### Situation
Developers open PRs with empty or very brief descriptions:
"fix bug", "new feature". This makes code review
and traceability harder.

### Solution
The `describe-pr.yml` workflow automatically generates the
PR description when it is opened, based on
the actual diff of the changes.

### Setup
1. Copy `.github/workflows/describe-pr.yml` to your repository
2. Copy `.github/prompts/describe-pr.md` to your repository
3. The workflow activates automatically when a new PR is opened

### Expected result
Each new PR automatically receives a description with:
- Summary of changes
- Type of change (bug fix, feature, refactoring)
- Table of modified files
- Checklist for the developer and the reviewer

---

## Use case 4: Technical debt visibility

### Situation
The team knows there is technical debt but does not have a clear inventory
of how much there is or how to prioritize it.

### Solution
The `tech-debt.yml` workflow runs an automatic weekly analysis
and creates an Issue in GitHub with the full report.

### Setup
1. Copy `.github/workflows/tech-debt.yml` to your repository
2. The workflow runs automatically every Monday
3. For manual execution: Actions → Technical Debt Analysis → Run workflow

### Expected result
Weekly Issue with:
- Complete technical debt inventory by category
- Effort estimate for each item
- Prioritized remediation roadmap (quick wins, medium term, backlog)

---

## Customize prompts for your team

The real value of the toolkit is in adapting the prompts to the
specific conventions of your team. Example for a banking team:

### Add banking security rules to review-bugs/prompt.md

```markdown
### Additional security rules (banking context)
- Verify that sensitive data (ID numbers, accounts, cards) never
  appear in logs or error responses
- Confirm that all financial endpoints have authentication
- Check that monetary transactions use BigDecimal
  with correct scale (never double or float)
- Verify encryption of data at rest for sensitive information
```

---

## Frequently asked questions

### How much does it cost to run the agents?
Depends on repository size and model used.
A medium-sized repository (50-100 files) consumes
approximately $0.10-0.50 USD per execution with Claude Sonnet.

### Do the agents modify production code?
The `review-bugs`, `tech-debt` and `describe-pr` agents only generate
reports — they do not modify code. The `generate-tests` agent creates
new test files but never modifies existing code.
The `generate-docs` agent only creates or updates .md files.

### Does it work with any language?
Yes. The prompts include instructions for Java/Spring Boot and
React/JavaScript. You can edit them to add Python, .NET,
Go or other languages your team uses.

### How do I update prompts in production?
Edit the `.github/prompts/agent-name.md` file directly
in your repository. The change applies on the next workflow run
without needing to modify the YAML.
