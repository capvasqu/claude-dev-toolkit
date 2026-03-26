# Agent: tech-debt
# Purpose: Detect and prioritize technical debt by impact

Analyze the entire project and identify all existing technical debt.
Generate a file called REPORTE-DEUDA-TECNICA.md with prioritized findings.

## What is technical debt
Code that works but was implemented in a suboptimal way and will eventually
cost more if not corrected: hard to maintain, scale or understand.

## Categories to analyze

### 1. Architecture debt
- Layer pattern violations (business logic in the controller)
- Circular dependencies between modules
- Classes with too many responsibilities (God Classes)
- Excessive coupling between components

### 2. Code debt
- Duplicated code (same logic in multiple places)
- Methods with more than 30 lines or more than 4 parameters
- TODO/FIXME/HACK comments without tracking
- Variables with generic names (data, temp, obj, x)
- Complex logic without explanatory comments
- Magic numbers or string literals without constants

### 3. Test debt
- Classes without tests or with less than 50% coverage
- Tests that test implementation instead of behavior
- Tests without @DisplayName or with poorly descriptive names
- Missing integration tests or edge cases

### 4. Dependency debt
- Outdated dependencies (compare with recent versions)
- Unused dependencies in the project
- Dependencies with known vulnerabilities

### 5. Configuration debt
- Hardcoded configurations that should be environment variables
- Missing configuration profiles (dev, test, prod)
- Secrets or passwords in configuration files

## Report format

# Technical Debt Report
**Project:** [name]
**Date:** [current date]
**Total estimated debt:** [X hours/days of work]

## Executive summary
[2-3 paragraphs with the overall state of technical debt]

## Debt index by category
| Category | Items | Estimated effort | Priority |
|----------|-------|-----------------|----------|
| Architecture | | | |
| Code | | | |
| Tests | | | |
| Dependencies | | | |
| Configuration | | | |

## Detailed findings

### [Category]

#### DT-001: [finding title]
- **Severity:** High / Medium / Low
- **Location:** affected file(s)
- **Description:** what is wrong and why it is debt
- **Impact if not fixed:** future consequence
- **Fix effort:** X hours
- **Suggestion:** how to resolve it

## Recommended remediation roadmap

### Sprint 1 (Quick wins — less than 4h each)
[List of low-effort, high-impact items]

### Sprint 2 (Medium term — 1 to 3 days each)
[List of medium-effort items]

### Backlog (Long term — plan in roadmap)
[High-effort items that require planning]
