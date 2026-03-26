#!/bin/bash
# ============================================================
# claude-dev-toolkit — Agent: generate-docs
# Usage: ./agents/generate-docs/run.sh [path-to-project]
# ============================================================

set -e

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$AGENT_DIR/prompt.md"
PROJECT_DIR="${1:-$(pwd)}"

echo "============================================================"
echo " Claude Dev Toolkit — Technical Documentation Generator"
echo "============================================================"
echo " Project : $PROJECT_DIR"
echo " Agent   : generate-docs"
echo "============================================================"

if [ ! -f "$PROMPT_FILE" ]; then
  echo "ERROR: prompt.md not found in $AGENT_DIR"
  exit 1
fi

if [ ! -d "$PROJECT_DIR" ]; then
  echo "ERROR: Project directory does not exist: $PROJECT_DIR"
  exit 1
fi

if ! command -v claude &> /dev/null; then
  echo "ERROR: Claude Code is not installed."
  echo "Install with: npm install -g @anthropic-ai/claude-code"
  exit 1
fi

cd "$PROJECT_DIR"

echo ""
echo "Generating documentation... (this may take several minutes)"
echo ""

claude --print "$(cat "$PROMPT_FILE")"

echo ""
echo "============================================================"
echo " Documentation generated:"
echo "   - README.md"
echo "   - ARCHITECTURE.md"
echo "   - CHANGELOG.md"
echo "============================================================"
