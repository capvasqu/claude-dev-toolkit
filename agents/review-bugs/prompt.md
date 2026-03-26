# Agent: review-bugs
# Purpose: Comprehensive code review — bugs, quality, security and performance

Thoroughly analyze all source code files in this repository
and generate a file called REPORTE-REVISION-INTEGRAL.md in the project root.

## Analysis instructions

### 1. Bugs and logic errors
Search the entire codebase for:
- Logic errors and functional bugs
- Missing input parameter validation (null, negative, empty)
- Incorrect exception handling (empty catch blocks, generic exceptions)
- Race conditions or concurrency issues
- Physical deletion where soft delete should be used
- Precision loss in numeric operations (double/float for money)
- Potential unhandled NullPointerExceptions

### 2. Code quality
Evaluate the following dimensions:
- SOLID principles (Single Responsibility, Open/Closed, etc.)
- Duplicated code or DRY (Don't Repeat Yourself) violations
- Methods that are too long or have too many responsibilities
- Incorrect dependency injection (@Autowired on field vs constructor)
- Missing documentation (Javadoc/JSDoc) on public methods
- Poorly descriptive variable or method names
- High cyclomatic complexity

### 3. Security (cybersecurity perspective)
Identify security vulnerabilities:
- SQL Injection: dynamic queries without parameterization
- JPA entities exposed directly in REST endpoints
- Sensitive data exposed in logs or error responses
- Missing input validation on public endpoints
- Insecure configurations (hardcoded passwords, SSL disabled)
- Cross-Site Scripting (XSS) in the frontend
- Stack traces exposed in client error responses
- Secrets or API keys exposed in the code

### 4. Performance
Detect performance issues:
- N+1 queries in JPA/Hibernate (bad lazy loading)
- Missing pagination on endpoints returning full lists
- Expensive operations inside loops
- Missing suggested indexes for frequent queries
- Unnecessary full data loading when only specific fields are needed
- Unnecessary re-renders in React components (missing useMemo/useCallback)
- Redundant HTTP calls from the frontend

## Report format

Generate the report with the following exact structure:

# Comprehensive Code Review Report
**Project:** [project name]
**Date:** [current date]
**Files analyzed:** [number]
**Total findings:** [number]

## Executive summary
[3-4 line paragraph with the most critical findings]

## Statistics
| Category | Critical | High | Medium | Low | Total |
|----------|---------|------|--------|-----|-------|
| Bugs | | | | | |
| Quality | | | | | |
| Security | | | | | |
| Performance | | | | | |
| **Total** | | | | | |

## Detailed findings

### Bugs and logic errors
#### [CRITICAL/HIGH/MEDIUM/LOW] BUG-001: [title]
- **File:** path/to/file.java (line N)
- **Description:** what is wrong and why it is a problem
- **Impact:** what may happen if not fixed
- **Suggested fix:** code or description of how to fix it

[repeat for each finding]

### Code quality
[same structure]

### Security
[same structure]

### Performance
[same structure]

## Recommended action plan
Prioritized list of the 5 most critical findings to fix first,
with effort estimate (hours) for each one.

## Note on complementary tools
This analysis was performed by Claude Code. For continuous static analysis
it is recommended to complement with:
- SonarQube/SonarCloud: code quality and coverage
- OWASP Dependency-Check: dependency vulnerabilities
- Snyk: dependency and container security
