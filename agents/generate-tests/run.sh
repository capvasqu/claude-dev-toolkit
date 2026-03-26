#!/bin/bash
# ============================================================
# claude-dev-toolkit — Agent: generate-tests
# Usage: ./agents/generate-tests/run.sh [path-to-project]
# ============================================================

set -e

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$AGENT_DIR/prompt.md"
PROJECT_DIR="${1:-$(pwd)}"

echo "============================================================"
echo " Claude Dev Toolkit — Unit Test Generator"
echo "============================================================"
echo " Project : $PROJECT_DIR"
echo " Agent   : generate-tests"
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
echo "Analyzing coverage and generating tests... (this may take several minutes)"
echo ""

claude --print "$(cat "$PROMPT_FILE")"

echo ""
echo "============================================================"
echo " Tests generated. Run to verify:"
echo "   Java:       mvn test"
echo "   JavaScript: npm test"
echo "============================================================"
