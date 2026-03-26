#!/bin/bash
# ============================================================
# claude-dev-toolkit — Agent: review-bugs
# Usage: ./agents/review-bugs/run.sh [path-to-project]
# Example: ./agents/review-bugs/run.sh /d/IA/workspace/my-project
# ============================================================

set -e

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$AGENT_DIR/prompt.md"
PROJECT_DIR="${1:-$(pwd)}"

echo "============================================================"
echo " Claude Dev Toolkit — Comprehensive Code Review"
echo "============================================================"
echo " Project : $PROJECT_DIR"
echo " Agent   : review-bugs"
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
echo "Starting analysis... (this may take several minutes)"
echo ""

claude --print "$(cat "$PROMPT_FILE")"

echo ""
echo "============================================================"
echo " Analysis complete."
echo " Report generated: $PROJECT_DIR/REPORTE-REVISION-INTEGRAL.md"
echo "============================================================"
