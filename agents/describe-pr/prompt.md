# Agent: describe-pr
# Purpose: Generate a professional Pull Request description from the git diff

Analyze the changes in the current branch compared to main/master and generate
a complete and professional description for the Pull Request.

## Instructions

### 1. Get the changes
Run these commands to understand the context:
```
git log main..HEAD --oneline
git diff main..HEAD --stat
git diff main..HEAD
```

### 2. Analyze the changes
Identify:
- Which files were modified and why
- Which features were added, modified or removed
- Whether there are changes in tests, documentation or configuration
- The impact of the changes (breaking changes, new dependencies)

### 3. Generate the PR-DESCRIPTION.md file
Generate a PR-DESCRIPTION.md file in the root with this exact structure:

## Description
[2-3 line summary of what this PR does and why]

## Type of change
- [ ] Bug fix
- [ ] New feature
- [ ] Refactoring
- [ ] Documentation
- [ ] Tests
- [ ] Configuration / DevOps

Mark with [x] the ones that apply based on the detected changes.

## Changes made
- [list of concrete changes found in the diff]

## Modified files
| File | Type of change | Description |
|------|---------------|-------------|
[table with each modified file]

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests verified
- [ ] Manually tested in local environment

## Checklist
- [ ] Code follows project conventions
- [ ] Documentation added for public changes
- [ ] No secrets or sensitive data exposed
- [ ] Existing tests still pass

## Notes for the reviewer
[Specific points where the reviewer should pay special attention]

### 4. Show in console
When finished, display the content of PR-DESCRIPTION.md in the console
so the developer can copy it directly to GitHub.
