# Agent: generate-docs
# Purpose: Automatically generate complete technical documentation

Analyze the entire project and generate the following documentation files.
Do not modify any source code files — only generate or update documentation.

## Files to generate

### 1. README.md
Update or create the README.md with:
- Project name and description (inferred from the code)
- "About this project" section with purpose and context
- Tech stack with versions
- Architecture diagram in Mermaid format (graph TB)
  - Nodes without line breaks (\n) — use single-line text in quotes
- Description of each main layer or module
- All available REST endpoints (if applicable):
  | Method | URL | Description | Parameters | Response |
- Installation and run instructions (local and Docker if Dockerfile exists)
- Prerequisites (Java, Node versions, etc.)

### 2. ARCHITECTURE.md
Generate an architecture file with:
- Mermaid diagram of the complete HTTP request flow (sequenceDiagram)
- Mermaid diagram of relationships between main classes (classDiagram)
- Mermaid diagram of system layers (graph TB)
- Relevant design decisions found in the code
- IMPORTANT: All Mermaid diagrams must use valid syntax.
  Nodes CANNOT contain \n — use single-line text.

### 3. CHANGELOG.md
Generate or update the CHANGELOG following the Keep a Changelog format:
- [Unreleased] section with Added, Changed, Fixed subsections
- List all components and features found in the code

## Important rules
- Never modify .java, .jsx, .js, .ts, .py or other source code files
- If README.md already exists, update it preserving relevant existing content
- Mermaid diagrams must be syntactically valid for GitHub
- Infer all information from the source code, do not invent
